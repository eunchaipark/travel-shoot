package com.quadrant.travelshoot.domains.stay.repository;

import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.dto.response.StayTrendingResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StayTrendingRepository extends JpaRepository<Stay, Long> {
    
    @SuppressWarnings({"SqlDialectInspection", "SqlNoDataSourceInspection", "SqlResolve"})
    @Query(value = """
        SELECT 
            s.stay_id as stayId,
            s.stay_name as stayName,
            s.address as address,
            s.average_rating as averageRating,
            
            (SELECT f.s3_url 
            FROM files f 
            WHERE f.reference_type = 'STAY' 
            AND f.reference_id = s.stay_id 
            AND f.is_representative = true 
            AND f.is_deleted = false
            LIMIT 1) as thumbnailImage,
            
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
                s.latitude, s.longitude, s.check_in_time, s.check_out_time, s.stay_type
        HAVING reservationGrowthRate > 0 OR viewGrowthRate > 0
        ORDER BY 
            reservationGrowthRate DESC, 
            viewGrowthRate DESC,
            s.average_rating DESC
        LIMIT :limit
        """, nativeQuery = true)
    List<StayTrendingResponse> findTrendingStays(@Param("limit") int limit);
}