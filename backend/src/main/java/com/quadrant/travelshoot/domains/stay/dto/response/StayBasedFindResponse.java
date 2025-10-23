package com.quadrant.travelshoot.domains.stay.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StayBasedFindResponse {

    private Long id;
    private BigDecimal latitude;
    private BigDecimal longitude;
    private String name;
    private BigDecimal lowestPrice;  // Stay.minPrice 사용
    private String stayType;
    private String placeType;  // "stay" 고정
    private String mainImageUrl;
    private BigDecimal rating;
    // 추천 정보
    private List<FindRestaurantResponse> restaurants;
    private List<FindActivityResponse> activities;
}
