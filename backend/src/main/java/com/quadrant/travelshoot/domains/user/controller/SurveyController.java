package com.quadrant.travelshoot.domains.user.controller;

import com.quadrant.travelshoot.domains.user.dto.request.SurveySubmitRequest;
import com.quadrant.travelshoot.domains.user.dto.response.SurveySubmitResponse;
import com.quadrant.travelshoot.domains.user.service.SurveyService;
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
    
    private final SurveyService surveyService;
    
    /**
     * 설문조사 제출
     * POST /api/survey/submit
     */
    @PostMapping("/submit")
    public ResponseEntity<ApiResponse<SurveySubmitResponse>> submitSurvey(
            @Valid @RequestBody SurveySubmitRequest request,
            @RequestParam(required = false, defaultValue = "1") Long userId
    ) {
        log.info("설문조사 제출 API 호출 - userId: {}", userId);
        
        SurveySubmitResponse response = surveyService.submitSurvey(userId, request);
        
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("설문조사가 성공적으로 제출되었습니다.", response));
    }
    
    /**
     * 설문조사 완료 여부 확인
     * GET /api/survey/status
     */
    @GetMapping("/status")
    public ResponseEntity<ApiResponse<Boolean>> checkSurveyStatus(
            @RequestParam(required = false, defaultValue = "1") Long userId
    ) {
        log.info("설문조사 완료 여부 확인 API 호출 - userId: {}", userId);
        
        boolean isCompleted = surveyService.isSurveyCompleted(userId);
        
        return ResponseEntity.ok(ApiResponse.success("설문조사 완료 여부 조회 성공", isCompleted));
    }
}