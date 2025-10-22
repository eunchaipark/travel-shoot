package com.quadrant.travelshoot.domains.ai.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

// OpenAI에 전송할 숙소 추천 요청 DTO
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StayAIRequest {
    
    // 후보 숙소 목록 (15개)
    
    private List<CandidateStay> candidates;
    
    // 사용자 프로필
    private UserProfile userProfile;
    
    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class CandidateStay {
        private Long stayId;
        private String stayName;
        private String stayType;
        private String regionName;
        private Double minPrice;
        private Double averageRating;
        private Integer reviewCount;
    }
    
    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class UserProfile {
        private SurveyData surveyData;
        private List<ReservationHistory> reservationHistory;
    }
    
    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class SurveyData {
        private List<String> preferredRegions;  // 선호 지역 (순서대로)
        private String stayType;                // 선호 숙소 타입
        private List<String> activities;        // 선호 액티비티
        private List<String> foods;             // 선호 음식
    }
    
    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class ReservationHistory {
        private String stayType;
        private String regionName;
        private String checkInDate;
    }
}