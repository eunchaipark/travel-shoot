package com.quadrant.travelshoot.domains.review.repository;

import com.quadrant.travelshoot.domains.review.entity.ReviewAiSummary;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ReviewAiSummaryRepository extends JpaRepository<ReviewAiSummary, Long> {


    Optional<ReviewAiSummary> findByStayId(Long stayId);
}
