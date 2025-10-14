package com.quadrant.travelshoot.domains.restaurant.service;

import com.quadrant.travelshoot.domains.restaurant.dto.response.RestaurantTrendingResponse;

import java.util.List;

public interface RestaurantTrendingService {
    List<RestaurantTrendingResponse> getTrendingRestaurants();
}