package com.quadrant.travelshoot.domains.restaurant.service;

import com.quadrant.travelshoot.domains.restaurant.dto.response.RestaurantTrendingResponse;
import com.quadrant.travelshoot.domains.restaurant.repository.RestaurantTrendingRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class RestaurantTrendingServiceImpl implements RestaurantTrendingService {

    private final RestaurantTrendingRepository restaurantTrendingRepository;

    @Override
    public List<RestaurantTrendingResponse> getTrendingRestaurants() {
        return restaurantTrendingRepository.findTrendingRestaurants();
    }
}