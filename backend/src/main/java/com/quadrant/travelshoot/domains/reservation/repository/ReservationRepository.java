package com.quadrant.travelshoot.domains.reservation.repository;

import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.quadrant.travelshoot.domains.reservation.enums.ReservationStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {

    // 사용자별 예약 목록 조회
    Page<Reservation> findByUserIdOrderByCreatedAtDesc(Long userId, Pageable pageable);

    // 예약 상태별 조회
    Page<Reservation> findByUserIdAndReservationStatusOrderByCreatedAtDesc(
            Long userId, ReservationStatus status, Pageable pageable);

    // 특정 예약 조회 (사용자 검증 포함)
    Optional<Reservation> findByReservationIdAndUserId(Long reservationId, Long userId);

    // 예약 가능 여부 - 날짜 겹침 확인 (
    @Query("SELECT CASE WHEN COUNT(r) > 0 THEN true ELSE false END " +
            "FROM Reservation r " +
            "WHERE r.roomId = :roomId " +
            "AND r.reservationStatus = '예약확정' " +
            "AND ((r.checkInDate < :checkOutDate AND r.checkOutDate > :checkInDate))")
    boolean existsConflictingReservation(
            @Param("roomId") Long roomId,
            @Param("checkInDate") LocalDate checkInDate,
            @Param("checkOutDate") LocalDate checkOutDate
    );

    // 다가오는 예약 조회 (7일 이내)
    @Query("SELECT r FROM Reservation r " +
            "WHERE r.userId = :userId " +
            "AND r.reservationStatus = '예약확정' " +
            "AND r.checkInDate BETWEEN :startDate AND :endDate " +
            "ORDER BY r.checkInDate ASC")
    List<Reservation> findUpcomingReservations(
            @Param("userId") Long userId,
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
    );

    // 리뷰 작성 가능한 예약 조회
    @Query("SELECT r FROM Reservation r " +
            "WHERE r.userId = :userId " +
            "AND r.reservationStatus = '이용완료' " +
            "AND r.checkOutDate < :today " +
            "ORDER BY r.checkOutDate DESC")
    List<Reservation> findReviewTargetReservations(
            @Param("userId") Long userId,
            @Param("today") LocalDate today
    );
}
