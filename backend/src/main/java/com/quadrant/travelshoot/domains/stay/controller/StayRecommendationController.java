package com.quadrant.travelshoot.domains.stay.controller;

import com.quadrant.travelshoot.domains.stay.dto.response.StayRecommendationResponse;
import com.quadrant.travelshoot.domains.stay.service.StayRecommendationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/api/stays/recommendation")
@RequiredArgsConstructor
public class StayRecommendationController {

    private final StayRecommendationService recommendationService;

    @GetMapping
    public ResponseEntity<StayRecommendationResponse.Response> getRecommendations(
            @RequestParam Long userId) {
        
        log.info(" 추천 조회 요청 - userId: {}", userId);
        StayRecommendationResponse.Response response = recommendationService.getRecommendedStays(userId);
        return ResponseEntity.ok(response);
    }
}
