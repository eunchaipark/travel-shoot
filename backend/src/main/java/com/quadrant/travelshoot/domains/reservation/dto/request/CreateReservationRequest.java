package com.quadrant.travelshoot.domains.reservation.dto.request;

import com.quadrant.travelshoot.domains.reservation.enums.PaymentMethod;
import com.quadrant.travelshoot.domains.reservation.enums.TransportationMethod;
import jakarta.validation.constraints.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateReservationRequest {

    @NotNull(message = "객실 ID는 필수입니다")
    private Long roomId;

    @NotNull(message = "체크인 날짜는 필수입니다")
    private LocalDate checkInDate;

    @NotNull(message = "체크아웃 날짜는 필수입니다")
    private LocalDate checkOutDate;

    @NotNull(message = "투숙 인원은 필수입니다")
    @Min(value = 1, message = "투숙 인원은 최소 1명이어야 합니다")
    private Integer guestCount;

    @NotNull(message = "총 금액은 필수입니다")
    @DecimalMin(value = "0.0", inclusive = false, message = "금액은 0보다 커야 합니다")
    private BigDecimal totalPrice;

    @NotNull(message = "방문 수단을 선택해주세요")
    private TransportationMethod transportationMethod;

    @NotBlank(message = "이용자 이름은 필수입니다")
    @Size(max = 100, message = "이름은 100자 이내여야 합니다")
    private String guestName;

    @NotBlank(message = "이용자 전화번호는 필수입니다")
    @Pattern(regexp = "^010-\\d{4}-\\d{4}$", message = "전화번호 형식이 올바르지 않습니다")
    private String guestPhone;

    @NotNull(message = "결제 수단은 필수입니다")
    private PaymentMethod paymentMethod;

    //약관 동의
    @NotNull(message = "만 14세 이상 이용 동의는 필수입니다")
    @AssertTrue(message = "만 14세 이상만 이용 가능합니다")
    private Boolean ageAgreed;

    @NotNull(message = "이용 약관 동의는 필수입니다")
    @AssertTrue(message = "이용 약관에 동의해주세요")
    private Boolean termsAgreed;

    @NotNull(message = "취소 및 환불 규칙 동의는 필수입니다")
    @AssertTrue(message = "취소 및 환불 규칙에 동의해주세요")
    private Boolean refundPolicyAgreed;

    private Boolean marketingAgreed;

    private Boolean privacyCollectionAgreed;
}