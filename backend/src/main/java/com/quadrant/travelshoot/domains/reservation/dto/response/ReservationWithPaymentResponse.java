package com.quadrant.travelshoot.domains.reservation.dto.response;

import com.quadrant.travelshoot.domains.reservation.enums.PaymentMethod;
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
public class ReservationWithPaymentResponse {
    private String reservationCode;
    private Long stayId;
    private String stayName;
    private String mainImageUrl;
    private BigDecimal latitude;
    private BigDecimal longitude;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private LocalTime checkInTime;
    private LocalTime checkOutTime;
    private Integer totalNights;
    private BigDecimal totalPrice;
    private ReservationStatus reservationStatus;
    private String transportationMethod;
    private String cancelReason;
    private String cancelDetail;
    private LocalDateTime cancelledAt;
    private LocalDateTime createdAt;
    private PaymentMethod paymentMethod;
}
