package com.quadrant.travelshoot.domains.stay.controller;

import com.quadrant.travelshoot.domains.stay.dto.response.TravelNowResponse;
import com.quadrant.travelshoot.domains.stay.service.TravelNowService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/travel-now")
@RequiredArgsConstructor
public class TravelNowController {

    private final TravelNowService travelNowService;

    // 모든 여행지 조회 (DB + Util 통합)
    @GetMapping("/destinations")
    public ResponseEntity<List<TravelNowResponse>> getAllDestinations() {
        return ResponseEntity.ok(travelNowService.getAllTravelNowDestinations());
    }

    // DB 데이터만 조회 (제주도, 강원도)
    @GetMapping("/destinations/db")
    public ResponseEntity<List<TravelNowResponse>> getDbDestinations() {
        return ResponseEntity.ok(travelNowService.getDbDestinations());
    }

    // Util 데이터만 조회 (다른 지역)
    @GetMapping("/destinations/util")
    public ResponseEntity<List<TravelNowResponse>> getUtilDestinations() {
        return ResponseEntity.ok(travelNowService.getUtilDestinations());
    }
}