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
    private static final int MIN_CANDIDATES = 50;  //최소 후보 개수
    private static final int FINAL_RECOMMENDATIONS = 15;  // 최종 추천 개수

 
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
        log.info("타입 순위: {}", typesByRank);

        // 5. 5단계 완화 필터링 (최소 50개 목표)
        List<Stay> candidates = searchWithLevels(regionsByRank, typesByRank, basePrice);
        log.info("5단계 완화 후 후보군: {}개", candidates.size());

        // 6. 최소 50개 후보 보장
        if (candidates.size() < MIN_CANDIDATES) {
            log.warn("후보 부족 ({}/{}) - 평점순 추가 조회", candidates.size(), MIN_CANDIDATES);
            ensureMinimumCandidates(candidates);
            log.info("추가 확보 후 후보군: {}개", candidates.size());
        }

        // 7. 스코어링 및 상위 15개 선택
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
            // 신규: 전체 평균
            BigDecimal avgPrice = reservationRepository.findOverallAvgPricePerNight();
            log.info("신규 사용자 - 전체 평균: {}", avgPrice);
            return avgPrice != null ? avgPrice : BigDecimal.valueOf(150000);
        } else {
            // 기존: 본인 평균
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
            // 신규: 설문조사만
            return survey.getRegions().stream()
                    .sorted(Comparator.comparingInt(UserSurveyRegion::getRankOrder))
                    .map(UserSurveyRegion::getRegionName)
                    .collect(Collectors.toList());
        } else {
            // 라이트/헤비: 예약 패턴 우선
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
    // 4단계: 타입 순위 결정
    // ========================================
    
    private List<Stay.StayType> getStayTypeRankings(Long userId, UserType userType, UserSurvey survey) {
        if (userType == UserType.NEW) {
            // 신규: 설문조사만
            return getStayTypesByRank(survey.getStayType());
        } else {
            // 라이트/헤비: 예약 패턴 우선
            List<Object[]> typeFrequency = reservationRepository.findStayTypeFrequencyByUserId(userId);
            
            if (typeFrequency.isEmpty()) {
                return getStayTypesByRank(survey.getStayType());
            }

            List<Stay.StayType> patternBased = typeFrequency.stream()
                    .map(row -> (Stay.StayType) row[0])
                    .collect(Collectors.toList());

            // 설문에 있는 타입 중 예약 안한 타입 추가
            List<Stay.StayType> surveyTypes = getStayTypesByRank(survey.getStayType());
            for (Stay.StayType type : surveyTypes) {
                if (!patternBased.contains(type)) {
                    patternBased.add(type);
                }
            }

            log.info("예약 패턴 기반 타입 순위: {}", patternBased);
            return patternBased;
        }
    }

    // ========================================
    // 5단계: 5단계 완화 필터링
    // ========================================
    
    private List<Stay> searchWithLevels(List<String> regions, List<Stay.StayType> types, BigDecimal basePrice) {
        
        // Level 1: 1순위 지역 + 1~2순위 타입 + 평점 4.5+
        List<Stay> result = tryLevel(
                regions.subList(0, Math.min(1, regions.size())),
                types.subList(0, Math.min(2, types.size())),
                BigDecimal.valueOf(4.5),
                basePrice,
                PRICE_MARGIN,
                1);
        if (result.size() >= MIN_CANDIDATES) return result;

        // Level 2: 1~2순위 지역 + 가격범위 ×1.2
        result = tryLevel(
                regions.subList(0, Math.min(2, regions.size())),
                types.subList(0, Math.min(2, types.size())),
                BigDecimal.valueOf(4.3),
                basePrice,
                PRICE_MARGIN.multiply(BigDecimal.valueOf(1.2)),
                2);
        if (result.size() >= MIN_CANDIDATES) return result;

        // Level 3: 1~3순위 지역 + 가격범위 ×1.4
        result = tryLevel(
                regions.subList(0, Math.min(3, regions.size())),
                types,
                BigDecimal.valueOf(4.1),
                basePrice,
                PRICE_MARGIN.multiply(BigDecimal.valueOf(1.4)),
                3);
        if (result.size() >= MIN_CANDIDATES) return result;

        // Level 4: 1~3순위 지역 + 모든 타입 + 가격범위 ×1.6
        result = tryLevel(
                regions.subList(0, Math.min(3, regions.size())),
                types,
                BigDecimal.valueOf(3.9),
                basePrice,
                PRICE_MARGIN.multiply(BigDecimal.valueOf(1.6)),
                4);
        if (result.size() >= MIN_CANDIDATES) return result;

        // Level 5: 가격 제한 해제 (최후의 수단)
        log.info("Level 5: 가격 제한 해제, 평점순 최대 100개");
        List<Stay> allCandidates = stayRepository.findWithFilters(
                regions,
                types,
                BigDecimal.valueOf(0.0)
        );
        
        result = allCandidates.stream()
                .limit(100)
                .collect(Collectors.toList());
        
        log.info("Level 5 결과: {}개", result.size());
        return result;
    }

    private List<Stay> tryLevel(
            List<String> regionNames,
            List<Stay.StayType> stayTypes,
            BigDecimal minRating,
            BigDecimal basePrice,
            BigDecimal priceMargin,
            int level) {
        
        List<Stay> candidates = stayRepository.findWithFilters(regionNames, stayTypes, minRating);

        BigDecimal minPrice = basePrice.subtract(priceMargin);
        BigDecimal maxPrice = basePrice.add(priceMargin);

        List<Stay> filtered = candidates.stream()
                .filter(stay -> {
                    BigDecimal price = stayRepository.findMinWeekdayPrice(stay.getId());
                    return price != null && 
                           price.compareTo(minPrice) >= 0 && 
                           price.compareTo(maxPrice) <= 0;
                })
                .collect(Collectors.toList());

        log.info("Level {}: 평점 {}+, 가격 {}-{} → {}개", 
                level, minRating, minPrice, maxPrice, filtered.size());

        return filtered;
    }

    // ========================================
    // 6단계: 최소 후보 보장
    // ========================================
    
    private void ensureMinimumCandidates(List<Stay> candidates) {
        int needed = MIN_CANDIDATES - candidates.size();
        List<Stay> additionalStays = stayRepository.findTopByOrderByAverageRatingDesc(needed);
        
        // 중복 제거
        Set<Long> existingIds = candidates.stream()
                .map(Stay::getId)
                .collect(Collectors.toSet());
        
        additionalStays.stream()
                .filter(stay -> !existingIds.contains(stay.getId()))
                .forEach(candidates::add);
    }

    // ========================================
    // 7단계: 스코어링 및 상위 선택
    // ========================================

    private List<Map<String, Object>> scoreAndSelectTop(
            List<Stay> candidates, 
            UserSurvey survey, 
            UserType userType, 
            Long userId) {
        
        ScoreWeight weight = ScoreWeight.forUserType(userType);
        
        // 1단계: 스코어링 후 상위 15개 선정
        List<Stay> top15 = candidates.stream()
                .map(stay -> {
                    double score = calculateScore(stay, survey, weight, userId, userType);
                    stay.setRecommendationScore(score);
                    return new ScoredStay(stay, score);
                })
                .sorted(Comparator.comparingDouble(ScoredStay::getScore).reversed())
                .limit(FINAL_RECOMMENDATIONS)
                .map(ScoredStay::getStay)
                .collect(Collectors.toList());

        log.info("1차 스코어링 완료 - 상위 15개 선정");

        // 2단계: OpenAI로 10개 정제
        OpenAIResponse refinement = openAIService.refineRecommendations(top15, survey);
        
        // 3단계: 메모리에서 선택된 ID로 필터링
        List<Stay> finalTop10 = refinement.getSelectedIds().stream()
                .map(id -> top15.stream()
                        .filter(stay -> stay.getId().equals(id))
                        .findFirst()
                        .orElse(null))
                .filter(java.util.Objects::nonNull)
                .collect(Collectors.toList());

        log.info("OpenAI 정제 완료 - 설명: {}, 최종: {}개", 
                refinement.getDescription(), finalTop10.size());

        // 4단계: 간소화된 응답 생성 (Map)
        List<Map<String, Object>> responses = finalTop10.stream()
                .map(stay -> {
                    BigDecimal price = stayRepository.findMinWeekdayPrice(stay.getId());
                    
                    log.info("최종 추천: {} ({}점)", stay.getStayName(), 
                            String.format("%.2f", stay.getRecommendationScore()));
                    
                    Map<String, Object> response = new HashMap<>();
                    response.put("id", stay.getId());
                    response.put("stayCode", stay.getStayCode());
                    response.put("title", stay.getStayName());
                    response.put("image", null); // TODO: 나중에 추가
                    response.put("rating", stay.getAverageRating());
                    response.put("location", formatLocation(stay));
                    response.put("price", price);
                    response.put("checkinTime", stay.getCheckInTime().toString().substring(0, 5));
                    
                    return response;
                })
                .collect(Collectors.toList());
        
        return responses;
    }

    /**
     * 위치 포맷팅
     */
    private String formatLocation(Stay stay) {
        String city = stay.getRegion().getCityName();
        String area = stay.getRegion().getAreaName();
        return city + " • " + area;
    }

    // ========================================
    // 스코어링 세부 로직
    // ========================================
    
    
    // 총점 계산 (사용자별 가중치 적용)
     
    private double calculateScore(
            Stay stay, 
            UserSurvey survey, 
            ScoreWeight weight, 
            Long userId, 
            UserType userType) {
        
        double surveyScore = calculateSurveyScore(stay, survey);
        double patternScore = calculatePatternScore(stay, userId, userType);
        double popularScore = calculatePopularityScore(stay);

        double totalScore = (surveyScore * weight.getSurveyWeight()) +
                           (patternScore * weight.getPatternWeight()) +
                           (popularScore * weight.getPopularWeight());

        return totalScore;
    }

    // 설문 매칭 
    private double calculateSurveyScore(Stay stay, UserSurvey survey) {
        double score = 0.0;

        // 지역 매칭
        BigDecimal regionWeight = survey.getRegions().stream()
                .filter(r -> r.getRegionName().equals(stay.getRegion().getAreaName()))
                .findFirst()
                .map(UserSurveyRegion::getWeight)
                .orElse(BigDecimal.ZERO);
        score += regionWeight.doubleValue();

        // 타입 매칭
        Stay.StayType preferredType = convertToStayType(survey.getStayType());
        if (stay.getStayType().equals(preferredType)) {
            score += 5;
        }

        return score * 10;
    }


    // 예약 패턴 점수 (최대 100점)

    private double calculatePatternScore(Stay stay, Long userId, UserType userType) {
        if (userType == UserType.NEW) {
            return 0.0;
        }

        double score = 0.0;

        // 1. 지역 패턴 점수 (최대 35점)
        List<Object[]> regionFreq = reservationRepository.findRegionFrequencyByUserId(userId);
        for (int i = 0; i < Math.min(3, regionFreq.size()); i++) {
            Object[] row = regionFreq.get(i);
            String regionName = (String) row[0];
            Long count = (Long) row[1];
            
            if (stay.getRegion().getAreaName().equals(regionName)) {
                double baseScore = 30 - (i * 10);  // 1순위 30점, 2순위 20점, 3순위 10점
                double frequencyBonus = Math.min(5, count * 1);  // 빈도 보너스 최대 5점
                score += baseScore + frequencyBonus;
                break;
            }
        }

        // 2. 타입 패턴 점수 (최대 35점)
        List<Object[]> typeFreq = reservationRepository.findStayTypeFrequencyByUserId(userId);
        for (int i = 0; i < Math.min(3, typeFreq.size()); i++) {
            Object[] row = typeFreq.get(i);
            Stay.StayType stayType = (Stay.StayType) row[0];
            Long count = (Long) row[1];
            
            if (stay.getStayType().equals(stayType)) {
                double baseScore = 30 - (i * 10);  // 1순위 30점, 2순위 20점, 3순위 10점
                double frequencyBonus = Math.min(5, count * 1);  // 빈도 보너스 최대 5점
                score += baseScore + frequencyBonus;
                break;
            }
        }

        // 3. 가격 근접도 점수 (최대 40점)
        BigDecimal userAvgPrice = reservationRepository.findAvgPricePerNightByUserId(userId);
        if (userAvgPrice != null) {
            BigDecimal stayPrice = stayRepository.findMinWeekdayPrice(stay.getId());
            if (stayPrice != null) {
                double avgPrice = userAvgPrice.doubleValue();
                double currentPrice = stayPrice.doubleValue();
                
                // 가격 차이율 계산 (%)
                double priceDiffPercent = Math.abs(currentPrice - avgPrice) / avgPrice * 100;
                
                // 차이율에 따른 감점
                // 0%: 40점, 10%: 36점, 20%: 32점, 50%: 20점, 100%+: 0점
                double priceScore = Math.max(0, 40 - (priceDiffPercent / 2.5));
                score += priceScore;
            }
        }

        return Math.min(100, score);
    }

    // 인기도 점수
    private double calculatePopularityScore(Stay stay) {
        double score = 0.0;
        
        // 1. 평점 점수 (최대 70점)
        double ratingScore = (stay.getAverageRating().doubleValue() / 5.0) * 70;
        score += ratingScore;
        
        // 2. 리뷰 개수 점수 (최대 30점)
        double reviewScore = Math.min(30, Math.log(stay.getReviewCount() + 1) * 5);
        score += reviewScore;
        
        return Math.min(100, score);
    }

    // 유틸리티 메서드    
    private Stay.StayType convertToStayType(UserSurvey.StayType surveyType) {
        switch (surveyType) {
            case PENSION: return Stay.StayType.펜션;
            case HOTEL: return Stay.StayType.호텔;
            case MOTEL: return Stay.StayType.모텔;
            default: throw new RuntimeException("알 수 없는 타입");
        }
    }

    private List<Stay.StayType> getStayTypesByRank(UserSurvey.StayType preferredType) {
        List<Stay.StayType> types = new ArrayList<>();
        switch (preferredType) {
            case PENSION:
                types.add(Stay.StayType.펜션);
                types.add(Stay.StayType.호텔);
                types.add(Stay.StayType.모텔);
                break;
            case HOTEL:
                types.add(Stay.StayType.호텔);
                types.add(Stay.StayType.펜션);
                types.add(Stay.StayType.모텔);
                break;
            case MOTEL:
                types.add(Stay.StayType.모텔);
                types.add(Stay.StayType.호텔);
                types.add(Stay.StayType.펜션);
                break;
        }
        return types;
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