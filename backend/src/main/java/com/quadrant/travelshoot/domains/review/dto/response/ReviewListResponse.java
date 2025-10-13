package com.quadrant.travelshoot.domains.review.dto.response;

import lombok.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 숙소에 대한 리뷰 목록 조회 응답 DTO
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewListResponse {

    // 사용자가 작성한 리뷰를 저장하는 것이지, 숙소의 리뷰가 저장되는 것이 아님.
    private Long reviewId;
    private Long userId;
    private String userName;

//    private Long stayId;
    private Long roomId;  // 숙소의 객실 필터링
    private String roomName;    // 객실명: 리뷰 -> 예약 -> 객실id 있음

    private BigDecimal totalRating; // 리뷰 평균평점
    private String reviewContent;   // 리뷰 내용
    private String reviewImageUrl;  // 리뷰 이미지

    private LocalDateTime createdAt;    // 리뷰 작성일
    private LocalDateTime updatedAt;    // 리뷰 작성일

}
