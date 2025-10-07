package com.quadrant.travelshoot.domains.main.service;

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

    private static final BigDecimal PRICE_MARGIN = BigDecimal.valueOf(30000);

    public List<Stay> getRecommendations(Long userId) {

        UserSurvey survey = userSurveyRepository.findByUserId(userId)
                .orElseThrow(() -> new RuntimeException("설문조사를 완료해주세요"));

        BigDecimal basePrice = calculateBasePrice(userId);

        List<String> regionsByRank = survey.getRegions().stream()
                .sorted(Comparator.comparingInt(UserSurveyRegion::getRankOrder))
                .map(UserSurveyRegion::getRegionName)
                .collect(Collectors.toList());

        List<Stay.StayType> typesByRank = getStayTypesByRank(survey.getStayType());

        List<Stay> candidates = searchWithLevels(regionsByRank, typesByRank, basePrice);

        List<Stay> scored = candidates.stream()
                .map(stay -> new ScoredStay(stay, calculateScore(stay, survey)))
                .sorted(Comparator.comparingDouble(ScoredStay::getScore).reversed())
                .limit(10)
                .map(ScoredStay::getStay)
                .collect(Collectors.toList());

        log.info("추천 완료 - 기준가격: {}, 후보: {}개, 최종: {}개", basePrice, candidates.size(), scored.size());

        return scored;
    }

    private BigDecimal calculateBasePrice(Long userId) {
        long reservationCount = reservationRepository.countByUserId(userId);

        if (reservationCount == 0) {
            BigDecimal avgPrice = reservationRepository.findOverallAvgPricePerNight();
            log.info("신규 사용자 - 전체 예약 평균: {}", avgPrice);
            return avgPrice != null ? avgPrice : BigDecimal.valueOf(150000);
        } else {
            BigDecimal userAvg = reservationRepository.findAvgPricePerNightByUserId(userId);
            log.info("기존 사용자 - 본인 예약 평균: {}", userAvg);
            return userAvg != null ? userAvg : BigDecimal.valueOf(150000);
        }
    }

    private List<Stay> searchWithLevels(List<String> regions, List<Stay.StayType> types, BigDecimal basePrice) {

        List<Stay> result = tryLevel(
                regions.subList(0, Math.min(1, regions.size())),
                types.subList(0, Math.min(2, types.size())),
                BigDecimal.valueOf(4.5),
                basePrice,
                PRICE_MARGIN,
                1);
        if (result.size() >= 50)
            return result;

        result = tryLevel(
                regions.subList(0, Math.min(2, regions.size())),
                types.subList(0, Math.min(2, types.size())),
                BigDecimal.valueOf(4.3),
                basePrice,
                PRICE_MARGIN.multiply(BigDecimal.valueOf(1.2)),
                2);
        if (result.size() >= 50)
            return result;

        result = tryLevel(
                regions.subList(0, Math.min(3, regions.size())),
                types,
                BigDecimal.valueOf(4.1),
                basePrice,
                PRICE_MARGIN.multiply(BigDecimal.valueOf(1.4)),
                3);

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
                    return price != null && price.compareTo(minPrice) >= 0 && price.compareTo(maxPrice) <= 0;
                })
                .collect(Collectors.toList());

        log.info("Level {}: 평점 {}+, 가격 {}-{} → {}개", level, minRating, minPrice, maxPrice, filtered.size());

        return filtered;
    }

    private double calculateScore(Stay stay, UserSurvey survey) {
        double surveyScore = 0.0;

        BigDecimal regionWeight = survey.getRegions().stream()
                .filter(r -> r.getRegionName().equals(stay.getRegion().getAreaName()))
                .findFirst()
                .map(UserSurveyRegion::getWeight)
                .orElse(BigDecimal.ZERO);

        surveyScore += regionWeight.doubleValue();

        Stay.StayType preferredType = convertToStayType(survey.getStayType());
        if (stay.getStayType().equals(preferredType)) {
            surveyScore += 5;
        }

        surveyScore = surveyScore * 10;

        double popularityScore = calculatePopularityScore(stay);

        return (surveyScore * 0.7) + (popularityScore * 0.3);
    }

    private double calculatePopularityScore(Stay stay) {
        double ratingScore = (stay.getAverageRating().doubleValue() / 5.0) * 60;
        double reviewScore = Math.min(30, Math.log(stay.getReviewCount() + 1) * 6);
        double viewScore = Math.min(10, Math.log(stay.getViewCount() + 1));
        return ratingScore + reviewScore + viewScore;
    }

    private Stay.StayType convertToStayType(UserSurvey.StayType surveyType) {
        switch (surveyType) {
            case PENSION:
                return Stay.StayType.펜션;
            case HOTEL:
                return Stay.StayType.호텔;
            case MOTEL:
                return Stay.StayType.모텔;
            default:
                throw new RuntimeException("알 수 없는 타입");
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

        public Stay getStay() {
            return stay;
        }

        public double getScore() {
            return score;
        }
    }
}