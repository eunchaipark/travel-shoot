package com.quadrant.travelshoot.domains.activity.service;

import com.quadrant.travelshoot.domains.activity.entity.Activity;

import java.math.BigDecimal;
import java.util.List;

public interface ActivityService {
    List<Activity> getByCategoriesAndRatingAndDistance(List<String> categories, double minRating, BigDecimal latitude, BigDecimal longitude, double maxDistanceKm);
    List<Activity> getByRatingAndDistance(double minRating, BigDecimal latitude, BigDecimal longitude, double maxDistanceKm);
    Activity getById(Long activityId);
    Activity findByNameAndCoordinates(String name, BigDecimal latitude, BigDecimal longitude);
    Activity save(Activity activity);
}
