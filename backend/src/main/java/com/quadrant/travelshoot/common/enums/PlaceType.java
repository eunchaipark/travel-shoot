package com.quadrant.travelshoot.common.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum PlaceType {
    STAY("숙소"),
    RESTAURANT("맛집"),
    ATTRACTION("관광지");

    private final String description;
}