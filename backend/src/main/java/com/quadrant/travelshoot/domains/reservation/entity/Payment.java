package com.quadrant.travelshoot.domains.reservation.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "payments")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "payment_id")
    private Long paymentId;

    @Column(name = "payment_code", unique = true, length = 100)
    private String paymentCode;

    @Column(name = "reservation_id", nullable = false)
    private Long reservationId;

    @Column(name = "payment_method", nullable = false)
    private String paymentMethod;

    @Column(name = "payment_amount", nullable = false, precision = 10, scale = 2)
    private BigDecimal paymentAmount;

    @Column(name = "payment_status", nullable = false)
    private String paymentStatus = "결제대기";

    @Column(name = "completed_at")
    private LocalDateTime completedAt;

    @Column(name = "refund_amount", nullable = false, precision = 10, scale = 2)
    private BigDecimal refundAmount = BigDecimal.ZERO;

    @Column(name = "refunded_at")
    private LocalDateTime refundedAt;

    @Builder
    public Payment(String paymentCode, Long reservationId, String paymentMethod,
                   BigDecimal paymentAmount, String paymentStatus, LocalDateTime completedAt) {
        this.paymentCode = paymentCode;
        this.reservationId = reservationId;
        this.paymentMethod = paymentMethod;
        this.paymentAmount = paymentAmount;
        this.paymentStatus = paymentStatus != null ? paymentStatus : "결제완료";
        this.completedAt = completedAt;
        this.refundAmount = BigDecimal.ZERO;
    }
}