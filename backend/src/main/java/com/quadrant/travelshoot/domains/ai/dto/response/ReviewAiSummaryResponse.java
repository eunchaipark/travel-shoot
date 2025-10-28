package com.quadrant.travelshoot.domains.ai.dto.response;

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

}
