package com.quadrant.travelshoot.domains.survey.service;

import com.quadrant.travelshoot.domains.survey.dto.request.SurveySubmitRequest;
import com.quadrant.travelshoot.domains.survey.dto.response.SurveySubmitResponse;
import com.quadrant.travelshoot.domains.survey.entity.UserSurvey;

import java.util.Optional;

public interface UserSurveyService {
    
    SurveySubmitResponse submitSurvey(Long userId, SurveySubmitRequest request);
    
    boolean isSurveyCompleted(Long userId);
    
    Optional<UserSurvey> getByUserId(Long userId);
}