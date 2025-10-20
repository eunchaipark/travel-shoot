package com.quadrant.travelshoot.domains.stay.service.impl;

import com.quadrant.travelshoot.domains.activity.entity.Activity;
import com.quadrant.travelshoot.domains.activity.service.ActivityService;
import com.quadrant.travelshoot.domains.restaurant.entity.Restaurant;
import com.quadrant.travelshoot.domains.restaurant.service.RestaurantService;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.service.StayService;
import com.quadrant.travelshoot.domains.stay.dto.response.StayBasedFindResponse;
import com.quadrant.travelshoot.domains.stay.service.StayBasedFindService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class StayBasedFindServiceImpl implements StayBasedFindService {

    private final StayService stayService;
    private final RestaurantService restaurantService;
    private final ActivityService activityService;

    private static final double EARTH_RADIUS_KM = 6371.0;

    @Override
    public List<StayBasedFindResponse> findRecommendations(
            List<Long> stayIds,
            int restaurantCount,
            int activityCount) {

        log.info("숙소 기반 추천 시작 - 숙소 {}개, 맛집 {}개/숙소, 관광지 {}개/숙소",
                stayIds.size(), restaurantCount, activityCount);

        return stayIds.stream()
                .map(stayId -> findForStay(stayId, restaurantCount, activityCount))
                .collect(Collectors.toList());
    }

    /**
     * 단일 숙소에 대한 맛집/관광지 추천
     */
    private StayBasedFindResponse findForStay(Long stayId, int restaurantCount, int activityCount) {
        Stay stay = stayService.getById(stayId);

        log.info("숙소 '{}' 추천 시작 - 위치: ({}, {})",
                stay.getName(), stay.getLatitude(), stay.getLongitude());

        // 맛집 추천 (단계별 완화)
        List<Restaurant> restaurants = findRestaurants(stay, restaurantCount);

        // 관광지 추천 (단계별 완화)
        List<Activity> activities = findActivities(stay, activityCount);

        log.info("숙소 '{}' 추천 완료 - 맛집: {}개, 관광지: {}개",
                stay.getName(), restaurants.size(), activities.size());

        return StayBasedFindResponse.builder()
                .stayId(stay.getId())
                .stayName(stay.getName())
                .restaurants(restaurants)
                .activities(activities)
                .build();
    }

    /**
     * 맛집 추천 (평점/거리 기반 단계별 완화)
     */
    private List<Restaurant> findRestaurants(Stay stay, int count) {
        List<Restaurant> result;

        // 1단계: 평점 4.0+ / 20km
        result = restaurantService.getByRatingAndDistance(
                4.0, stay.getLatitude(), stay.getLongitude(), 20.0);
        if (result.size() >= count) {
            return sortAndLimit(result, stay, count);
        }

        // 2단계: 평점 3.5+ / 20km
        result = restaurantService.getByRatingAndDistance(
                3.5, stay.getLatitude(), stay.getLongitude(), 20.0);
        if (result.size() >= count) {
            return sortAndLimit(result, stay, count);
        }

        // 3단계: 평점 3.5+ / 30km
        result = restaurantService.getByRatingAndDistance(
                3.5, stay.getLatitude(), stay.getLongitude(), 30.0);
        if (result.size() >= count) {
            return sortAndLimit(result, stay, count);
        }

        // 4단계: 평점 3.0+ / 30km (최종)
        result = restaurantService.getByRatingAndDistance(
                3.0, stay.getLatitude(), stay.getLongitude(), 30.0);

        log.warn("숙소 '{}' 맛집 {}개 미만 확보 - 실제: {}개", stay.getName(), count, result.size());
        return sortAndLimit(result, stay, count);
    }

    /**
     * 관광지 추천 (평점/거리 기반 단계별 완화)
     */
    private List<Activity> findActivities(Stay stay, int count) {
        List<Activity> result;

        // 1단계: 평점 4.0+ / 20km
        result = activityService.getByRatingAndDistance(
                4.0, stay.getLatitude(), stay.getLongitude(), 20.0);
        if (result.size() >= count) {
            return sortAndLimitActivities(result, stay, count);
        }

        // 2단계: 평점 3.5+ / 20km
        result = activityService.getByRatingAndDistance(
                3.5, stay.getLatitude(), stay.getLongitude(), 20.0);
        if (result.size() >= count) {
            return sortAndLimitActivities(result, stay, count);
        }

        // 3단계: 평점 3.5+ / 30km
        result = activityService.getByRatingAndDistance(
                3.5, stay.getLatitude(), stay.getLongitude(), 30.0);
        if (result.size() >= count) {
            return sortAndLimitActivities(result, stay, count);
        }

        // 4단계: 평점 3.0+ / 30km (최종)
        result = activityService.getByRatingAndDistance(
                3.0, stay.getLatitude(), stay.getLongitude(), 30.0);

        log.warn("숙소 '{}' 관광지 {}개 미만 확보 - 실제: {}개", stay.getName(), count, result.size());
        return sortAndLimitActivities(result, stay, count);
    }

    /**
     * 맛집 정렬 및 제한 (평점 높은 순 → 거리 가까운 순)
     */
    private List<Restaurant> sortAndLimit(List<Restaurant> restaurants, Stay stay, int limit) {
        return restaurants.stream()
                .sorted(Comparator
                        .comparing(Restaurant::getRating).reversed()
                        .thenComparing(r -> calculateDistance(
                                stay.getLatitude(), stay.getLongitude(),
                                r.getLatitude(), r.getLongitude())))
                .limit(limit)
                .collect(Collectors.toList());
    }

    /**
     * 관광지 정렬 및 제한 (평점 높은 순 → 거리 가까운 순)
     */
    private List<Activity> sortAndLimitActivities(List<Activity> activities, Stay stay, int limit) {
        return activities.stream()
                .sorted(Comparator
                        .comparing(Activity::getRating).reversed()
                        .thenComparing(a -> calculateDistance(
                                stay.getLatitude(), stay.getLongitude(),
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
}