package com.quadrant.travelshoot.domains.stay.dto.cache;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * Redis 캐시용 숙소 추천 데이터
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StayRecommendationCache implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    /**
     * 사용자 ID
     */
    private Long userId;
    
    /**
     * 추천된 숙소 ID 목록 (6개)
     */
    private List<Long> stayIds;
    
    /**
     * 캐시 생성 시점의 완료된 예약 건수
     */
    private Integer reservationCount;
    
    /**
     * 캐시 생성 시간
     */
    private LocalDateTime cachedAt;
    
    /**
     * 숙소 상세 정보 (6개)
     */
    private List<CachedStayInfo> stays;
    
    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class CachedStayInfo implements Serializable {
        private static final long serialVersionUID = 1L;
        
        private Long stayId;
        private String stayName;
        private String stayType;
        private String regionName;
        private Double minPrice;
        private Double averageRating;
        private Integer reviewCount;


        private String thumbnailImage;
        private String location;
        private String checkinTime;
        private String badge;
        private Double latitude;
        private Double longitude;
    }
}