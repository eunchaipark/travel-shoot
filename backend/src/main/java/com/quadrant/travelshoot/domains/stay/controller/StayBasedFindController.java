package com.quadrant.travelshoot.domains.stay.controller;

import com.quadrant.travelshoot.domains.stay.service.StayBasedFindService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/stays")
public class StayBasedFindController {

    private final StayBasedFindService stayBasedFindService;

    @GetMapping("/find-recommendations")
    public ResponseEntity<Map<Long, List<Object>>> getRecommendations(
            @RequestParam List<Long> stayIds,
            @RequestParam(defaultValue = "2") int restaurantCount,
            @RequestParam(defaultValue = "2") int activityCount) {

        log.info("숙소 기반 추천 요청 - stayIds: {}, 맛집: {}개, 관광지: {}개",
                stayIds, restaurantCount, activityCount);

        Map<Long, List<Object>> responses = stayBasedFindService
                .findRecommendations(stayIds, restaurantCount, activityCount);

        return ResponseEntity.ok(responses);
    }
}