package com.quadrant.travelshoot.domains.stay.repository;

import com.quadrant.travelshoot.domains.stay.entity.Stay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

/**
 * 가격착한 숙소 Repository
 */
@Repository
public interface BudgetFriendlyRepository extends JpaRepository<Stay, Long> {

    /**
     * 가격착한 숙소 후보 조회
     * - 평점 3.5 이상
     * - 리뷰 20개 이상
     * - 활성화된 숙소
     * - 예약 가능한 객실 존재
     * - city_name이 NULL이 아닌 것만
     */
    @Query(value = "SELECT DISTINCT s.* " +
            "FROM stays s " +
            "INNER JOIN rooms r ON s.stay_id = r.stay_id " +
            "INNER JOIN regions reg ON s.region_id = reg.region_id " +
            "WHERE s.is_active = true " +
            "AND s.average_rating >= 3.5 " +
            "AND s.review_count >= 20 " +
            "AND r.is_available = true " +
            "AND r.is_active = true " +
            "AND reg.city_name IS NOT NULL " +
            "GROUP BY s.stay_id", nativeQuery = true)
    List<Stay> findBudgetFriendlyCandidates();

    /**
     * 특정 숙소의 평일/주말 최저가 조회
     */
    @Query(value = "SELECT MIN(r.weekday_price) as min_weekday, " +
            "       MIN(r.weekend_price) as min_weekend " +
            "FROM rooms r " +
            "WHERE r.stay_id = :stayId " +
            "AND r.is_available = true " +
            "AND r.is_active = true", nativeQuery = true)
    List<Object[]> findMinPricesByStayId(@Param("stayId") Long stayId);

    /**
     * 특정 시(city)의 평균 숙소 가격 조회
     */
    @Query(value = "SELECT AVG((r.weekday_price + r.weekend_price) / 2) " +
            "FROM rooms r " +
            "INNER JOIN stays s ON r.stay_id = s.stay_id " +
            "INNER JOIN regions reg ON s.region_id = reg.region_id " +
            "WHERE reg.city_name = :cityName " +
            "AND r.is_available = true " +
            "AND r.is_active = true " +
            "AND s.is_active = true", nativeQuery = true)
    BigDecimal findAveragePriceByCityName(@Param("cityName") String cityName);
}