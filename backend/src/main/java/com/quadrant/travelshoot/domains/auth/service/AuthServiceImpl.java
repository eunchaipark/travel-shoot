package com.quadrant.travelshoot.domains.auth.service;

import com.quadrant.travelshoot.domains.user.entity.User;
import com.quadrant.travelshoot.domains.user.repository.UserRepository;
import com.quadrant.travelshoot.domains.auth.dto.request.*;
import com.quadrant.travelshoot.domains.auth.dto.response.LoginResponse;
import com.quadrant.travelshoot.domains.auth.dto.response.PasswordResetResponse;
import com.quadrant.travelshoot.domains.auth.dto.response.SignupResponse;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;

import java.util.Collections;
import java.time.LocalDateTime;

//  인증
@Slf4j
@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {

    private final UserRepository userRepository;
    private final EmailAuthService emailAuthService;
    private final PasswordEncoder passwordEncoder;

    //  회원가입
    @Override
    @Transactional
    public SignupResponse signup(SignupRequest request) {
        // 이메일 중복 확인
        if (userRepository.existsByEmail(request.getEmail())) {
            throw new IllegalArgumentException("이미 사용 중인 이메일입니다");
        }

        // 이메일 인증 확인
        if (!emailAuthService.isVerified(request.getEmail())) {
            throw new IllegalArgumentException("이메일 인증이 필요합니다");
        }

        // 사용자 생성
        User user = User.builder()
                .email(request.getEmail())
                .password(passwordEncoder.encode(request.getPassword()))
                .userName(request.getUserName())
                .emailVerified(true)
                .build();

        User savedUser = userRepository.save(user);

        log.info("회원가입 완료: {}", savedUser.getEmail());

        return SignupResponse.builder()
                .userId(savedUser.getId())
                .email(savedUser.getEmail())
                .userName(savedUser.getUserName())
                .emailVerified(savedUser.getEmailVerified())
                .surveyRequired(true)
                .surveyCompleted(false)
                .nextStep("SURVEY")
                .createdAt(savedUser.getCreatedAt())
                .message("회원가입이 완료되었습니다. 설문조사를 진행해주세요.")
                .build();
    }

    //  로그인
    @Override
    @Transactional
    public LoginResponse login(LoginRequest request, HttpSession session) {
        User user = userRepository.findByEmail(request.getEmail())
//                .filter(u -> u.getExpiredAt() == null) // 만료되지 않은 사용자만    1005
                .orElseThrow(() -> new IllegalArgumentException(
                        "이메일 또는 비밀번호가 일치하지 않습니다"
                ));

        // 비밀번호 확인
        if (!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            log.warn("로그인 실패 - 비밀번호 불일치: {}", request.getEmail());
            throw new IllegalArgumentException(
                    "이메일 또는 비밀번호가 일치하지 않습니다"
            );
        }

        // 이메일 인증 확인
        if (!user.getEmailVerified()) {
            throw new IllegalArgumentException("이메일 인증이 필요합니다");
        }

        // 세션에 저장!!!!!
        session.setAttribute("userId", user.getId());
        session.setAttribute("userEmail", user.getEmail());
        session.setAttribute("userName", user.getUserName());

        // Spring Security에 인증 정보 저장
        UsernamePasswordAuthenticationToken authentication =
                new UsernamePasswordAuthenticationToken(
                        user.getId().toString(),  // principal (사용자 ID를 String으로)
                        null,  // credentials (비밀번호는 저장하지 않음)
                        Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER"))  // 권한
                );

        SecurityContext securityContext = SecurityContextHolder.createEmptyContext();
        securityContext.setAuthentication(authentication);
        SecurityContextHolder.setContext(securityContext);

        //세션에 SecurityContext 저장
        session.setAttribute(
                HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY,
                securityContext
        );

        // 마지막 로그인 시간 업데이트
//        user.setLastLoginAt(LocalDateTime.now()); //1005
        userRepository.save(user);

        log.info("로그인 성공: {}", user.getEmail());

        boolean surveyCompleted = false; // TODO: 실제 UserSurveyRepository 조회

        return LoginResponse.builder()
                .userId(user.getId())
                .email(user.getEmail())
                .userName(user.getUserName())
                .surveyCompleted(surveyCompleted)
                .redirectTo(surveyCompleted ? "MAIN" : "SURVEY")
//                .lastLoginAt(user.getLastLoginAt())  //1005
                .message("로그인 성공")
                .build();
    }

    //  이메일 중복 확인
    @Override
    @Transactional(readOnly = true)
    public boolean checkEmailDuplicate(String email) {
        return userRepository.existsByEmail(email);
    }

    //  비밀번호 재설정
    @Override
    @Transactional
    public PasswordResetResponse resetPassword(PasswordResetRequest request) {

        if (!emailAuthService.isVerified(request.getEmail())) {
            throw new IllegalArgumentException("이메일 인증이 필요합니다.");
        }

        User user = userRepository.findByEmail(request.getEmail())
//                .filter(u -> u.getExpiredAt() == null)  //1005
                .orElseThrow(() -> new IllegalArgumentException("해당 이메일로 가입된 사용자가 존재하지 않습니다."));

        user.setPassword(passwordEncoder.encode(request.getNewPassword()));
        userRepository.save(user);

        log.info("비밀번호 재설정 완료: {}", user.getEmail());

        return PasswordResetResponse.builder()
                .email(user.getEmail())
                .passwordChangedAt(LocalDateTime.now())
                .message("비밀번호가 변경되었습니다")
                .build();
    }
}
