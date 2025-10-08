package com.quadrant.travelshoot.domains.main.dto.response;

import lombok.Builder;
import lombok.Getter;
import java.util.List;

@Getter
@Builder
public class OpenAIResponse {
    private String description;       // AI 생성 설명
    private List<Long> selectedIds;   // 선택된 숙소 ID 목록
}