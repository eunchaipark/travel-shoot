package com.quadrant.travelshoot.config;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.json.jackson.JacksonJsonpMapper;
import co.elastic.clients.transport.rest_client.RestClientTransport;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.elasticsearch.client.RestClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;

@Configuration
@EnableElasticsearchRepositories(basePackages = "com.quadrant.travelshoot.domains.stay.repository")
public class ElasticsearchConfig {
    
    @Bean
    public ElasticsearchClient elasticsearchClient(RestClient restClient) {
        // ObjectMapper에 JavaTimeModule 등록
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
        objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
        
        // JacksonJsonpMapper 생성
        JacksonJsonpMapper jsonpMapper = new JacksonJsonpMapper(objectMapper);
        
        // RestClientTransport 생성
        RestClientTransport transport = new RestClientTransport(restClient, jsonpMapper);
        
        // ElasticsearchClient 생성
        return new ElasticsearchClient(transport);
    }
}