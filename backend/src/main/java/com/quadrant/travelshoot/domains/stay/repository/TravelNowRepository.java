package com.quadrant.travelshoot.domains.stay.repository;

import com.quadrant.travelshoot.domains.stay.entity.Stay;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface TravelNowRepository extends JpaRepository<Stay, Long> {
    
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
}