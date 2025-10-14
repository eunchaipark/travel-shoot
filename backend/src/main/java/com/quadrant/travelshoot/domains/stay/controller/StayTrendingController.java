package com.quadrant.travelshoot.domains.stay.controller;

import com.quadrant.travelshoot.domains.stay.dto.response.StayTrendingResponse;
import com.quadrant.travelshoot.domains.stay.service.StayTrendingService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/stays/trending")
@RequiredArgsConstructor
public class StayTrendingController {
    
    private final StayTrendingService stayTrendingService;
    
    @GetMapping
    public ResponseEntity<List<StayTrendingResponse>> getTrendingStays() {
        List<StayTrendingResponse> trendingStays = stayTrendingService.getTrendingStays();
        return ResponseEntity.ok(trendingStays);
    }
}