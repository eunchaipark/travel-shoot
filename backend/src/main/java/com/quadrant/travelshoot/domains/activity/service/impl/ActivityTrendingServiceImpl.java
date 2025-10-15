package com.quadrant.travelshoot.domains.activity.service.impl;

import com.quadrant.travelshoot.domains.activity.dto.response.ActivityTrendingResponse;
import com.quadrant.travelshoot.domains.activity.repository.ActivityRepository;
import com.quadrant.travelshoot.domains.activity.service.ActivityTrendingService;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ActivityTrendingServiceImpl implements ActivityTrendingService {

    private final ActivityRepository activityTrendingRepository;

    @Override
    public List<ActivityTrendingResponse> getTrendingActivities() {
        return activityTrendingRepository.findTrendingActivities();
    }
}