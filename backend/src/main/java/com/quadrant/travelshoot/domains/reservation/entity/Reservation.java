package com.quadrant.travelshoot.domains.reservation.entity;

import com.quadrant.travelshoot.domains.stay.entity.Room;
import com.quadrant.travelshoot.domains.reservation.enums.*;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import com.quadrant.travelshoot.domains.stay.entity.Room;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
//import java.util.UUID;  //TODO : 1015 랜덤 아이디 규칙 적용해서 주석처리
import java.util.Random;  //TODO : 1015 랜덤 아이디 규칙 적용

@Entity
@Table(name = "reservations")
@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class Reservation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reservation_id")
    private Long id;

    @Column(name = "reservation_code", unique = true, nullable = false, length = 100)
    private String reservationCode;

//    @OneToOne(fetch = FetchType.LAZY)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "room_id", nullable = false)
    private Room room;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(name = "guest_name", nullable = false, length = 100)
    private String guestName;

    @Column(name = "guest_phone", nullable = false, length = 20)
    private String guestPhone;

    @Column(name = "guest_email", nullable = false, length = 255)
    private String guestEmail;

    @Column(name = "check_in_date", nullable = false)
    private LocalDate checkInDate;

    @Column(name = "check_out_date", nullable = false)
    private LocalDate checkOutDate;

    @Column(name = "guest_count", nullable = false)
    private Integer guestCount;

    @Column(name = "total_nights", nullable = false)
    private Integer totalNights;

    @Column(name = "total_price", nullable = false, precision = 10, scale = 2)
    private BigDecimal totalPrice;

    @Enumerated(EnumType.STRING)
    @Column(name = "reservation_status", nullable = false)
    @Builder.Default
    private ReservationStatus reservationStatus = ReservationStatus.예약확정;

    @Column(name = "cancel_reason", length = 100)
    private String cancelReason;

    // 1013 추가 - 1020 수정
    @Enumerated(EnumType.STRING)
    @Column(name = "transportation_method", nullable = true)
    private TransportationMethod transportationMethod;

    @Column(name = "cancel_detail", columnDefinition = "TEXT")
    private String cancelDetail;

    @Column(name = "cancelled_at")
    private LocalDateTime cancelledAt;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();

        if (reservationCode == null) {
            reservationCode = generateReservationCode();
        }

        if (reservationStatus == null) {
            reservationStatus = ReservationStatus.예약확정;
        }

        if (totalNights == null && checkInDate != null && checkOutDate != null) {
            totalNights = (int) ChronoUnit.DAYS.between(checkInDate, checkOutDate);
        }
    }

    private String generateReservationCode() {

        //TODO : RES + 이용시작일 + 랜덤숫자 7자리 이렇게 예약번호 생성되게 규칙성
        String datePart = String.format("%02d%02d", checkInDate.getMonthValue(), checkInDate.getDayOfMonth());
        int randomNum = new Random().nextInt(9_000_000) + 1_000_000;
        String randomPart = String.valueOf(randomNum);

        return "RES" + datePart + randomPart;

        // TODO : 1015 예약번호 너무 랜덤이라는 의견을 수렴해서 위의 코드로 조금 규칙성을 줌...
//        String timestamp = String.valueOf(System.currentTimeMillis());
//        String uuid = UUID.randomUUID().toString().substring(0, 8).toUpperCase();
//        return "RES" + timestamp + uuid;
    }

    public void cancel(String reason, String detail) {
        if (this.reservationStatus == ReservationStatus.예약취소) {
            throw new IllegalStateException("이미 취소된 예약입니다");
        }
        if (this.reservationStatus == ReservationStatus.이용완료) {
            throw new IllegalStateException("이미 이용 완료된 예약은 환불 안됨");
        }

        this.reservationStatus = ReservationStatus.예약취소;
        this.cancelReason = reason;
        this.cancelDetail = detail;
        this.cancelledAt = LocalDateTime.now();
    }

    public void complete() {
        if (this.reservationStatus == ReservationStatus.예약취소) {
            throw new IllegalStateException("취소된 예약은 완료 처리 안함");
        }
        this.reservationStatus = ReservationStatus.이용완료;
    }

    public boolean canCancel() {
        if (this.reservationStatus != ReservationStatus.예약확정) {
            return false;
        }
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime checkInDeadline = this.checkInDate.atTime(15, 0).minusHours(2);
        return now.isBefore(checkInDeadline);
    }

//    public enum ReservationStatus {
//        예약확정, 이용완료, 예약취소
//    }
}