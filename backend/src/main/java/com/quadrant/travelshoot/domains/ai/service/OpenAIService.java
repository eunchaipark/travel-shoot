package com.quadrant.travelshoot.domains.ai.service;


import com.quadrant.travelshoot.domains.ai.dto.request.GPTRequest;
import com.quadrant.travelshoot.domains.ai.dto.response.GPTResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;

import jakarta.annotation.PostConstruct;
import java.util.Map;

@Slf4j
@Service
public class OpenAIService {

    private WebClient webClient;

    @Value("${openai.api.key}")
    private String apiKey;

    @Value("${openai.api.url}")
    private String apiUrl;

    @Value("${openai.api.model}")
    private String model;

    @PostConstruct
    public void init() {
        this.webClient = WebClient.builder().build();
        log.info("WebClient 초기화 완료");
    }

    public String callGPT(String systemPrompt, String userPrompt) {
        try {
            log.info("GPT API 호출 시작");
            log.info("사용 모델: {}", model);

            GPTRequest request = GPTRequest.builder()
                    .model(model)
                    .input(systemPrompt + "\n\n" + userPrompt)
                    .reasoning(Map.of("effort", "minimal"))
                    .build();

            GPTResponse response = webClient.post()
                    .uri(apiUrl)
                    .header("Authorization", "Bearer " + apiKey)
                    .header("Content-Type", "application/json")
                    .bodyValue(request)
                    .retrieve()
                    .bodyToMono(GPTResponse.class)
                    .block();

            if (response != null) {
                String content = null;
                if (response.getOutput() != null && !response.getOutput().isEmpty()) {
                    for (GPTResponse.Output outputItem : response.getOutput()) {
                        if ("message".equals(outputItem.getType()) &&
                                outputItem.getContent() != null &&
                                !outputItem.getContent().isEmpty()) {

                            for (GPTResponse.Content contentItem : outputItem.getContent()) {
                                if (contentItem.getText() != null) {
                                    content = contentItem.getText();
                                    break;
                                }
                            }
                            if (content != null) break;
                        }
                    }
                    log.info("GPT-5 output 응답 수신");
                }

                if (content != null && !content.isEmpty()) {
                    log.info("GPT 응답 수신 성공 - 길이: {}", content.length());
                    return content.trim();
                }
            }


            log.warn("GPT 응답이 비어있음");
            throw new RuntimeException("GPT 응답이 비어있습니다.");

        } catch (WebClientResponseException e) {
            log.error("OpenAI API 에러 응답: {}", e.getResponseBodyAsString());
            log.error("HTTP 상태 코드: {}", e.getStatusCode());
            throw new RuntimeException("GPT API 호출 실패: " + e.getMessage(), e);
        } catch (Exception e) {
            log.error("GPT 호출 실패: {}", e.getMessage(), e);
            throw new RuntimeException("GPT 호출 실패: " + e.getMessage(), e);
        }
    }
}