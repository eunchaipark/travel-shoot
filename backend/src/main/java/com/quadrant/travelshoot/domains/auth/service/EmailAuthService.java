package com.quadrant.travelshoot.domains.auth.service;

//  이메일인증 - gmail
public interface EmailAuthService {

    //  gmail 인증 코드 발송
    void sendVerificationCode(String email, String purpose);

    //  전송받은 인증 코드 검사
    boolean verifyCode(String email, String code);

    //  인증 코드 확인
    boolean isVerified(String email);
}