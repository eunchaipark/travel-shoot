package com.quadrant.travelshoot.domains.stay.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

/**
 * 가격착한 숙소 응답 DTO
 * 메인페이지의 Budget Friendly 섹션에서 사용
 */
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BudgetFriendlyResponse {

    private Long stayId;
    private String stayName;
    private String stayType;
    private String address;
    private String regionName;

    // 가격 정보
    private BigDecimal averagePrice; // 평일+주말 평균 최저가
    private Integer discountRate; // 할인율 (지역 평균가 대비)

    // 평점 정보
    private BigDecimal averageRating;
    private Integer reviewCount;

    // 이미지
    private String thumbnailUrl;

    // 편의시설 (최대 5개)
    private List<String> amenities;

    // 체크인/아웃 시간
    private String checkInTime;
    private String checkOutTime;
}