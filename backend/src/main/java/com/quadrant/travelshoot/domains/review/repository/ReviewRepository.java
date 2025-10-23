package com.quadrant.travelshoot.domains.review.repository;

import com.quadrant.travelshoot.domains.review.entity.Review;
import com.quadrant.travelshoot.domains.stay.dto.response.StayRatingResponse;
import jakarta.validation.constraints.NotNull;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

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


    /**
     * 리뷰 평점평균 구해서 저장할 용도
     * @param stayId
     * @return Double AVG(totalRating)
     */
    @Query("SELECT AVG(r.totalRating) FROM Review r WHERE r.stayId = :stayId")
    Double findAverageByStayId(Long stayId);


    @Query("""
        SELECT new com.quadrant.travelshoot.domains.stay.dto.response.StayRatingResponse(
            AVG(r.communicationRating),
            AVG(r.cleanRating),
            AVG(r.convenienceRating),
            AVG(r.checkinRating),
            AVG(r.locationRating),
            AVG(r.valueRating),
            AVG(r.totalRating)
        )
        FROM Review r
        WHERE r.stayId = :stayId
    """)
    StayRatingResponse findStayRatingByStayId(Long stayId);


    @Query("SELECT r.reviewId FROM Review r WHERE r.stayId = :stayId")
    List<Long> findIdsByStayId(Long stayId);

    Optional<Review> findByReservationId(Long reservationId);

    Optional<Review> findByReservation_Id(Long reservationId);
}
