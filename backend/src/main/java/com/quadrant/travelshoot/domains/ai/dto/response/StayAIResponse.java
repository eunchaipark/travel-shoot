package com.quadrant.travelshoot.domains.ai.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

// OpenAI로부터 받은 숙소 추천 응답 DTO
@Data
@NoArgsConstructor
@AllArgsConstructor
public class StayAIResponse {
    
    // 선정된 숙소 ID 목록 (6개)
    
    private List<Long> selectedStayIds;
}