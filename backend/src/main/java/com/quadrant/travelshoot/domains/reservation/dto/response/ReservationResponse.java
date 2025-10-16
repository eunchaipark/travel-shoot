package com.quadrant.travelshoot.domains.reservation.dto.response;

import com.quadrant.travelshoot.domains.reservation.enums.ReservationStatus;
import com.quadrant.travelshoot.domains.reservation.enums.TransportationMethod;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReservationResponse {

    private Long reservationId;
    private String reservationCode;
    private Long userId;
    private Long roomId;
    private String roomName;
    private Long stayId;
    private String stayName;
    private String address;
    private String guestName;
    private String guestPhone;
    private String guestEmail;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private Integer guestCount;
    private Integer totalNights;
    private BigDecimal totalPrice;
    private ReservationStatus reservationStatus;
    private String transportationMethod;
    private String cancelReason;
    private String cancelDetail;
    private LocalDateTime cancelledAt;
    private LocalDateTime createdAt;
    private Boolean canCancel;
}