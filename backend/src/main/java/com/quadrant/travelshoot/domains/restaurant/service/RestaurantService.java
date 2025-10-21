package com.quadrant.travelshoot.domains.restaurant.service;

import com.quadrant.travelshoot.domains.restaurant.entity.Restaurant;

import java.math.BigDecimal;
import java.util.List;

public interface RestaurantService {
    List<Restaurant> getByCategoriesAndRatingAndDistance(List<String> categories, double minRating, BigDecimal latitude, BigDecimal longitude, double maxDistanceKm);
    List<Restaurant> getByRatingAndDistance( double minRating, BigDecimal latitude, BigDecimal longitude, double maxDistanceKm);
    Restaurant getById(Long restaurantId);
    Restaurant findByNameAndCoordinates(String name, BigDecimal latitude, BigDecimal longitude);
    Restaurant save(Restaurant restaurant);
}
