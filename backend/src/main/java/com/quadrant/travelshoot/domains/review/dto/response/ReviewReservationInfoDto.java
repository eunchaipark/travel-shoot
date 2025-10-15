package com.quadrant.travelshoot.domains.review.dto.response;

import com.quadrant.travelshoot.domains.reservation.enums.ReservationStatus;
import lombok.*;
import java.time.LocalDate;
import java.time.LocalTime;

/* 예약 정보 DTO */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewReservationInfoDto {

    /* 예약 정보 */
    private Long reservationId;
    private String reservationCode;     // 예약 번호
    private LocalDate checkInDate;      // 체크인 일자
    private LocalDate checkOutDate;     // 체크아웃 일자
    private int totalNights;    // 몇 박
    private ReservationStatus reservationStatus; // 예약 상태 ENUM

    /* 숙소 정보  */
    private Long stayId;
    private String stayName;
    private LocalTime checkInTime;      // 숙소 체크인 시간
    private LocalTime checkOutTime;     // 숙소 체크아웃 시간
    private String stayImageUrl;        // 숙소 이미지 url 하나만

    /* 객실 정보 - 참조 예정 */
    private Long roomId;
    private String roomName;
    private Integer standardCapacity;   // 기준 인원
    private Integer maximumCapacity;    // 최대 인원

}
