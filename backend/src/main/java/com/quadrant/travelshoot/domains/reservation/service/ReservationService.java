package com.quadrant.travelshoot.domains.reservation.service;

import com.quadrant.travelshoot.domains.reservation.dto.request.*;
import com.quadrant.travelshoot.domains.reservation.dto.response.*;
import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import com.quadrant.travelshoot.domains.reservation.enums.ReservationStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.time.LocalDate;
import java.util.List;

public interface ReservationService {

    ReservationInitResponse getReservationInitData(Long roomId, LocalDate checkInDate, LocalDate checkOutDate, Integer guestCount);

    ReservationResponse createReservation(CreateReservationRequest request, Long userId, String guestEmail);

    AvailabilityResponse validateAvailability(ValidateAvailabilityRequest request);

    PriceCalculationResponse calculatePrice(CalculatePriceRequest request);

    ReservationResponse confirmReservation(Long reservationId, Long userId);

    void cancelReservation(Long reservationId, Long userId, String reason, String detail);

    ReservationResponse getReservationDetail(Long reservationId, Long userId);

    Page<ReservationResponse> getUserReservations(Long userId, Pageable pageable);

    Page<ReservationResponse> getReservationsByStatus(Long userId, ReservationStatus status, Pageable pageable);

    List<TransportOptionResponse> getTransportOptions();

    List<ReservationResponse> getUpcomingReservations(Long userId);

    List<ReservationResponse> getReviewTargetReservations(Long userId);

    Reservation getById(Long reservationId);
}