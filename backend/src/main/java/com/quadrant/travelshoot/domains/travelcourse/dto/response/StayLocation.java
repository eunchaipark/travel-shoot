package com.quadrant.travelshoot.domains.travelcourse.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StayLocation {
    private Long stayId;
    private String stayName;
    private BigDecimal latitude;
    private BigDecimal longitude;
    private String address;
}