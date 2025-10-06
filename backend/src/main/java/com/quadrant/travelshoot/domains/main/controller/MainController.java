package com.quadrant.travelshoot.domains.main.controller;

import com.quadrant.travelshoot.domains.main.service.RecommendationService;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/main")
@RequiredArgsConstructor
public class MainController {

    private final RecommendationService recommendationService;

    @GetMapping("/recommendations")
    public ResponseEntity<List<Stay>> getRecommendations(@RequestParam Long userId) {
        return ResponseEntity.ok(recommendationService.getRecommendations(userId));
    }
}