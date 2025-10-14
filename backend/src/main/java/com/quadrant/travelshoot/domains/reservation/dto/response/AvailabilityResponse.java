package com.quadrant.travelshoot.domains.reservation.dto.response;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AvailabilityResponse {
    private Boolean available;
    private String message;
}