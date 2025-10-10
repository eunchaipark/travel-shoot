package com.quadrant.travelshoot.domains.stay.repository;

import com.quadrant.travelshoot.domains.stay.entity.Stay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface StayRepository extends JpaRepository<Stay, Long> {

        // --------- 개인 추천 섹션------------

        // 기존 메서드
        @Query("SELECT s FROM Stay s " +
                        "JOIN s.region r " +
                        "WHERE r.areaName IN :regionNames " +
                        "AND s.stayType IN :stayTypes " +
                        "AND s.isActive = true " +
                        "ORDER BY s.averageRating DESC")
        List<Stay> findByRegionsAndTypes(
                        @Param("regionNames") List<String> regionNames,
                        @Param("stayTypes") List<Stay.StayType> stayTypes);

        // 평점 필터 포함
        @Query("SELECT s FROM Stay s " +
                        "JOIN s.region r " +
                        "WHERE r.areaName IN :regionNames " +
                        "AND s.stayType IN :stayTypes " +
                        "AND s.averageRating >= :minRating " +
                        "AND s.isActive = true " +
                        "ORDER BY s.averageRating DESC")
        List<Stay> findWithFilters(
                        @Param("regionNames") List<String> regionNames,
                        @Param("stayTypes") List<Stay.StayType> stayTypes,
                        @Param("minRating") BigDecimal minRating);

        // Stay의 최저 평일 가격 조회
        @Query("SELECT MIN(r.weekdayPrice) FROM Room r WHERE r.stayId = :stayId AND r.isAvailable = true")
        BigDecimal findMinWeekdayPrice(@Param("stayId") Long stayId);

        // 평점 높은 순으로 N개 조회
        @Query("SELECT s FROM Stay s WHERE s.isActive = true ORDER BY s.averageRating DESC LIMIT :limit")
        List<Stay> findTopByOrderByAverageRatingDesc(@Param("limit") int limit);

        // --------가격 착한 숙소 섹션------------

        // 지역별 평균 가격 조회
        @Query("SELECT r.areaName, AVG(rm.weekdayPrice) " +
                        "FROM Stay s " +
                        "JOIN s.region r " +
                        "JOIN Room rm ON rm.stayId = s.id " +
                        "WHERE s.isActive = true " +
                        "GROUP BY r.areaName")
        List<Object[]> findAveragePriceByRegion();

        // 평점 이상, 활성화된 숙소 조회
        List<Stay> findByAverageRatingGreaterThanEqualAndIsActiveTrue(BigDecimal minRating);

        // -----------인기있는 관광지 맛집 숙소 추천 섹션------------------------
        // 활성화된 숙소 조회
        List<Stay> findByIsActiveTrue();

        // 기간별 예약수
        @Query("SELECT COUNT(r) FROM Reservation r " +
                        "JOIN Room rm ON r.roomId = rm.id " +
                        "WHERE rm.stayId = :stayId " +
                        "AND r.createdAt BETWEEN :startDate AND :endDate")
        Long countReservationsByStayIdAndPeriod(
                        @Param("stayId") Long stayId,
                        @Param("startDate") LocalDateTime startDate,
                        @Param("endDate") LocalDateTime endDate);

}