package com.quadrant.travelshoot.domains.stay.repository;

import com.quadrant.travelshoot.domains.stay.entity.Stay;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

public interface StayRepository extends JpaRepository<Stay, Long> {

    //자동완성 ( 검색창 - 지역명 )
    @Query(value =
            "SELECT DISTINCT result " +
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
                    "LIMIT 10",
            nativeQuery = true)
    List<String> findRegionsByKeyword(@Param("keyword") String keyword);

    //자동완성 ( 검색창 - 숙소명 )
    @Query("SELECT DISTINCT s.name " +
            "FROM Stay s " +
            "WHERE s.name LIKE CONCAT('%', :keyword, '%') " +
            "AND s.isActive = true")
    List<String> findStayNamesByKeyword(@Param("keyword") String keyword);

    //기본 검색창 검색 ( 지역, 날짜, 인원수 )
    @Query(value =
            "SELECT DISTINCT s.* FROM stays s " +
                    "INNER JOIN rooms r ON s.stay_id = r.stay_id " +
                    "INNER JOIN regions reg ON s.region_id = reg.region_id " +
                    "WHERE (reg.area_name LIKE CONCAT('%', :region, '%') " +
                    "   OR reg.city_name LIKE CONCAT('%', :region, '%')) " +
                    "AND r.maximum_capacity >= :guests " +
                    "AND s.is_active = true " +
                    "AND r.is_available = true " +
                    "AND r.room_id NOT IN ( " +
                    "    SELECT res.room_id FROM reservations res " +
                    "    WHERE res.reservation_status = '예약확정' " +
                    "    AND (res.check_in_date <= :checkOut AND res.check_out_date >= :checkIn) " +
                    ") " +
                    "GROUP BY s.stay_id " +
                    "ORDER BY s.created_at DESC",
            countQuery =
                    "SELECT COUNT(DISTINCT s.stay_id) FROM stays s " +
                            "INNER JOIN rooms r ON s.stay_id = r.stay_id " +
                            "INNER JOIN regions reg ON s.region_id = reg.region_id " +
                            "WHERE (reg.area_name LIKE CONCAT('%', :region, '%') " +
                            "   OR reg.city_name LIKE CONCAT('%', :region, '%')) " +
                            "AND r.maximum_capacity >= :guests " +
                            "AND s.is_active = true " +
                            "AND r.is_available = true",
            nativeQuery = true)
    Page<Stay> searchStays(
            @Param("region") String region,
            @Param("checkIn") LocalDate checkIn,
            @Param("checkOut") LocalDate checkOut,
            @Param("guests") Integer guests,
            Pageable pageable);

    // 숙소 검색 리스트 페이지 사이드 필터
    @Query(value =
            "SELECT DISTINCT s.* FROM stays s " +
                    "INNER JOIN rooms r ON s.stay_id = r.stay_id " +
                    "INNER JOIN regions reg ON s.region_id = reg.region_id " +
                    "WHERE (:region IS NULL OR reg.area_name LIKE CONCAT('%', :region, '%') " +
                    "   OR reg.city_name LIKE CONCAT('%', :region, '%')) " +
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
                    "ORDER BY s.created_at DESC",
            countQuery =
                    "SELECT COUNT(DISTINCT s.stay_id) FROM stays s " +
                            "INNER JOIN rooms r ON s.stay_id = r.stay_id " +
                            "INNER JOIN regions reg ON s.region_id = reg.region_id " +
                            "WHERE (:region IS NULL OR reg.area_name LIKE CONCAT('%', :region, '%')) " +
                            "AND s.is_active = true " +
                            "AND r.is_available = true",
            nativeQuery = true)

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
}