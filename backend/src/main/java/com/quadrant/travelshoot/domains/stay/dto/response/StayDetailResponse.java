package com.quadrant.travelshoot.domains.stay.dto.response;

import com.quadrant.travelshoot.domains.common.dto.response.FileUploadResponse;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalTime;
import java.util.List;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StayDetailResponse {

    private Long stayId;
    private String stayName;
    private String stayCode;
    private String stayType;  // '호텔', '모텔', '펜션'

    private String address;
    private String addressDetail;

    private BigDecimal latitude;
    private BigDecimal longitude;
    private String description;
    private LocalTime checkInTime;
    private LocalTime checkOutTime;
    private String reservationNotice;
    private BigDecimal averageRating;

    private Integer reviewCount;
    private Long viewCount;
    private Boolean isActive;

    private Long regionId;
    private BigDecimal minPrice;

    // 페이지에 보이는 5장만
    private List<StayImageDto> stayImages;
    private List<AmenityDto> amenities;
    private List<RoomDto> rooms;


}
