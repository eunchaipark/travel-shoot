package com.quadrant.travelshoot.domains.stay.repository;

import com.quadrant.travelshoot.domains.stay.entity.Region;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface RegionRepository extends JpaRepository<Region, Long> {
    @Query("SELECT r FROM Region r WHERE " +
            ":address LIKE CONCAT('%', r.areaName, '%') " +
            "AND (:address LIKE CONCAT('%', r.cityName, '%') OR r.cityName IS NULL) " +
            "ORDER BY " +
            "CASE WHEN r.districtName IS NOT NULL AND :address LIKE CONCAT('%', r.districtName, '%') THEN 1 " +
            "     WHEN r.cityName IS NOT NULL THEN 2 " +
            "     ELSE 3 END")
    Optional<Region> findByAddress(@Param("address") String address);
}
