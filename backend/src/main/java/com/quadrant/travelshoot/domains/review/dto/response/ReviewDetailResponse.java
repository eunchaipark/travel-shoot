package com.quadrant.travelshoot.domains.review.dto.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 리뷰 상세 조회 응답 DTO
 * 사용 페이지: 리뷰 수정 시 조회, (사용자 리뷰 상세 조회)
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL) // null값 필드는 응답에서 제외
public class ReviewDetailResponse {

    private Long reviewId;
    private Long userId;
    private String userName;

    // 예약 정보
    private ReviewReservationInfoDto reservationInfoDto;

    // 평점 정보 (BigDecimal로 변경)
    private BigDecimal totalRating;
    private BigDecimal cleanRating;
    private BigDecimal convenienceRating;
    private BigDecimal checkinRating;
    private BigDecimal communicationRating;
    private BigDecimal locationRating;
    private BigDecimal valueRating;

    private String reviewContent;
    private Boolean isRecommended;  // 0
    //리뷰 이미지 상세 정보 필요할 수 있음
    private String reviewImageUrl;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

}
