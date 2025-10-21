package com.quadrant.travelshoot.domains.payment.service;


import com.quadrant.travelshoot.domains.payment.entity.Payment;

public interface PaymentService {
    Payment save(Payment payment);
    Payment getByReservationId(Long reservationId);
}
