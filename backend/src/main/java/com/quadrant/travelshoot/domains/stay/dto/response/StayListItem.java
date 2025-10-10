package com.quadrant.travelshoot.domain.stay.dto.response;

import com.quadrant.travelshoot.common.enums.PlaceType;
import lombok.*;
import java.math.BigDecimal;
import java.util.List;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StayListItem {
    private Long stayId;
    private String name;
    private String stayType;
    private String region;
    private String address;
    private String thumbnailImage;
    private Integer lowestPrice;
    private BigDecimal rating;
    private Integer reviewCount;
    private BigDecimal latitude;
    private BigDecimal longitude;
    private String checkInTime;
    private List<String> amenities;

    private PlaceType placeType;
}