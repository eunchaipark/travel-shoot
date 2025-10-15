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
            .formLogin(login -> login.disable())
            .httpBasic(basic -> basic.disable())
            .authorizeHttpRequests(auth -> auth
//                  //여기 아래에 추가하면 됩니다요
//                .requestMatchers("/api/auth/**", "/api/survey/**" ,"/api/search/**" ).permitAll()
//                .requestMatchers("/api/reservations/init/**").permitAll()  // 예약 초기 데이터
//                .requestMatchers("/api/reservations/calculate-price").permitAll()  // 가격 계산
//                .requestMatchers("/api/reservations/validate-availability").permitAll()  // 가용성 체크
//                .requestMatchers("/api/reservations/transport-options").permitAll()  // 교통수단 선택
//
//                .anyRequest().authenticated()
//                .requestMatchers("/api/reservations/**").authenticated()  // 나머지 예약 API는 인증 필요 TODO : 예약결제 API 테스트는 로그인이 완료된 상태에서 작동해서 테스트가 가능하게 되어있는데 전체 허용 말고 주석 제거하고 구분해서 테스트해야 정상작동함.


//                // 개발 단계니까 우선 모든 API 열어두기
                .requestMatchers("/api/**").permitAll()
                .anyRequest().permitAll()
            );
        
        return http.build();
    }
}