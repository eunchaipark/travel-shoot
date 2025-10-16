package com.quadrant.travelshoot.domains.survey.controller;

import com.quadrant.travelshoot.domains.survey.dto.request.SurveySubmitRequest;
import com.quadrant.travelshoot.domains.survey.dto.response.SurveySubmitResponse;
import com.quadrant.travelshoot.domains.survey.service.UserSurveyService;
import com.quadrant.travelshoot.shared.response.ApiResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/api/survey")
@RequiredArgsConstructor
public class SurveyController {
    
    private final UserSurveyService userSurveyService;
    
    @PostMapping("/submit")
    public ResponseEntity<ApiResponse<SurveySubmitResponse>> submitSurvey(
            @Valid @RequestBody SurveySubmitRequest request,
            @RequestParam(required = false, defaultValue = "1") Long userId
    ) {
        log.info("설문조사 제출 API 호출 - userId: {}", userId);
        
        SurveySubmitResponse response = userSurveyService.submitSurvey(userId, request);
        
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("설문조사가 성공적으로 제출되었습니다.", response));
    }
}