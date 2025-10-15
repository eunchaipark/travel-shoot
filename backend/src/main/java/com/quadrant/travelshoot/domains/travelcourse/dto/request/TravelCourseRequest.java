package com.quadrant.travelshoot.domains.travelcourse.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Min;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class TravelCourseRequest {
    @NotNull(message = "예약 ID는 필수입니다.")
    private Long reservationId;

    @NotNull(message = "여행 일수는 필수입니다.")
    @Min(value = 1, message = "여행 일수는 최소 1일 이상이어야 합니다.")
    private Integer totalDays;
}
