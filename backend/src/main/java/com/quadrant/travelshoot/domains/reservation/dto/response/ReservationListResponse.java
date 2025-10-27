package com.quadrant.travelshoot.domains.reservation.dto.response;

import com.quadrant.travelshoot.domains.reservation.enums.ReservationStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReservationListResponse {
    private String reservationCode;
    private Long stayId;
    private String stayName;
    private String mainImageUrl;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private LocalTime checkInTime;
    private LocalTime checkOutTime;
    private ReservationStatus reservationStatus;
    private LocalDateTime createdAt;
    private Long reviewId;
    private LocalDateTime reviewCreatedAt;
    private Integer totalNights;
    private BigDecimal totalPrice;
    private Long reservationId;
    private String cancelReason;
}
