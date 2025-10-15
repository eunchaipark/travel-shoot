package com.quadrant.travelshoot.domains.activity.service;

import com.quadrant.travelshoot.domains.activity.dto.response.ActivityTrendingResponse;

import java.util.List;

public interface ActivityTrendingService {
    List<ActivityTrendingResponse> getTrendingActivities();
}