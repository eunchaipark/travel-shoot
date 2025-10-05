package com.quadrant.travelshoot.domains.auth.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

//  비밀번호 재설정 결과
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PasswordResetResponse {

    private String email;
    private LocalDateTime passwordChangedAt;
    private String message;
}