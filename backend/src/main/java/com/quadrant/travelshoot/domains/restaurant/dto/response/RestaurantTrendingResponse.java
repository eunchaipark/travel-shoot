package com.quadrant.travelshoot.domains.restaurant.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RestaurantTrendingResponse {
    // 기본 정보
    private Long restaurantId;
    private String restaurantName;
    private String foodType;  // category
    private String address;
    private BigDecimal rating;
    
    // 이미지
    private String thumbnailImage;
    
    // 위치
    private BigDecimal latitude;
    private BigDecimal longitude;
    
    // Trending 관련
    private Long recent7DaysViews;
    private BigDecimal previous3WeeksAvgViews;
    private BigDecimal viewGrowthRate;
    private BigDecimal trendingScore;  // viewGrowthRate * (rating/5.0)
}