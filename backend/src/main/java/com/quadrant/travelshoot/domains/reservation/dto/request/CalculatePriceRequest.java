package com.quadrant.travelshoot.domains.reservation.dto.request;

import jakarta.validation.constraints.*;
import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CalculatePriceRequest {

    @NotNull(message = "객실 ID는 필수입니다")
    private Long roomId;

    @NotNull(message = "체크인 날짜는 필수입니다")
//    @Future(message = "체크인 날짜는 과거일 수 없습니다")
    private LocalDate checkInDate;

    @NotNull(message = "체크아웃 날짜는 필수입니다")
    @Future(message = "체크아웃 날짜는 오늘 이후여야 합니다")
    private LocalDate checkOutDate;
}