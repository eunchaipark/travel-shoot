package com.quadrant.travelshoot.domains.ai.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.quadrant.travelshoot.domains.survey.enums.ActivityCategory;
import com.quadrant.travelshoot.domains.survey.enums.FoodCategory;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class SpotCategorizationService {

    private final OpenAIService openAIService;
    private final ObjectMapper objectMapper;

    @Data
    @AllArgsConstructor
    public static class SpotCategoryInfo {
        private String category;
        private String summary;
        private BigDecimal rating;
    }


    public SpotCategoryInfo getCategoryAndSummary(String placeName, String categoryName, boolean isRestaurant) {
        try {
            log.info("장소 카테고리 분석 시작 - placeName: {}, categoryName: {}", placeName, categoryName);

            String categories = isRestaurant
                    ? Arrays.stream(FoodCategory.values())
                    .map(Enum::name)
                    .collect(Collectors.joining(","))
                    : Arrays.stream(ActivityCategory.values())
                    .map(Enum::name)
                    .collect(Collectors.joining(","));

            // 극도로 짧은 프롬프트
            String userPrompt = String.format(
                    "%s (%s)\nPick 1: %s\nJSON:{\"category\":\"\",\"summary\":\"\",\"rating\":4.0}",
                    placeName,
                    categoryName,
                    categories
            );

            String systemPrompt = "Return JSON only. Summary in natural Korean with spaces between words, max 30 chars.";
            String gptResponse = openAIService.callGPT(systemPrompt, userPrompt);

            log.info("GPT 응답: {}", gptResponse);

            SpotCategoryInfo categoryInfo = objectMapper.readValue(gptResponse, SpotCategoryInfo.class);

            return categoryInfo;

        } catch (Exception e) {
            log.error("AI 카테고리 분류 실패 - placeName: {}, error: {}", placeName, e.getMessage());
            return getFallbackCategory(placeName, categoryName, isRestaurant);
        }
    }

    private SpotCategoryInfo getFallbackCategory(String placeName, String categoryName, boolean isRestaurant) {
        log.info("폴백 카테고리 사용");
        String category;
        if (isRestaurant) {
            if (categoryName.contains("한식")) category = "한식";
            else if (categoryName.contains("중식")) category = "중식";
            else if (categoryName.contains("일식")) category = "일식";
            else if (categoryName.contains("양식")) category = "양식";
            else if (categoryName.contains("카페")) category = "카페";
            else if (categoryName.contains("해산물")) category = "해산물";
            else if (categoryName.contains("고기")) category = "고기";
            else category = "한식";
        } else {
            if (categoryName.contains("자연")) category = "자연관광";
            else if (categoryName.contains("문화")) category = "문화체험";
            else if (categoryName.contains("레포츠")) category = "레포츠";
            else if (categoryName.contains("쇼핑")) category = "쇼핑";
            else category = "자연관광";
        }
        return new SpotCategoryInfo(category, placeName + " 추천", BigDecimal.valueOf(4.0));
    }
}