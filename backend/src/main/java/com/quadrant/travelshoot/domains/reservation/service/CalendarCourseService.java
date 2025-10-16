package com.quadrant.travelshoot.domains.reservation.service;

import com.quadrant.travelshoot.domains.reservation.dto.response.CalendarCourseResponse;
import java.util.List;

public interface CalendarCourseService {
    List<CalendarCourseResponse> getCalendarCourses(Long userId);
}