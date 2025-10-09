package com.quadrant.travelshoot.domains.restaurant.repository;

import com.quadrant.travelshoot.domains.restaurant.entity.Restaurant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RestaurantRepository extends JpaRepository<Restaurant, Long> {

        // 운영중인 맛집을 평점 높은 순으로 조회

        @Query(value = "SELECT * FROM restaurants " +
                        "WHERE is_active = true " +
                        "ORDER BY rating DESC " +
                        "LIMIT 12", nativeQuery = true)
        List<Restaurant> findTop12ByIsActiveTrueOrderByRatingDesc();
}