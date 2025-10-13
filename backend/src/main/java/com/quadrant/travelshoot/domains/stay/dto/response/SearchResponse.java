package com.quadrant.travelshoot.domains.stay.dto.response;

import lombok.*;
import java.util.List;

// 검색창 검색 결과 리스트 조회
@Getter
@Setter  // 무한스크롤... 페이지 데이터 동적 설정할라고 추가함
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SearchResponse {
    private List<StayListItem> stays;
    private Long totalCount;
    private Integer currentPage;
    private Integer totalPages;
    private Boolean hasNext;
}