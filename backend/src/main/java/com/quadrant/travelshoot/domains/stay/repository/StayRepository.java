package com.quadrant.travelshoot.domains.stay.repository;

import com.quadrant.travelshoot.domains.stay.entity.Stay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface StayRepository extends JpaRepository<Stay, Long> {

    @Query("SELECT s FROM Stay s " +
            "JOIN s.region r " +
            "WHERE r.areaName = :regionName " +
            "AND s.stayType = :stayType " +
            "AND s.isActive = true " +
            "ORDER BY s.averageRating DESC")
    List<Stay> findTop10ByRegionAndType(
            @Param("regionName") String regionName,
            @Param("stayType") Stay.StayType stayType);
}