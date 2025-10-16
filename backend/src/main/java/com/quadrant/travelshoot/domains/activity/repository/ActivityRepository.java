package com.quadrant.travelshoot.domains.activity.repository;

import com.quadrant.travelshoot.domains.activity.dto.response.ActivityTrendingResponse;
import com.quadrant.travelshoot.domains.activity.entity.Activity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.util.List;

public interface ActivityRepository extends JpaRepository<Activity, Long> {

    @SuppressWarnings({"SqlDialectInspection", "SqlNoDataSourceInspection", "SqlResolve"})
    @Query(value = """
        SELECT 
            a.activity_id as activityId,
            a.activity_name as activityName,
            a.activity_type as activityType,
            a.address as address,
            a.rating as rating,
            
            -- 이미지
            (SELECT f.s3_url 
             FROM files f 
             WHERE f.reference_type = 'ACTIVITY' 
             AND f.reference_id = a.activity_id 
             AND f.is_representative = true 
             AND f.is_deleted = false
             LIMIT 1) as thumbnailImage,
            
            a.latitude as latitude,
            a.longitude as longitude,
            
            -- 최근 7일 조회수
            COUNT(DISTINCT CASE 
                WHEN vh.viewed_at >= DATE_SUB(NOW(), INTERVAL 7 DAY) 
                THEN vh.id 
            END) as recent7DaysViews,
            
            -- 이전 3주 평균 조회수
            ROUND(
                COUNT(DISTINCT CASE 
                    WHEN vh.viewed_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
                    AND vh.viewed_at < DATE_SUB(NOW(), INTERVAL 7 DAY)
                    THEN vh.id 
                END) / 3.0, 2
            ) as previous3WeeksAvgViews,
            
            -- 조회수 증가율
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
            
            -- Trending Score (조회수 증가율 × 평점 가중치)
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
                        END) > 0 THEN 100.0 * (a.rating / 5.0)
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
                        END) / 3.0) * (a.rating / 5.0), 2
                    )
            END as trendingScore
            
        FROM activities a
        LEFT JOIN view_history vh 
            ON vh.view_type = 'ACTIVITY' 
            AND vh.target_id = a.activity_id 
            AND vh.viewed_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
        WHERE a.is_active = 1
        AND a.rating >= 4.0
        GROUP BY a.activity_id, a.activity_name, a.activity_type, a.address, 
                 a.rating, a.latitude, a.longitude
        ORDER BY 
            trendingScore DESC,
            viewGrowthRate DESC,
            rating DESC
        LIMIT 12
        """, nativeQuery = true)
    List<ActivityTrendingResponse> findTrendingActivities();

    /**
     * 카테고리, 평점, 거리 기준으로 관광지 조회
     * Haversine 공식 사용하여 거리 계산
     */
    @Query("SELECT a FROM Activity a " +
            "WHERE a.activityType IN :categories " +
            "AND a.rating >= :minRating " +
            "AND (6371 * acos(cos(radians(:latitude)) * cos(radians(a.latitude)) * " +
            "cos(radians(a.longitude) - radians(:longitude)) + " +
            "sin(radians(:latitude)) * sin(radians(a.latitude)))) <= :maxDistanceKm " +
            "ORDER BY a.rating DESC")
    List<Activity> findByCategoriesAndRatingAndDistance(
            @Param("categories") List<String> categories,
            @Param("minRating") double minRating,
            @Param("latitude") BigDecimal latitude,
            @Param("longitude") BigDecimal longitude,
            @Param("maxDistanceKm") double maxDistanceKm
    );

    @Query("SELECT a FROM Activity a " +
            "WHERE a.rating >= :minRating " +
            "AND (6371 * acos(cos(radians(:latitude)) * cos(radians(a.latitude)) * " +
            "cos(radians(a.longitude) - radians(:longitude)) + " +
            "sin(radians(:latitude)) * sin(radians(a.latitude)))) <= :maxDistanceKm " +
            "ORDER BY a.rating DESC")
    List<Activity> findByRatingAndDistance(
            @Param("minRating") double minRating,
            @Param("latitude") BigDecimal latitude,
            @Param("longitude") BigDecimal longitude,
            @Param("maxDistanceKm") double maxDistanceKm
    );
}