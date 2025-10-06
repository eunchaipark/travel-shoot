package com.quadrant.travelshoot.domains.review.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/reviews")
public class ReviewController {

    @GetMapping("/test")
    public ResponseEntity<?> getTest(){

        return ResponseEntity.ok().body("테ㅐ스트 테스트");
    }

}
