package com.quadrant.travelshoot.domains.stay.dto.response;

import com.quadrant.travelshoot.domains.stay.entity.Room;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalTime;


@Getter @Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RoomDto {
    private Long roomId;
    private String roomCode;
    private String roomName;
    private Integer roomCount;

    // 수용 인원
    private Integer standardCapacity;
    private Integer maximumCapacity;

    // 체크인/아웃 시간
    private LocalTime checkInTime;
    private LocalTime checkOutTime;

    // 침실/욕실
    private Integer bedroomCount;
    private Integer bathroomCount;

    // 침대 구성
    private Integer singleBedCount;
    private Integer doubleBedCount;
    private Integer queenBedCount;
    private Integer kingBedCount;

    // 가격
    private BigDecimal weekdayPrice;
    private BigDecimal weekendPrice;

    // 숙박 일수
    private Integer minimumNights;
    private Integer maximumNights;

    // 설명
    private String roomDescription;
    private String reservationNotice;

    // 객실 이미지 1개
    private String roomImageUrl;

    // 상태
    private Boolean isAvailable;
    private Boolean isActive;

    // 통계
    private Long viewCount;
    private Integer reservationCount;

}
