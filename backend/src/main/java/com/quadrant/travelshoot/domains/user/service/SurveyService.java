package com.quadrant.travelshoot.domains.user.service;

import com.quadrant.travelshoot.domains.user.dto.request.SurveySubmitRequest;
import com.quadrant.travelshoot.domains.user.dto.response.SurveySubmitResponse;
import com.quadrant.travelshoot.domains.user.entity.*;
import com.quadrant.travelshoot.domains.user.repository.*;
import com.quadrant.travelshoot.shared.exception.CustomExceptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Slf4j
@Service
@RequiredArgsConstructor
public class SurveyService {
    
    private final UserRepository userRepository;
    private final UserSurveyRepository userSurveyRepository;
    
    @Transactional
    public SurveySubmitResponse submitSurvey(Long userId, SurveySubmitRequest request) {
        log.info("설문조사 제출 시작 - userId: {}", userId);
        
        // 1. 사용자 존재 확인
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new CustomExceptions.UserNotFoundException("사용자를 찾을 수 없습니다."));
        
        // 2. 중복 제출 확인
        if (userSurveyRepository.existsByUserId(userId)) {
            throw new CustomExceptions.SurveyAlreadyCompletedException("이미 설문조사를 완료하셨습니다.");
        }
        
        // 3. UserSurvey 메인 엔티티 생성
        UserSurvey survey = UserSurvey.builder()
                .user(user)
                .stayType(UserSurvey.StayType.fromKoreanName(request.getStayType().getType()))
                .isCompleted(true)
                .completedAt(LocalDateTime.now())
                .build();
        
        // 4. 지역 선호도 저장
        for (int i = 0; i < request.getPreferredRegions().size(); i++) {
            SurveySubmitRequest.RegionPreference pref = request.getPreferredRegions().get(i);
            
            UserSurveyRegion region = UserSurveyRegion.builder()
                    .survey(survey)
                    .regionName(pref.getRegion())
                    .rankOrder(i + 1)
                    .weight(BigDecimal.valueOf(pref.getWeight()))
                    .build();
            
            survey.getRegions().add(region);
        }
        
        // 5. 음식 선호도 저장
        for (SurveySubmitRequest.FoodPreference pref : request.getFoodPreferences()) {
            UserSurveyFood food = UserSurveyFood.builder()
                    .survey(survey)
                    .foodCategory(pref.getCategory())
                    .preferenceOrder(pref.getOrder())
                    .weight(BigDecimal.valueOf(pref.getWeight()))
                    .build();
            
            survey.getFoods().add(food);
        }
        
        // 6. 액티비티 선호도 저장
        for (SurveySubmitRequest.ActivityPreference pref : request.getActivityPreferences()) {
            UserSurveyActivity activity = UserSurveyActivity.builder()
                    .survey(survey)
                    .activityCategory(pref.getActivity())
                    .preferenceOrder(pref.getOrder())
                    .weight(BigDecimal.valueOf(pref.getWeight()))
                    .build();
            
            survey.getActivities().add(activity);
        }
        
        // 7. 저장 (cascade로 자식 엔티티들도 함께 저장됨)
        UserSurvey savedSurvey = userSurveyRepository.save(survey);
        
        log.info("설문조사 제출 완료 - surveyId: {}, userId: {}", savedSurvey.getId(), userId);
        
        return SurveySubmitResponse.builder()
                .surveyId(savedSurvey.getId())
                .userId(userId)
                .completedAt(savedSurvey.getCompletedAt())
                .build();
    }
    
    @Transactional(readOnly = true)
    public boolean isSurveyCompleted(Long userId) {
        return userSurveyRepository.existsByUserId(userId);
    }
    
    @Transactional(readOnly = true)
    public UserSurvey getUserSurvey(Long userId) {
        return userSurveyRepository.findByUserId(userId)
                .orElseThrow(() -> new CustomExceptions.SurveyNotFoundException("완료된 설문조사가 없습니다."));
    }
}