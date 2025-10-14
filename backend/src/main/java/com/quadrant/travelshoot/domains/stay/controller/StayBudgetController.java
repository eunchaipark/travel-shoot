package com.quadrant.travelshoot.domains.stay.controller;

import com.quadrant.travelshoot.domains.stay.dto.response.BudgetFriendlyResponse;
import com.quadrant.travelshoot.domains.stay.service.BudgetFriendlyService;
import com.quadrant.travelshoot.domains.stay.dto.response.StayDetailResponse;
import com.quadrant.travelshoot.domains.stay.service.StayService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 숙소 컨트롤러
 */
@Slf4j
@RestController
@RequestMapping("/api/stays")
@RequiredArgsConstructor
public class StayBudgetController {

    private final BudgetFriendlyService budgetFriendlyService;

    /**
     * 가격착한 숙소 6개 조회
     * GET /api/stays/budget-friendly
     */
    @GetMapping("/budget-friendly")
    public ResponseEntity<List<BudgetFriendlyResponse>> getBudgetFriendlyStays() {
        log.info("가격착한 숙소 조회 API 호출");

        List<BudgetFriendlyResponse> stays = budgetFriendlyService.getBudgetFriendlyStays();

        log.info("가격착한 숙소 조회 완료 - 결과: {} 개", stays.size());
        return ResponseEntity.ok(stays);
    }

    private final StayService stayService;

    /**
     * 숙소 상세 조회
     */
    @GetMapping("/{stayId}")
    public ResponseEntity<?> getStayDetail(@PathVariable Long stayId){

        StayDetailResponse response = stayService.getStayDetail(stayId);
        return ResponseEntity.ok(response);
    }

}
