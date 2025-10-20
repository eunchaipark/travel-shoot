package com.quadrant.travelshoot.domains.stay.service;

import com.quadrant.travelshoot.domains.stay.dto.response.StayRecommendationResponse;

public interface StayRecommendationService {

    // 사용자 맞춤 숙소 추천 
    StayRecommendationResponse.Response getRecommendedStays(Long userId);
}