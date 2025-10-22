package com.quadrant.travelshoot.domains.auth.controller;

import com.quadrant.travelshoot.domains.auth.dto.request.*;
import com.quadrant.travelshoot.domains.auth.dto.response.LoginResponse;
import com.quadrant.travelshoot.domains.auth.dto.response.PasswordResetResponse;
import com.quadrant.travelshoot.domains.auth.dto.response.SignupResponse;
import com.quadrant.travelshoot.domains.auth.service.AuthService;
import com.quadrant.travelshoot.domains.auth.service.EmailAuthService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Map;

// 인증 API 
@Slf4j
@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;
    private final EmailAuthService emailAuthService;

    //  회원가입
    @PostMapping("/signup")
    public ResponseEntity<SignupResponse> signup(@Valid @RequestBody SignupRequest request) {
        log.info("회원가입 요청: {}", request.getEmail());

        SignupResponse response = authService.signup(request);

        return ResponseEntity.ok(response);
    }

    //  로그인
    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@Valid @RequestBody LoginRequest request, HttpSession session) {
        log.info("로그인 요청: {}", request.getEmail());

        LoginResponse response = authService.login(request, session);

        return ResponseEntity.ok(response);
    }

    // 세션 확인 (로그인 상태 체크)
    @GetMapping("/session")
    public ResponseEntity<?> checkSession(HttpSession session) {
        log.info("세션 확인 요청");

        // 세션에서 userId 확인
        Long userId = (Long) session.getAttribute("userId");

        if (userId != null) {
            // 유저 정보 조회해서 반환
            String userEmail = (String) session.getAttribute("userEmail");
            String userName = (String) session.getAttribute("userName");

            log.info("세션 유효 - 로그인 상태: {}", userEmail);

            return ResponseEntity.ok(Map.of(
                    "userId", userId,
                    "email", userEmail,
                    "userName", userName
            ));
        }

        log.info("세션 없음 - 비로그인 상태");
        return ResponseEntity.status(401).build();
    }

    //  이메일 중복 확인 
    @GetMapping("/check-email")
    public ResponseEntity<Map<String, Object>> checkEmail(
            @RequestParam String email) {
        log.info("이메일 중복 확인: {}", email);

        boolean isDuplicate = authService.checkEmailDuplicate(email);

        return ResponseEntity.ok(Map.of(
                "email", email,
                "available", !isDuplicate,
                "message", isDuplicate ?
                        "이미 사용 중인 이메일입니다" :
                        "사용 가능한 이메일입니다"
        ));
    }

    //  gmail 인증 코드 발송
    @PostMapping("/email/send-code")
    public ResponseEntity<Map<String, String>> sendVerificationCode(@RequestParam String email) {
        log.info("인증 코드 발송 요청: {}", email);

        if (authService.checkEmailDuplicate(email)) {
            return ResponseEntity.badRequest()
                    .body(Map.of("message", "이미 사용 중인 이메일입니다"));
        }

        emailAuthService.sendVerificationCode(email, "signup");

        return ResponseEntity.ok(Map.of(
                "message", "인증 코드가 발송되었습니다",
                "email", email
        ));
    }

    //  gmail 인증 코드 검사 
    @PostMapping("/email/verify-code")
    public ResponseEntity<Map<String, Object>> verifyCode(
            @Valid @RequestBody EmailAuthRequest request) {

        boolean verified = emailAuthService.verifyCode(
                request.getEmail(),
                request.getCode()
        );

        if (verified) {
            return ResponseEntity.ok(Map.of(
                    "verified", true,
                    "message", "이메일 인증이 완료되었습니다",
                    "email", request.getEmail()
            ));
        } else {
            return ResponseEntity.badRequest().body(Map.of(
                    "verified", false,
                    "message", "인증 코드가 유효하지 않거나 만료되었습니다",
                    "email", request.getEmail()
            ));
        }
    }

    //  비밀번호 재설정 요청
    @PostMapping("/password/reset-request")
    public ResponseEntity<Map<String, String>> requestPasswordReset(@RequestParam String email) {
        log.info("비밀번호 재설정 요청: {}", email);

        if (!authService.checkEmailDuplicate(email)) {
            return ResponseEntity.badRequest()
                    .body(Map.of("message", "존재하지 않는 이메일입니다"));
        }

        emailAuthService.sendVerificationCode(email, "password-reset");

        return ResponseEntity.ok(Map.of(
                "message", "인증 코드가 발송되었습니다",
                "email", email
        ));
    }

    //  비밀번호 재설정 진행
    @PostMapping("/password/reset")
    public ResponseEntity<PasswordResetResponse> resetPassword(@Valid @RequestBody PasswordResetRequest request) {
        log.info("비밀번호 재설정: {}", request.getEmail());

        PasswordResetResponse response = authService.resetPassword(request);

        return ResponseEntity.ok(response);
    }

    //TODO : 로그아웃 메서드 추가하라고 했던거
    @PostMapping("/logout")
    public ResponseEntity<Map<String, String>> logout(HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");

        if (userId != null) {
            log.info("로그아웃: userId={}", userId);
        } else {
            log.info("로그아웃: 세션 없음 (이미 만료됨)");
        }

        try {
            // 세션 무효화
            session.invalidate();

            // Spring Security 컨텍스트 정리
            SecurityContextHolder.clearContext();

            return ResponseEntity.ok(Map.of("message", "로그아웃 성공"));
        } catch (IllegalStateException e) {
            // 이미 무효화된 세션
            log.warn("이미 무효화된 세션");
            return ResponseEntity.ok(Map.of("message", "이미 로그아웃됨"));
        }
    }
}