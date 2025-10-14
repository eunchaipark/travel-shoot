package com.quadrant.travelshoot.domains.activity.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ActivityTrendingResponse {

    private Long activityId;
    private String activityName;
    private String activityType;  // category
    private String address;
    private BigDecimal rating;
    
    private String thumbnailImage;
    

    private BigDecimal latitude;
    private BigDecimal longitude;
    
    private Long recent7DaysViews;
    private BigDecimal previous3WeeksAvgViews;
    private BigDecimal viewGrowthRate;
    private BigDecimal trendingScore;  // viewGrowthRate * (rating/5.0)
}