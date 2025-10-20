package com.quadrant.travelshoot.domains.survey.service.impl;

import com.quadrant.travelshoot.domains.stay.service.StayAIRecommendationService;
import com.quadrant.travelshoot.domains.survey.dto.request.SurveySubmitRequest;
import com.quadrant.travelshoot.domains.survey.dto.response.SurveySubmitResponse;
import com.quadrant.travelshoot.domains.survey.entity.*;
import com.quadrant.travelshoot.domains.survey.enums.ActivityCategory;
import com.quadrant.travelshoot.domains.survey.enums.FoodCategory;
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
    private final StayAIRecommendationService stayAIRecommendationService;
    
    @Override
    @Transactional
    public SurveySubmitResponse submitSurvey(Long userId, SurveySubmitRequest request) {
        // 1. 중복 제출 확인
        if (userSurveyRepository.existsByUserId(userId)) {
            throw new CustomExceptions.SurveyAlreadyCompletedException("이미 설문조사를 완료하셨습니다.");
        }
        UserSurvey survey;
        try {
            survey = UserSurvey.builder()
                    .userId(userId)
                    .stayType(UserSurvey.StayType.valueOf(request.getStayType().getType()))
                    .isCompleted(false)
                    .build();
        } catch (IllegalArgumentException e) {
            log.error("     StayType Enum 변환 실패!");
            log.error("    받은 값: '{}'", request.getStayType().getType());
            log.error("    에러 메시지: {}", e.getMessage());
            throw new IllegalArgumentException("유효하지 않은 숙소 타입: " + request.getStayType().getType() + 
                    " (가능한 값: PENSION, MOTEL, HOTEL)");
        }
        
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
            try {
                UserSurveyFood food = UserSurveyFood.builder()
                        .foodCategory(FoodCategory.valueOf(pref.getCategory()))
                        .preferenceOrder(pref.getOrder())
                        .weight(BigDecimal.valueOf(pref.getWeight()))
                        .build();
                
                survey.addFood(food);
            } catch (IllegalArgumentException e) {
                log.error("     음식 Enum 변환 실패!");
                log.error("    받은 값: '{}'", pref.getCategory());
                log.error("    에러 메시지: {}", e.getMessage());
                throw new IllegalArgumentException("유효하지 않은 음식 카테고리: " + pref.getCategory() + 
                        " (가능한 값: 한식, 중식, 일식, 양식, 카페, 해산물, 고기, 디저트)");
            }
        }
        
        // 5. 액티비티 선호도 추가
        for (SurveySubmitRequest.ActivityPreference pref : request.getActivityPreferences()) {
            log.info("    액티비티 변환 시도 - 받은 값: '{}'", pref.getActivity());
            try {
                UserSurveyActivity activity = UserSurveyActivity.builder()
                        .activityCategory(ActivityCategory.valueOf(pref.getActivity()))
                        .preferenceOrder(pref.getOrder())
                        .weight(BigDecimal.valueOf(pref.getWeight()))
                        .build();
                
                survey.addActivity(activity);
            } catch (IllegalArgumentException e) {
                log.error("     액티비티 Enum 변환 실패!");
                log.error("    받은 값: '{}'", pref.getActivity());
                log.error("    에러 메시지: {}", e.getMessage());
                throw new IllegalArgumentException("유효하지 않은 액티비티 카테고리: " + pref.getActivity() + 
                        " (가능한 값: 자연관광, 문화체험, 레포츠, 맛집탐방, 쇼핑, 사진, 휴양, 축제)");
            }
        }
        
        // 6. 완료 처리
        survey.completeSurvey();
        
        // 7. 저장
        UserSurvey savedSurvey = userSurveyRepository.save(survey);
        
        // 8.  백그라운드 캐시 생성 (비동기) - 추가된 부분
        try {
            stayAIRecommendationService.createCacheOnSurveyComplete(userId);
            log.info("설문조사 완료 - 백그라운드 캐시 생성 시작됨: userId={}", userId);
        } catch (Exception e) {
            log.error("설문조사 완료 - 캐시 생성 실패 (무시): userId={}", userId, e);
            // 캐시 생성 실패해도 설문조사 제출은 성공 처리
        }
        
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