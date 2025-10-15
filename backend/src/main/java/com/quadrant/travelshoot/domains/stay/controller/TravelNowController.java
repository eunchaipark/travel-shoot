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

    @GetMapping("/destinations")
    public ResponseEntity<List<TravelNowResponse>> getAllDestinations() {
        return ResponseEntity.ok(travelNowService.getAllTravelNowDestinations());
    }
}