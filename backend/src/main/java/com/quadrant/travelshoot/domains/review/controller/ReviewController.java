package com.quadrant.travelshoot.domains.review.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api/reviews")
@RequiredArgsConstructor
public class ReviewController {

    @GetMapping("/test")
    public ResponseEntity<?> getTest(){

        log.info("테스트 성공 ");
        System.out.println("테스트 성공성공");

        return ResponseEntity.ok().body("테ㅐ스트 테스트");
    }

}
