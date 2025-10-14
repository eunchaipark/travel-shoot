package com.quadrant.travelshoot.domains.reservation.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum PaymentMethod {
    카카오페이("카카오페이", "카카오페이 간편결제"),
    네이버페이("네이버페이", "네이버페이 간편결제"),
    카드결제("카드결제", "신용/체크카드");

    private final String displayName;
    private final String description;
}