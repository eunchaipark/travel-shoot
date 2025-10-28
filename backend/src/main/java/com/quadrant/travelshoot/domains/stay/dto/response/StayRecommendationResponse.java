package com.quadrant.travelshoot.domains.stay.dto.response;

import com.quadrant.travelshoot.domains.stay.entity.Stay;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.stream.Collectors;

public class StayRecommendationResponse {

    /**
     * API 응답 DTO
     */
    @Getter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Response {
        private List<StaySummary> stays;
        private Integer totalCount;
        private String userType; 

        public static Response of(List<StayScore> scoredStays, String userType) {
            List<StaySummary> summaries = scoredStays.stream()
                .map(StayScore::toSummary)
                .collect(Collectors.toList());
                
            return Response.builder()
                .stays(summaries)
                .totalCount(summaries.size())
                .userType(userType)
                .build();
        }
    }

    /**
     * 숙소 요약 정보
     */
    @Getter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class StaySummary {
        private Long stayId;
        private String stayName;
        private String stayType;
        private String regionName;
        private BigDecimal minPrice;
        private Double averageRating;
        private Integer reviewCount;
        private Double totalScore;
    }

    /**
     * 점수가 포함된 숙소 (내부 사용)
     */
    @Getter
    @AllArgsConstructor
    public static class StayScore {
        private Stay stay;
        private String regionName;
        private double totalScore;
        private double surveyScore;
        private double reservationScore;
        private double ratingScore;

        public StaySummary toSummary() {
            return StaySummary.builder()
                .stayId(stay.getId())
                .stayName(stay.getName())
                .stayType(stay.getStayType())
                .regionName(regionName)
                .minPrice(getMinPrice())
                .averageRating(stay.getAverageRating().doubleValue())
                .reviewCount(stay.getReviewCount())
                .totalScore(Math.round(totalScore * 100.0) / 100.0)
                .build();
        }

        private BigDecimal getMinPrice() {
            if (stay.getRooms() == null || stay.getRooms().isEmpty()) {
                return BigDecimal.ZERO;
            }
            
            return stay.getRooms().stream()
                .map(room -> room.getWeekdayPrice())
                .min(BigDecimal::compareTo)
                .orElse(BigDecimal.ZERO);
        }
    }
}