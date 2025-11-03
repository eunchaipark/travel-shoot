package com.quadrant.travelshoot.domains.reservation.service;

import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import com.quadrant.travelshoot.domains.reservation.enums.ReservationStatus;
import com.quadrant.travelshoot.domains.reservation.repository.ReservationRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
public class ReservationStatusScheduler {

    private final ReservationRepository reservationRepository;

    /**
     * 매일 오전 12시(정오)에 실행
     * 체크아웃 날짜가 지난 예약을 '이용완료'로 변경
     */

//    @Scheduled(cron = "0 */1 * * * ?")  // 테스트용 ( build하고 1분뒤에 실행되도록 ) 
    @Scheduled(cron = "0 0 12 * * ?")
    @Transactional
    public void updateCompletedReservations() {
        log.info("===== 예약 상태 자동 업데이트 시작 =====");

        LocalDate today = LocalDate.now();

        // 오늘 이전에 체크아웃이고, 아직 '예약확정' 상태인 예약들 조회
        List<Reservation> completedReservations = reservationRepository
                .findByCheckOutDateBeforeAndReservationStatus(
                        today,
                        ReservationStatus.예약확정
                );

        log.info("처리 대상 예약 수: {}건", completedReservations.size());

        // 각 예약을 '이용완료'로 변경
        completedReservations.forEach(reservation -> {
            try {
                reservation.complete();
                log.info("예약 이용완료 처리: {} (체크아웃: {})",
                        reservation.getReservationCode(),
                        reservation.getCheckOutDate());
            } catch (Exception e) {
                log.error("예약 상태 변경 실패: {}", reservation.getReservationCode(), e);
            }
        });

        log.info("예약 상태 자동 업데이트 완료: 총 {}건 처리 완료함",
                completedReservations.size());
    }
}