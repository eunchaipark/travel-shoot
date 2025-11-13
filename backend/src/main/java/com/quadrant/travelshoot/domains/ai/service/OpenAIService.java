package com.quadrant.travelshoot.domains.ai.service;


import com.quadrant.travelshoot.domains.ai.dto.request.GPTRequest;
import com.quadrant.travelshoot.domains.ai.dto.response.GPTResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;

import jakarta.annotation.PostConstruct;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
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
                    .messages(List.of(
                            GPTRequest.Message.builder()
                                    .role("developer")
                                    .content(systemPrompt)
                                    .build(),
                            GPTRequest.Message.builder()
                                    .role("user")
                                    .content(userPrompt)
                                    .build()
                    ))
                    .build();

            GPTResponse response = webClient.post()
                    .uri(apiUrl)
                    .header("Authorization", "Bearer " + apiKey)
                    .header("Content-Type", "application/json")
                    .bodyValue(request)
                    .retrieve()
                    .bodyToMono(GPTResponse.class)
                    .block();

            if (response != null && !response.getChoices().isEmpty()) {
                String content = response.getChoices().get(0).getMessage().getContent();
                log.info("GPT 응답 수신 성공");

                if (response.getUsage() != null && response.getUsage().getCompletionTokensDetails() != null) {
                    log.info("토큰 사용량 - reasoning: {}",
                            response.getUsage().getCompletionTokensDetails().getReasoningTokens());
                }

                return content != null ? content.trim() : "";
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