package com.quadrant.travelshoot.domains.review.dto.response;

import com.quadrant.travelshoot.domains.review.entity.Review;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 등록된 리뷰 응답 DTO
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewRegistResponse {

    private Long reviewId;
    private Long reservationId;
    private Long userId;
    private Long stayId;
    private BigDecimal totalRating;
    private BigDecimal cleanRating;
    private BigDecimal convenienceRating;
    private BigDecimal checkinRating;
    private BigDecimal communicationRating;
    private BigDecimal locationRating;
    private BigDecimal valueRating;
    private String reviewContent;
//    private String reviewImageUrl;
    private Boolean isRecommended;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    // Entity -> DTO 변환
    public static ReviewRegistResponse from(Review review) {
        return ReviewRegistResponse.builder()
                .reviewId(review.getReviewId())
                .reservationId(review.getReservationId())
                .userId(review.getUser().getId())
                .stayId(review.getStayId())
                .totalRating(review.getTotalRating())
                .cleanRating(review.getCleanRating())
                .convenienceRating(review.getConvenienceRating())
                .checkinRating(review.getCheckinRating())
                .communicationRating(review.getCommunicationRating())
                .locationRating(review.getLocationRating())
                .valueRating(review.getValueRating())
                .reviewContent(review.getReviewContent())
//                .reviewImageUrl(review.getReviewImageUrl())
                .isRecommended(review.getIsRecommended())
                .createdAt(review.getCreatedAt())
                .updatedAt(review.getUpdatedAt())
                .build();
    }
}
