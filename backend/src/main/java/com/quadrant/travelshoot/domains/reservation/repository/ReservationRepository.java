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



        //개인별 캘린더 일정 조회를 위한 쿼리
    @Query(value = "SELECT r.reservation_code, r.check_in_date, r.check_out_date, " +
               "s.stay_name, reg.city_name, r.reservation_status, " +
               "tc.course_id, cs.day, cs.spot_order, cs.spot_type, cs.start_time, cs.end_time, " +
               "CASE " +
               "  WHEN cs.spot_type = '관광지' THEN a.activity_name " +
               "  WHEN cs.spot_type = '맛집' THEN rest.restaurant_name " +
               "  ELSE NULL " +
               "END AS spot_name, " +
               "CASE " +
               "  WHEN cs.spot_type = '관광지' THEN a.address " +
               "  WHEN cs.spot_type = '맛집' THEN rest.address " +
               "  ELSE NULL " +
               "END AS spot_address " +
               "FROM reservations r " +
               "INNER JOIN travel_courses tc ON r.reservation_id = tc.reservation_id " +
               "INNER JOIN course_spots cs ON tc.course_id = cs.course_id " +
               "LEFT JOIN activities a ON cs.spot_type = '관광지' AND cs.reference_id = a.activity_id " +
               "LEFT JOIN restaurants rest ON cs.spot_type = '맛집' AND cs.reference_id = rest.restaurant_id " +
               "INNER JOIN rooms rm ON r.room_id = rm.room_id " +
               "INNER JOIN stays s ON rm.stay_id = s.stay_id " +
               "INNER JOIN regions reg ON s.region_id = reg.region_id " +
               "WHERE r.user_id = :userId " +
               "AND tc.generation_status = '생성완료' " +
               "ORDER BY r.check_in_date ASC, tc.course_id, cs.day, cs.spot_order",
       nativeQuery = true)
        List<Object[]> findReservationsWithCoursesByUserId(@Param("userId") Long userId);
}