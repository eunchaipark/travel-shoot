package com.quadrant.travelshoot.domains.stay.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum UserType {
    NEWBIE(0, 0, 0.7, 0.0, 0.3),        // 신규: 설문 70%, 평점 30%
    LIGHT_EARLY(1, 2, 0.6, 0.3, 0.1),   // 초기 라이트: 설문 60%, 예약 30%, 평점 10%
    LIGHT_MID(3, 5, 0.4, 0.5, 0.1),     // 중기 라이트: 설문 40%, 예약 50%, 평점 10%
    HEAVY(6, 999, 0.3, 0.6, 0.1);       // 헤비: 설문 30%, 예약 60%, 평점 10%

    private final int minReservations;
    private final int maxReservations;
    private final double surveyWeight;
    private final double reservationWeight;
    private final double ratingWeight;

    public static UserType classify(int reservationCount) {
        for (UserType type : values()) {
            if (reservationCount >= type.minReservations && 
                reservationCount <= type.maxReservations) {
                return type;
            }
        }
        return NEWBIE; // 기본값
    }
}