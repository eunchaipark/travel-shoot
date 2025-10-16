package com.quadrant.travelshoot.domains.travelcourse.service.impl;

import com.quadrant.travelshoot.domains.activity.entity.Activity;
import com.quadrant.travelshoot.domains.activity.service.ActivityService;
import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import com.quadrant.travelshoot.domains.restaurant.service.RestaurantService;
import com.quadrant.travelshoot.domains.reservation.service.ReservationService;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.service.StayService;
import com.quadrant.travelshoot.domains.survey.entity.UserSurvey;
import com.quadrant.travelshoot.domains.survey.entity.UserSurveyActivity;
import com.quadrant.travelshoot.domains.survey.entity.UserSurveyFood;
import com.quadrant.travelshoot.domains.survey.service.UserSurveyService;
import com.quadrant.travelshoot.domains.travelcourse.dto.response.StayLocation;
import com.quadrant.travelshoot.domains.travelcourse.dto.response.TravelCourseRecommendationData;
import com.quadrant.travelshoot.domains.restaurant.entity.Restaurant;
import com.quadrant.travelshoot.domains.travelcourse.service.TravelCourseRecommendationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class TravelCourseRecommendationServiceImpl implements TravelCourseRecommendationService {

    private final ReservationService reservationService;
    private final UserSurveyService userSurveyService;
    private final RestaurantService restaurantService;
    private final ActivityService activityService;
    private final StayService stayService;

    private static final double EARTH_RADIUS_KM = 6371.0;

    @Override
    public TravelCourseRecommendationData getRecommendations(Long reservationId, Long userId, Integer totalDays) {
        log.info("추천 데이터 조회 시작 - reservationId: {}, userId: {}, totalDays: {}",
                reservationId, userId, totalDays);

        int requiredCount = totalDays * 5;

        // 1. 숙소 위치 조회
        StayLocation stayLocation = getStayLocation(reservationId);

        // 2. 설문조사 조회
        Optional<UserSurvey> surveyOpt = userSurveyService.getByUserId(userId);

        // 3. 맛집 추천
        List<Restaurant> restaurants = recommendRestaurants(
                stayLocation, surveyOpt, requiredCount);

        // 4. 관광지 추천
        List<Activity> activities = recommendActivities(
                stayLocation, surveyOpt, requiredCount);

        log.info("추천 완료 - 맛집: {}개, 관광지: {}개", restaurants.size(), activities.size());

        return TravelCourseRecommendationData.builder()
                .stayLocation(stayLocation)
                .restaurants(restaurants)
                .activities(activities)
                .hasSurvey(surveyOpt.isPresent())
                .build();
    }

    /**
     * 숙소 위치 조회
     */
    private StayLocation getStayLocation(Long reservationId) {
        // 1. Reservation으로 Room 조회
        Reservation reservation = reservationService.getById(reservationId);
        Long stayId = reservation.getRoom().getStay().getId();

        // 2. stayId로 Stay 조회
        Stay stay = stayService.getById(stayId);

        return StayLocation.builder()
                .stayId(stay.getId())
                .stayName(stay.getName())
                .latitude(stay.getLatitude())
                .longitude(stay.getLongitude())
                .address(stay.getAddress())
                .build();
    }

    /**
     * 맛집 추천 (단계적 완화)
     */
    private List<Restaurant> recommendRestaurants(
            StayLocation location, Optional<UserSurvey> surveyOpt, int requiredCount) {

        // 설문조사 체크
        if (surveyOpt.isPresent()) {
            UserSurvey survey = surveyOpt.get();
            List<UserSurveyFood> foodPrefs = survey.getFoods();

            if (foodPrefs != null && !foodPrefs.isEmpty()) {
                log.info("설문조사 기반 맛집 추천 시작 - 선호도: {}개", foodPrefs.size());
                return recommendRestaurantsWithSurvey(location, foodPrefs, requiredCount);
            }
        }

        // 설문조사 없거나 비어있음
        log.info("설문조사 없음 - 평점/거리 기반 맛집 추천");
        return recommendRestaurantsWithoutSurvey(location, requiredCount);
    }

    /**
     * 관광지 추천 (단계적 완화)
     */
    private List<Activity> recommendActivities(
            StayLocation location, Optional<UserSurvey> surveyOpt, int requiredCount) {

        // 설문조사 체크
        if (surveyOpt.isPresent()) {
            UserSurvey survey = surveyOpt.get();
            List<UserSurveyActivity> activityPrefs = survey.getActivities();

            if (activityPrefs != null && !activityPrefs.isEmpty()) {
                log.info("설문조사 기반 관광지 추천 시작 - 선호도: {}개", activityPrefs.size());
                return recommendActivitiesWithSurvey(location, activityPrefs, requiredCount);
            }
        }

        // 설문조사 없거나 비어있음
        log.info("설문조사 없음 - 평점/거리 기반 관광지 추천");
        return recommendActivitiesWithoutSurvey(location, requiredCount);
    }

    /**
     * 맛집 추천 - 설문 기반 (가중치 단계별 완화)
     */
    private List<Restaurant> recommendRestaurantsWithSurvey(
            StayLocation location,
            List<UserSurveyFood> preferences,
            int requiredCount) {

        // 선호도를 가중치 기준 내림차순 정렬
        List<UserSurveyFood> sortedPrefs = preferences.stream()
                .sorted(Comparator.comparing(UserSurveyFood::getWeight).reversed())
                .collect(Collectors.toList());

        // 단계별 시도
        List<Restaurant> result;

        // 1단계: 가중치 차등 최대 (1.0, 0.8, 0.6, 0.4, 0.2) + 평점 4.0+ + 20km
        result = tryRestaurantRecommendation(location, sortedPrefs, requiredCount, 4.0, 20.0, BigDecimal.valueOf(1.0));
        if (result.size() >= requiredCount) {
            log.info("맛집 1단계 성공 - {}개 확보", result.size());
            return result.subList(0, requiredCount);
        }

        // 2단계: 가중치 차등 완화 (1.0, 0.9, 0.8, 0.7, 0.6) + 평점 4.0+ + 20km
        result = tryRestaurantRecommendation(location, sortedPrefs, requiredCount, 4.0, 20.0, BigDecimal.valueOf(0.9));
        if (result.size() >= requiredCount) {
            log.info("맛집 2단계 성공 - {}개 확보", result.size());
            return result.subList(0, requiredCount);
        }

        // 3단계: 가중치 차등 더 완화 (거의 균등) + 평점 4.0+ + 20km
        result = tryRestaurantRecommendation(location, sortedPrefs, requiredCount, 4.0, 20.0, BigDecimal.valueOf(0.8));
        if (result.size() >= requiredCount) {
            log.info("맛집 3단계 성공 - {}개 확보", result.size());
            return result.subList(0, requiredCount);
        }

        // 4단계: 평점 3.5로 완화 + 20km
        result = tryRestaurantRecommendation(location, sortedPrefs, requiredCount, 3.5, 20.0, BigDecimal.valueOf(0.8));
        if (result.size() >= requiredCount) {
            log.info("맛집 4단계 성공 - {}개 확보", result.size());
            return result.subList(0, requiredCount);
        }

        // 5단계: 거리 30km로 확대 + 평점 3.5
        result = tryRestaurantRecommendation(location, sortedPrefs, requiredCount, 3.5, 30.0, BigDecimal.valueOf(0.8));
        if (result.size() >= requiredCount) {
            log.info("맛집 5단계 성공 - {}개 확보", result.size());
            return result.subList(0, requiredCount);
        }

        // 6단계: 설문조사 무시하고 평점/거리만 고려
        log.warn("맛집 설문 기반 추천 실패 - 평점/거리 기반으로 전환");
        return recommendRestaurantsWithoutSurvey(location, requiredCount);
    }

    /**
     * 맛집 가중치 기반 추천 시도
     */
    private List<Restaurant> tryRestaurantRecommendation(
            StayLocation location,
            List<UserSurveyFood> sortedPrefs,
            int requiredCount,
            double minRating,
            double maxDistanceKm,
            BigDecimal weightMultiplier) {

        // 카테고리별 필요 개수 계산 (가중치 기반 비율)
        Map<String, Integer> categoryQuota = calculateCategoryQuota(
                sortedPrefs, requiredCount, weightMultiplier);

        log.debug("맛집 카테고리별 목표: {}, 평점: {}, 거리: {}km", categoryQuota, minRating, maxDistanceKm);

        // 전체 카테고리 후보 조회
        List<String> allCategories = sortedPrefs.stream()
                .map(pref -> pref.getFoodCategory().name())
                .collect(Collectors.toList());

        List<Restaurant> candidates = restaurantService.getByCategoriesAndRatingAndDistance(
                allCategories, minRating, location.getLatitude(), location.getLongitude(), maxDistanceKm);



        // 가중치 맵 생성
        Map<String, BigDecimal> weightMap = sortedPrefs.stream()
                .collect(Collectors.toMap(
                        pref -> pref.getFoodCategory().name(),
                        UserSurveyFood::getWeight
                ));

        // 카테고리별 그룹핑 및 점수 계산
        Map<String, List<ScoredItem<Restaurant>>> categoryGroups = candidates.stream()
                .map(r -> new ScoredItem<>(
                        r,
                        scoreRestaurant(r, location, weightMap)
                ))
                .collect(Collectors.groupingBy(
                        item -> item.getItem().getFoodType()
                ));

        // 카테고리별 정렬 (점수 높은 순)
        for (List<ScoredItem<Restaurant>> list : categoryGroups.values()) {
            list.sort(Comparator.comparing((ScoredItem<Restaurant> item) -> item.getScore()).reversed());
        }

        // 카테고리별 할당량만큼 선택
        List<Restaurant> result = new ArrayList<>();
        for (Map.Entry<String, Integer> entry : categoryQuota.entrySet()) {
            String category = entry.getKey();
            int quota = entry.getValue();

            List<ScoredItem<Restaurant>> categoryItems =
                    categoryGroups.getOrDefault(category, Collections.emptyList());

            int takeCount = Math.min(quota, categoryItems.size());
            categoryItems.stream()
                    .limit(takeCount)
                    .map(ScoredItem::getItem)
                    .forEach(result::add);
        }

        // 할당량을 못 채운 경우, 남은 것들을 점수 순으로 추가
        if (result.size() < requiredCount) {
            Set<Long> selectedIds = result.stream()
                    .map(Restaurant::getId)
                    .collect(Collectors.toSet());

            candidates.stream()
                    .filter(r -> !selectedIds.contains(r.getId()))
                    .map(r -> new ScoredItem<>(
                            r,
                            scoreRestaurant(r, location, weightMap)
                    ))
                    .sorted(Comparator.comparing((ScoredItem<Restaurant> item) -> item.getScore()).reversed())
                    .limit(requiredCount - result.size())
                    .map(ScoredItem::getItem)
                    .forEach(result::add);
        }

        return result;
    }

    /**
     * 카테고리별 할당량 계산 (가중치 비율 기반)
     */
    private Map<String, Integer> calculateCategoryQuota(
            List<UserSurveyFood> sortedPrefs,
            int totalCount,
            BigDecimal weightMultiplier) {

        // 가중치 재조정 (차등 완화)
        List<BigDecimal> adjustedWeights = new ArrayList<>();
        BigDecimal baseWeight = sortedPrefs.get(0).getWeight();

        for (int i = 0; i < sortedPrefs.size(); i++) {
            BigDecimal originalWeight = sortedPrefs.get(i).getWeight();
            // weightMultiplier가 클수록 차등이 심함
            BigDecimal adjusted = baseWeight.subtract(
                    baseWeight.subtract(originalWeight).multiply(weightMultiplier)
            );
            adjustedWeights.add(adjusted);
        }

        // 전체 가중치 합
        BigDecimal totalWeight = adjustedWeights.stream()
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        // 비율대로 할당
        Map<String, Integer> quota = new LinkedHashMap<>();
        int allocated = 0;

        for (int i = 0; i < sortedPrefs.size(); i++) {
            String category = sortedPrefs.get(i).getFoodCategory().name();
            BigDecimal weight = adjustedWeights.get(i);

            // 마지막 카테고리는 남은 개수 전부
            if (i == sortedPrefs.size() - 1) {
                quota.put(category, totalCount - allocated);
            } else {
                int count = weight.divide(totalWeight, 10, RoundingMode.HALF_UP)
                        .multiply(BigDecimal.valueOf(totalCount))
                        .setScale(0, RoundingMode.HALF_UP)
                        .intValue();
                quota.put(category, count);
                allocated += count;
            }
        }

        return quota;
    }

    /**
     * 맛집 점수 계산
     */
    private BigDecimal scoreRestaurant(
            Restaurant restaurant,
            StayLocation location,
            Map<String, BigDecimal> weightMap) {

        BigDecimal categoryWeight = weightMap.getOrDefault(restaurant.getFoodType(), BigDecimal.ZERO);
        BigDecimal rating = restaurant.getRating(); // 이미 BigDecimal이면 그대로 사용
        BigDecimal distance = calculateDistance(
                location.getLatitude(), location.getLongitude(),
                restaurant.getLatitude(), restaurant.getLongitude()
        );

        // 점수 = 가중치 * 100 + 평점 * 10 - 거리
        return categoryWeight.multiply(BigDecimal.valueOf(100))
                .add(rating.multiply(BigDecimal.TEN))
                .subtract(distance);
    }

    /**
     * 맛집 추천 - 설문 없음 (평점/거리만)
     */
    private List<Restaurant> recommendRestaurantsWithoutSurvey(
            StayLocation location, int requiredCount) {

        List<Restaurant> result;

        // 1단계: 평점 4.0+ + 20km
        result = restaurantService.getByRatingAndDistance(
                4.0, location.getLatitude(), location.getLongitude(), 20.0);

        if (result.size() >= requiredCount) {
            return sortAndLimitRestaurants(result, location, requiredCount);
        }

        // 2단계: 평점 3.5+ + 20km
        result = restaurantService.getByRatingAndDistance(
                3.5, location.getLatitude(), location.getLongitude(), 20.0);

        if (result.size() >= requiredCount) {
            return sortAndLimitRestaurants(result, location, requiredCount);
        }

        // 3단계: 평점 3.5+ + 30km
        result = restaurantService.getByRatingAndDistance(
                3.5, location.getLatitude(), location.getLongitude(), 30.0);

        return sortAndLimitRestaurants(result, location, requiredCount);
    }

    /**
     * 관광지 추천 - 설문 기반
     */
    private List<Activity> recommendActivitiesWithSurvey(
            StayLocation location,
            List<UserSurveyActivity> preferences,
            int requiredCount) {

        // 선호도를 가중치 기준 내림차순 정렬
        List<UserSurveyActivity> sortedPrefs = preferences.stream()
                .sorted(Comparator.comparing(UserSurveyActivity::getWeight).reversed())
                .collect(Collectors.toList());

        List<Activity> result;

        // 1~5단계 시도
        result = tryActivityRecommendation(location, sortedPrefs, requiredCount, 4.0, 20.0, BigDecimal.valueOf(1.0));
        if (result.size() >= requiredCount) {
            log.info("관광지 1단계 성공 - {}개 확보", result.size());
            return result.subList(0, requiredCount);
        }

        result = tryActivityRecommendation(location, sortedPrefs, requiredCount, 4.0, 20.0, BigDecimal.valueOf(0.9));
        if (result.size() >= requiredCount) {
            log.info("관광지 2단계 성공 - {}개 확보", result.size());
            return result.subList(0, requiredCount);
        }

        result = tryActivityRecommendation(location, sortedPrefs, requiredCount, 4.0, 20.0, BigDecimal.valueOf(0.8));
        if (result.size() >= requiredCount) {
            log.info("관광지 3단계 성공 - {}개 확보", result.size());
            return result.subList(0, requiredCount);
        }

        result = tryActivityRecommendation(location, sortedPrefs, requiredCount, 3.5, 20.0, BigDecimal.valueOf(0.8));
        if (result.size() >= requiredCount) {
            log.info("관광지 4단계 성공 - {}개 확보", result.size());
            return result.subList(0, requiredCount);
        }

        result = tryActivityRecommendation(location, sortedPrefs, requiredCount, 3.5, 30.0, BigDecimal.valueOf(0.8));
        if (result.size() >= requiredCount) {
            log.info("관광지 5단계 성공 - {}개 확보", result.size());
            return result.subList(0, requiredCount);
        }

        // 6단계: 설문 무시
        log.warn("관광지 설문 기반 추천 실패 - 평점/거리 기반으로 전환");
        return recommendActivitiesWithoutSurvey(location, requiredCount);
    }

    /**
     * 관광지 가중치 기반 추천 시도
     */
    private List<Activity> tryActivityRecommendation(
            StayLocation location,
            List<UserSurveyActivity> sortedPrefs,
            int requiredCount,
            double minRating,
            double maxDistanceKm,
            BigDecimal weightMultiplier) {

        // 카테고리별 할당량
        Map<String, Integer> categoryQuota = calculateActivityCategoryQuota(
                sortedPrefs, requiredCount, weightMultiplier);

        log.debug("관광지 카테고리별 목표: {}, 평점: {}, 거리: {}km", categoryQuota, minRating, maxDistanceKm);

        List<String> allCategories = sortedPrefs.stream()
                .map(pref -> pref.getActivityCategory().name())
                .collect(Collectors.toList());

        List<Activity> candidates = activityService.getByCategoriesAndRatingAndDistance(
                allCategories, minRating, location.getLatitude(), location.getLongitude(), maxDistanceKm);

// 2. Map 키를 String으로 변환
        Map<String, BigDecimal> weightMap = sortedPrefs.stream()
                .collect(Collectors.toMap(
                        pref -> pref.getActivityCategory().name(),
                        UserSurveyActivity::getWeight
                ));

// 3. 점수 계산 및 그룹핑 (BigDecimal 사용)
        Map<String, List<ScoredItem<Activity>>> categoryGroups = candidates.stream()
                .map(a -> new ScoredItem<>(
                        a,
                        scoreActivity(a, location, weightMap) // BigDecimal 반환
                ))
                .collect(Collectors.groupingBy(
                        item -> item.getItem().getActivityType()
                ));
        for (List<ScoredItem<Activity>> list : categoryGroups.values()) {
            list.sort(Comparator.comparing((ScoredItem<Activity> item) -> item.getScore()).reversed());
        }
        // 할당량만큼 선택
        List<Activity> result = new ArrayList<>();
        for (Map.Entry<String, Integer> entry : categoryQuota.entrySet()) {
            String category = entry.getKey();
            int quota = entry.getValue();

            List<ScoredItem<Activity>> categoryItems =
                    categoryGroups.getOrDefault(category, Collections.emptyList());

            int takeCount = Math.min(quota, categoryItems.size());
            categoryItems.stream()
                    .limit(takeCount)
                    .map(ScoredItem::getItem)
                    .forEach(result::add);
        }

        // 부족분 채우기
        if (result.size() < requiredCount) {
            Set<Long> selectedIds = result.stream()
                    .map(Activity::getId)
                    .collect(Collectors.toSet());

            candidates.stream()
                    .filter(a -> !selectedIds.contains(a.getId()))
                    .map(a -> new ScoredItem<>(
                            a,
                            scoreActivity(a, location, weightMap)
                    ))
                    .sorted(Comparator.comparing((ScoredItem<Activity> item) -> item.getScore()).reversed())
                    .limit(requiredCount - result.size())
                    .map(ScoredItem::getItem)
                    .forEach(result::add);
        }

        return result;
    }

    /**
     * 관광지 카테고리별 할당량 계산
     */
    private Map<String, Integer> calculateActivityCategoryQuota(
            List<UserSurveyActivity> sortedPrefs,
            int totalCount,
            BigDecimal weightMultiplier) {

        List<BigDecimal> adjustedWeights = new ArrayList<>();
        BigDecimal baseWeight = sortedPrefs.get(0).getWeight();

        for (int i = 0; i < sortedPrefs.size(); i++) {
            BigDecimal originalWeight = sortedPrefs.get(i).getWeight();
            BigDecimal adjusted = baseWeight.subtract(
                    baseWeight.subtract(originalWeight).multiply(weightMultiplier)
            );
            adjustedWeights.add(adjusted);
        }

        BigDecimal totalWeight = adjustedWeights.stream()
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        Map<String, Integer> quota = new LinkedHashMap<>();
        int allocated = 0;

        for (int i = 0; i < sortedPrefs.size(); i++) {
            String category = sortedPrefs.get(i).getActivityCategory().name();
            BigDecimal weight = adjustedWeights.get(i);

            if (i == sortedPrefs.size() - 1) {
                quota.put(category, totalCount - allocated);
            } else {
                int count = weight.divide(totalWeight, 10, RoundingMode.HALF_UP)
                        .multiply(BigDecimal.valueOf(totalCount))
                        .setScale(0, RoundingMode.HALF_UP)
                        .intValue();
                quota.put(category, count);
                allocated += count;
            }
        }

        return quota;
    }

    /**
     * 관광지 점수 계산
     */
    private BigDecimal scoreActivity(
            Activity activity,
            StayLocation location,
            Map<String, BigDecimal> weightMap) {

        BigDecimal categoryWeight = weightMap.getOrDefault(
                activity.getActivityType(), BigDecimal.ZERO);

        BigDecimal rating = activity.getRating();

        BigDecimal distance = calculateDistance(
                location.getLatitude(), location.getLongitude(),
                activity.getLatitude(), activity.getLongitude()
        );

        // 점수 = 가중치 * 100 + 평점 * 10 - 거리
        return categoryWeight.multiply(BigDecimal.valueOf(100))
                .add(rating.multiply(BigDecimal.TEN))
                .subtract(distance);
    }

    /**
     * 관광지 추천 - 설문 없음
     */
    private List<Activity> recommendActivitiesWithoutSurvey(
            StayLocation location, int requiredCount) {

        List<Activity> result;

        result = activityService.getByRatingAndDistance(
                4.0, location.getLatitude(), location.getLongitude(), 20.0);
        if (result.size() >= requiredCount) {
            return sortAndLimitActivities(result, location, requiredCount);
        }

        result = activityService.getByRatingAndDistance(
                3.5, location.getLatitude(), location.getLongitude(), 20.0);
        if (result.size() >= requiredCount) {
            return sortAndLimitActivities(result, location, requiredCount);
        }

        result = activityService.getByRatingAndDistance(
                3.5, location.getLatitude(), location.getLongitude(), 30.0);
        return sortAndLimitActivities(result, location, requiredCount);
    }

    /**
     * 맛집 평점/거리 기준 정렬 및 제한
     */
    private List<Restaurant> sortAndLimitRestaurants(
            List<Restaurant> restaurants, StayLocation location, int limit) {

        return restaurants.stream()
                .sorted(Comparator
                        .comparing(Restaurant::getRating).reversed()  // ✅ comparingDouble → comparing
                        .thenComparing(r -> calculateDistance(  // ✅ comparingDouble → comparing
                                location.getLatitude(), location.getLongitude(),
                                r.getLatitude(), r.getLongitude())))
                .limit(limit)
                .collect(Collectors.toList());
    }

    /**
     * 관광지 평점/거리 기준 정렬 및 제한
     */
    private List<Activity> sortAndLimitActivities(
            List<Activity> activities, StayLocation location, int limit) {

        return activities.stream()
                .sorted(Comparator
                        .comparing(Activity::getRating).reversed()  // ✅ comparing
                        .thenComparing(a -> calculateDistance(  // ✅ comparing
                                location.getLatitude(), location.getLongitude(),
                                a.getLatitude(), a.getLongitude())))
                .limit(limit)
                .collect(Collectors.toList());
    }

    /**
     * 두 좌표 간 거리 계산 (Haversine 공식)
     */
    private BigDecimal calculateDistance(BigDecimal lat1, BigDecimal lon1, BigDecimal lat2, BigDecimal lon2) {
        double dLat = Math.toRadians(lat2.doubleValue() - lat1.doubleValue());
        double dLon = Math.toRadians(lon2.doubleValue() - lon1.doubleValue());

        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(Math.toRadians(lat1.doubleValue())) *
                        Math.cos(Math.toRadians(lat2.doubleValue())) *
                        Math.sin(dLon / 2) * Math.sin(dLon / 2);

        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

        double distanceKm = EARTH_RADIUS_KM * c;

        return BigDecimal.valueOf(distanceKm);
    }

    // 내부 클래스 - 점수 계산용
    @lombok.Getter
    @lombok.AllArgsConstructor
    private static class ScoredItem<T> {
        private T item;
        private BigDecimal score;
    }
}