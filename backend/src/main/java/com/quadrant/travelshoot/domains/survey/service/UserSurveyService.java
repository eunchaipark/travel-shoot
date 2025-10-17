package com.quadrant.travelshoot.domains.survey.service;

import com.quadrant.travelshoot.domains.survey.entity.UserSurvey;

import java.util.Optional;

public interface UserSurveyService {
    Optional<UserSurvey> getByUserId(Long userId);
}