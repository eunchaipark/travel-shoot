package com.quadrant.travelshoot.domains.survey.service.impl;

import com.quadrant.travelshoot.domains.survey.entity.UserSurvey;
import com.quadrant.travelshoot.domains.survey.repository.UserSurveyRepository;
import com.quadrant.travelshoot.domains.survey.service.UserSurveyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class UserSurveyServiceImpl implements UserSurveyService {
    public final UserSurveyRepository userSurveyRepository;

    @Override
    public Optional<UserSurvey> getByUserId(Long userId) {
        return userSurveyRepository.findByUserId(userId);
    }
    @Override
    public Optional<UserSurvey> findByUserIdWithDetails(Long userId) {
        return userSurveyRepository.findByUserIdWithDetails(userId);
    }
}