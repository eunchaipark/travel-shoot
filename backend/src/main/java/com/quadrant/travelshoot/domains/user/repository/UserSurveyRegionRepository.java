package com.quadrant.travelshoot.domains.user.repository;

import com.quadrant.travelshoot.domains.user.entity.UserSurveyRegion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserSurveyRegionRepository extends JpaRepository<UserSurveyRegion, Long> {
    List<UserSurveyRegion> findBySurveyIdOrderByRankOrder(Long surveyId);
}