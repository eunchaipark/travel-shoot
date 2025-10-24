package com.quadrant.travelshoot.domains.review.mapper;

import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewDetailResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewListResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewRegistResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewReservationInfoDto;
import com.quadrant.travelshoot.domains.review.entity.Review;
import com.quadrant.travelshoot.domains.stay.entity.Room;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
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
                .isRecommended(review.getIsRecommended())
                .createdAt(review.getCreatedAt())
                .updatedAt(review.getUpdatedAt())
                .build();
    }


    /* 리뷰의 예약 내역 */
    public ReviewReservationInfoDto toReservationInfoDto(Reservation reservation){
        if (reservation == null) {
            return null;
        }

        Stay stay = reservation.getRoom().getStay();
        Room room = reservation.getRoom();

        return ReviewReservationInfoDto.builder()
                .reservationId(reservation.getId())
                .reservationCode(reservation.getReservationCode())
                .checkInDate(reservation.getCheckInDate())
                .checkOutDate(reservation.getCheckOutDate())
                .totalNights(reservation.getTotalNights())
                .reservationStatus(reservation.getReservationStatus())
                .guestCount(reservation.getGuestCount())
                .stayId(stay.getId())
                .stayName(stay.getName())
                .checkInTime(stay.getCheckInTime())
                .checkOutTime(stay.getCheckOutTime())
                .roomId(room.getId())
                .roomName(room.getRoomName())
                .standardCapacity(room.getStandardCapacity())
                .maximumCapacity(room.getStandardCapacity())
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
                .reservationInfoDto(toReservationInfoDto(review.getReservation()))
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
