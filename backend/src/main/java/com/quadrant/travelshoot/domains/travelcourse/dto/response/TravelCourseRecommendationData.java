package com.quadrant.travelshoot.domains.travelcourse.dto.response;

import com.quadrant.travelshoot.domains.activity.entity.Activity;
import com.quadrant.travelshoot.domains.restaurant.entity.Restaurant;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TravelCourseRecommendationData {

    private StayLocation stayLocation;
    private List<Restaurant> restaurants;
    private List<Activity> activities;
    private Boolean hasSurvey;
}