package com.quadrant.travelshoot.config;

import com.quadrant.travelshoot.domains.user.entity.User;

import com.quadrant.travelshoot.domains.user.repository.UserRepository;

import lombok.RequiredArgsConstructor;

import lombok.extern.slf4j.Slf4j;

import org.springframework.boot.ApplicationRunner;

import org.springframework.context.annotation.Bean;

import org.springframework.context.annotation.Configuration;

import org.springframework.context.annotation.Profile;

import org.springframework.security.crypto.password.PasswordEncoder;

@Slf4j

@Configuration

@RequiredArgsConstructor

public class TestDataConfig {

    private final UserRepository userRepository;

    private final PasswordEncoder passwordEncoder;

    @Bean

    @Profile({"dev", "local"})

    public ApplicationRunner initTestUser() {

        return args -> {

            String testEmail = "test@test.com";



            if (userRepository.existsByEmail(testEmail)) {

                log.info("테스트 계정이 이미 존재합니다: {}", testEmail);

                return;

            }

            User testUser = User.builder()

                    .email(testEmail)

                    .password(passwordEncoder.encode("Test1234!"))

                    .userName("테스트유저")

                    .emailVerified(true)

                    .build();

            userRepository.save(testUser);



            log.info("========================================");

            log.info("설문조사 테스트 계정 생성 완료!");

            log.info("이메일: test@test.com");

            log.info("비밀번호: Test1234!");

            log.info("설문조사: 미완료 (테스트 하세여어어엉)");

            log.info("========================================");

        };

    }

}