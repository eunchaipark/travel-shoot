package com.quadrant.travelshoot.domains.review.dto.request;

import lombok.*;
import jakarta.validation.constraints.*;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;

/**
 * 리뷰 작성 요청 DTO
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class ReviewRegistRequest {

    @NotNull(message = "예약 정보를 찾을 수 없습니다.")
    private Long reservationId;

    @NotNull(message = "숙소 정보를 찾을 수 없습니다.")
    private Long stayId;

    private Long reviewId; // 수정할 때만 값이 있음

    @NotNull(message = "청결도 별점을 선택해주세요.")
    @DecimalMin(value = "1.00", message = "청결도 별점을 선택해주세요.")
    @DecimalMax(value = "5.00", message = "청결도 별점은 최대 5점입니다.")
    private BigDecimal cleanRating;

    @NotNull(message = "편의성 별점을 선택해주세요.")
    @DecimalMin(value = "1.00", message = "편의성 별점을 선택해주세요.")
    @DecimalMax(value = "5.00", message = "편의성 별점은 최대 5점입니다.")
    private BigDecimal convenienceRating;

    @NotNull(message = "체크인 별점을 선택해주세요.")
    @DecimalMin(value = "1.00", message = "체크인 별점을 선택해주세요.")
    @DecimalMax(value = "5.00", message = "체크인 별점은 최대 5점입니다.")
    private BigDecimal checkinRating;

    @NotNull(message = "의사소통 별점을 선택해주세요.")
    @DecimalMin(value = "1.00", message = "의사소통 별점을 선택해주세요.")
    @DecimalMax(value = "5.00", message = "의사소통 별점은 최대 5점입니다.")
    private BigDecimal communicationRating;

    @NotNull(message = "위치 별점을 선택해주세요.")
    @DecimalMin(value = "1.00", message = "위치 별점을 선택해주세요.")
    @DecimalMax(value = "5.00", message = "위치 별점은 최대 5점입니다.")
    private BigDecimal locationRating;

    @NotNull(message = "가성비 별점을 선택해주세요.")
    @DecimalMin(value = "1.00", message = "가성비 별점을 선택해주세요.")
    @DecimalMax(value = "5.00", message = "가성비 별점은 최대 5점입니다.")
    private BigDecimal valueRating;

    // totalRating
    // 프론트에서 계산해서 보내줌
    @NotNull(message = "전체 별점을 확인해주세요.")
    @DecimalMin(value = "1.00", message = "전체 별점은 최소 1점이어야 합니다.")
    @DecimalMax(value = "5.00", message = "전체 별점은 최대 5점입니다.")
    private BigDecimal totalRating;

    @NotBlank(message = "리뷰 내용을 입력해주세요.")
    @Size(min = 10, max = 1000, message = "후기 최소 10자 이상 작성해주세요.")
    private String reviewContent;

    @NotNull(message = "이 숙소를 추천하시는지 선택해주세요.")
    private Boolean isRecommended;

    // 이미지 등록 1장
    private MultipartFile reviewImage;

    // 이미지가 비어있는지 검증하는 커스텀 메서드
    @AssertTrue(message = "후기 사진을 등록해주세요.")
    public boolean isReviewImageValid() {
        // 수정 모드(reviewId가 있음)면 검증 스킵
        if (reviewId != null) {
            return true;
        }
        // 등록 모드면 이미지 필수
        return reviewImage != null && !reviewImage.isEmpty();
    }
}