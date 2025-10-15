package com.quadrant.travelshoot.domains.travelcourse.service;

import com.quadrant.travelshoot.domains.travelcourse.dto.response.TravelCourseRecommendationData;

public interface TravelCourseRecommendationService {
    TravelCourseRecommendationData getRecommendations(Long reservationId, Long userId, Integer totalDays);
}
