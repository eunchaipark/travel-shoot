package com.quadrant.travelshoot.domains.restaurant.repository;

import com.quadrant.travelshoot.domains.restaurant.dto.response.RestaurantTrendingResponse;
import com.quadrant.travelshoot.domains.restaurant.entity.Restaurant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RestaurantTrendingRepository extends JpaRepository<Restaurant, Long> {

    @SuppressWarnings({"SqlDialectInspection", "SqlNoDataSourceInspection", "SqlResolve"})
    @Query(value = """
        SELECT 
            r.restaurant_id as restaurantId,
            r.restaurant_name as restaurantName,
            r.food_type as foodType,
            r.address as address,
            r.rating as rating,
            
            (SELECT f.s3_url 
             FROM files f 
             WHERE f.reference_type = 'RESTAURANT' 
             AND f.reference_id = r.restaurant_id 
             AND f.is_representative = true 
             AND f.is_deleted = false
             LIMIT 1) as thumbnailImage,
            
            r.latitude as latitude,
            r.longitude as longitude,
            
            COUNT(DISTINCT CASE 
                WHEN vh.viewed_at >= DATE_SUB(NOW(), INTERVAL 7 DAY) 
                THEN vh.id 
            END) as recent7DaysViews,
            
            ROUND(
                COUNT(DISTINCT CASE 
                    WHEN vh.viewed_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
                    AND vh.viewed_at < DATE_SUB(NOW(), INTERVAL 7 DAY)
                    THEN vh.id 
                END) / 3.0, 2
            ) as previous3WeeksAvgViews,
            
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
            END as viewGrowthRate,
            
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
                        END) > 0 THEN 100.0 * (r.rating / 5.0)
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
                        END) / 3.0) * (r.rating / 5.0), 2
                    )
            END as trendingScore
            
        FROM restaurants r
        LEFT JOIN view_history vh 
            ON vh.view_type = 'RESTAURANT' 
            AND vh.target_id = r.restaurant_id 
            AND vh.viewed_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
        WHERE r.is_active = 1
        AND r.rating >= 4.0
        GROUP BY r.restaurant_id, r.restaurant_name, r.food_type, r.address, 
                 r.rating, r.latitude, r.longitude
        ORDER BY 
            trendingScore DESC,
            viewGrowthRate DESC,
            rating DESC
        LIMIT 12
        """, nativeQuery = true)
    List<RestaurantTrendingResponse> findTrendingRestaurants();
}