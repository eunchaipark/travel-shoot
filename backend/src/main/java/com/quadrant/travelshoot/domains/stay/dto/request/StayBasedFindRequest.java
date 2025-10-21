package com.quadrant.travelshoot.domains.stay.dto.request;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StayBasedFindRequest {

    @NotEmpty(message = "숙소 ID 목록은 필수입니다")
    private List<Long> stayIds;

    @NotNull(message = "맛집 개수는 필수입니다")
    private Integer restaurantCount;

    @NotNull(message = "관광지 개수는 필수입니다")
    private Integer activityCount;
}