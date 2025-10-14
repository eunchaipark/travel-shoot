package com.quadrant.travelshoot.domains.reservation.service;

import com.quadrant.travelshoot.domains.reservation.dto.request.*;
import com.quadrant.travelshoot.domains.reservation.dto.response.*;
import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import com.quadrant.travelshoot.domains.reservation.enums.ReservationStatus;
import com.quadrant.travelshoot.domains.reservation.enums.TransportationMethod;
import com.quadrant.travelshoot.domains.reservation.repository.ReservationRepository;
import com.quadrant.travelshoot.domains.stay.service.RoomService;
import com.quadrant.travelshoot.domains.stay.service.StayService;
import com.quadrant.travelshoot.domains.stay.dto.response.RoomDetailResponse;
import com.quadrant.travelshoot.domains.stay.dto.response.StayDetailResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ReservationServiceImpl implements ReservationService {

    private final ReservationRepository reservationRepository;
    private final RoomService roomService;
    private final StayService stayService;

    private static final BigDecimal TAX_RATE = new BigDecimal("0.10");
    private static final BigDecimal SERVICE_FEE_RATE = new BigDecimal("0.05");

    @Override
    public ReservationInitResponse getReservationInitData(
            Long roomId, LocalDate checkInDate, LocalDate checkOutDate, Integer guestCount) {
        log.info("예약 초기 데이터 조회 - roomId: {}", roomId);

        RoomDetailResponse room = roomService.getRoomDetail(roomId);
        StayDetailResponse stay = stayService.getStayDetail(room.getStayId());
        List<TransportOptionResponse> transportOptions = getTransportOptions();

        ReservationInitResponse.PriceInfo priceInfo = ReservationInitResponse.PriceInfo.builder()
                .weekdayPrice(room.getWeekdayPrice())
                .weekendPrice(room.getWeekendPrice())
                .minStayDays(room.getMinStayDays())
                .maxStayDays(room.getMaxStayDays())
                .build();

        ReservationInitResponse.PolicyInfo policyInfo = ReservationInitResponse.PolicyInfo.builder()
                .reservationNotice(stay.getReservationNotice())
                .cancellationPolicy(stay.getCancellationPolicy())
                .build();

        List<ReservationInitResponse.AmenityInfo> amenities = stay.getAmenities().stream()
                .map(a -> ReservationInitResponse.AmenityInfo.builder()
                        .amenityId(a.getAmenityId())
                        .name(a.getName())
                        .iconUrl(a.getIconUrl())
                        .build())
                .collect(Collectors.toList());

        return ReservationInitResponse.builder()
                .stayId(stay.getStayId())
                .stayName(stay.getName())
                .address(stay.getAddress())
                .mainImageUrl(stay.getMainImageUrl())
                .latitude(stay.getLatitude())
                .longitude(stay.getLongitude())
                .roomId(room.getRoomId())
                .roomName(room.getName())
                .maxOccupancy(room.getMaxOccupancy())
                .checkInTime(stay.getCheckInTime())
                .checkOutTime(stay.getCheckOutTime())
                .priceInfo(priceInfo)
                .policyInfo(policyInfo)
                .amenities(amenities)
                .transportOptions(transportOptions)
                .build();
    }

    @Override
    @Transactional
    public ReservationResponse createReservation(
            CreateReservationRequest request, Long userId, String guestEmail) {
        log.info("예약 생성 - userId: {}, email: {}, roomId: {}", userId, guestEmail, request.getRoomId());

        // 필수 약관 동의 검증
        if (!Boolean.TRUE.equals(request.getAgeAgreed())) {
            throw new IllegalStateException("만 14세 이상만 이용 가능합니다");
        }
        if (!Boolean.TRUE.equals(request.getTermsAgreed())) {
            throw new IllegalStateException("이용 약관에 동의해주세요");
        }
        if (!Boolean.TRUE.equals(request.getRefundPolicyAgreed())) {
            throw new IllegalStateException("취소 및 환불 규칙에 동의해주세요");
        }

        // 예약 가능성 검증
        ValidateAvailabilityRequest validateRequest = ValidateAvailabilityRequest.builder()
                .roomId(request.getRoomId())
                .checkInDate(request.getCheckInDate())
                .checkOutDate(request.getCheckOutDate())
                .guestCount(request.getGuestCount())
                .build();

        AvailabilityResponse availability = validateAvailability(validateRequest);
        if (!availability.getAvailable()) {
            throw new IllegalStateException(availability.getMessage());
        }

        // 가격 재검증
        CalculatePriceRequest priceRequest = CalculatePriceRequest.builder()
                .roomId(request.getRoomId())
                .checkInDate(request.getCheckInDate())
                .checkOutDate(request.getCheckOutDate())
                .build();

        PriceCalculationResponse priceResult = calculatePrice(priceRequest);
        BigDecimal serverCalculatedPrice = priceResult.getTotalPrice();

        if (serverCalculatedPrice.compareTo(request.getTotalPrice()) != 0) {
            throw new IllegalStateException(
                    String.format("가격이 일치하지 않습니다. 예상: %s, 실제: %s",
                            request.getTotalPrice(), serverCalculatedPrice)
            );
        }

        // 예약 엔티티 생성
        Reservation reservation = Reservation.builder()
                .userId(userId)
                .roomId(request.getRoomId())
                .guestName(request.getGuestName())
                .guestPhone(request.getGuestPhone())
                .guestEmail(guestEmail)
                .checkInDate(request.getCheckInDate())
                .checkOutDate(request.getCheckOutDate())
                .guestCount(request.getGuestCount())
                .totalPrice(serverCalculatedPrice)
                .transportationMethod(request.getTransportationMethod())
                .reservationStatus(ReservationStatus.예약확정)
                .build();

        Reservation saved = reservationRepository.save(reservation);

        if (Boolean.TRUE.equals(request.getMarketingAgreed())) {
            log.info("마케팅 수신 동의 - userId: {}", userId);
        }

        return toDetailResponse(saved);
    }

    @Override
    public AvailabilityResponse validateAvailability(ValidateAvailabilityRequest request) {
        log.info("예약 가능성 검증 - roomId: {}", request.getRoomId());

        RoomDetailResponse room = roomService.getRoomDetail(request.getRoomId());

        if (!room.getIsActive()) {
            return AvailabilityResponse.builder()
                    .available(false)
                    .message("현재 예약할 수 없는 객실입니다")
                    .build();
        }

        if (!request.getCheckOutDate().isAfter(request.getCheckInDate())) {
            return AvailabilityResponse.builder()
                    .available(false)
                    .message("체크아웃 날짜는 체크인 날짜 이후여야 합니다")
                    .build();
        }

        int nights = (int) ChronoUnit.DAYS.between(request.getCheckInDate(), request.getCheckOutDate());

        if (room.getMinStayDays() != null && nights < room.getMinStayDays()) {
            return AvailabilityResponse.builder()
                    .available(false)
                    .message(String.format("최소 %d박 이상 예약해야 합니다", room.getMinStayDays()))
                    .build();
        }

        if (room.getMaxStayDays() != null && nights > room.getMaxStayDays()) {
            return AvailabilityResponse.builder()
                    .available(false)
                    .message(String.format("최대 %d박까지 예약 가능합니다", room.getMaxStayDays()))
                    .build();
        }

        if (request.getGuestCount() > room.getMaxOccupancy()) {
            return AvailabilityResponse.builder()
                    .available(false)
                    .message(String.format("최대 수용 인원은 %d명입니다", room.getMaxOccupancy()))
                    .build();
        }

        boolean hasConflict = reservationRepository.existsConflictingReservation(
                request.getRoomId(),
                request.getCheckInDate(),
                request.getCheckOutDate()
        );

        if (hasConflict) {
            return AvailabilityResponse.builder()
                    .available(false)
                    .message("해당 날짜에 이미 예약이 있습니다")
                    .build();
        }

        return AvailabilityResponse.builder()
                .available(true)
                .message("예약 가능합니다")
                .build();
    }

    @Override
    public PriceCalculationResponse calculatePrice(CalculatePriceRequest request) {
        log.info("가격 계산 - roomId: {}", request.getRoomId());

        RoomDetailResponse room = roomService.getRoomDetail(request.getRoomId());

        BigDecimal weekdayPrice = room.getWeekdayPrice();
        BigDecimal weekendPrice = room.getWeekendPrice();

        List<PriceCalculationResponse.DailyPrice> dailyPrices = new ArrayList<>();
        BigDecimal subtotal = BigDecimal.ZERO;

        LocalDate currentDate = request.getCheckInDate();
        while (currentDate.isBefore(request.getCheckOutDate())) {
            DayOfWeek dayOfWeek = currentDate.getDayOfWeek();
            boolean isWeekend = dayOfWeek == DayOfWeek.FRIDAY || dayOfWeek == DayOfWeek.SATURDAY;

            BigDecimal dayPrice = isWeekend ? weekendPrice : weekdayPrice;
            subtotal = subtotal.add(dayPrice);

            dailyPrices.add(PriceCalculationResponse.DailyPrice.builder()
                    .date(currentDate.toString())
                    .dayType(isWeekend ? "주말" : "평일")
                    .price(dayPrice)
                    .build());

            currentDate = currentDate.plusDays(1);
        }

        BigDecimal tax = subtotal.multiply(TAX_RATE).setScale(0, RoundingMode.HALF_UP);
        BigDecimal serviceFee = subtotal.multiply(SERVICE_FEE_RATE).setScale(0, RoundingMode.HALF_UP);
        BigDecimal totalPrice = subtotal.add(tax).add(serviceFee);

        int totalNights = (int) ChronoUnit.DAYS.between(request.getCheckInDate(), request.getCheckOutDate());

        return PriceCalculationResponse.builder()
                .dailyPrices(dailyPrices)
                .totalNights(totalNights)
                .subtotal(subtotal)
                .tax(tax)
                .serviceFee(serviceFee)
                .totalPrice(totalPrice)
                .build();
    }

    @Override
    @Transactional
    public ReservationResponse confirmReservation(Long reservationId, Long userId) {
        log.info("예약 확정 - reservationId: {}, userId: {}", reservationId, userId);

        Reservation reservation = reservationRepository.findByReservationIdAndUserId(reservationId, userId)
                .orElseThrow(() -> new IllegalArgumentException("예약을 찾을 수 없습니다"));

        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }

        return toDetailResponse(reservation);
    }

    @Override
    @Transactional
    public void cancelReservation(Long reservationId, Long userId, String reason, String detail) {
        log.info("예약 취소 - reservationId: {}, userId: {}", reservationId, userId);

        Reservation reservation = reservationRepository.findByReservationIdAndUserId(reservationId, userId)
                .orElseThrow(() -> new IllegalArgumentException("예약을 찾을 수 없습니다"));

        if (!reservation.canCancel()) {
            throw new IllegalStateException("취소할 수 없는 예약입니다");
        }

        reservation.cancel(reason, detail);
        reservationRepository.save(reservation);
    }

    @Override
    public ReservationResponse getReservationDetail(Long reservationId, Long userId) {
        log.info("예약 상세 조회 - reservationId: {}, userId: {}", reservationId, userId);

        Reservation reservation = reservationRepository.findByReservationIdAndUserId(reservationId, userId)
                .orElseThrow(() -> new IllegalArgumentException("예약을 찾을 수 없습니다"));

        return toDetailResponse(reservation);
    }

    @Override
    public Page<ReservationResponse> getUserReservations(Long userId, Pageable pageable) {
        log.info("사용자 예약 목록 조회 - userId: {}", userId);

        Page<Reservation> reservations = reservationRepository.findByUserIdOrderByCreatedAtDesc(userId, pageable);
        return reservations.map(this::toDetailResponse);
    }

    @Override
    public Page<ReservationResponse> getReservationsByStatus(Long userId, ReservationStatus status, Pageable pageable) {
        log.info("예약 상태별 조회 - userId: {}, status: {}", userId, status);

        Page<Reservation> reservations = reservationRepository
                .findByUserIdAndReservationStatusOrderByCreatedAtDesc(userId, status, pageable);
        return reservations.map(this::toDetailResponse);
    }

    @Override
    public List<TransportOptionResponse> getTransportOptions() {
        return Arrays.stream(TransportationMethod.values())
                .map(method -> TransportOptionResponse.builder()
                        .value(method.name())
                        .label(method.getDisplayName())
                        .description(method.getDescription())
                        .build())
                .collect(Collectors.toList());
    }

    @Override
    public List<ReservationResponse> getUpcomingReservations(Long userId) {
        LocalDate today = LocalDate.now();
        LocalDate sevenDaysLater = today.plusDays(7);

        List<Reservation> reservations = reservationRepository.findUpcomingReservations(userId, today, sevenDaysLater);
        return reservations.stream()
                .map(this::toDetailResponse)
                .collect(Collectors.toList());
    }

    @Override
    public List<ReservationResponse> getReviewTargetReservations(Long userId) {
        LocalDate today = LocalDate.now();

        List<Reservation> reservations = reservationRepository.findReviewTargetReservations(userId, today);
        return reservations.stream()
                .map(this::toDetailResponse)
                .collect(Collectors.toList());
    }

    private ReservationResponse toDetailResponse(Reservation reservation) {
        RoomDetailResponse room = roomService.getRoomDetail(reservation.getRoomId());
        StayDetailResponse stay = stayService.getStayDetail(room.getStayId());

        return ReservationResponse.builder()
                .reservationId(reservation.getReservationId())
                .reservationCode(reservation.getReservationCode())
                .userId(reservation.getUserId())
                .roomId(reservation.getRoomId())
                .roomName(room.getName())
                .stayId(stay.getStayId())
                .stayName(stay.getName())
                .address(stay.getAddress())
                .guestName(reservation.getGuestName())
                .guestPhone(reservation.getGuestPhone())
                .guestEmail(reservation.getGuestEmail())
                .checkInDate(reservation.getCheckInDate())
                .checkOutDate(reservation.getCheckOutDate())
                .guestCount(reservation.getGuestCount())
                .totalNights(reservation.getTotalNights())
                .totalPrice(reservation.getTotalPrice())
                .reservationStatus(reservation.getReservationStatus())
                .transportationMethod(reservation.getTransportationMethod())
                .cancelReason(reservation.getCancelReason())
                .cancelDetail(reservation.getCancelDetail())
                .cancelledAt(reservation.getCancelledAt())
                .createdAt(reservation.getCreatedAt())
                .canCancel(reservation.canCancel())
                .build();
    }
}