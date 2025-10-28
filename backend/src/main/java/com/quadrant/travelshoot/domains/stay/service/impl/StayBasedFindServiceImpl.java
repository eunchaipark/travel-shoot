package com.quadrant.travelshoot.domains.stay.service.impl;

import com.quadrant.travelshoot.domains.activity.entity.Activity;
import com.quadrant.travelshoot.domains.activity.service.ActivityService;
import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import com.quadrant.travelshoot.domains.common.service.impl.FileUploadServiceImpl;
import com.quadrant.travelshoot.domains.restaurant.entity.Restaurant;
import com.quadrant.travelshoot.domains.restaurant.service.RestaurantService;
import com.quadrant.travelshoot.domains.stay.entity.Room;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.service.StayService;
import com.quadrant.travelshoot.domains.stay.dto.response.FindActivityResponse;
import com.quadrant.travelshoot.domains.stay.dto.response.FindRestaurantResponse;
import com.quadrant.travelshoot.domains.stay.dto.response.StayBasedFindResponse;
import com.quadrant.travelshoot.domains.stay.service.StayBasedFindService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class StayBasedFindServiceImpl implements StayBasedFindService {

    private final StayService stayService;
    private final RestaurantService restaurantService;
    private final ActivityService activityService;
    private final FileUploadServiceImpl fileUploadService;

    private static final double EARTH_RADIUS_KM = 6371.0;

    @Override
    public List<Object> findRecommendations(List<Long> stayIds, int restaurantCount, int activityCount) {
        List<Object> result = new ArrayList<>();

        for (Long stayId : stayIds) {
            List<Object> stayData = findForStay(stayId, restaurantCount, activityCount);
            if (!stayData.isEmpty()) {
                result.addAll(stayData); // 전체 결과 리스트에 합치기
            }
        }

        return result;
    }

    /**
     *  숙소에 대한 맛집/관광지 추천
     * 순서: 숙소 정보 -> 맛집들 -> 관광지들
     */
    private List<Object> findForStay(Long stayId, int restaurantCount, int activityCount) {
        Stay stay = stayService.getById(stayId);

        if (stay == null) {
            log.warn("숙소 ID {}를 찾을 수 없습니다.", stayId);
            return Collections.emptyList();
        }

        // 최저가 설정
        BigDecimal minPrice = findRoomMinPrice(stay.getRooms());
        stay.setMinPrice(minPrice);

        // 이미지 설정
        List<FileUpload> images = fileUploadService.findAllByReferenceTypeAndReferenceId("숙소", stayId);
        String mainImageUrl = "";
        if (!images.isEmpty()) {
            mainImageUrl = images.stream()
                .filter(img -> Boolean.TRUE.equals(img.getIsRepresentative()))
                .findFirst()
                .map(FileUpload::getS3Url)
                .orElseGet(() -> images.get(0).getS3Url());
        }
        stay.setMainImageUrl(mainImageUrl);

        log.debug("숙소 조회 - ID: {}, 이름: {}, 최저가: {}, 이미지: {}", 
                stay.getId(), stay.getName(), minPrice, mainImageUrl);

        List<Object> result = new ArrayList<>();

        // 1. 숙소 정보 추가
        StayBasedFindResponse stayDto = StayBasedFindResponse.builder()
                .id(stay.getId())
                .latitude(stay.getLatitude())
                .longitude(stay.getLongitude())
                .rating(stay.getAverageRating())
                .name(stay.getName())
                .lowestPrice(stay.getMinPrice() != null ? stay.getMinPrice() : BigDecimal.ZERO)
                .stayType(stay.getStayType())
                .placeType("stay")
                .mainImageUrl(stay.getMainImageUrl() != null ? stay.getMainImageUrl() : "")
                .restaurants(null)
                .activities(null)
                .build();
        result.add(stayDto);

        // 2. 맛집 추천 추가
        List<Restaurant> restaurants = findRestaurants(stay, restaurantCount);
        for (Restaurant r : restaurants) {
            result.add(FindRestaurantResponse.from(r));
        }

        // 3. 관광지 추천 추가
        List<Activity> activities = findActivities(stay, activityCount);
        for (Activity a : activities) {
            result.add(FindActivityResponse.from(a));
        }

        return result;
    }

    /**
     * 최저가 구하는 메서드 (StayServiceImpl의 로직 복사)
     */
    private BigDecimal findRoomMinPrice(List<Room> rooms) {
        return rooms.stream()
                .flatMap(room -> Stream.of(room.getWeekdayPrice(), room.getWeekendPrice()))
                .min(Comparator.naturalOrder())
                .orElse(BigDecimal.ZERO);
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

        if (result.size() < count) {
            log.warn("숙소 '{}' 맛집 {}개 미만 확보 - 실제: {}개", stay.getName(), count, result.size());
        }
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

        if (result.size() < count) {
            log.warn("숙소 '{}' 관광지 {}개 미만 확보 - 실제: {}개", stay.getName(), count, result.size());
        }
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