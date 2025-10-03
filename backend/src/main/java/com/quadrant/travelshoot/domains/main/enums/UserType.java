package com.quadrant.travelshoot.domains.main.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum UserType {
    NEW("신규사욪자", 0, 0),
    LIGHT("라이트 사용자", 1, 3),
    HEAVY("헤비 사용자", 4, null);

    private final String description;
    private final int minReservation;
    private final Integer maxReservation;

    public static UserType fromReservationCount(long count){
        if(count ==0){
            return NEW;
        } else if(count >= 1 && count <= 3){
            return LIGHT;
        } else{
            return HEAVY;
        }
    }
}
