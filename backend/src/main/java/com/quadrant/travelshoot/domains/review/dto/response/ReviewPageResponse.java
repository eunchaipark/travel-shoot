package com.quadrant.travelshoot.domains.review.dto.response;

import lombok.*;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * 페이징 응답을 위한 공통 DTO
 * Page 객체를 직접 반환하지 않고 필요한 정보만 담아 반환
 */
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewPageResponse<T> {

    private List<T> content;           // 실제 데이터 리스트
    private int pageNumber;            // 현재 페이지 번호
    private int pageSize;              // 페이지 크기
    private long totalElements;        // 전체 데이터 개수
    private int totalPages;            // 전체 페이지 수
    private boolean first;             // 첫 페이지 여부
    private boolean last;              // 마지막 페이지 여부
    private boolean hasNext;           // 다음 페이지 존재 여부
    private boolean hasPrevious;       // 이전 페이지 존재 여부

    /**
     * Page 객체를 ReviewPageResponse로 변환
     */
    public static <T> ReviewPageResponse<T> of(Page<T> page) {
        return ReviewPageResponse.<T>builder()
                .content(page.getContent())
                .pageNumber(page.getNumber())
                .pageSize(page.getSize())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .first(page.isFirst())
                .last(page.isLast())
                .hasNext(page.hasNext())
                .hasPrevious(page.hasPrevious())
                .build();
    }
}
