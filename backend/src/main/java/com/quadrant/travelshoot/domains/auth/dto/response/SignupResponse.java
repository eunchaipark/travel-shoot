package com.quadrant.travelshoot.domains.auth.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

//  회원가입 결과
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SignupResponse {

    private Long userId;
    private String email;
    private String userName;
    private Boolean emailVerified;

    // 설문조사 관련
    private Boolean surveyRequired;      // 설문조사 필요 여부 (항상 true)
    private Boolean surveyCompleted;     // 설문조사 완료 여부 (최초 가입 시 false)
    private String nextStep;             // 다음 단계 ("SURVEY" or "MAIN")

    private LocalDateTime createdAt;
    private String message;
}