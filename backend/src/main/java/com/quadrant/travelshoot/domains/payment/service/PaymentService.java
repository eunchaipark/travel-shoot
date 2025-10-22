package com.quadrant.travelshoot.domains.payment.service;


import com.quadrant.travelshoot.domains.payment.entity.Payment;

import java.time.LocalDate;

public interface PaymentService {
    Payment save(Payment payment);
    Payment getByReservationId(Long reservationId);
    void cancelPayment(Long userId, Long reservationId, LocalDate checkInDate);
}
