package com.quadrant.travelshoot.domains.main.service;

import com.quadrant.travelshoot.domains.main.dto.response.OpenAIResponse;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.user.entity.UserSurvey;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class OpenAIService {
    
    @Value("${openai.enabled:false}")
    private boolean openAIEnabled;
    
    @Value("${openai.api-key:MOCK}")
    private String apiKey;
    
    /**
     * 15개 → 10개 정제
     */
    public OpenAIResponse refineRecommendations(
            List<Stay> top15, 
            UserSurvey userSurvey
    ) {
        log.info("OpenAI 정제 시작 - 입력: {}개, 활성화: {}", top15.size(), openAIEnabled);
        
        if (!openAIEnabled || "MOCK".equals(apiKey)) {
            return mockRefinement(top15);
        }
        
        return callOpenAI(top15, userSurvey);
    }
    
    /**
     * Mock 응답 (임시)
     */
    private OpenAIResponse mockRefinement(List<Stay> stays) {
        List<Long> selectedIds = stays.stream()
                .limit(10)
                .map(Stay::getId)
                .collect(Collectors.toList());
        
        log.info("Mock 정제 완료 - 선택: {}개", selectedIds.size());
        
        return OpenAIResponse.builder()
                .description("제주 모텔 중심으로 선별된 추천 숙소입니다.")
                .selectedIds(selectedIds)
                .build();
    }
    
    /**
     * 실제 OpenAI 호출 (나중에 구현)
     */
    private OpenAIResponse callOpenAI(List<Stay> stays, UserSurvey survey) {
        // TODO: OpenAI API 연동
        log.warn("OpenAI 미구현 - Mock으로 대체");
        return mockRefinement(stays);
    }
}