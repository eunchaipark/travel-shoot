package com.quadrant.travelshoot.domains.restaurant.controller;

import com.quadrant.travelshoot.domains.restaurant.dto.response.RestaurantTrendingResponse;
import com.quadrant.travelshoot.domains.restaurant.service.RestaurantTrendingService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/restaurants/trending")
@RequiredArgsConstructor
public class RestaurantTrendingController {

    private final RestaurantTrendingService restaurantTrendingService;

    @GetMapping
    public List<RestaurantTrendingResponse> getTrendingRestaurants() {
        return restaurantTrendingService.getTrendingRestaurants();
    }
}