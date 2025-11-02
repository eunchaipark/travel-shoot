package com.quadrant.travelshoot.domains.ai.service;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.quadrant.travelshoot.domains.ai.dto.response.ReviewAiSummaryResponse;
import com.quadrant.travelshoot.domains.review.entity.Review;
import com.quadrant.travelshoot.domains.review.entity.ReviewAiSummary;
import com.quadrant.travelshoot.domains.review.repository.ReviewAiSummaryRepository;
import com.quadrant.travelshoot.domains.review.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class ReviewAiSummaryService {

    private final OpenAIService openAIService;
    private final ReviewRepository reviewRepository;
    private final ReviewAiSummaryRepository reviewAiSummaryRepository;
    private final ObjectMapper objectMapper;

    // 요약 결과 응답
    public ReviewAiSummaryResponse generateAiSummary(Long stayId, int currentReviewCount, ReviewAiSummary existingSummary) {

        // 리뷰 데이터 최근 10개 조회
//            List<Review> reviews = reviewRepository.findTop10ByStayIdOrderByCreatedAtDesc(stayId);

        // 리뷰 데이터 최근 5개 조회
        List<Review> reviews = reviewRepository.findTop5ByStayIdOrderByCreatedAtDesc(stayId);

        // 리뷰 내용만 추출
        String reviewContents = reviews.stream()
                .map(Review::getReviewContent)
                .collect(Collectors.joining("\n- ", "- ", ""));

        // 시스템 프롬프트
        String systemPrompt = """
                당신은 숙소 리뷰를 분석하는 전문가입니다.
                제공된 리뷰들을 바탕으로 해당 숙소의 주요 장점과 단점을 분석하여 반드시 JSON 형식으로 응답해주세요.
                """;

        // 사용자 프롬프트
        String userPrompt = String.format("""
                아래 제공된 리뷰를 장점과 단점 중심으로 요약해주세요.
                
                리뷰 내용:
                %s
                
                요구사항:
                1. 장점(positive_summary): 숙소의 좋은 점을 2-3줄로 요약
                2. 단점(negative_summary): 숙소의 불편하거나 아쉬운 점을 2-3줄로 요약
                
                반드시 아래 JSON 형식으로만 응답해주세요:
                {
                  "positive_summary": "장점 요약 내용",
                  "negative_summary": "단점 요약 내용"
                }
                """, reviewContents);

        // OpenAI API 호출
        String response = openAIService.callGPT(systemPrompt, userPrompt);
        log.info("AI 요약 생성 완료: {}", response);

        // json 변환
        ReviewAiSummaryResponse aiSummaryResponse = parseResponse(response);

        // 기존 요약 업데이트 or 새로 생성
        if (existingSummary != null) {
//            existingSummary.updateSummary(response, currentReviewCount);

            existingSummary.updateStructuredSummary(
                    aiSummaryResponse.getPositiveSummary(),
                    aiSummaryResponse.getNegativeSummary(),
                    currentReviewCount
            );
            reviewAiSummaryRepository.save(existingSummary);
        } else {
            ReviewAiSummary newSummary = ReviewAiSummary.builder()
                    .stayId(stayId)
//                    .overallSummary(response)
                    .positiveSummary(aiSummaryResponse.getPositiveSummary())
                    .negativeSummary(aiSummaryResponse.getNegativeSummary())
                    .reviewCount(currentReviewCount)
                    .build();
            reviewAiSummaryRepository.save(newSummary);
        }

        return aiSummaryResponse;
    }

    /**
     * OpenAI 응답을 파싱하여 DTO로 변환
     */
    private ReviewAiSummaryResponse parseResponse(String response) {
        try {
            // JSON 응답에서 코드 블록 제거 (```json ... ``` 형식 처리)
            String cleanedResponse = response
                    .replaceAll("```json\\s*", "")
                    .replaceAll("```\\s*", "")
                    .trim();

            return objectMapper.readValue(cleanedResponse, ReviewAiSummaryResponse.class);
        } catch (JsonProcessingException e) {
            log.error("JSON 파싱 실패. 원본 응답: {}", response, e);

            // 파싱 실패 시 기본값 반환
            return ReviewAiSummaryResponse.builder()
                    .positiveSummary(response)
                    .negativeSummary("분석 중 오류가 발생했습니다.")
                    .build();
        }
    }

}
