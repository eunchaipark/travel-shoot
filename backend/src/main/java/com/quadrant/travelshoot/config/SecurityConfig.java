package com.quadrant.travelshoot.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;
import java.util.List;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Value("${cors.allowed-origins:http://localhost:3000}")
    private String allowedOrigins;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();

        // 배포에 맞춰서 수정함
        List<String> origins = Arrays.asList(allowedOrigins.split(","));
        configuration.setAllowedOrigins(origins);

        configuration.setAllowedMethods(Arrays.asList(
                "GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS"
        ));

        configuration.setAllowedHeaders(Arrays.asList("*"));
        configuration.setAllowCredentials(true);
        configuration.setMaxAge(3600L);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .cors(cors -> cors.configurationSource(corsConfigurationSource()))
                .csrf(csrf -> csrf.disable())
                .formLogin(login -> login.disable())
                .httpBasic(basic -> basic.disable())
                .sessionManagement(session -> session
                        .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
                        .maximumSessions(1)
                )

                .authorizeHttpRequests(auth -> auth

                        // 로그인 없이 접근 가능한 페이지들

                        // 인증 API
                        .requestMatchers("/api/auth/signup", "/api/auth/login", "/api/auth/check-email",
                                "/api/auth/email/**", "/api/auth/password/**").permitAll()

                        // 숙소 검색/조회
                        .requestMatchers("/api/stays/**").permitAll()

                        // 예약 초기 숙소 정보 데이터
                        .requestMatchers("/api/reservations/init/**",
                                "/api/reservations/calculate-price",
                                "/api/reservations/validate-availability",
                                "/api/reservations/transport-options").permitAll()

                        // 메인페이지 캘린더 코스
                        .requestMatchers("/api/reservations/calendar-courses/**").permitAll()

                        // 리뷰 조회
                        .requestMatchers("GET", "/api/reviews/ai-summary/**").permitAll()
                        .requestMatchers("GET", "/api/reviews/stays/**").permitAll()
                        .requestMatchers("GET", "/api/reviews/*/review-images").permitAll()

                        // 맛집/관광지
                        .requestMatchers("/api/restaurants/**", "/api/activities/**").permitAll()

                        // 결제 API
                        .requestMatchers("/api/payment/**").permitAll()

                        //로그인 후 접근 가능한 페이지들

                        // 인증 상태 & 로그아웃
                        .requestMatchers("/api/auth/session", "/api/auth/logout").authenticated()

                        // 사용자 정보
                        .requestMatchers("/api/user/**").authenticated()

                        // 설문조사
                        .requestMatchers("/api/signup-complete/**").authenticated()

                        // 예약 생성/관리
                        .requestMatchers("/api/reservations/create", "/api/reservations/confirm/**",
                                "/api/reservations/my", "/api/reservations/my/**",
                                "/api/reservations/detail/**", "/api/reservations/list",
                                "/api/reservations/upcoming", "/api/reservations/review-targets").authenticated()

                        // 예약 취소
                        .requestMatchers("DELETE", "/api/reservations/**").authenticated()
                        .requestMatchers("PUT", "/api/reservations/cancel").authenticated()

                        // 리뷰 작성/수정/삭제
                        .requestMatchers("POST", "/api/reviews/**").authenticated()
                        .requestMatchers("PUT", "/api/reviews/**").authenticated()
                        .requestMatchers("DELETE", "/api/reviews/**").authenticated()
                        .requestMatchers("GET", "/api/reviews/reservations/**").authenticated()

                        // AI 여행 코스
                        .requestMatchers("/api/ai/**").authenticated()

                        // 파일 업로드
                        .requestMatchers("/api/files/**", "/api/images/upload").authenticated()
                        .requestMatchers("DELETE", "/api/images/**").authenticated()

                        // 나머지
                        .anyRequest().authenticated()
                );

        return http.build();
    }
}