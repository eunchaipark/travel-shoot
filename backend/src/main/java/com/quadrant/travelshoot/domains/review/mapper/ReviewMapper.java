package com.quadrant.travelshoot.domains.review.mapper;

import com.quadrant.travelshoot.domains.review.dto.response.ReviewDetailResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewListResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewRegistResponse;
import com.quadrant.travelshoot.domains.review.entity.Review;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

@Component
public class ReviewMapper {

    public ReviewRegistResponse toReviewRegistResponse(Review review){
        if(review == null){
            return null;
        }

        // Entity -> DTO 변환
        return ReviewRegistResponse.builder()
                .reviewId(review.getReviewId())
                .reservationId(review.getReservation().getId())
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

    public ReviewDetailResponse toReviewDetailResponse(Review review){
        if (review == null) {
            return null;
        }

        return ReviewDetailResponse.builder()
                .reviewId(review.getReviewId())
                .userId(review.getUser().getId())
                .userName(review.getUser().getUserName())
                .totalRating(review.getTotalRating())
                .cleanRating(review.getCleanRating())
                .convenienceRating(review.getConvenienceRating())
                .checkinRating(review.getCheckinRating())
                .communicationRating(review.getCommunicationRating())
                .locationRating(review.getLocationRating())
                .valueRating(review.getValueRating())
                .reviewContent(review.getReviewContent())
                // 이미지 url 파일에서 가져오기
                .reviewImageUrl(null)
                .isRecommended(review.getIsRecommended())
                .createdAt(review.getCreatedAt())
                .updatedAt(review.getUpdatedAt())
                .build();
    }


    public ReviewListResponse toReviewListResponse(Review review){
        if (review == null) {
            return null;
        }

        return ReviewListResponse.builder()
                .reviewId(review.getReviewId())
                .userId(review.getUser().getId())
                .userName(review.getUser().getUserName())
                .roomId(review.getReservation().getRoom().getId())
                .roomName(review.getReservation().getRoom().getRoomName())
                .totalRating(review.getTotalRating())
                .reviewContent(review.getReviewContent())
                .reviewImageUrl(null)
                .createdAt(review.getCreatedAt())
                .updatedAt(review.getUpdatedAt())
                .build();

    }



}
