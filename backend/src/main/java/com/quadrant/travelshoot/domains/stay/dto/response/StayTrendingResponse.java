package com.quadrant.travelshoot.domains.stay.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class StayTrendingResponse {
    private Long stayId;
    private String stayName;
    private String address;
    private BigDecimal averageRating;
    private String thumbnailImage;

    private BigDecimal price;

    private BigDecimal latitude;
    private BigDecimal longitude;
    
 
    private String checkInTime;
    private String checkOutTime;
    
 
    private String stayType;

    private Long recent7DaysReservations;
    private Long recent7DaysViews;
    
    private BigDecimal previous3WeeksAvgReservations;
    private BigDecimal previous3WeeksAvgViews;
    
    private BigDecimal reservationGrowthRate;
    private BigDecimal viewGrowthRate;
}