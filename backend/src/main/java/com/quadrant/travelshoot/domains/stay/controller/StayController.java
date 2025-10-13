package com.quadrant.travelshoot.domains.stay.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api/stay")
@RequiredArgsConstructor
public class StayController {

    /**
     * 숙소 상세 조회
     */
    @GetMapping("/{stayId}")
    public ResponseEntity<?> getStayDetail(@PathVariable Long stayId){


        return null;
    }

}
