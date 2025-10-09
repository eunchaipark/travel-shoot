package com.quadrant.travelshoot.domains.main.service;

import com.quadrant.travelshoot.domains.activity.entity.Activity;
import com.quadrant.travelshoot.domains.activity.repository.ActivityRepository;
import com.quadrant.travelshoot.domains.restaurant.entity.Restaurant;
import com.quadrant.travelshoot.domains.restaurant.repository.RestaurantRepository;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class TrendingService {

    private final StayRepository stayRepository;
    private final RestaurantRepository restaurantRepository;
    private final ActivityRepository activityRepository;

    private static final int TARGET_COUNT = 12;
    private static final int DAYS_RECENT = 7;
    private static final int DAYS_BASELINE = 30;

    // 트렌딩 조회
    public List<Map<String, Object>> getTrendingItems(String type) {
        log.info("=== 트렌딩 조회 시작: type={} ===", type);

        switch (type) {
            case "stay":
                return getTrendingStays();
            case "restaurants":
                return getTrendingRestaurants();
            case "attractions":
            case "activities":
                return getTrendingActivities();
            default:
                throw new IllegalArgumentException("잘못된 타입: " + type);
        }
    }

    // 트렌딩 숙소 (1달을 기반으로 최근 일주일 비교)
    private List<Map<String, Object>> getTrendingStays() {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime recentStart = now.minusDays(DAYS_RECENT);
        LocalDateTime baselineStart = now.minusDays(DAYS_BASELINE);

        List<Stay> allStays = stayRepository.findByIsActiveTrue();
        List<TrendingItem<Stay>> trendingItems = new ArrayList<>();

        for (Stay stay : allStays) {
            Long recentReservations = stayRepository.countReservationsByStayIdAndPeriod(
                    stay.getId(), recentStart, now);

            Long totalReservations = stayRepository.countReservationsByStayIdAndPeriod(
                    stay.getId(), baselineStart, now);

            double avgReservations = (totalReservations / (double) DAYS_BASELINE) * DAYS_RECENT;
            double reservationGrowth = calculateGrowthRate(avgReservations, recentReservations);
            double trendingScore = reservationGrowth;

            if (totalReservations > 0) {
                trendingItems.add(new TrendingItem<>(stay, trendingScore));
            }
        }

        List<TrendingItem<Stay>> topItems = trendingItems.stream()
                .sorted((a, b) -> Double.compare(b.getScore(), a.getScore()))
                .limit(TARGET_COUNT)
                .collect(Collectors.toList());

        log.info("트렌딩 숙소: {}개 후보 → 상위 {}개 선정", trendingItems.size(), topItems.size());

        return topItems.stream()
                .map(this::toStayResponseMap)
                .collect(Collectors.toList());
    }

    // 최근 인기 있는 맛집 평점 기준(데이터베이스에서 활용할 데이터가 없음..)
    private List<Map<String, Object>> getTrendingRestaurants() {
        try {
            List<Restaurant> topRestaurants = restaurantRepository.findTop12ByIsActiveTrueOrderByRatingDesc();

            log.info("트렌딩 맛집: {}개 선정 (평점 기준)", topRestaurants.size());

            return topRestaurants.stream()
                    .map(this::toRestaurantResponseMap)
                    .collect(Collectors.toList());
        } catch (Exception e) {
            log.error("맛집 트렌딩 조회 실패", e);
            return Collections.emptyList();
        }
    }

    // 최근 인기 있는 관광지 , 액티비티 가져오기 (평점 기점 기준 마찬가지로 DB에 활용할게 없음)
    private List<Map<String, Object>> getTrendingActivities() {
        try {
            List<Activity> topActivities = activityRepository.findTop12ByIsActiveTrueOrderByRatingDesc();

            log.info("트렌딩 관광지: {}개 선정 (평점 기준)", topActivities.size());

            return topActivities.stream()
                    .map(this::toActivityResponseMap)
                    .collect(Collectors.toList());
        } catch (Exception e) {
            log.error("관광지 트렌딩 조회 실패", e);
            return Collections.emptyList();
        }
    }

    // 증가율 계산
    private double calculateGrowthRate(double baseline, Long recent) {
        if (baseline == 0) {
            return recent != null ? recent * 100.0 : 0.0;
        }

        if (recent == null) {
            return 0.0;
        }

        return ((recent - baseline) / baseline) * 100.0;
    }

    // 숙소 응답
    private Map<String, Object> toStayResponseMap(TrendingItem<Stay> item) {
        Stay stay = item.getItem();
        BigDecimal price = stayRepository.findMinWeekdayPrice(stay.getId());

        Map<String, Object> response = new HashMap<>();
        response.put("id", stay.getId());
        response.put("stayCode", stay.getStayCode());
        response.put("title", stay.getStayName());
        response.put("image", null);
        response.put("rating", stay.getAverageRating());
        response.put("location", formatLocation(
                stay.getRegion().getCityName(),
                stay.getRegion().getAreaName()));
        response.put("price", price);
        response.put("category", stay.getStayType().name());
        response.put("reviews", stay.getReviewCount());

        log.info("트렌딩 숙소: {} - 점수: {}", stay.getStayName(),
                String.format("%.2f", item.getScore()));

        return response;
    }

    // 맛집 응답 MAP으로 묶기
    private Map<String, Object> toRestaurantResponseMap(Restaurant restaurant) {
        Map<String, Object> response = new HashMap<>();
        response.put("id", restaurant.getId());
        response.put("stayCode", "R" + restaurant.getId());
        response.put("title", restaurant.getRestaurantName());
        response.put("image", null);
        response.put("rating", restaurant.getRating());

        if (restaurant.getRegion() != null) {
            response.put("location", formatLocation(
                    restaurant.getRegion().getCityName(),
                    restaurant.getRegion().getAreaName()));
        } else {
            response.put("location", "제주도");
        }

        response.put("price", null);
        response.put("category", restaurant.getFoodType());
        response.put("reviews", 0);

        log.info("트렌딩 맛집: {} - 평점: {}", restaurant.getRestaurantName(), restaurant.getRating());

        return response;
    }

    // 관광지, 액티비티 응답 MAP으로 묶기
    private Map<String, Object> toActivityResponseMap(Activity activity) {
        Map<String, Object> response = new HashMap<>();
        response.put("id", activity.getId());
        response.put("stayCode", "A" + activity.getId());
        response.put("title", activity.getActivityName());
        response.put("image", null);
        response.put("rating", activity.getRating());

        if (activity.getRegion() != null) {
            response.put("location", formatLocation(
                    activity.getRegion().getCityName(),
                    activity.getRegion().getAreaName()));
        } else {
            response.put("location", "제주도");
        }

        response.put("price", null);
        response.put("category", activity.getActivityType());
        response.put("reviews", 0);

        log.info("트렌딩 관광지: {} - 평점: {}", activity.getActivityName(), activity.getRating());

        return response;
    }

    // 위치 포멧팅
    private String formatLocation(String city, String area) {
        return city + " • " + area;
    }

    // 내부 DTO
    @Getter
    @AllArgsConstructor
    private static class TrendingItem<T> {
        private final T item;
        private final double score;
    }
}