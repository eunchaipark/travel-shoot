package com.quadrant.travelshoot.domains.user.repository;

import com.quadrant.travelshoot.domains.user.entity.UserSurveyActivity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserSurveyActivityRepository extends JpaRepository<UserSurveyActivity, Long> {
    List<UserSurveyActivity> findBySurveyIdOrderByPreferenceOrder(Long surveyId);
}