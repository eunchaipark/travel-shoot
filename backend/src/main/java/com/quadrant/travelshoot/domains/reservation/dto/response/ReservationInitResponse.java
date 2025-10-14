package com.quadrant.travelshoot.domains.reservation.dto.response;

import lombok.*;

import java.math.BigDecimal;
import java.time.LocalTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReservationInitResponse {

    private Long stayId;
    private String stayName;
    private String address;
    private String mainImageUrl;
    private Double latitude;
    private Double longitude;

    private Long roomId;
    private String roomName;
    private Integer maxOccupancy;
    private LocalTime checkInTime;
    private LocalTime checkOutTime;

    private PriceInfo priceInfo;
    private PolicyInfo policyInfo;
    private List<AmenityInfo> amenities;
    private List<TransportOptionResponse> transportOptions;

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class PriceInfo {
        private BigDecimal weekdayPrice;
        private BigDecimal weekendPrice;
        private Integer minStayDays;
        private Integer maxStayDays;
    }

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class PolicyInfo {
        private String reservationNotice;
        private String cancellationPolicy;
    }

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class AmenityInfo {
        private Long amenityId;
        private String name;
        private String iconUrl;
    }
}