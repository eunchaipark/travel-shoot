package com.quadrant.travelshoot.domains.stay.service;

import com.quadrant.travelshoot.domains.stay.dto.response.StayTrendingResponse;

import java.util.List;

public interface StayTrendingService {
    List<StayTrendingResponse> getTrendingStays();
}