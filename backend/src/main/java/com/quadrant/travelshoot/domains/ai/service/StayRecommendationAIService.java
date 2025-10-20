package com.quadrant.travelshoot.domains.ai.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import com.quadrant.travelshoot.domains.reservation.service.ReservationService;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.survey.entity.UserSurvey;
import com.quadrant.travelshoot.domains.survey.service.UserSurveyService;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

/**
 * 숙소 추천 AI 서비스
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class StayRecommendationAIService {
    
    private final OpenAIService openAIService;
    private final UserSurveyService userSurveyService;
    private final ReservationService reservationService;
    private final ObjectMapper objectMapper;
    
    // 메모리 캐시: userId별 AI 매칭 점수 저장
    private static final Map<String, Map<Long, Integer>> aiScoreCache = new ConcurrentHashMap<>();
    
    /**
     * OpenAI를 통한 숙소 추천 (6개 선정)
     */
    public List<Long> selectTop6Stays(List<Stay> candidates, Long userId) {
        log.info("AI 숙소 선정 시작 - 후보: {}개, userId: {}", candidates.size(), userId);
        
        try {
            // 1. 사용자 데이터 조회
            UserSurvey survey = userSurveyService.getByUserId(userId)
                .orElseThrow(() -> new IllegalStateException("설문조사를 찾을 수 없습니다."));
            
            List<Reservation> reservations = reservationService.getRecentCompletedReservations(userId, 10);
            
            // 2. System Prompt 생성 (점수 포함)
            String systemPrompt = buildSystemPromptWithScore();
            
            // 3. User Prompt 생성
            String userPrompt = buildSimplifiedUserPrompt(candidates, survey, reservations);
            
            log.info("Prompt 생성 완료 - System: {}자, User: {}자", 
                systemPrompt.length(), userPrompt.length());
            
            // 4. OpenAI API 호출
            String response = openAIService.callGPT(systemPrompt, userPrompt);
            
            log.info("AI 응답 수신: {}", response);
            
            // 5. JSON 파싱 (ID + 점수)
            List<AIRecommendation> recommendations = parseAIResponseWithScore(response);
            
            // 6. 점수 정보를 메모리에 저장
            Map<Long, Integer> scoreMap = recommendations.stream()
                .collect(Collectors.toMap(
                    AIRecommendation::getId,
                    AIRecommendation::getMatchScore
                ));
            aiScoreCache.put(userId.toString(), scoreMap);
            
            log.info("AI 매칭 점수 저장 완료 - userId: {}", userId);
            recommendations.forEach(r -> 
                log.info("  - ID: {}, 매칭 점수: {}%", r.getId(), r.getMatchScore())
            );
            
            // 7. ID만 반환
            return recommendations.stream()
                .map(AIRecommendation::getId)
                .collect(Collectors.toList());
            
        } catch (Exception e) {
            log.error("AI 숙소 선정 실패 - userId: {}, error: {}", userId, e.getMessage(), e);
            throw new RuntimeException("AI 숙소 선정 실패", e);
        }
    }
    
    /**
     * AI 매칭 점수 조회 (다른 서비스에서 사용)
     */
    public static Integer getAIMatchScore(Long userId, Long stayId) {
        Map<Long, Integer> scoreMap = aiScoreCache.get(userId.toString());
        return scoreMap != null ? scoreMap.get(stayId) : null;
    }
    
    /**
     * System Prompt 생성 (점수 포함)
     */
    private String buildSystemPromptWithScore() {
        return """
            You are a travel accommodation expert.
            Select the best 6 accommodations based on user preferences.
            
            Selection Criteria:
            1. Match user's region preferences
            2. Match accommodation type preferences
            3. Consider rating and reviews
            4. Maximum 2 accommodations per region
            
            Response Format (JSON array with matching score):
            [
              {"id": 101, "score": 96},
              {"id": 52, "score": 92},
              {"id": 23, "score": 89},
              {"id": 67, "score": 87},
              {"id": 89, "score": 85},
              {"id": 45, "score": 83}
            ]
            
            IMPORTANT:
            - Return ONLY 6 accommodations
            - Use IDs from the candidate list only
            - Score: 0-100 (how well it matches user preferences)
            - Return JSON array without any explanation
            """;
    }
    
    /**
     * User Prompt 생성
     */
    private String buildSimplifiedUserPrompt(
        List<Stay> candidates, 
        UserSurvey survey, 
        List<Reservation> reservations) {
    
        StringBuilder prompt = new StringBuilder();
        
        // 1. 사용자 선호도
        prompt.append("=== User Preferences ===\n");
        prompt.append("Preferred Type: ").append(survey.getStayType().name()).append("\n");
        
        prompt.append("Preferred Regions: ");
        survey.getRegions().stream()
            .sorted(Comparator.comparing(r -> r.getRankOrder()))
            .forEach(r -> prompt.append(r.getRegionName()).append(", "));
        prompt.append("\n");
        
        // 선호 음식
        if (!survey.getFoods().isEmpty()) {
            prompt.append("Preferred Foods: ");
            survey.getFoods().stream()
                .sorted(Comparator.comparing(f -> f.getPreferenceOrder()))
                .forEach(f -> prompt.append(f.getFoodCategory().name()).append(", "));
            prompt.append("\n");
        }
        
        // 선호 액티비티
        if (!survey.getActivities().isEmpty()) {
            prompt.append("Preferred Activities: ");
            survey.getActivities().stream()
                .sorted(Comparator.comparing(a -> a.getPreferenceOrder()))
                .forEach(a -> prompt.append(a.getActivityCategory().name()).append(", "));
            prompt.append("\n");
        }
        
        prompt.append("Reservation History: ").append(reservations.size()).append(" times\n\n");
        
        // 2. 후보 숙소 (간소화)
        prompt.append("=== Accommodation Candidates ===\n");
        for (int i = 0; i < candidates.size(); i++) {
            Stay stay = candidates.get(i);
            prompt.append(String.format("%d. [ID: %d] %s\n", 
                i + 1, stay.getId(), stay.getName()));
            prompt.append(String.format("   - Type: %s, Region: %s\n", 
                stay.getStayType(), stay.getRegionName()));
            prompt.append(String.format("   - Price: %.0f, Rating: %.1f (%d reviews)\n", 
                stay.getMinPrice(), stay.getAverageRating(), stay.getReviewCount()));
            prompt.append("\n");
        }
        
        // 3. 요구사항
        prompt.append("=== Requirements ===\n");
        prompt.append("1. Select ONLY from the candidates above\n");
        prompt.append("2. Use exact ID as shown\n");
        prompt.append("3. Calculate matching score (0-100) for each\n");
        prompt.append("4. Consider user's food and activity preferences when scoring\n");
        prompt.append("5. Return JSON array: [{\"id\": 101, \"score\": 96}, ...]\n");
        prompt.append("6. No additional text\n");
        
        return prompt.toString();
    }
    
    /**
     * AI 응답 파싱 (ID + 점수)
     */
    private List<AIRecommendation> parseAIResponseWithScore(String response) {
        try {
            // JSON 배열 추출
            String jsonArray = extractJsonArray(response);
            
            log.info("추출된 JSON: {}", jsonArray);
            
            // JSON 파싱
            List<AIRecommendation> recommendations = objectMapper.readValue(
                jsonArray, 
                new TypeReference<List<AIRecommendation>>() {}
            );
            
            if (recommendations == null || recommendations.isEmpty()) {
                throw new IllegalArgumentException("AI가 빈 배열을 반환했습니다");
            }
            
            if (recommendations.size() != 6) {
                log.warn("AI가 6개가 아닌 {}개를 반환했습니다", recommendations.size());
                if (recommendations.size() > 6) {
                    recommendations = recommendations.subList(0, 6);
                }
            }
            
            return recommendations;
            
        } catch (JsonProcessingException e) {
            log.error("AI 응답 파싱 실패: {}", response, e);
            throw new RuntimeException("AI 응답 파싱 실패", e);
        }
    }
    
    /**
     * 응답에서 JSON 배열 추출
     */
    private String extractJsonArray(String response) {
        int start = response.indexOf('[');
        int end = response.lastIndexOf(']');
        
        if (start == -1 || end == -1 || start >= end) {
            throw new IllegalArgumentException("JSON 배열을 찾을 수 없습니다: " + response);
        }
        
        return response.substring(start, end + 1);
    }
    
    /**
     * AI 추천 DTO (ID + 매칭 점수)
     */
    @Getter
    @NoArgsConstructor
    @AllArgsConstructor
    public static class AIRecommendation {
        private Long id;
        private Integer score; // matchScore로 매핑됨
        
        public Integer getMatchScore() {
            return score;
        }
    }
}