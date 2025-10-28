package com.quadrant.travelshoot.domains.review.mapper;

import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewDetailResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewListResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewRegistResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewReservationInfoDto;
import com.quadrant.travelshoot.domains.review.entity.Review;
import com.quadrant.travelshoot.domains.stay.entity.Room;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ReviewMapper {

    public ReviewListResponse toListResponse(Review review, String representativeUrl, List<String> imageUrls) {
        return ReviewListResponse.builder()
                .reviewId(review.getReviewId())
                .userId(review.getUser().getId())
                .userName(review.getUser().getUserName())
                .roomId(review.getReservation().getRoom().getId())
                .roomName(review.getReservation().getRoom().getRoomName())
                .totalRating(review.getTotalRating())
                .reviewContent(review.getReviewContent())
                .reviewImageUrls(imageUrls)
                .createdAt(review.getCreatedAt())
                .updatedAt(review.getUpdatedAt())
                .build();
    }

    public ReviewRegistResponse toReviewRegistResponse(Review review, String imageUrl){
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
                .imageUrl(imageUrl)
                .build();
    }





    /* 리뷰의 예약 내역 */
    public ReviewReservationInfoDto toReservationInfoDto(Reservation reservation, String reservationImageUrl){
        if (reservation == null) {
            return null;
        }

        Stay stay = reservation.getRoom().getStay();
        Room room = reservation.getRoom();

        // stay.getStayImages 안되면 fileUploadRepository에서 조회할 것
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
//                .stayImageUrl(stay.getStayImages().getFirst().getS3Url())
                .stayImageUrl(reservationImageUrl)
                .roomId(room.getId())
                .roomName(room.getRoomName())
                .standardCapacity(room.getStandardCapacity())
                .maximumCapacity(room.getStandardCapacity())
                .build();
    }


    public ReviewDetailResponse toReviewDetailResponse(Review review, String reservationImageUrl, String reviewImageUrl){
        if (review == null) {
            return null;
        }

        return ReviewDetailResponse.builder()
                .reviewId(review.getReviewId())
                .userId(review.getUser().getId())
                .userName(review.getUser().getUserName())
                .reservationInfoDto(toReservationInfoDto(review.getReservation(), reservationImageUrl))
                .totalRating(review.getTotalRating())
                .cleanRating(review.getCleanRating())
                .convenienceRating(review.getConvenienceRating())
                .checkinRating(review.getCheckinRating())
                .communicationRating(review.getCommunicationRating())
                .locationRating(review.getLocationRating())
                .valueRating(review.getValueRating())
                .reviewContent(review.getReviewContent())
                // 이미지 url 파일에서 가져오기
                .reviewImageUrl(reviewImageUrl)
                .isRecommended(review.getIsRecommended())
                .createdAt(review.getCreatedAt())
                .updatedAt(review.getUpdatedAt())
                .build();
    }


    public ReviewListResponse toReviewListResponse(Review review, String imageUrl){
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
                .reviewImageUrl(imageUrl)
                .createdAt(review.getCreatedAt())
                .updatedAt(review.getUpdatedAt())
                .build();

    }



}
