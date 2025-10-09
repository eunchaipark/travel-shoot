package com.quadrant.travelshoot.domains.activity.repository;

import com.quadrant.travelshoot.domains.activity.entity.Activity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ActivityRepository extends JpaRepository<Activity, Long> {

        // 활성화된 관광지를 평점 높은 순으로 조회

        @Query(value = "SELECT * FROM activities " +
                        "WHERE is_active = true " +
                        "ORDER BY rating DESC " +
                        "LIMIT 12", nativeQuery = true)
        List<Activity> findTop12ByIsActiveTrueOrderByRatingDesc();
}