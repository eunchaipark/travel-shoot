package com.quadrant.travelshoot.domains.reservation.dto.response;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TransportOptionResponse {
    private String value;
    private String label;
    private String description;
}