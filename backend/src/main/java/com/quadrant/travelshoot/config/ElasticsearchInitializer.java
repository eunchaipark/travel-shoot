package com.quadrant.travelshoot.config;

import com.quadrant.travelshoot.domains.stay.service.StayIndexingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

@Slf4j
@Configuration
@RequiredArgsConstructor
public class ElasticsearchInitializer {

    private final StayIndexingService stayIndexingService;

    @Bean
    @Profile("!test")  // 테스트 환경에서는 실행 안 함
    public CommandLineRunner initializeElasticsearch() {
        return args -> {
            try {
                log.info("🚀 Elasticsearch 초기 데이터 색인 시작...");
                stayIndexingService.reindexAll();
                log.info("✅ Elasticsearch 초기 데이터 색인 완료!");
            } catch (Exception e) {
                log.error("❌ Elasticsearch 초기 색인 실패: {}", e.getMessage());
            }
        };
    }
}