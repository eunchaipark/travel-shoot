package com.quadrant.travelshoot.domains.payment.entity;

import com.quadrant.travelshoot.domains.payment.enums.PaymentStatus;
import com.quadrant.travelshoot.domains.reservation.enums.PaymentMethod;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "payments")
@Data
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

    @Enumerated(EnumType.STRING)
    @Column(name = "payment_method", nullable = false)
    private PaymentMethod paymentMethod;

    @Column(name = "payment_amount", nullable = false, precision = 10, scale = 2)
    private BigDecimal paymentAmount;

    @Enumerated(EnumType.STRING)
    @Column(name = "payment_status", nullable = false)
    private PaymentStatus paymentStatus = PaymentStatus.결제대기;

    @Column(name = "completed_at")
    private LocalDateTime completedAt;

    @Column(name = "refund_amount", nullable = false, precision = 10, scale = 2)
    private BigDecimal refundAmount = BigDecimal.ZERO;

    @Column(name = "refunded_at")
    private LocalDateTime refundedAt;

    @Builder
    public Payment(String paymentCode, Long reservationId, PaymentMethod paymentMethod,
                   BigDecimal paymentAmount, PaymentStatus paymentStatus, LocalDateTime completedAt) {
        this.paymentCode = paymentCode;
        this.reservationId = reservationId;
        this.paymentMethod = paymentMethod;
        this.paymentAmount = paymentAmount;
        this.paymentStatus = paymentStatus != null ? paymentStatus : PaymentStatus.결제완료;
        this.completedAt = completedAt;
        this.refundAmount = BigDecimal.ZERO;
    }
}