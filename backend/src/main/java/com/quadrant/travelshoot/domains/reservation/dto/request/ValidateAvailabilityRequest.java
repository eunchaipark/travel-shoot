package com.quadrant.travelshoot.domains.reservation.dto.request;

import jakarta.validation.constraints.*;
import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ValidateAvailabilityRequest {

    @NotNull(message = "객실 ID는 필수입니다")
    private Long roomId;

    @NotNull(message = "체크인 날짜는 필수입니다")
    @Future(message = "체크인 날짜는 과거일 수 없습니다")
    private LocalDate checkInDate;

    @NotNull(message = "체크아웃 날짜는 필수입니다")
//    @Future(message = "체크아웃 날짜는 오늘 이후여야 합니다")
    private LocalDate checkOutDate;

    @NotNull(message = "투숙 인원은 필수입니다")
    @Min(value = 1, message = "투숙 인원은 최소 1명이어야 합니다")
    private Integer guestCount;
}