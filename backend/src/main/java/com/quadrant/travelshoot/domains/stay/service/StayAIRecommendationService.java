package com.quadrant.travelshoot.domains.stay.service;

import java.util.concurrent.CompletableFuture;

import com.quadrant.travelshoot.domains.stay.dto.response.AIRecommendationResponse;

/**
 * AI 기반 숙소 추천 서비스
 * - Redis 캐싱
 * - 예약 건수 변화 감지
 * - OpenAI 호출 (비동기)
 * - 폴백 처리
 */
public interface StayAIRecommendationService {
    
    AIRecommendationResponse getAIRecommendations(Long userId);

    CompletableFuture<Void> createCacheOnSurveyComplete(Long userId);
}