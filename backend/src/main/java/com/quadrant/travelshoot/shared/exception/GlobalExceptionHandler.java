package com.quadrant.travelshoot.shared.exception;

import com.quadrant.travelshoot.shared.response.ApiResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {
    
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ApiResponse<Map<String, String>>> handleValidationExceptions(
            MethodArgumentNotValidException ex
    ) {
        Map<String, String> errors = new HashMap<>();
        
        ex.getBindingResult().getAllErrors().forEach((error) -> {
            String fieldName = ((FieldError) error).getField();
            String errorMessage = error.getDefaultMessage();
            errors.put(fieldName, errorMessage);
        });
        
        log.warn("Validation 오류: {}", errors);
        
        return ResponseEntity.badRequest()
                .body(ApiResponse.error("VALIDATION_ERROR", "입력 데이터가 유효하지 않습니다.", errors));
    }
    
    @ExceptionHandler(CustomExceptions.UserNotFoundException.class)
    public ResponseEntity<ApiResponse<Void>> handleUserNotFoundException(
            CustomExceptions.UserNotFoundException ex
    ) {
        log.error("UserNotFoundException: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body(ApiResponse.error("USER_NOT_FOUND", ex.getMessage()));
    }
    
    @ExceptionHandler(CustomExceptions.SurveyAlreadyCompletedException.class)
    public ResponseEntity<ApiResponse<Void>> handleSurveyAlreadyCompletedException(
            CustomExceptions.SurveyAlreadyCompletedException ex
    ) {
        log.warn("SurveyAlreadyCompletedException: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.CONFLICT)
                .body(ApiResponse.error("SURVEY_ALREADY_COMPLETED", ex.getMessage()));
    }
    
    @ExceptionHandler(CustomExceptions.SurveyNotFoundException.class)
    public ResponseEntity<ApiResponse<Void>> handleSurveyNotFoundException(
            CustomExceptions.SurveyNotFoundException ex
    ) {
        log.warn("SurveyNotFoundException: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body(ApiResponse.error("SURVEY_NOT_FOUND", ex.getMessage()));
    }

    // 500에러로 뜨는거 401으로 처리 - 로그인 실패 등 인증 오류 처리
    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<ApiResponse<Void>> handleIllegalArgumentException(
            IllegalArgumentException ex
    ) {
        log.warn("인증/검증 실패: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .body(ApiResponse.error("UNAUTHORIZED", ex.getMessage()));
    }
    
    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiResponse<Void>> handleGlobalException(Exception ex) {
        log.error("예상치 못한 오류 발생", ex);
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(ApiResponse.error("INTERNAL_SERVER_ERROR", "서버 오류가 발생했습니다."));
    }
}