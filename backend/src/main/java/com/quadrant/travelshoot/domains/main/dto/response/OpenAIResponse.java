package com.quadrant.travelshoot.domains.main.dto.response;

import lombok.Builder;
import lombok.Getter;
import java.util.List;
import java.util.Map;

@Getter
@Builder
public class OpenAIResponse {
    private String description;                    // AI 생성 설명
    private List<Long> selectedIds;                // 선택된 숙소 ID 목록 (순서 보장)
    private Map<Long, Double> scores;              // 각 숙소의 OpenAI 평가 점수 (stayId -> score)
}