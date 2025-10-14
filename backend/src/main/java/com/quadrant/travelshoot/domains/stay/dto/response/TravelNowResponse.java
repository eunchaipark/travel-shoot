package com.quadrant.travelshoot.domains.stay.dto.response;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TravelNowResponse {
    private Long id;
    private String name;
    private String location;
    private String image;
    private List<String> features;
    private Long accommodationCount;
}
