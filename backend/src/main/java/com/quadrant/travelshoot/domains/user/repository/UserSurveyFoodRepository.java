package com.quadrant.travelshoot.domains.user.repository;

import com.quadrant.travelshoot.domains.user.entity.UserSurveyFood;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserSurveyFoodRepository extends JpaRepository<UserSurveyFood, Long> {
    List<UserSurveyFood> findBySurveyIdOrderByPreferenceOrder(Long surveyId);
}