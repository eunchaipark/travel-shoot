package com.quadrant.travelshoot.domains.travelcourse.controller;

import com.quadrant.travelshoot.domains.travelcourse.dto.request.TravelCourseRequest;
import com.quadrant.travelshoot.domains.travelcourse.dto.request.TravelCourseUpdateRequest;
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

    @GetMapping("/{id}")
    public ResponseEntity<TravelCourseResponse> getTravelCourse(
            @PathVariable Long id,
            @RequestParam(defaultValue = "course") String type) {  // course or reservation
        log.info("여행 코스 조회 요청 - id: {}, type: {}", id, type);
        TravelCourseResponse response = travelCourseService.getCourse(id, type);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/update")
    public ResponseEntity<Void> updateCourseSpot(
            @Valid @RequestBody TravelCourseUpdateRequest request
            /*,@SessionAttribute("userId") Long userId*/) {
        Long userId = 1L; //TODO: 로그인 기능 완료 시 세션 기반 userId로 갖고와야 함.
        log.info("여행 코스 수정 요청 - spotId: {}, placeName: {}",
                request.getSpotId(), request.getPlace().getPlace_name());

        travelCourseService.updateCourseSpot(request, userId);

        return ResponseEntity.ok().build();
    }
}

