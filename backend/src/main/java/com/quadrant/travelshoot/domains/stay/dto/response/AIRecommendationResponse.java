package com.quadrant.travelshoot.domains.stay.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

/**
 * AI 숙소 추천 API 응답 DTO
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AIRecommendationResponse {
    
    /**
     * 추천 숙소 목록 (6개)
     */
    private List<AIStayResponse> stays;
    
    /**
     * 총 개수 (항상 6개)
     */
    private Integer totalCount;
    
    /**
     * 사용자 타입
     */
    private String userType;
    
    /**
     * 캐시 사용 여부
     */
    private Boolean fromCache;
    
    /**
     * 캐시 생성 시간 (캐시 사용 시)
     */
    private LocalDateTime cachedAt;
}