package com.quadrant.travelshoot.domains.ai.service;


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

    // 요약 결과 응답
    public String generateAiSummary(Long stayId, int currentReviewCount, ReviewAiSummary existingSummary) {

            // 리뷰 데이터 최근 10개 조회
            List<Review> reviews = reviewRepository.findTop10ByStayIdOrderByCreatedAtDesc(stayId);

            // 리뷰 내용만 추출
            String reviewContents = reviews.stream()
                    .map(Review::getReviewContent)
                    .collect(Collectors.joining("\n- ", "- ", ""));

            // 시스템 프롬프트
            String systemPrompt = """
                    당신은 숙소 리뷰를 분석하는 전문가입니다.
                    제공된 리뷰들을 바탕으로 해당 숙소의 주요 장점과 단점을 중심으로 요약해주세요.
                    """;

            // 사용자 프롬프트
            String userPrompt = String.format("""
                    지시: 아래 제공된 리뷰를 장점과 단점 중심으로 요약해주세요.
                    예시: 예를 들어, '숙소가 깨끗하고 주차 시설이 잘 되어있음'
                    맥락: 리뷰는 숙소에 대한 것이며, 사용자 경험에 초점을 맞춥니다.
                    리뷰: %s
                    질문: 이 리뷰를 바탕으로 해당 숙소의 각 주요 장점과 단점을 2줄 이내로 간결하게 요약해주세요.
                    """, reviewContents);

            // OpenAI API 호출
            String response = openAIService.callGPT(systemPrompt, userPrompt);
            log.info("AI 요약 생성 완료");

        // 기존 요약 업데이트 or 새로 생성
        if (existingSummary != null) {
            existingSummary.updateSummary(response, currentReviewCount);
            reviewAiSummaryRepository.save(existingSummary);
        } else {
            ReviewAiSummary newSummary = ReviewAiSummary.builder()
                    .stayId(stayId)
                    .overallSummary(response)
                    .reviewCount(currentReviewCount)
                    .build();
            reviewAiSummaryRepository.save(newSummary);
        }

        return response;
    }
}
