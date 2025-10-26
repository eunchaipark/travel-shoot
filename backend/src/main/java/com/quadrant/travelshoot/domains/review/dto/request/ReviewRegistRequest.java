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

    @NotNull(message = "예약 ID는 필수입니다.")
    private Long reservationId;

    @NotNull(message = "숙박시설 ID는 필수입니다.")
    private Long stayId;

    // Integer에서 BigDecimal로 변경하여 소수점 지원 (0.5 단위 평점 등)
    @NotNull(message = "청결도 점수는 필수입니다.")
    @DecimalMin(value = "0.00", message = "청결도 점수는 0 이상이어야 합니다.")
    @DecimalMax(value = "5.00", message = "청결도 점수는 5 이하여야 합니다.")
    private BigDecimal cleanRating;

    @NotNull(message = "편의성 점수는 필수입니다.")
    @DecimalMin(value = "0.00", message = "편의성 점수는 0 이상이어야 합니다.")
    @DecimalMax(value = "5.00", message = "편의성 점수는 5 이하여야 합니다.")
    private BigDecimal convenienceRating;

    @NotNull(message = "체크인 점수는 필수입니다.")
    @DecimalMin(value = "0.00", message = "체크인 점수는 0 이상이어야 합니다.")
    @DecimalMax(value = "5.00", message = "체크인 점수는 5 이하여야 합니다.")
    private BigDecimal checkinRating;

    @NotNull(message = "의사소통 점수는 필수입니다.")
    @DecimalMin(value = "0.00", message = "의사소통 점수는 0 이상이어야 합니다.")
    @DecimalMax(value = "5.00", message = "의사소통 점수는 5 이하여야 합니다.")
    private BigDecimal communicationRating;

    @NotNull(message = "위치 점수는 필수입니다.")
    @DecimalMin(value = "0.00", message = "위치 점수는 0 이상이어야 합니다.")
    @DecimalMax(value = "5.00", message = "위치 점수는 5 이하여야 합니다.")
    private BigDecimal locationRating;

    @NotNull(message = "가성비 점수는 필수입니다.")
    @DecimalMin(value = "0.00", message = "가성비 점수는 0 이상이어야 합니다.")
    @DecimalMax(value = "5.00", message = "가성비 점수는 5 이하여야 합니다.")
    private BigDecimal valueRating;

    // totalRating
    // 프론트에서 계산해서 보내줌
    @NotNull(message = "종합 평균 점수는 필수입니다.")
    @DecimalMin("0.00")
    @DecimalMax("5.00")
    private BigDecimal totalRating;

    @NotBlank(message = "리뷰 내용은 필수입니다.")
    @Size(min = 10, max = 5000, message = "리뷰 내용은 10자 이상 5000자 이하여야 합니다.")
    private String reviewContent;

    @NotNull(message = "추천 여부는 필수입니다.")
    private Boolean isRecommended;

    // 이미지 등록 1장
    private MultipartFile reviewImage;
}