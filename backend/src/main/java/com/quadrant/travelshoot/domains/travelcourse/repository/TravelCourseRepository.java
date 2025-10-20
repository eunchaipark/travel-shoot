package com.quadrant.travelshoot.domains.travelcourse.repository;
import com.quadrant.travelshoot.domains.travelcourse.entity.TravelCourse;
import com.quadrant.travelshoot.domains.travelcourse.entity.TravelCourse.GenerationStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TravelCourseRepository extends JpaRepository<TravelCourse, Long> {

    List<TravelCourse> findByUserId(Long userId);

    List<TravelCourse> findByGenerationStatus(GenerationStatus status);

    Optional<TravelCourse> findByReservationId(Long reservationId);
}