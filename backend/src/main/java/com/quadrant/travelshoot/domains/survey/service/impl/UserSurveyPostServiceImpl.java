package com.quadrant.travelshoot.domains.survey.service.impl;

import com.quadrant.travelshoot.domains.survey.dto.request.SurveySubmitRequest;
import com.quadrant.travelshoot.domains.survey.dto.response.SurveySubmitResponse;
import com.quadrant.travelshoot.domains.survey.entity.*;
import com.quadrant.travelshoot.domains.survey.repository.UserSurveyRepository;
import com.quadrant.travelshoot.domains.survey.service.UserSurveyPostService;
import com.quadrant.travelshoot.shared.exception.CustomExceptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserSurveyPostServiceImpl implements UserSurveyPostService {
    
    private final UserSurveyRepository userSurveyRepository;
    
    @Override
    @Transactional
    public SurveySubmitResponse submitSurvey(Long userId, SurveySubmitRequest request) {
        log.info("설문조사 제출 시작 - userId: {}", userId);
        
        // 1. 중복 제출 확인
        if (userSurveyRepository.existsByUserId(userId)) {
            throw new CustomExceptions.SurveyAlreadyCompletedException("이미 설문조사를 완료하셨습니다.");
        }
        
        // 2. UserSurvey 메인 엔티티 생성
        UserSurvey survey = UserSurvey.builder()
                .userId(userId)
                .stayType(UserSurvey.StayType.valueOf(request.getStayType().getType()))
                .isCompleted(false)
                .build();
        
        // 3. 지역 선호도 추가
        for (int i = 0; i < request.getPreferredRegions().size(); i++) {
            SurveySubmitRequest.RegionPreference pref = request.getPreferredRegions().get(i);
            
            UserSurveyRegion region = UserSurveyRegion.builder()
                    .regionName(pref.getRegion())
                    .rankOrder(i + 1)
                    .weight(BigDecimal.valueOf(pref.getWeight()))
                    .build();
            
            survey.addRegion(region);
        }
        
        // 4. 음식 선호도 추가
        for (SurveySubmitRequest.FoodPreference pref : request.getFoodPreferences()) {
            UserSurveyFood food = UserSurveyFood.builder()
                    .foodCategory(UserSurveyFood.FoodCategory.valueOf(pref.getCategory()))
                    .preferenceOrder(pref.getOrder())
                    .weight(BigDecimal.valueOf(pref.getWeight()))
                    .build();
            
            survey.addFood(food);
        }
        
        // 5. 액티비티 선호도 추가
        for (SurveySubmitRequest.ActivityPreference pref : request.getActivityPreferences()) {
            UserSurveyActivity activity = UserSurveyActivity.builder()
                    .activityCategory(UserSurveyActivity.ActivityCategory.valueOf(pref.getActivity()))
                    .preferenceOrder(pref.getOrder())
                    .weight(BigDecimal.valueOf(pref.getWeight()))
                    .build();
            
            survey.addActivity(activity);
        }
        
        // 6. 완료 처리
        survey.completeSurvey();
        
        // 7. 저장
        UserSurvey savedSurvey = userSurveyRepository.save(survey);
        
        log.info("설문조사 제출 완료 - surveyId: {}, userId: {}", savedSurvey.getSurveyId(), userId);
        
        return SurveySubmitResponse.builder()
                .surveyId(savedSurvey.getSurveyId())
                .userId(userId)
                .completedAt(savedSurvey.getCompletedAt())
                .build();
    }
    
    @Override
    @Transactional(readOnly = true)
    public boolean isSurveyCompleted(Long userId) {
        return userSurveyRepository.existsByUserId(userId);
    }
    
    @Override
    @Transactional(readOnly = true)
    public Optional<UserSurvey> getByUserId(Long userId) {
        return userSurveyRepository.findByUserIdWithDetails(userId);
    }
}