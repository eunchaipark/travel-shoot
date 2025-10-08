package com.quadrant.travelshoot.domains.main.controller;

import com.quadrant.travelshoot.domains.main.service.BudgetFriendlyService;
import com.quadrant.travelshoot.domains.main.service.RecommendationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/main")
@RequiredArgsConstructor
public class MainController {

    private final BudgetFriendlyService budgetFriendlyService;
    private final RecommendationService recommendationService;

    @GetMapping("/recommendations")
    public ResponseEntity<List<Map<String, Object>>> getRecommendations(
            @RequestParam Long userId
    ) {
        return ResponseEntity.ok(recommendationService.getRecommendations(userId));
    }

    @GetMapping("/budget-friendly")
    public ResponseEntity<List<Map<String, Object>>> getBudgetFriendlyStays() {
        return ResponseEntity.ok(budgetFriendlyService.getBudgetFriendlyStays());
    }
}