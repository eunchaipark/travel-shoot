package com.quadrant.travelshoot.domains.reservation.controller;

import com.quadrant.travelshoot.domains.reservation.dto.response.CalendarCourseResponse;
import com.quadrant.travelshoot.domains.reservation.service.CalendarCourseService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/reservations")
@RequiredArgsConstructor
public class CalendarCourseController {

    private final CalendarCourseService calendarCourseService;

    @GetMapping("/calendar-courses/{userId}")
    public ResponseEntity<List<CalendarCourseResponse>> getCalendarCourses(
            @PathVariable Long userId
    ) {
        log.info("캘린더 코스 조회 요청 - userId: {}", userId);
        
        List<CalendarCourseResponse> response = calendarCourseService.getCalendarCourses(userId);
        
        log.info("캘린더 코스 조회 완료 - userId: {}, count: {}", userId, response.size());
        return ResponseEntity.ok(response);
    }
}