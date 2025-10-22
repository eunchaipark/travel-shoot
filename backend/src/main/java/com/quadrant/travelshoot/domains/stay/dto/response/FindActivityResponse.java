package com.quadrant.travelshoot.domains.stay.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import com.quadrant.travelshoot.domains.activity.entity.Activity;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FindActivityResponse {

    private Long id;
    private BigDecimal latitude;
    private BigDecimal longitude;
    private String name;
    private String address;
    private String addressDetail;
    private String activityType;
    private BigDecimal rating;
    private String placeType;  // "activity" 고정
    private String image;

    // Entity -> DTO 변환
    public static FindActivityResponse from(Activity activity) {
        if (activity == null) return null;

        return FindActivityResponse.builder()
                .id(activity.getId())
                .latitude(activity.getLatitude())
                .longitude(activity.getLongitude())
                .name(activity.getActivityName())
                .address(activity.getAddress())
                .addressDetail(activity.getAddressDetail())
                .activityType(activity.getActivityType())
                .rating(activity.getRating())
                .placeType("activity")
                .image("")
                .build();
    }
}
