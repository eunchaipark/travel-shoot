package com.quadrant.travelshoot.domains.stay.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import com.quadrant.travelshoot.domains.restaurant.entity.Restaurant;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FindRestaurantResponse {

    private Long id;
    private BigDecimal latitude;
    private BigDecimal longitude;
    private String name;
    private String address;
    private String addressDetail;
    private String foodType;
    private BigDecimal rating;
    private String signatureMenu;
    private String closedDays;
    private String placeType;  // "restaurant" 고정
    private String image;

    // Entity -> DTO 변환
    public static FindRestaurantResponse from(Restaurant restaurant) {
        if (restaurant == null) return null;

        return FindRestaurantResponse.builder()
                .id(restaurant.getId())
                .latitude(restaurant.getLatitude())
                .longitude(restaurant.getLongitude())
                .name(restaurant.getRestaurantName())
                .address(restaurant.getAddress())
                .addressDetail(restaurant.getAddressDetail())
                .foodType(restaurant.getFoodType())
                .rating(restaurant.getRating())
                .signatureMenu(restaurant.getSignatureMenu())
                .closedDays(restaurant.getClosedDays())
                .placeType("restaurant")
                .image("")
                .build();
    }
}
