package com.quadrant.travelshoot.domains.stay.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StayImageDto {
    private Long imageId;
    private String s3Key;
    private String s3Url;
    private Integer sortOrder;
}
