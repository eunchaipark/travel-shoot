package com.quadrant.travelshoot.domains.reservation.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum TransportationMethod {
    차량("차량", "자가용 또는 렌터카로 방문"),
    대중교통("대중교통", "버스, 기차 등으로 방문");

    private final String displayName;
    private final String description;
}