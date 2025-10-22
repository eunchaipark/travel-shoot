package com.quadrant.travelshoot.domains.reservation.controller;

import com.quadrant.travelshoot.domains.reservation.dto.request.*;
import com.quadrant.travelshoot.domains.reservation.dto.response.*;
import com.quadrant.travelshoot.domains.reservation.enums.ReservationStatus;
import com.quadrant.travelshoot.domains.reservation.service.ReservationService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api/reservations")
@RequiredArgsConstructor
public class ReservationController {

    private final ReservationService reservationService;

    @GetMapping("/init/{roomId}")
    public ResponseEntity<ReservationInitResponse> getReservationInitData(
            @PathVariable Long roomId,
            @RequestParam LocalDate checkInDate,
            @RequestParam LocalDate checkOutDate,
            @RequestParam Integer guestCount
    ) {
        log.info("예약 초기 데이터 조회 - roomId: {}", roomId);
        ReservationInitResponse response = reservationService.getReservationInitData(
                roomId, checkInDate, checkOutDate, guestCount
        );
        return ResponseEntity.ok(response);
    }

    @PostMapping("/create")
    public ResponseEntity<ReservationResponse> createReservation(
            @Valid @RequestBody CreateReservationRequest request,
            Authentication authentication,
            HttpSession session
    ) {
        Long userId = Long.valueOf(authentication.getName());
        String guestEmail = (String) session.getAttribute("userEmail"); // 세션에 있는 로그인한 사용자의 이메일 데이터

        log.info("예약 생성 - userId: {}, email: {}, roomId: {}", userId, guestEmail, request.getRoomId());

        ReservationResponse response = reservationService.createReservation(
                request, userId, guestEmail // 이메일 전달하기
        );
        return ResponseEntity.ok(response);
    }

    @PostMapping("/validate-availability")
    public ResponseEntity<AvailabilityResponse> validateAvailability(
            @Valid @RequestBody ValidateAvailabilityRequest request
    ) {
        log.info("예약 가능성 검증 - roomId: {}", request.getRoomId());
        AvailabilityResponse response = reservationService.validateAvailability(request);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/calculate-price")
    public ResponseEntity<PriceCalculationResponse> calculatePrice(
            @Valid @RequestBody CalculatePriceRequest request
    ) {
        log.info("가격 계산 - roomId: {}", request.getRoomId());
        PriceCalculationResponse response = reservationService.calculatePrice(request);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/confirm/{reservationId}")
    public ResponseEntity<ReservationResponse> confirmReservation(
            @PathVariable Long reservationId,
            Authentication authentication
    ) {
        Long userId = Long.valueOf(authentication.getName());
        log.info("예약 확정 - reservationId: {}, userId: {}", reservationId, userId);

        ReservationResponse response = reservationService.confirmReservation(reservationId, userId);
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/{reservationId}")
    public ResponseEntity<Map<String, String>> cancelReservation(
            @PathVariable Long reservationId,
            @RequestParam(required = false) String reason,
            @RequestParam(required = false) String detail,
            Authentication authentication
    ) {
        Long userId = Long.valueOf(authentication.getName());
        log.info("예약 취소 - reservationId: {}, userId: {}", reservationId, userId);

        reservationService.cancelReservation(reservationId, userId, reason, detail);

        Map<String, String> response = new HashMap<>();
        response.put("message", "예약이 취소되었습니다");
        return ResponseEntity.ok(response);
    }

    @GetMapping("/{reservationId}")
    public ResponseEntity<ReservationResponse> getReservationDetail(
            @PathVariable Long reservationId,
            Authentication authentication
    ) {
        Long userId = Long.valueOf(authentication.getName());
        log.info("예약 상세 조회 - reservationId: {}, userId: {}", reservationId, userId);

        ReservationResponse response = reservationService.getReservationDetail(reservationId, userId);
        return ResponseEntity.ok(response);
    }

    //TODO : 마이페이지 활용 가능
    @GetMapping("/my")
    public ResponseEntity<Page<ReservationResponse>> getUserReservations(
            Authentication authentication,
            @PageableDefault(size = 10) Pageable pageable
    ) {
        Long userId = Long.valueOf(authentication.getName());
        log.info("사용자 예약 목록 조회 - userId: {}", userId);

        Page<ReservationResponse> response = reservationService.getUserReservations(userId, pageable);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/my/status/{status}")
    public ResponseEntity<Page<ReservationResponse>> getReservationsByStatus(
            @PathVariable ReservationStatus status,
            Authentication authentication,
            @PageableDefault(size = 10) Pageable pageable
    ) {
        Long userId = Long.valueOf(authentication.getName());
        log.info("예약 상태별 조회 - userId: {}, status: {}", userId, status);

        Page<ReservationResponse> response = reservationService.getReservationsByStatus(userId, status, pageable);
        return ResponseEntity.ok(response);
    }

    //TODO : open ai 으로 gpt한테 프롬프트 넣을때 방문 수단이 대중교통인지 자차인지에 따라서 추천 여행 코스 다르게 줄 수 있을거 같아서...
    @GetMapping("/transport-options")
    public ResponseEntity<List<TransportOptionResponse>> getTransportOptions() {
        log.info("방문 수단 옵션 조회");
        List<TransportOptionResponse> response = reservationService.getTransportOptions();
        return ResponseEntity.ok(response);
    }

    //TODO : 만약에 추후에 추천 여행 코스를 이메일으로 보낸다거나 그럴때 사용가능할거같은데 아니면 알림기능 꼭 넣어야한다거나...
    @GetMapping("/upcoming")
    public ResponseEntity<List<ReservationResponse>> getUpcomingReservations(
            Authentication authentication
    ) {
        Long userId = Long.valueOf(authentication.getName());
        log.info("다가오는 예약 조회 - userId: {}", userId);

        List<ReservationResponse> response = reservationService.getUpcomingReservations(userId);
        return ResponseEntity.ok(response);
    }
    //TODO : 리뷰 작성 가능 활용 가능
    @GetMapping("/review-targets")
    public ResponseEntity<List<ReservationResponse>> getReviewTargetReservations(
            Authentication authentication
    ) {
        Long userId = Long.valueOf(authentication.getName());
        log.info("리뷰 작성 대상 예약 조회 - userId: {}", userId);

        List<ReservationResponse> response = reservationService.getReviewTargetReservations(userId);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/detail/{reservationId}")
    public ResponseEntity<ReservationWithPaymentResponse> getReservationDetailWithPayment(
            @PathVariable Long reservationId
            , Authentication authentication
    ) {
        Long userId = Long.valueOf(authentication.getName());
        log.info("예약 및 결제 상세 조회 - reservationId: {}, userId: {}", reservationId, userId);

        ReservationWithPaymentResponse response = reservationService.getReservationDetailWithPayment(reservationId, userId);
        return ResponseEntity.ok(response);
    }
}