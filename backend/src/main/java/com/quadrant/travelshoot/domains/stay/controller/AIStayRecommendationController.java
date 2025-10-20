package com.quadrant.travelshoot.domains.stay.controller;

import com.quadrant.travelshoot.domains.stay.dto.response.AIRecommendationResponse;
import com.quadrant.travelshoot.domains.stay.service.StayAIRecommendationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * AI 기반 숙소 추천 API
 */
@Slf4j
@RestController
@RequestMapping("/api/stays/ai-recommendation")
@RequiredArgsConstructor
public class AIStayRecommendationController {
    
    private final StayAIRecommendationService aiRecommendationService;
    
    // AI 숙소 추천 조회

    @GetMapping
    public ResponseEntity<AIRecommendationResponse> getAIRecommendations(
            @RequestParam Long userId) {
        
        log.info("AI 숙소 추천 요청 - userId: {}", userId);
        
        AIRecommendationResponse response = aiRecommendationService.getAIRecommendations(userId);
        
        log.info("AI 숙소 추천 응답 - userId: {}, 숙소: {}개, 캐시사용: {}", 
            userId, response.getTotalCount(), response.getFromCache());
        
        return ResponseEntity.ok(response);
    }
}