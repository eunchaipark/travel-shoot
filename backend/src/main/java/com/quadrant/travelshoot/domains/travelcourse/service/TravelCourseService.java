package com.quadrant.travelshoot.domains.travelcourse.service;

import com.quadrant.travelshoot.domains.travelcourse.dto.request.TravelCourseRequest;
import com.quadrant.travelshoot.domains.travelcourse.dto.response.TravelCourseResponse;

public interface TravelCourseService {

    /**
     * 여행 코스 생성 요청
     */
    void generateCourse(TravelCourseRequest request, Long userId);

    /**
     * 비동기 코스 생성 (내부 처리용)
     */
    void generateCourseAsync(Long courseId, Long reservationId, Integer totalDays, Long userId);

    /**
     * 여행 코스 조회
     */
    TravelCourseResponse getCourse(Long courseId, String type);
}

