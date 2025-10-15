package com.quadrant.travelshoot.domains.travelcourse.repository;
import com.quadrant.travelshoot.domains.travelcourse.entity.CourseSpot;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseSpotRepository extends JpaRepository<CourseSpot, Long> {

    List<CourseSpot> findByTravelCourseIdOrderByDayAscSpotOrderAsc(Long courseId);

    @Query("""
        SELECT cs, 
               CASE 
                   WHEN cs.spotType = '관광지' THEN a.activityName
                   WHEN cs.spotType = '맛집' THEN r.restaurantName
               END as spotName,
               CASE 
                   WHEN cs.spotType = '관광지' THEN a.address
                   WHEN cs.spotType = '맛집' THEN r.address
               END as address
        FROM CourseSpot cs
        LEFT JOIN Activity a ON cs.spotType = '관광지' AND cs.referenceId = a.id
        LEFT JOIN Restaurant r ON cs.spotType = '맛집' AND cs.referenceId = r.id
        WHERE cs.travelCourse.id = :courseId
        ORDER BY cs.day ASC, cs.spotOrder ASC
    """)
    List<Object[]> findCourseSpotWithDetailsById(@Param("courseId") Long courseId);
}