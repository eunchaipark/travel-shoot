package com.quadrant.travelshoot.domains.stay.controller;

import com.quadrant.travelshoot.domains.stay.dto.response.*;
import com.quadrant.travelshoot.domains.stay.service.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 숙소 관련 API 컨트롤러
 */
@Slf4j
@RestController
@RequestMapping("/api/stays")
@RequiredArgsConstructor
public class StayController {

    private final BudgetFriendlyService budgetFriendlyService;
    private final StayRecommendationService recommendationService;
    private final StayTrendingService stayTrendingService;
    private final StayBasedFindService stayBasedFindService;
    private final TravelNowService travelNowService;
    private final StayAIRecommendationService aiRecommendationService;

    /**
     * 가격착한 숙소 조회
     * GET /api/stays/budget-friendly
     */
    @GetMapping("/budget-friendly")
    public ResponseEntity<List<BudgetFriendlyResponse>> getBudgetFriendlyStays() {
        log.info("가격착한 숙소 조회 API 호출");
        List<BudgetFriendlyResponse> stays = budgetFriendlyService.getBudgetFriendlyStays();
        log.info("가격착한 숙소 조회 완료 - 결과: {} 개", stays.size());
        return ResponseEntity.ok(stays);
    }

    /**
     * 사용자 맞춤 추천 숙소 조회
     * GET /api/stays/recommendations
     */
    @GetMapping("/recommendations")
    public ResponseEntity<StayRecommendationResponse.Response> getRecommendations(
            @RequestParam Long userId) {
        log.info("추천 조회 요청 - userId: {}", userId);
        StayRecommendationResponse.Response response = recommendationService.getRecommendedStays(userId);
        return ResponseEntity.ok(response);
    }

    /**
     * AI 기반 숙소 추천 조회
     * GET /api/stays/ai-recommendations
     */
    @GetMapping("/ai-recommendation")
    public ResponseEntity<AIRecommendationResponse> getAIRecommendations(
            @RequestParam Long userId) {

        log.info("AI 숙소 추천 요청 - userId: {}", userId);

        AIRecommendationResponse response = aiRecommendationService.getAIRecommendations(userId);

        log.info("AI 숙소 추천 응답 - userId: {}, 숙소: {}개, 캐시사용: {}",
                userId, response.getTotalCount(), response.getFromCache());

        return ResponseEntity.ok(response);
    }

    /**
     * 트렌딩 숙소 조회
     * GET /api/stays/trending
     */
    @GetMapping("/trending")
    public ResponseEntity<List<StayTrendingResponse>> getTrendingStays() {
        List<StayTrendingResponse> trendingStays = stayTrendingService.getTrendingStays();
        return ResponseEntity.ok(trendingStays);
    }

    /**
     * 숙소 기반 맛집/관광지 추천
     * GET /api/stays/find-recommendations
     */
    @GetMapping("/find-recommendations")
    public ResponseEntity<Map<Long, List<Object>>> getStayBasedRecommendations(
            @RequestParam List<Long> stayIds,
            @RequestParam(defaultValue = "2") int restaurantCount,
            @RequestParam(defaultValue = "2") int activityCount) {

        log.info("숙소 기반 추천 요청 - stayIds: {}, 맛집: {}개, 관광지: {}개",
                stayIds, restaurantCount, activityCount);

        Map<Long, List<Object>> responses = stayBasedFindService
                .findRecommendations(stayIds, restaurantCount, activityCount);

        return ResponseEntity.ok(responses);
    }

    /**
     * 지금 떠나기 좋은 여행지 조회
     * GET /api/stays/travel-now
     */
    @GetMapping("/travel-now")
    public ResponseEntity<List<TravelNowResponse>> getTravelNowDestinations() {
        return ResponseEntity.ok(travelNowService.getAllTravelNowDestinations());
    }
}