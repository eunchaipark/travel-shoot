package com.quadrant.travelshoot.domains.travelcourse.controller;

import com.quadrant.travelshoot.domains.travelcourse.dto.request.TravelCourseRequest;
import com.quadrant.travelshoot.domains.travelcourse.dto.request.TravelCourseUpdateRequest;
import com.quadrant.travelshoot.domains.travelcourse.dto.response.TravelCourseResponse;
import com.quadrant.travelshoot.domains.travelcourse.service.TravelCourseService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/ai/course")
public class TravelCourseController {

    private final TravelCourseService travelCourseService;

    @PostMapping
    public ResponseEntity<Void> generateTravelCourse(
            @Valid @RequestBody TravelCourseRequest request
            , Authentication authentication) {
        Long userId = Long.valueOf(authentication.getName());
        log.info("AI 여행 코스 생성 요청: {}, userId: {}", request, userId);
        travelCourseService.generateCourse(request, userId);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/{id}")
    public ResponseEntity<TravelCourseResponse> getTravelCourse(
            @PathVariable Long id,
            @RequestParam(defaultValue = "course") String type,
            Authentication authentication) {  // course or reservation
        log.info("여행 코스 조회 요청 - id: {}, type: {}", id, type);
        Long userId = Long.valueOf(authentication.getName());
        TravelCourseResponse response = travelCourseService.getCourse(id, type, userId);
        if (response == null) {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).build(); // 204 No Content
        }
        return ResponseEntity.ok(response);
    }

    @PostMapping("/update")
    public ResponseEntity<Void> updateCourseSpot(
            @Valid @RequestBody TravelCourseUpdateRequest request
            , Authentication authentication) {
        Long userId = Long.valueOf(authentication.getName());
        log.info("여행 코스 수정 요청 - spotId: {}, placeName: {}",
                request.getSpotId(), request.getPlace().getPlace_name());

        travelCourseService.updateCourseSpot(request, userId);

        return ResponseEntity.ok().build();
    }
}

