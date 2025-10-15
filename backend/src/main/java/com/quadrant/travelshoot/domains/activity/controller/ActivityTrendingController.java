package com.quadrant.travelshoot.domains.activity.controller;

import com.quadrant.travelshoot.domains.activity.dto.response.ActivityTrendingResponse;
import com.quadrant.travelshoot.domains.activity.service.ActivityTrendingService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/activities/trending")
@RequiredArgsConstructor
public class ActivityTrendingController {

    private final ActivityTrendingService activityTrendingService;

    @GetMapping
    public List<ActivityTrendingResponse> getTrendingActivities() {
        return activityTrendingService.getTrendingActivities();
    }
}