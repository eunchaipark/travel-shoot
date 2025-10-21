package com.quadrant.travelshoot.domains.payment.service.impl;

import com.quadrant.travelshoot.domains.payment.entity.Payment;
import com.quadrant.travelshoot.domains.payment.repository.PaymentRepository;
import com.quadrant.travelshoot.domains.payment.service.PaymentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
