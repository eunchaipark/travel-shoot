package com.quadrant.travelshoot.domains.stay.dto.response;

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
public class StayBasedFindResponse {

    private Long stayId;
    private String stayName;
    private List<Restaurant> restaurants;
    private List<Activity> activities;
}