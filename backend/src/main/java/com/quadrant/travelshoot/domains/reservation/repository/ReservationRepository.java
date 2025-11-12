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
import java.util.Set;

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
    @Query(value = "SELECT r.reservation_id, r.reservation_code, r.check_in_date, r.check_out_date, " +
            "s.stay_name, s.stay_type, reg.city_name, r.reservation_status, " +  // stay_type 추가!
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
            "FROM travel_courses tc " +  // FROM 변경!
            "INNER JOIN course_spots cs ON tc.course_id = cs.course_id " +
            "LEFT JOIN activities a ON cs.spot_type = '관광지' AND cs.reference_id = a.activity_id " +
            "LEFT JOIN restaurants rest ON cs.spot_type = '맛집' AND cs.reference_id = rest.restaurant_id " +
            "LEFT JOIN reservations r ON tc.reservation_id = r.reservation_id " +  // LEFT JOIN으로 변경!
            "LEFT JOIN rooms rm ON r.room_id = rm.room_id " +  // LEFT JOIN으로 변경!
            "LEFT JOIN stays s ON rm.stay_id = s.stay_id " +  // LEFT JOIN으로 변경!
            "LEFT JOIN regions reg ON s.region_id = reg.region_id " +  // LEFT JOIN으로 변경!
            "WHERE tc.user_id = :userId " +  // tc.user_id로 변경!
            "AND tc.generation_status = '생성완료' " +
            "ORDER BY r.check_in_date ASC, tc.course_id, cs.day, cs.spot_order",
            nativeQuery = true)
    List<Object[]> findReservationsWithCoursesByUserId(@Param("userId") Long userId);


    //개인 추천화 섹션

    // 완료된 예약 조회 (예약확정 + 이용완료)
    @Query("""
                    SELECT DISTINCT r FROM Reservation r
                    JOIN FETCH r.room room
                    JOIN FETCH room.stay stay
                    WHERE r.userId = :userId
                    AND r.reservationStatus IN ('예약확정', '이용완료')
                    ORDER BY r.checkOutDate DESC
            """)
    List<Reservation> findCompletedReservations(@Param("userId") Long userId);


    // 개인화 추천 AI
    @Query("SELECT r FROM Reservation r " +
            "WHERE r.userId = :userId " +
            "AND r.reservationStatus IN ('예약확정', '이용완료') " +
            "ORDER BY r.checkInDate DESC")
    List<Reservation> findRecentCompletedReservations(
            @Param("userId") Long userId,
            @Param("limit") int limit
    );

    @Query("SELECT COUNT(r) FROM Reservation r " +
            "WHERE r.userId = :userId " +
            "AND r.reservationStatus IN ('예약확정', '이용완료')")
    int countCompletedReservations(@Param("userId") Long userId);

    @Query("SELECT r FROM Reservation r " +
            "JOIN FETCH r.room rm " +
            "JOIN FETCH rm.stay " +
            "WHERE r.id = :reservationId AND r.userId = :userId")
    Optional<Reservation> findByIdAndUserIdWithStay(
            @Param("reservationId") Long reservationId,
            @Param("userId") Long userId
    );

    // 사용자의 예약 목록 조회 (최신순)
    @Query("SELECT r FROM Reservation r " +
            "JOIN FETCH r.room room " +
            "JOIN FETCH room.stay stay " +
            "WHERE r.userId = :userId " +
            "ORDER BY r.createdAt DESC")
    List<Reservation> findByUserIdWithRoomAndStay(@Param("userId") Long userId);

    // 여러 예약의 reviewId 한 번에 조회 (N+1 방지)
    @Query("SELECT rev.reservation.id, rev.reviewId, rev.createdAt " +
            "FROM Review rev " +
            "WHERE rev.reservation.id IN :reservationIds")
    List<Object[]> findReviewIdsByReservationIds(@Param("reservationIds") List<Long> reservationIds);

    Optional<Reservation> findByIdAndUserIdAndReservationStatus(Long reservationId, Long userId, ReservationStatus reservationStatus);

    // 체크아웃 완료 후 이용완료으로 db 상태 변경하기
    List<Reservation> findByCheckOutDateBeforeAndReservationStatus(
            LocalDate checkOutDate,
            ReservationStatus status
    );

    /**
     * 날짜별로 가능한 예약 개수 숙소 상세 페이지에 표시
     * - 요청한 날짜 범위 내에서 각 날짜마다 몇 개의 예약이 겹치는지 확인
     * - 가장 많이 겹치는 날의 예약 개수 반환
     */
    @Query(value =
            "WITH RECURSIVE dates AS ( " +
                    "    SELECT :checkInDate as date " +
                    "    UNION ALL " +
                    "    SELECT DATE_ADD(date, INTERVAL 1 DAY) " +
                    "    FROM dates " +
                    "    WHERE date < DATE_SUB(:checkOutDate, INTERVAL 1 DAY) " +
                    "), " +
                    "daily_counts AS ( " +
                    "    SELECT d.date, COUNT(r.reservation_id) as booking_count " +
                    "    FROM dates d " +
                    "    LEFT JOIN reservations r ON " +
                    "        r.room_id = :roomId " +
                    "        AND r.reservation_status = '예약확정' " +
                    "        AND d.date >= r.check_in_date " +
                    "        AND d.date < r.check_out_date " +
                    "    GROUP BY d.date " +
                    ") " +
                    "SELECT COALESCE(MAX(booking_count), 0) " +
                    "FROM daily_counts",
            nativeQuery = true)
    Long findMaxDailyBookingCount(
            @Param("roomId") Long roomId,
            @Param("checkInDate") String checkInDate,
            @Param("checkOutDate") String checkOutDate
    );
}