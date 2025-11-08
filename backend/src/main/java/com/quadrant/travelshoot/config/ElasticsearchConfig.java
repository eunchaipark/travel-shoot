package com.quadrant.travelshoot.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;

@Configuration
@EnableElasticsearchRepositories(basePackages = "com.quadrant.travelshoot.domains.stay.repository")
public class ElasticsearchConfig {
    // Spring Boot Auto-configuration이 자동으로 처리
}