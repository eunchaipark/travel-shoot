package com.quadrant.travelshoot.domains.activity.service.impl;

import com.quadrant.travelshoot.domains.activity.repository.ActivityRepository;
import com.quadrant.travelshoot.domains.activity.service.ActivityService;
import com.quadrant.travelshoot.domains.activity.entity.Activity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ActivityServiceImpl implements ActivityService {
    private final ActivityRepository activityRepository;

    @Override
    public List<Activity> getByCategoriesAndRatingAndDistance(
            List<String> categories,
            double minRating,
            BigDecimal latitude,
            BigDecimal longitude,
            double maxDistanceKm) {

        return activityRepository.findByCategoriesAndRatingAndDistance(
                categories, minRating, latitude, longitude, maxDistanceKm);
    }

    @Override
    public List<Activity> getByRatingAndDistance(
            double minRating,
            BigDecimal latitude,
            BigDecimal longitude,
            double maxDistanceKm) {

        return activityRepository.findByRatingAndDistance(
                minRating, latitude, longitude, maxDistanceKm);
    }

    @Override
    public Activity getById(Long activityId) {
        return activityRepository.findById(activityId)
                .orElseThrow(() -> new IllegalArgumentException(
                        "관광지 정보를 찾을 수 없습니다. ID: " + activityId));
    }

    @Override
    public Activity findByNameAndCoordinates(String name, BigDecimal latitude, BigDecimal longitude) {
        return activityRepository.findByNameAndCoordinates(name, latitude, longitude).orElse(null);
    }

    @Override
    @Transactional
    public Activity save(Activity activity) {
        return activityRepository.save(activity);
    }
}
