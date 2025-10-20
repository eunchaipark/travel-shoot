package com.quadrant.travelshoot.domains.stay.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AIStayResponse {
    
    private Long id;                // stayId
    private String title;           // stayName
    private String image;           // 대표 이미지 URL
    private Double rating;          // averageRating (5점 만점)
    private String location;        // "지역명 • 상세주소"
    private Double price;           // minPrice
    private String checkinTime;     // "15:00" 형식
    private String badge;           // "AI 추천 95%" 또는 "추천율 92%"
    private Double latitude;        // 위도
    private Double longitude;       // 경도
    
    // 추가 정보
    private String stayType;        // 숙소 타입
    private Integer reviewCount;    // 리뷰 수
}