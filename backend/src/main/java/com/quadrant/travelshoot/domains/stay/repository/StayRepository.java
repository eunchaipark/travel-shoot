package com.quadrant.travelshoot.domains.stay.repository;

import com.quadrant.travelshoot.domains.stay.entity.Stay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface StayRepository extends JpaRepository<Stay, Long> {

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
}