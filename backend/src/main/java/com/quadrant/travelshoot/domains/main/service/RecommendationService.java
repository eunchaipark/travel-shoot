package com.quadrant.travelshoot.domains.main.service;

import com.quadrant.travelshoot.domains.main.dto.response.OpenAIResponse;
import com.quadrant.travelshoot.domains.main.enums.UserType;
import com.quadrant.travelshoot.domains.main.enums.dto.internal.ScoreWeight;
import com.quadrant.travelshoot.domains.reservation.repository.ReservationRepository;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;
import com.quadrant.travelshoot.domains.user.entity.UserSurvey;
import com.quadrant.travelshoot.domains.user.entity.UserSurveyRegion;
import com.quadrant.travelshoot.domains.user.repository.UserSurveyRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class RecommendationService {

    private final UserSurveyRepository userSurveyRepository;
    private final StayRepository stayRepository;
    private final ReservationRepository reservationRepository;
    private final OpenAIService openAIService;

    private static final BigDecimal PRICE_MARGIN = BigDecimal.valueOf(30000);
    private static final int MIN_CANDIDATES = 50;
    private static final int FINAL_RECOMMENDATIONS = 15;

 
    // 메인 추천 플로우
    public List<Map<String, Object>> getRecommendations(Long userId) {
        log.info("=== 추천 시작: userId={} ===", userId);

        // 1. 사용자 타입 판별 (예약 개수 기반)
        UserType userType = determineUserType(userId);
        log.info("사용자 타입: {}", userType);

        // 2. 설문조사 데이터 조회
        UserSurvey survey = userSurveyRepository.findByUserId(userId)
                .orElseThrow(() -> new RuntimeException("설문조사를 완료해주세요"));

        // 3. 기준 가격 계산 (신규: 전체 평균, 기존: 본인 평균)
        BigDecimal basePrice = calculateBasePrice(userId);
        log.info("기준 가격: {}", basePrice);

        // 4. 지역/타입 순위 결정 (사용자 타입별 전략)
        List<String> regionsByRank = getRegionRankings(userId, userType, survey);
        List<Stay.StayType> typesByRank = getStayTypeRankings(userId, userType, survey);
        log.info("지역 순위: {}", regionsByRank);

        // 5. 5단계 완화 필터링 (최소 50개 목표, 타입 다양성 보장)
        List<Stay> candidates = searchWithLevels(regionsByRank, typesByRank, basePrice);
        log.info("5단계 완화 후 후보군: {}개", candidates.size());

        // 6. 최소 50개 후보 보장
        if (candidates.size() < MIN_CANDIDATES) {
            log.warn("후보 부족 ({}/{}) - 평점순 추가 조회", candidates.size(), MIN_CANDIDATES);
            ensureMinimumCandidates(candidates);
            log.info("추가 확보 후 후보군: {}개", candidates.size());
        }

        // 7. 스코어링 및 상위 15개 선택 (타입별 최소 1개, 최대 2개)
        List<Map<String, Object>> finalRecommendations = 
        scoreAndSelectTop(candidates, survey, userType, userId);

        log.info("=== 추천 완료: {}개 후보 → 상위 {}개 선정 ===", 
                candidates.size(), finalRecommendations.size());
        
        return finalRecommendations;
    }

    // ========================================
    // 1단계: 사용자 타입 판별
    // ========================================
    
    private UserType determineUserType(Long userId) {
        long count = reservationRepository.countByUserId(userId);
        return UserType.fromReservationCount(count);
    }

    // ========================================
    // 2단계: 기준 가격 계산
    // ========================================
    
    private BigDecimal calculateBasePrice(Long userId) {
        long reservationCount = reservationRepository.countByUserId(userId);

        if (reservationCount == 0) {
            BigDecimal avgPrice = reservationRepository.findOverallAvgPricePerNight();
            log.info("신규 사용자 - 전체 평균: {}", avgPrice);
            return avgPrice != null ? avgPrice : BigDecimal.valueOf(150000);
        } else {
            BigDecimal userAvg = reservationRepository.findAvgPricePerNightByUserId(userId);
            log.info("기존 사용자 - 본인 평균: {}", userAvg);
            return userAvg != null ? userAvg : BigDecimal.valueOf(150000);
        }
    }

    // ========================================
    // 3단계: 지역 순위 결정
    // ========================================
    
    private List<String> getRegionRankings(Long userId, UserType userType, UserSurvey survey) {
        if (userType == UserType.NEW) {
            return survey.getRegions().stream()
                    .sorted(Comparator.comparingInt(UserSurveyRegion::getRankOrder))
                    .map(UserSurveyRegion::getRegionName)
                    .collect(Collectors.toList());
        } else {
            List<Object[]> regionFrequency = reservationRepository.findRegionFrequencyByUserId(userId);
            
            if (regionFrequency.isEmpty()) {
                return survey.getRegions().stream()
                        .sorted(Comparator.comparingInt(UserSurveyRegion::getRankOrder))
                        .map(UserSurveyRegion::getRegionName)
                        .collect(Collectors.toList());
            }

            List<String> patternBased = regionFrequency.stream()
                    .map(row -> (String) row[0])
                    .collect(Collectors.toList());

            log.info("예약 패턴 기반 지역 순위: {}", patternBased);
            return patternBased;
        }
    }

    // ========================================
    // 4단계: 타입 순위 결정 (1순위만 우선)
    // ========================================
    
    private List<Stay.StayType> getStayTypeRankings(Long userId, UserType userType, UserSurvey survey) {
        if (userType == UserType.NEW) {
            Stay.StayType primaryType = convertToStayType(survey.getStayType());
            List<Stay.StayType> allTypes = new ArrayList<>();
            allTypes.add(primaryType);
            
            List<Stay.StayType> otherTypes = new ArrayList<>();
            for (Stay.StayType type : Stay.StayType.values()) {
                if (!type.equals(primaryType)) {
                    otherTypes.add(type);
                }
            }
            Collections.shuffle(otherTypes);
            allTypes.addAll(otherTypes);
            
            log.info("타입 우선순위: 1순위={}, 기타={} (동일 가중치)", primaryType, otherTypes);
            return allTypes;
        } else {
            List<Object[]> typeFrequency = reservationRepository.findStayTypeFrequencyByUserId(userId);
            
            if (typeFrequency.isEmpty()) {
                Stay.StayType primaryType = convertToStayType(survey.getStayType());
                List<Stay.StayType> allTypes = new ArrayList<>();
                allTypes.add(primaryType);
                
                List<Stay.StayType> otherTypes = new ArrayList<>();
                for (Stay.StayType type : Stay.StayType.values()) {
                    if (!type.equals(primaryType)) {
                        otherTypes.add(type);
                    }
                }
                Collections.shuffle(otherTypes);
                allTypes.addAll(otherTypes);
                
                log.info("타입 우선순위: 1순위={}, 기타={} (동일 가중치)", primaryType, otherTypes);
                return allTypes;
            }

            Stay.StayType primaryType = (Stay.StayType) typeFrequency.get(0)[0];
            List<Stay.StayType> allTypes = new ArrayList<>();
            allTypes.add(primaryType);
            
            List<Stay.StayType> otherTypes = new ArrayList<>();
            for (Stay.StayType type : Stay.StayType.values()) {
                if (!type.equals(primaryType)) {
                    otherTypes.add(type);
                }
            }
            Collections.shuffle(otherTypes);
            allTypes.addAll(otherTypes);

            log.info("타입 우선순위 (예약 패턴): 1순위={}, 기타={} (동일 가중치)", primaryType, otherTypes);
            return allTypes;
        }
    }

    // ========================================
    // 5단계: 5단계 완화 필터링 (타입 다양성 보장)
    // ========================================
    
    private List<Stay> searchWithLevels(List<String> regions, List<Stay.StayType> types, BigDecimal basePrice) {
        Stay.StayType primaryType = types.get(0);
        List<Stay.StayType> otherTypes = types.subList(1, types.size());
        
        List<Stay> result = tryLevelWithDiversity(
                regions.subList(0, Math.min(1, regions.size())),
                primaryType, otherTypes,
                BigDecimal.valueOf(4.5), basePrice, PRICE_MARGIN, 1);
        if (result.size() >= MIN_CANDIDATES) return result;

        result = tryLevelWithDiversity(
                regions.subList(0, Math.min(2, regions.size())),
                primaryType, otherTypes,
                BigDecimal.valueOf(4.3), basePrice,
                PRICE_MARGIN.multiply(BigDecimal.valueOf(1.2)), 2);
        if (result.size() >= MIN_CANDIDATES) return result;

        result = tryLevelWithDiversity(
                regions.subList(0, Math.min(3, regions.size())),
                primaryType, otherTypes,
                BigDecimal.valueOf(4.1), basePrice,
                PRICE_MARGIN.multiply(BigDecimal.valueOf(1.4)), 3);
        if (result.size() >= MIN_CANDIDATES) return result;

        result = tryLevelWithDiversity(
                regions, primaryType, otherTypes,
                BigDecimal.valueOf(3.9), basePrice,
                PRICE_MARGIN.multiply(BigDecimal.valueOf(1.6)), 4);
        if (result.size() >= MIN_CANDIDATES) return result;

        log.info("Level 5: 가격 제한 해제, 평점순 최대 100개");
        List<Stay> allCandidates = stayRepository.findWithFilters(regions, types, BigDecimal.valueOf(0.0));
        result = allCandidates.stream().limit(100).collect(Collectors.toList());
        log.info("Level 5 결과: {}개", result.size());
        return result;
    }

    private List<Stay> tryLevelWithDiversity(
            List<String> regionNames, Stay.StayType primaryType, List<Stay.StayType> otherTypes,
            BigDecimal minRating, BigDecimal basePrice, BigDecimal priceMargin, int level) {
        
        BigDecimal minPrice = basePrice.subtract(priceMargin);
        BigDecimal maxPrice = basePrice.add(priceMargin);
        
        List<Stay> primaryCandidates = stayRepository.findWithFilters(
                regionNames, Arrays.asList(primaryType), minRating);
        
        List<Stay> filteredPrimary = primaryCandidates.stream()
                .filter(stay -> {
                    BigDecimal price = stayRepository.findMinWeekdayPrice(stay.getId());
                    return price != null && 
                           price.compareTo(minPrice) >= 0 && 
                           price.compareTo(maxPrice) <= 0;
                })
                .collect(Collectors.toList());
        
        List<Stay> otherCandidates = new ArrayList<>();
        for (Stay.StayType otherType : otherTypes) {
            List<Stay> typeCandidates = stayRepository.findWithFilters(
                    regionNames, Arrays.asList(otherType), minRating);
            
            List<Stay> filteredType = typeCandidates.stream()
                    .filter(stay -> {
                        BigDecimal price = stayRepository.findMinWeekdayPrice(stay.getId());
                        return price != null && 
                               price.compareTo(minPrice) >= 0 && 
                               price.compareTo(maxPrice) <= 0;
                    })
                    .limit(5)
                    .collect(Collectors.toList());
            
            otherCandidates.addAll(filteredType);
        }
        
        List<Stay> result = new ArrayList<>(filteredPrimary);
        result.addAll(otherCandidates);
        
        log.info("Level {}: 평점 {}+, 가격 {}-{} → 1순위:{}/기타:{}개 (총:{}개)", 
                level, minRating, minPrice, maxPrice, 
                filteredPrimary.size(), otherCandidates.size(), result.size());

        return result;
    }

    // ========================================
    // 6단계: 최소 후보 보장
    // ========================================
    
    private void ensureMinimumCandidates(List<Stay> candidates) {
        int needed = MIN_CANDIDATES - candidates.size();
        List<Stay> additionalStays = stayRepository.findTopByOrderByAverageRatingDesc(needed);
        
        Set<Long> existingIds = candidates.stream()
                .map(Stay::getId)
                .collect(Collectors.toSet());
        
        additionalStays.stream()
                .filter(stay -> !existingIds.contains(stay.getId()))
                .forEach(candidates::add);
    }

    // ========================================
    // 7단계: 스코어링 및 상위 선택 (타입 분산 배치)
    // ========================================

    private List<Map<String, Object>> scoreAndSelectTop(
            List<Stay> candidates, UserSurvey survey, UserType userType, Long userId) {
        
        ScoreWeight weight = ScoreWeight.forUserType(userType);
        
        List<ScoredStay> scoredStays = candidates.stream()
                .map(stay -> {
                    double score = calculateScore(stay, survey, weight, userId, userType);
                    stay.setRecommendationScore(score);
                    return new ScoredStay(stay, score);
                })
                .sorted(Comparator.comparingDouble(ScoredStay::getScore).reversed())
                .collect(Collectors.toList());
        
        List<Stay> top15 = selectDiverseTop15(scoredStays);
        log.info("1차 스코어링 완료 - 타입 다양성 보장된 상위 15개 선정");

        OpenAIResponse refinement = openAIService.refineRecommendations(top15, survey);
        
        List<Stay> finalTop10 = refinement.getSelectedIds().stream()
                .map(id -> top15.stream()
                        .filter(stay -> stay.getId().equals(id))
                        .findFirst()
                        .orElse(null))
                .filter(java.util.Objects::nonNull)
                .collect(Collectors.toList());

        log.info("OpenAI 정제 완료 - 설명: {}, 최종: {}개", 
                refinement.getDescription(), finalTop10.size());

        List<Stay> diverselySorted = sortWithTypeDiversity(finalTop10);
        
        List<Map<String, Object>> responses = diverselySorted.stream()
                .map(stay -> {
                    BigDecimal price = stayRepository.findMinWeekdayPrice(stay.getId());
                    
                    log.info("최종 추천: {} - {} (AI점수:{}점, 기존:{}점)", 
                            stay.getStayType(), stay.getStayName(),
                            String.format("%.2f", stay.getRecommendationScore()),
                            String.format("%.2f", stay.getRecommendationScore()));
                    
                    Map<String, Object> response = new HashMap<>();
                    response.put("id", stay.getId());
                    response.put("stayCode", stay.getStayCode());
                    response.put("title", stay.getStayName());
                    response.put("stayType", stay.getStayType().name());
                    response.put("image", null);
                    response.put("rating", stay.getAverageRating());
                    response.put("location", formatLocation(stay));
                    response.put("price", price);
                    response.put("checkinTime", stay.getCheckInTime().toString().substring(0, 5));
                    response.put("latitude", stay.getLatitude());
                    response.put("longitude", stay.getLongitude());
                    response.put("placeType", "stay");
                    response.put("aiScore", stay.getRecommendationScore()); // OpenAI 점수
                    
                    return response;
                })
                .collect(Collectors.toList());
        
        return responses;
    }

    private List<Stay> selectDiverseTop15(List<ScoredStay> scoredStays) {
        Map<Stay.StayType, List<ScoredStay>> byType = scoredStays.stream()
                .collect(Collectors.groupingBy(ss -> ss.getStay().getStayType(), Collectors.toList()));
        
        List<Stay> selected = new ArrayList<>();
        Map<Stay.StayType, Integer> typeCount = new HashMap<>();
        
        for (Stay.StayType type : Stay.StayType.values()) {
            List<ScoredStay> typeStays = byType.get(type);
            if (typeStays != null && !typeStays.isEmpty()) {
                selected.add(typeStays.get(0).getStay());
                typeCount.put(type, 1);
            } else {
                typeCount.put(type, 0);
            }
        }
        
        Set<Long> selectedIds = selected.stream().map(Stay::getId).collect(Collectors.toSet());
        
        for (ScoredStay ss : scoredStays) {
            if (selected.size() >= FINAL_RECOMMENDATIONS) break;
            
            Stay stay = ss.getStay();
            Stay.StayType type = stay.getStayType();
            
            if (selectedIds.contains(stay.getId()) || typeCount.get(type) >= 2) {
                continue;
            }
            
            selected.add(stay);
            selectedIds.add(stay.getId());
            typeCount.put(type, typeCount.get(type) + 1);
        }
        
        if (selected.size() < FINAL_RECOMMENDATIONS) {
            Stay.StayType primaryType = scoredStays.get(0).getStay().getStayType();
            
            for (ScoredStay ss : scoredStays) {
                if (selected.size() >= FINAL_RECOMMENDATIONS) break;
                
                Stay stay = ss.getStay();
                if (!selectedIds.contains(stay.getId()) && stay.getStayType() == primaryType) {
                    selected.add(stay);
                    selectedIds.add(stay.getId());
                }
            }
        }
        
        log.info("타입별 선정 개수: {}", typeCount);
        return selected;
    }

    private List<Stay> sortWithTypeDiversity(List<Stay> stays) {
        Map<Stay.StayType, Long> typeCount = stays.stream()
                .collect(Collectors.groupingBy(Stay::getStayType, Collectors.counting()));
        
        Stay.StayType primaryType = typeCount.entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey)
                .orElse(stays.get(0).getStayType());
        
        List<Stay> primaryStays = stays.stream()
                .filter(stay -> stay.getStayType() == primaryType)
                .sorted(Comparator.comparingDouble(Stay::getRecommendationScore).reversed())
                .collect(Collectors.toList());
        
        List<Stay> otherStays = stays.stream()
                .filter(stay -> stay.getStayType() != primaryType)
                .sorted(Comparator.comparingDouble(Stay::getRecommendationScore).reversed())
                .collect(Collectors.toList());
        
        List<Stay> result = new ArrayList<>();
        int primaryIndex = 0;
        int otherIndex = 0;
        
        while (primaryIndex < primaryStays.size() || otherIndex < otherStays.size()) {
            for (int i = 0; i < 3 && primaryIndex < primaryStays.size(); i++) {
                result.add(primaryStays.get(primaryIndex++));
            }
            
            if (otherIndex < otherStays.size()) {
                result.add(otherStays.get(otherIndex++));
            }
        }
        
        log.info("타입 분산 정렬 완료 - 1순위({}):{}개, 기타:{}개 (각각 점수순)", 
                primaryType, primaryStays.size(), otherStays.size());
        return result;
    }

    private String formatLocation(Stay stay) {
        String city = stay.getRegion().getCityName();
        String area = stay.getRegion().getAreaName();
        return city + " • " + area;
    }

    // ========================================
    // 스코어링 세부 로직
    // ========================================
    
    private double calculateScore(
            Stay stay, UserSurvey survey, ScoreWeight weight, Long userId, UserType userType) {
        
        double surveyScore = calculateSurveyScore(stay, survey);
        double patternScore = calculatePatternScore(stay, userId, userType);
        double popularScore = calculatePopularityScore(stay);

        double totalScore = (surveyScore * weight.getSurveyWeight()) +
                           (patternScore * weight.getPatternWeight()) +
                           (popularScore * weight.getPopularWeight());

        return totalScore;
    }

    private double calculateSurveyScore(Stay stay, UserSurvey survey) {
        double score = 0.0;

        BigDecimal regionWeight = survey.getRegions().stream()
                .filter(r -> r.getRegionName().equals(stay.getRegion().getAreaName()))
                .findFirst()
                .map(UserSurveyRegion::getWeight)
                .orElse(BigDecimal.ZERO);
        score += regionWeight.doubleValue();

        Stay.StayType preferredType = convertToStayType(survey.getStayType());
        if (stay.getStayType().equals(preferredType)) {
            score += 5;
        }

        return score * 10;
    }

    private double calculatePatternScore(Stay stay, Long userId, UserType userType) {
        if (userType == UserType.NEW) {
            return 0.0;
        }

        double score = 0.0;

        List<Object[]> regionFreq = reservationRepository.findRegionFrequencyByUserId(userId);
        for (int i = 0; i < Math.min(3, regionFreq.size()); i++) {
            Object[] row = regionFreq.get(i);
            String regionName = (String) row[0];
            Long count = (Long) row[1];
            
            if (stay.getRegion().getAreaName().equals(regionName)) {
                double baseScore = 30 - (i * 10);
                double frequencyBonus = Math.min(5, count * 1);
                score += baseScore + frequencyBonus;
                break;
            }
        }

        List<Object[]> typeFreq = reservationRepository.findStayTypeFrequencyByUserId(userId);
        for (int i = 0; i < Math.min(3, typeFreq.size()); i++) {
            Object[] row = typeFreq.get(i);
            Stay.StayType stayType = (Stay.StayType) row[0];
            Long count = (Long) row[1];
            
            if (stay.getStayType().equals(stayType)) {
                double baseScore = 30 - (i * 10);
                double frequencyBonus = Math.min(5, count * 1);
                score += baseScore + frequencyBonus;
                break;
            }
        }

        BigDecimal userAvgPrice = reservationRepository.findAvgPricePerNightByUserId(userId);
        if (userAvgPrice != null) {
            BigDecimal stayPrice = stayRepository.findMinWeekdayPrice(stay.getId());
            if (stayPrice != null) {
                double avgPrice = userAvgPrice.doubleValue();
                double currentPrice = stayPrice.doubleValue();
                double priceDiffPercent = Math.abs(currentPrice - avgPrice) / avgPrice * 100;
                double priceScore = Math.max(0, 40 - (priceDiffPercent / 2.5));
                score += priceScore;
            }
        }

        return Math.min(100, score);
    }

    private double calculatePopularityScore(Stay stay) {
        double score = 0.0;
        
        double ratingScore = (stay.getAverageRating().doubleValue() / 5.0) * 70;
        score += ratingScore;
        
        double reviewScore = Math.min(30, Math.log(stay.getReviewCount() + 1) * 5);
        score += reviewScore;
        
        return Math.min(100, score);
    }

    // ========================================
    // 유틸리티 메서드
    // ========================================
    
    private Stay.StayType convertToStayType(UserSurvey.StayType surveyType) {
        switch (surveyType) {
            case PENSION: return Stay.StayType.펜션;
            case HOTEL: return Stay.StayType.호텔;
            case MOTEL: return Stay.StayType.모텔;
            default: throw new RuntimeException("알 수 없는 타입");
        }
    }

    private static class ScoredStay {
        private final Stay stay;
        private final double score;

        public ScoredStay(Stay stay, double score) {
            this.stay = stay;
            this.score = score;
        }

        public Stay getStay() { return stay; }
        public double getScore() { return score; }
    }
}