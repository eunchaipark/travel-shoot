package com.quadrant.travelshoot.domains.reservation.repository;

import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.math.BigDecimal;
import java.util.List;

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

    // 사용자의 지역별 예약 빈도
    @Query("SELECT r.areaName, COUNT(*) " +
           "FROM Reservation res " +
           "JOIN Room room ON res.roomId = room.roomId " +
           "JOIN Stay s ON room.stayId = s.id " +
           "JOIN s.region r " +
           "WHERE res.userId = :userId " +
           "GROUP BY r.areaName " +
           "ORDER BY COUNT(*) DESC")
    List<Object[]> findRegionFrequencyByUserId(@Param("userId") Long userId);

    // 사용자의 타입별 예약 빈도
    @Query("SELECT s.stayType, COUNT(*) " +
           "FROM Reservation res " +
           "JOIN Room room ON res.roomId = room.roomId " +
           "JOIN Stay s ON room.stayId = s.id " +
           "WHERE res.userId = :userId " +
           "GROUP BY s.stayType " +
           "ORDER BY COUNT(*) DESC")
    List<Object[]> findStayTypeFrequencyByUserId(@Param("userId") Long userId);
}