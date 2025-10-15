package com.quadrant.travelshoot.domains.reservation.dto.response;

import lombok.*;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PriceCalculationResponse {

    private List<DailyPrice> dailyPrices;
    private Integer totalNights;
    private BigDecimal subtotal;
    private BigDecimal tax;
    private BigDecimal serviceFee;
    private BigDecimal totalPrice;

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class DailyPrice {
        private String date;
        private String dayType;
        private BigDecimal price;
    }
}