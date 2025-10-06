package com.quadrant.travelshoot.domains.auth.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

//  로그인 완료 응답
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginResponse {

    private Long userId;
    private String email;
    private String userName;

    // 설문조사 관련
    private Boolean surveyCompleted;     // 설문조사 완료 여부
    private String redirectTo;           // 리다이렉트 경로 ("SURVEY" or "MAIN")

    private LocalDateTime lastLoginAt;
    private String message;
}