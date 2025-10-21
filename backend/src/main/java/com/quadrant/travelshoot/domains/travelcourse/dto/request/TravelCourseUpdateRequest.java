package com.quadrant.travelshoot.domains.travelcourse.dto.request;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TravelCourseUpdateRequest {
    private Long spotId;
    private PlaceData place;

    @Getter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class PlaceData {
        private String id;
        private String place_name;
        private String x;
        private String y;
        private String address_name;
        private String place_url;
        private String category_group_name;
        private String category_name;
    }
}