package com.quadrant.travelshoot.domains.restaurant.service.impl;

import com.quadrant.travelshoot.domains.restaurant.entity.Restaurant;
import com.quadrant.travelshoot.domains.restaurant.repository.RestaurantRepository;
import com.quadrant.travelshoot.domains.restaurant.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class RestaurantServiceImpl implements RestaurantService {
    private final RestaurantRepository restaurantRepository;

    @Override
    public List<Restaurant> getByCategoriesAndRatingAndDistance(
            List<String> categories,
            double minRating,
            BigDecimal latitude,
            BigDecimal longitude,
            double maxDistanceKm) {

        return restaurantRepository
                .findByCategoriesAndRatingAndDistance(
                        categories, minRating, latitude, longitude, maxDistanceKm);
    }

    @Override
    public List<Restaurant> getByRatingAndDistance(
            double minRating,
            BigDecimal latitude,
            BigDecimal longitude,
            double maxDistanceKm) {

        return restaurantRepository.findByRatingAndDistance(
                minRating, latitude, longitude, maxDistanceKm);
    }


    @Override
    public Restaurant getById(Long restaurantId) {
        return restaurantRepository.findById(restaurantId)
                .orElseThrow(() -> new IllegalArgumentException(
                        "맛집 정보를 찾을 수 없습니다. ID: " + restaurantId));
    }
}