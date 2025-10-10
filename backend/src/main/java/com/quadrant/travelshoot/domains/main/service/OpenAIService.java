package com.quadrant.travelshoot.domains.main.service;

import com.quadrant.travelshoot.domains.main.dto.response.OpenAIResponse;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.user.entity.UserSurvey;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
     * 15개 → 10개 정제 (점수 포함)
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
     * Mock 응답 (임시 - 랜덤 점수 생성)
     */
    private OpenAIResponse mockRefinement(List<Stay> stays) {
        List<Long> selectedIds = stays.stream()
                .limit(10)
                .map(Stay::getId)
                .collect(Collectors.toList());
        
        // Mock: 기존 점수에 랜덤 변동 추가 (±10점)
        Map<Long, Double> scores = new HashMap<>();
        stays.stream()
                .limit(10)
                .forEach(stay -> {
                    double baseScore = stay.getRecommendationScore();
                    // 랜덤 변동: -10 ~ +10
                    double variation = (Math.random() - 0.5) * 20;
                    double newScore = Math.max(0, Math.min(100, baseScore + variation));
                    scores.put(stay.getId(), Math.round(newScore * 100.0) / 100.0); // 소수점 2자리
                });
        
        log.info("Mock 정제 완료 - 선택: {}개, 점수 범위: {}-{}", 
                selectedIds.size(),
                scores.values().stream().mapToDouble(Double::doubleValue).min().orElse(0),
                scores.values().stream().mapToDouble(Double::doubleValue).max().orElse(0));
        
        return OpenAIResponse.builder()
                .description("사용자 취향과 지역 특성을 고려한 AI 추천 숙소입니다.")
                .selectedIds(selectedIds)
                .scores(scores)
                .build();
    }
    
    private OpenAIResponse callOpenAI(List<Stay> stays, UserSurvey survey) {
        // TODO: OpenAI API 연동
        // 1. 프롬프트 생성
        // String prompt = buildPrompt(stays, survey);
        
        // 2. OpenAI API 호출
        // String response = openAIClient.chat(prompt);
        
        // 3. 응답 파싱 (JSON)
        // {
        //   "description": "...",
        //   "recommendations": [
        //     {"stayId": 1, "score": 95.5, "reason": "..."},
        //     {"stayId": 5, "score": 92.3, "reason": "..."},
        //     ...
        //   ]
        // }
        
        log.warn("OpenAI 미구현 - Mock으로 대체");
        return mockRefinement(stays);
    }
}