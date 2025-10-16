package com.quadrant.travelshoot.domains.travelcourse.controller;

import com.quadrant.travelshoot.domains.travelcourse.dto.request.TravelCourseRequest;
import com.quadrant.travelshoot.domains.travelcourse.dto.response.TravelCourseResponse;
import com.quadrant.travelshoot.domains.travelcourse.service.TravelCourseService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
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
            /*,@SessionAttribute("userId") Long userId*/) {
        Long userId = 1L; //TODO: 로그인 기능 완료 시 세션 기반 userId로 갖고와야 함.
        log.info("AI 여행 코스 생성 요청: {}, userId: {}", request, userId);
        travelCourseService.generateCourse(request, userId);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/{courseId}")
    public ResponseEntity<TravelCourseResponse> getTravelCourse(
            @PathVariable Long courseId) {
        log.info("여행 코스 조회 요청 - courseId: {}", courseId);
        TravelCourseResponse response = travelCourseService.getCourse(courseId);
        return ResponseEntity.ok(response);
    }
}

