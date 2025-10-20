package com.quadrant.travelshoot.domains.stay.controller;

import com.quadrant.travelshoot.domains.stay.dto.request.StayBasedFindRequest;
import com.quadrant.travelshoot.domains.stay.dto.response.StayBasedFindResponse;
import com.quadrant.travelshoot.domains.stay.service.StayBasedFindService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/stays")
public class StayBasedFindController {

        private final StayBasedFindService stayBasedFindService;

        /**
         * 여러 숙소를 기반으로 맛집과 관광지 추천
         * 
         * POST /api/stays/find-recommendations
         * 
         * Request Body:
         * {
         * "stayIds": [6, 1, 17, 2, 16, 10],
         * "restaurantCount": 2,
         * "activityCount": 2
         * }
         */
        @GetMapping("/find-recommendations")
        public ResponseEntity<List<StayBasedFindResponse>> findRecommendations(
                        @RequestParam List<Long> stayIds,
                        @RequestParam(defaultValue = "2") int restaurantCount,
                        @RequestParam(defaultValue = "2") int activityCount) {

                log.info("숙소 기반 추천 요청 - stayIds: {}, 맛집: {}개, 관광지: {}개",
                                stayIds, restaurantCount, activityCount);

                List<StayBasedFindResponse> responses = stayBasedFindService.findRecommendations(
                                stayIds,
                                restaurantCount,
                                activityCount);

                return ResponseEntity.ok(responses);
        }
}