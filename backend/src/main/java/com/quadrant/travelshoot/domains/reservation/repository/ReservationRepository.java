package com.quadrant.travelshoot.domains.reservation.repository;

import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import com.quadrant.travelshoot.domains.reservation.enums.ReservationStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {

    Page<Reservation> findByUserIdOrderByCreatedAtDesc(Long userId, Pageable pageable);

    Page<Reservation> findByUserIdAndReservationStatusOrderByCreatedAtDesc(
            Long userId, ReservationStatus status, Pageable pageable);

    Optional<Reservation> findByIdAndUserId(Long reservationId, Long userId);

    @Query("SELECT CASE WHEN COUNT(r) > 0 THEN true ELSE false END " +
            "FROM Reservation r " +
            "WHERE r.room.id = :roomId " +
            "AND r.reservationStatus = '예약확정' " +
            "AND ((r.checkInDate < :checkOutDate AND r.checkOutDate > :checkInDate))")
    boolean existsConflictingReservation(
            @Param("roomId") Long roomId,
            @Param("checkInDate") LocalDate checkInDate,
            @Param("checkOutDate") LocalDate checkOutDate
    );

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

    @Query("SELECT r FROM Reservation r " +
            "WHERE r.userId = :userId " +
            "AND r.reservationStatus = '이용완료' " +
            "AND r.checkOutDate < :today " +
            "ORDER BY r.checkOutDate DESC")
    List<Reservation> findReviewTargetReservations(
            @Param("userId") Long userId,
            @Param("today") LocalDate today
    );

    Optional<Reservation> findById(Long reservationId);
}