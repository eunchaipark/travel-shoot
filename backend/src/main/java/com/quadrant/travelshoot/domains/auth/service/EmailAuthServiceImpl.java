package com.quadrant.travelshoot.domains.auth.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

//  이메일 인증 방식 - 고민 (메모리 기반 방식 구현했는데 / redis vs  이메일 인증 테이블 새로 생성 방식 구현이 더 알맞는지.. )
@Slf4j
@Service
@RequiredArgsConstructor
public class EmailAuthServiceImpl implements EmailAuthService {

    private final JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String fromEmail;

    // 메모리에 저장
    private final Map<String, AuthCode> authCodeStore = new ConcurrentHashMap<>();
    private final Map<String, LocalDateTime> verifiedEmails = new ConcurrentHashMap<>();

    private static final SecureRandom random = new SecureRandom();

    //  인증코드 발송
    @Override
    public void sendVerificationCode(String email, String purpose) {
        // 6자리 랜덤 코드 생성
        String code = String.format("%06d", random.nextInt(1000000));
        LocalDateTime expiresAt = LocalDateTime.now().plusMinutes(5);

        // 메모리에 저장
        authCodeStore.put(email, new AuthCode(code, expiresAt));

        // 이메일 발송
        sendEmail(email, code, purpose);

        log.info("✅ 인증 코드 발송: {} -> {}", email, code);
    }

    // gmail 발송하기
    private void sendEmail(String to, String code, String purpose) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(to);

            if ("signup".equals(purpose)) {
                message.setSubject("✈ [Travel Shoot] 회원가입 인증");
                message.setText(
                        "안녕하세요, Travel Shoot입니다.\n\n" +
                                "회원가입 인증 코드: " + code + "\n\n" +
                                "이 코드는 5분간 유효합니다.\n" +

                                "감사합니다.\n" +
                                "Travel Shoot - 팀 사분면"
                );
            } else if ("password-reset".equals(purpose)) {
                message.setSubject("[Travel Shoot] 비밀번호 재설정");
                message.setText(
                        "안녕하세요, Travel Shoot입니다.\n\n" +
                                "비밀번호 재설정 인증 코드: " + code + "\n\n" +
                                "이 코드는 5분간 유효합니다.\n" +
                                "본인이 요청하지 않았다면 즉시 비밀번호를 변경하세요.\n\n" +
                                "감사합니다.\n" +
                                "Travel Shoot - 팀 사분면"
                );
            } else {
                message.setSubject("📧 [Travel Shoot] 이메일 인증");
                message.setText("인증 코드: " + code + "\n\n⏰ 5분간 유효합니다.");
            }

            mailSender.send(message);
            log.info("이메일 발송 성공: {}", to);

        } catch (Exception e) {
            log.error("이메일 발송 실패: {}", to, e);
            throw new RuntimeException("이메일 발송에 실패했습니다");
        }
    }

    // gmail  인증코드 검증 로직
    @Override
    public boolean verifyCode(String email, String code) {
        AuthCode authCode = authCodeStore.get(email);

        if (authCode == null) {
            return false;
        }

        if (authCode.isExpired()) {
            authCodeStore.remove(email);
            return false;
        }

        if (!authCode.code.equals(code)) {
            return false;
        }

        // 인증 성공
        verifiedEmails.put(email, LocalDateTime.now());
        authCodeStore.remove(email);

        log.info(" 이메일 인증 완료 : {}", email);
        return true;
    }

    // gmail 인증 완료 여부 체크
    @Override
    public boolean isVerified(String email) {
        LocalDateTime verifiedAt = verifiedEmails.get(email);
        if (verifiedAt == null) {
            return false;
        }

        // 30분 이내만 유효
        if (verifiedAt.isBefore(LocalDateTime.now().minusMinutes(30))) {
            verifiedEmails.remove(email);
            return false;
        }

        return true;
    }

    // gmail 인증 코드 저장
    private static class AuthCode {
        private final String code;
        private final LocalDateTime expiresAt;

        public AuthCode(String code, LocalDateTime expiresAt) {
            this.code = code;
            this.expiresAt = expiresAt;
        }

        public boolean isExpired() {
            return LocalDateTime.now().isAfter(expiresAt);
        }
    }
}