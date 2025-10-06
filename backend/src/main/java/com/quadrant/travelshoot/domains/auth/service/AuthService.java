package com.quadrant.travelshoot.domains.auth.service;

import com.quadrant.travelshoot.domains.auth.dto.request.*;
import com.quadrant.travelshoot.domains.auth.dto.response.LoginResponse;
import com.quadrant.travelshoot.domains.auth.dto.response.PasswordResetResponse;
import com.quadrant.travelshoot.domains.auth.dto.response.SignupResponse;
import jakarta.servlet.http.HttpSession;

//  인증 인터페이스
public interface AuthService {

    //  회원가입
    SignupResponse signup(SignupRequest request);

    //  로그인
    LoginResponse login(LoginRequest request, HttpSession session);

    //  이메일 중복 확인
    boolean checkEmailDuplicate(String email);

    //  비밀번호 재설정
    PasswordResetResponse resetPassword(PasswordResetRequest request);
}
