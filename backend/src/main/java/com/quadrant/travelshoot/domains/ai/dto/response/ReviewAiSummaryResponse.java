package com.quadrant.travelshoot.domains.ai.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.quadrant.travelshoot.domains.review.entity.ReviewAiSummary;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReviewAiSummaryResponse {

    private Long StayId;
    private String overallSummary;
    private LocalDateTime analyzedAt;  // 분석 일시
    private LocalDateTime createdAt;   // 생성일시
    private LocalDateTime updatedAt;   // 수정일시
    @JsonProperty("positive_summary")
    private String positiveSummary;
    @JsonProperty("negative_summary")
    private String negativeSummary;

    /**
     *  DTO 변환
     */
    public static ReviewAiSummaryResponse from(ReviewAiSummary entity) {
        return ReviewAiSummaryResponse.builder()
                .positiveSummary(entity.getPositiveSummary())
                .negativeSummary(entity.getNegativeSummary())
                .build();
    }


}
