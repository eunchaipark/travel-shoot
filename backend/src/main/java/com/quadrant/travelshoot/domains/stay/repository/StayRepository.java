package com.quadrant.travelshoot.domains.stay.repository;

import com.quadrant.travelshoot.domains.stay.dto.response.StayTrendingResponse;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface StayRepository extends JpaRepository<Stay, Long> {

        // 자동완성 ( 검색창 - 지역명 )
        @Query(value = "SELECT DISTINCT result " +
                        "FROM ( " +
                        "    SELECT area_name as result, 1 as priority " +
                        "    FROM regions " +
                        "    WHERE area_name LIKE CONCAT('%', :keyword, '%') " +
                        "    UNION " +
                        "    SELECT CONCAT(area_name, ' ', city_name) as result, 2 as priority " +
                        "    FROM regions " +
                        "    WHERE (area_name LIKE CONCAT('%', :keyword, '%') " +
                        "       OR city_name LIKE CONCAT('%', :keyword, '%')) " +
                        "       AND city_name IS NOT NULL " +
                        "    ORDER BY priority, result " +
                        ") subquery " +
                        "LIMIT 10", nativeQuery = true)
        List<String> findRegionsByKeyword(@Param("keyword") String keyword);

        // 자동완성 ( 검색창 - 숙소명 )
        @Query(value =
                "SELECT stay_name " +
                        "FROM ( " +
                        "    SELECT DISTINCT s.stay_name, s.average_rating " +
                        "    FROM stays s " +
                        "    WHERE s.stay_name LIKE CONCAT('%', :keyword, '%') " +
                        "    AND s.is_active = 1 " +
                        ") AS subquery " +
                        "ORDER BY average_rating DESC, stay_name ASC " +
                        "LIMIT 10",
                nativeQuery = true)
        List<String> findStayNamesByKeyword(@Param("keyword") String keyword);

        // 기본 검색창 검색 ( 지역, 날짜, 인원수 )
        @Query(value = "SELECT DISTINCT s.* FROM stays s " +
                        "INNER JOIN rooms r ON s.stay_id = r.stay_id " +
                        "INNER JOIN regions reg ON s.region_id = reg.region_id " +
                        "WHERE (" +
                        "   reg.area_name LIKE CONCAT('%', :region, '%') " +
                        "   OR reg.city_name LIKE CONCAT('%', :region, '%') " +
                        "   OR CONCAT(reg.area_name, ' ', reg.city_name) LIKE CONCAT('%', :region, '%')" +
                        ") " +
                        "AND r.maximum_capacity >= :guests " +
                        "AND s.is_active = true " +
                        "AND r.is_available = true " +
                        "AND r.room_count > ( " +
                        "    SELECT COUNT(*) FROM reservations res " +
                        "    WHERE res.room_id = r.room_id " +
                        "    AND res.reservation_status = '예약확정' " +
                        "    AND (res.check_in_date <= :checkOut AND res.check_out_date >= :checkIn) " +
                        ") " +
                        "GROUP BY s.stay_id " +
                        "ORDER BY s.created_at DESC, s.stay_id ASC", countQuery = "SELECT COUNT(DISTINCT s.stay_id) FROM stays s " +
                                        "INNER JOIN rooms r ON s.stay_id = r.stay_id " +
                                        "INNER JOIN regions reg ON s.region_id = reg.region_id " +
                                        "WHERE (" +
                                        "   reg.area_name LIKE CONCAT('%', :region, '%') " +
                                        "   OR reg.city_name LIKE CONCAT('%', :region, '%') " +
                                        "   OR CONCAT(reg.area_name, ' ', reg.city_name) LIKE CONCAT('%', :region, '%')" +
                                        ") " +
                                        "AND r.maximum_capacity >= :guests " +
                                        "AND s.is_active = true " +
                                        "AND r.is_available = true", nativeQuery = true)
        Page<Stay> searchStays(
                        @Param("region") String region,
                        @Param("checkIn") LocalDate checkIn,
                        @Param("checkOut") LocalDate checkOut,
                        @Param("guests") Integer guests,
                        Pageable pageable);

        @Query(value = "SELECT DISTINCT s.* FROM stays s " +
                "INNER JOIN rooms r ON s.stay_id = r.stay_id " +
                "WHERE s.stay_name LIKE CONCAT('%', :stayName, '%') " +
                "AND s.is_active = true " +
                "AND r.is_available = true " +
                "AND r.room_count > ( " +
                "    SELECT COUNT(*) FROM reservations res " +
                "    WHERE res.room_id = r.room_id " +
                "    AND res.reservation_status = '예약확정' " +
                "    AND (res.check_in_date <= :checkOut AND res.check_out_date >= :checkIn) " +
                ") " +
                "GROUP BY s.stay_id " +
                "ORDER BY s.created_at DESC, s.stay_id ASC",
                countQuery =
                        "SELECT COUNT(DISTINCT s.stay_id) FROM stays s " +
                                "INNER JOIN rooms r ON s.stay_id = r.stay_id " +
                                "WHERE s.stay_name LIKE CONCAT('%', :stayName, '%') " +
                                "AND s.is_active = true " +
                                "AND r.is_available = true",
                nativeQuery = true)
        Page<Stay> searchStaysByName(
                @Param("stayName") String stayName,
                @Param("checkIn") LocalDate checkIn,
                @Param("checkOut") LocalDate checkOut,
                Pageable pageable);


        // 숙소 검색 리스트 페이지 사이드 필터
        @Query(value = "SELECT DISTINCT s.* FROM stays s " +
                        "INNER JOIN rooms r ON s.stay_id = r.stay_id " +
                        "INNER JOIN regions reg ON s.region_id = reg.region_id " +
                        "WHERE (:region IS NULL OR reg.area_name LIKE CONCAT('%', :region, '%') " +
                        "   OR reg.city_name LIKE CONCAT('%', :region, '%') " +
                        "   OR CONCAT(reg.area_name, ' ', reg.city_name) LIKE CONCAT('%', :region, '%'))" +
                        "AND (:minPrice IS NULL OR r.weekday_price >= :minPrice) " +
                        "AND (:maxPrice IS NULL OR r.weekday_price <= :maxPrice) " +
                        "AND (:stayTypesSize = 0 OR s.stay_type IN :stayTypes) " +
                        "AND (:actualGuests IS NULL OR r.maximum_capacity >= :actualGuests) " +
                        "AND (:filterMinGuests IS NULL OR r.standard_capacity >= :filterMinGuests) " +
                        "AND (:filterMaxGuests IS NULL OR r.maximum_capacity <= :filterMaxGuests) " +
                        "AND (:bedroomCount IS NULL OR r.bedroom_count >= :bedroomCount) " +
                        "AND (:bathroomCount IS NULL OR r.bathroom_count >= :bathroomCount) " +
                        "AND (:ratingsSize = 0 OR FLOOR(s.average_rating) IN :ratings) " +
                        "AND (:amenityCount = 0 OR s.stay_id IN ( " +
                        "    SELECT sa.stay_id " +
                        "    FROM stays_amenities sa " +
                        "    INNER JOIN amenities a ON sa.amenity_id = a.amenity_id " +
                        "    WHERE a.amenity_name IN :amenities " +
                        "    GROUP BY sa.stay_id " +
                        "    HAVING COUNT(DISTINCT a.amenity_name) = :amenityCount " +
                        ")) " +
                        "AND s.is_active = true " +
                        "AND r.is_available = true " +
                        "GROUP BY s.stay_id " +
                        "ORDER BY s.created_at DESC, s.stay_id ASC", countQuery = "SELECT COUNT(DISTINCT s.stay_id) FROM stays s " +
                                        "INNER JOIN rooms r ON s.stay_id = r.stay_id " +
                                        "INNER JOIN regions reg ON s.region_id = reg.region_id " +
                                        "WHERE (:region IS NULL OR reg.area_name LIKE CONCAT('%', :region, '%')) " +
                                        "AND s.is_active = true " +
                                        "AND r.is_available = true", nativeQuery = true)

        Page<Stay> searchWithAdvancedFilters(
                        @Param("region") String region,
                        @Param("minPrice") BigDecimal minPrice,
                        @Param("maxPrice") BigDecimal maxPrice,
                        @Param("stayTypes") List<String> stayTypes,
                        @Param("stayTypesSize") int stayTypesSize,
                        @Param("actualGuests") Integer actualGuests,
                        @Param("filterMinGuests") Integer filterMinGuests,
                        @Param("filterMaxGuests") Integer filterMaxGuests,
                        @Param("bedroomCount") Integer bedroomCount,
                        @Param("bathroomCount") Integer bathroomCount,
                        @Param("ratings") List<Integer> ratings,
                        @Param("ratingsSize") int ratingsSize,
                        @Param("amenities") List<String> amenities,
                        @Param("amenityCount") Integer amenityCount,
                        Pageable pageable);


        // travelNow 섹션에서 사용
        // stays 테이블의 address에서 제주, 강원 숙소 수 조회
        @Query(value = "SELECT " +
                        "  CASE " +
                        "    WHEN address LIKE '%제주%' THEN '제주' " +
                        "    WHEN address LIKE '%강원%' THEN '강원' " +
                        "  END as region, " +
                        "  COUNT(*) as count " +
                        "FROM stays " +
                        "WHERE address LIKE '%제주%' OR address LIKE '%강원%' " +
                        "GROUP BY region", 
                nativeQuery = true)
        List<Object[]> findAccommodationCountByRegion();


        // 인기숙소 섹션에서 사용
        @SuppressWarnings({"SqlDialectInspection", "SqlNoDataSourceInspection", "SqlResolve"})
        @Query(value = """
                SELECT 
                s.stay_id as stayId,
                s.stay_name as stayName,
                s.address as address,
                s.average_rating as averageRating,
                
                (SELECT f.s3_url 
                FROM files f 
                WHERE f.reference_type = 'STAYS' 
                AND f.reference_id = s.stay_id 
                ORDER BY sort_order LIMIT 1) as thumbnailImage,
                
                -- 최저가
                (SELECT MIN(rm.weekday_price) 
                FROM rooms rm
                WHERE rm.stay_id = s.stay_id 
                AND rm.is_active = true) as price,
                
                s.latitude as latitude,
                s.longitude as longitude,
                TIME_FORMAT(s.check_in_time, '%H:%i') as checkInTime,
                TIME_FORMAT(s.check_out_time, '%H:%i') as checkOutTime,
                s.stay_type as stayType,
                
                s.review_count as reviewCount,

                COUNT(DISTINCT CASE 
                        WHEN res.created_at >= DATE_SUB(NOW(), INTERVAL 7 DAY) 
                        THEN res.reservation_id 
                END) as recent7DaysReservations,
                
                COUNT(DISTINCT CASE 
                        WHEN vh.viewed_at >= DATE_SUB(NOW(), INTERVAL 7 DAY) 
                        THEN vh.id 
                END) as recent7DaysViews,
                
                ROUND(
                        COUNT(DISTINCT CASE 
                        WHEN res.created_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
                        AND res.created_at < DATE_SUB(NOW(), INTERVAL 7 DAY)
                        THEN res.reservation_id 
                        END) / 3.0, 2
                ) as previous3WeeksAvgReservations,
                
                ROUND(
                        COUNT(DISTINCT CASE 
                        WHEN vh.viewed_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
                        AND vh.viewed_at < DATE_SUB(NOW(), INTERVAL 7 DAY)
                        THEN vh.id 
                        END) / 3.0, 2
                ) as previous3WeeksAvgViews,
                
                CASE 
                        WHEN COUNT(DISTINCT CASE 
                        WHEN res.created_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
                        AND res.created_at < DATE_SUB(NOW(), INTERVAL 7 DAY)
                        THEN res.reservation_id 
                        END) = 0 THEN 
                        CASE 
                                WHEN COUNT(DISTINCT CASE 
                                WHEN res.created_at >= DATE_SUB(NOW(), INTERVAL 7 DAY) 
                                THEN res.reservation_id 
                                END) > 0 THEN 100.0
                                ELSE 0.0
                        END
                        ELSE 
                        ROUND(
                                (COUNT(DISTINCT CASE 
                                WHEN res.created_at >= DATE_SUB(NOW(), INTERVAL 7 DAY) 
                                THEN res.reservation_id 
                                END) - 
                                COUNT(DISTINCT CASE 
                                WHEN res.created_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
                                AND res.created_at < DATE_SUB(NOW(), INTERVAL 7 DAY)
                                THEN res.reservation_id 
                                END) / 3.0) * 100.0 / 
                                (COUNT(DISTINCT CASE 
                                WHEN res.created_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
                                AND res.created_at < DATE_SUB(NOW(), INTERVAL 7 DAY)
                                THEN res.reservation_id 
                                END) / 3.0), 2
                        )
                END as reservationGrowthRate,
                
                CASE 
                        WHEN COUNT(DISTINCT CASE 
                        WHEN vh.viewed_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
                        AND vh.viewed_at < DATE_SUB(NOW(), INTERVAL 7 DAY)
                        THEN vh.id 
                        END) = 0 THEN 
                        CASE 
                                WHEN COUNT(DISTINCT CASE 
                                WHEN vh.viewed_at >= DATE_SUB(NOW(), INTERVAL 7 DAY) 
                                THEN vh.id 
                                END) > 0 THEN 100.0
                                ELSE 0.0
                        END
                        ELSE 
                        ROUND(
                                (COUNT(DISTINCT CASE 
                                WHEN vh.viewed_at >= DATE_SUB(NOW(), INTERVAL 7 DAY) 
                                THEN vh.id 
                                END) - 
                                COUNT(DISTINCT CASE 
                                WHEN vh.viewed_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
                                AND vh.viewed_at < DATE_SUB(NOW(), INTERVAL 7 DAY)
                                THEN vh.id 
                                END) / 3.0) * 100.0 / 
                                (COUNT(DISTINCT CASE 
                                WHEN vh.viewed_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
                                AND vh.viewed_at < DATE_SUB(NOW(), INTERVAL 7 DAY)
                                THEN vh.id 
                                END) / 3.0), 2
                        )
                END as viewGrowthRate
                
                FROM stays s
                LEFT JOIN rooms rm ON rm.stay_id = s.stay_id
                LEFT JOIN reservations res
                ON res.room_id = rm.room_id
                AND res.created_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
                LEFT JOIN view_history vh 
                ON vh.view_type = 'STAY' 
                AND vh.target_id = s.stay_id 
                AND vh.viewed_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
                WHERE s.is_active = 1
                GROUP BY s.stay_id, s.stay_name, s.address, s.average_rating,
                        s.latitude, s.longitude, s.check_in_time, s.check_out_time, s.stay_type, s.review_count
                HAVING reservationGrowthRate >= 0 OR viewGrowthRate >= 0
                ORDER BY 
                reservationGrowthRate DESC, 
                viewGrowthRate DESC,
                s.average_rating DESC
                LIMIT :limit
                """, nativeQuery = true)
        List<StayTrendingResponse> findTrendingStays(@Param("limit") int limit);

        // 가격착한 숙소 budgetfriendly에서 사용 
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


        @EntityGraph(attributePaths = {"rooms"})
        @Query("SELECT s FROM Stay s WHERE s.id = :stayId")
        Optional<Stay> findByStayId(@Param("stayId") Long stayId);

        Optional<Stay> findById(Long stayId);


        // 개인화 추천 섹션 

        /**
         * 활성화된 모든 숙소 조회
         */
        @Query("""
                SELECT DISTINCT s FROM Stay s
                LEFT JOIN FETCH s.rooms r
                WHERE s.isActive = true
                AND r.isAvailable = true
                ORDER BY s.averageRating DESC
        """)
        List<Stay> findAllActiveWithRooms();

        /**
         * 전체 숙소의 평균 가격 계산 
         */
        @Query("""
                SELECT AVG(r.weekdayPrice)
                FROM Room r
                WHERE r.isAvailable = true
        """)
        BigDecimal calculateAveragePrice();

    /**
     * 리뷰 등록, 수정 시 숙소 평균평점 업데이트
     */
    @Modifying
    @Query("UPDATE Stay s SET s.averageRating = " +
            "(SELECT COALESCE(ROUND(AVG(r.totalRating), 2), 0.0) " +
            "FROM Review r WHERE r.stayId = s.id) " +
            "WHERE s.id = :stayId")
    void updateAverageRating(@Param("stayId") Long stayId);


}