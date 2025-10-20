package com.quadrant.travelshoot.domains.survey.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SurveySubmitResponse {
    private Long surveyId;
    private Long userId;
    private LocalDateTime completedAt;
}