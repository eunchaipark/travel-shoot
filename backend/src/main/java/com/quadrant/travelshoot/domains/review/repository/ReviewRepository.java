package com.quadrant.travelshoot.domains.review.repository;

import com.quadrant.travelshoot.domains.review.entity.Review;
import jakarta.validation.constraints.NotNull;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {


    boolean existsByReservationId(@NotNull(message = "예약 ID가 존재해야 합니다.") Long reservationId);

    @EntityGraph(attributePaths = {"user", "reservation", "reservation.room"})
    @Query("SELECT r FROM Review r WHERE r.stayId = :stayId")
    Page<Review> findPageByStayId(Long stayId, Pageable pageable);

    @EntityGraph(attributePaths = {"user", "reservation", "reservation.room"})
    @Query("SELECT r FROM Review r WHERE r.stayId = :stayId AND r.reservation.room.id = :roomId")
    Page<Review> findByStayIdAndRoomId(Long stayId, Long roomId, Pageable pageable);

    Integer countByStayId(Long stayId);

    @Query("SELECT AVG(r.totalRating) FROM Review r WHERE r.stayId = :stayId")
    Double findAverageByStayId(Long stayId);
}
