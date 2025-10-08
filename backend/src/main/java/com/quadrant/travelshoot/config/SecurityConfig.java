package com.quadrant.travelshoot.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(auth -> auth
                  //여기 아래에 추가하면 됩니다요
//                .requestMatchers("/api/auth/**").permitAll()           // 인증 API
//                .requestMatchers("/api/survey/**").permitAll()         // 설문조사 API
//                .requestMatchers("/api/main/recommendations").permitAll()  // 개인화 추천
//                .requestMatchers("/api/main/budget-friendly").permitAll()  // 가격착한 숙소
//                .requestMatchers("/api/main/trending").permitAll()         // 트렌딩 (나중에)
//                .anyRequest().authenticated()

                // 개발 단계니까 우선 모든 API 열어두기
                .requestMatchers("/api/**").permitAll()
                .anyRequest().permitAll()
            );
        
        return http.build();
    }
}