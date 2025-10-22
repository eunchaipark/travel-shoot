package com.quadrant.travelshoot.domains.payment.service.impl;

import com.quadrant.travelshoot.domains.payment.entity.Payment;
import com.quadrant.travelshoot.domains.payment.enums.PaymentStatus;
import com.quadrant.travelshoot.domains.payment.repository.PaymentRepository;
import com.quadrant.travelshoot.domains.payment.service.PaymentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class PaymentServiceImpl implements PaymentService {
    private final PaymentRepository paymentRepository;

    @Override
    @Transactional
    public Payment save(Payment payment) {
        return paymentRepository.save(payment);
    }

    @Override
    @Transactional
    public Payment getByReservationId(Long reservationId){
        return paymentRepository.findByReservationId(reservationId)
                .orElseThrow(() -> new IllegalArgumentException("조회할 수 없는 결제 정보입니다."));
    }

    @Override
    @Transactional
    public void cancelPayment(Long userId, Long reservationId, LocalDate checkInDate){
        //TODO: 실제 결제 파트 구현 완료 시 환불해주는 API도 연동해줘야 함.
        Payment payment = getByReservationId(reservationId);
        payment.setRefundAmount(calculateRefundAmount(checkInDate, payment.getPaymentAmount()));
        payment.setPaymentStatus(PaymentStatus.환불완료);
        payment.setRefundedAt(LocalDateTime.now());
        paymentRepository.save(payment);
        log.info("결제 취소 완료: {}", payment.getPaymentId());;
    }

    /**
     * 체크인 날짜 기준으로 환불 금액 계산
     * @param checkInDate 체크인 날짜
     * @param paymentAmount 원래 결제 금액
     * @return 환불 금액
     */
    private BigDecimal calculateRefundAmount(LocalDate checkInDate, BigDecimal paymentAmount) {
        LocalDate today = LocalDate.now();
        long daysUntilCheckIn = ChronoUnit.DAYS.between(today, checkInDate);

        BigDecimal refundRate;

        if (daysUntilCheckIn >= 3) {
            // 체크인 3일 전까지: 100% 환불
            refundRate = BigDecimal.ONE;
        } else if (daysUntilCheckIn >= 1) {
            // 체크인 1-2일 전: 50% 환불
            refundRate = new BigDecimal("0.5");
        } else {
            // 체크인 당일 이후: 환불 불가
            refundRate = BigDecimal.ZERO;
        }

        return paymentAmount.multiply(refundRate).setScale(0, RoundingMode.DOWN);
    }
}
