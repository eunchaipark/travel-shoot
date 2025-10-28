package com.quadrant.travelshoot.domains.stay.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import java.util.List;

/**
 * 숙소 전체 이미지 모달용
 */
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StayImagesResponse {
    private Long stayId;
    private Integer totalCount;
    private List<StayImageDto> images;
}