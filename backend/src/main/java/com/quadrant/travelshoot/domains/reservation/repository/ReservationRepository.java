package com.quadrant.travelshoot.domains.reservation.repository;

import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {

    // 사용자별 예약 건수
    long countByUserId(Long userId);

    // 특정 사용자의 평균 1박 가격
    @Query("SELECT AVG(r.totalPrice / r.totalNights) FROM Reservation r WHERE r.userId = :userId")
    BigDecimal findAvgPricePerNightByUserId(@Param("userId") Long userId);

    // 전체 사용자의 평균 1박 가격 (신규 사용자용)
    @Query("SELECT AVG(r.totalPrice / r.totalNights) FROM Reservation r")
    BigDecimal findOverallAvgPricePerNight();
}