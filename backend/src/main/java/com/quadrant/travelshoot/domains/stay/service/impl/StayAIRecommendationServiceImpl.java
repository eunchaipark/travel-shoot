package com.quadrant.travelshoot.domains.stay.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.quadrant.travelshoot.domains.ai.service.StayRecommendationAIService;
import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import com.quadrant.travelshoot.domains.common.repository.FileUploadRepository;
import com.quadrant.travelshoot.domains.reservation.service.ReservationService;
import com.quadrant.travelshoot.domains.stay.dto.cache.StayRecommendationCache;
import com.quadrant.travelshoot.domains.stay.dto.response.AIRecommendationResponse;
import com.quadrant.travelshoot.domains.stay.dto.response.AIStayResponse;
import com.quadrant.travelshoot.domains.stay.dto.response.StayRecommendationResponse;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;
import com.quadrant.travelshoot.domains.stay.service.StayAIRecommendationService;
import com.quadrant.travelshoot.domains.stay.service.StayBasedFindService;
import com.quadrant.travelshoot.domains.stay.service.StayRecommendationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class StayAIRecommendationServiceImpl implements StayAIRecommendationService {
    
    private final StayRecommendationService stayRecommendationService;
    private final StayRecommendationAIService stayRecommendationAIService;
    private final ReservationService reservationService;
    private final RedisTemplate<String, StayRecommendationCache> redisTemplate;
    private final ObjectMapper objectMapper;
    private final FileUploadRepository fileUploadRepository;
    private final StayRepository stayRepository;
    private final StayBasedFindService stayBasedFindService;
    
    private static final String CACHE_KEY_PREFIX = "stay:ai:recommendation:";
    private static final Duration CACHE_TTL = Duration.ofDays(90); // 90일
    
    @Override
    public AIRecommendationResponse getAIRecommendations(Long userId) {
        log.info("AI 숙소 추천 시작 - userId: {}", userId);
        
        // 1. Redis 캐시 조회
        String cacheKey = CACHE_KEY_PREFIX + userId;
        StayRecommendationCache cache = redisTemplate.opsForValue().get(cacheKey);
        
        // 2. 현재 완료된 예약 건수 조회
        int currentReservationCount = reservationService.getCompletedReservationCount(userId);
        
        // 3. 캐시 유효성 검증
        if (cache != null && cache.getReservationCount() == currentReservationCount) {
            log.info("Redis 캐시 사용 - userId: {}, 예약건수: {}", userId, currentReservationCount);
            return buildResponseFromCache(cache, true);
        }
        
        // 4. 캐시 없거나 예약 건수 변화 -> AI 호출
        log.info("AI 호출 필요 - userId: {}, 캐시예약건수: {}, 현재예약건수: {}", 
            userId, 
            cache != null ? cache.getReservationCount() : "없음", 
            currentReservationCount);
        
        return generateNewRecommendations(userId, currentReservationCount);
    }
    
    /**
     * 캐시에서 응답 생성
     */
    private AIRecommendationResponse buildResponseFromCache(
            StayRecommendationCache cache, 
            boolean fromCache) {
        
        List<AIStayResponse> stays = cache.getStays().stream()
            .map(cached -> AIStayResponse.builder()
                .id(cached.getStayId())
                .title(cached.getStayName())
                .image(cached.getThumbnailImage())
                .rating(cached.getAverageRating())
                .location(cached.getLocation())
                .price(cached.getMinPrice())
                .checkinTime(cached.getCheckinTime())
                .badge(cached.getBadge())
                .latitude(cached.getLatitude())
                .longitude(cached.getLongitude())
                .stayType(cached.getStayType())
                .reviewCount(cached.getReviewCount())
                .build())
            .collect(Collectors.toList());
        
        return AIRecommendationResponse.builder()
            .stays(stays)
            .totalCount(stays.size())
            .userType(cache.getReservationCount() == 0 ? "NEWBIE" : "EXISTING")
            .fromCache(fromCache)
            .cachedAt(cache.getCachedAt())
            .build();
    }
    
    /**
     * 새로운 추천 생성 (AI 호출)
     */
    private AIRecommendationResponse generateNewRecommendations(Long userId, int reservationCount) {
        try {
            // 1. 기존 필터링 API로 15개 후보 조회
            StayRecommendationResponse.Response filterResult = 
                stayRecommendationService.getRecommendedStays(userId);
            
            // 2. StayScore에서 Stay 추출
            List<StayRecommendationResponse.StaySummary> summaries = filterResult.getStays();
            
            if (summaries.size() < 6) {
                log.warn("후보 숙소 부족 - userId: {}, 후보: {}개", userId, summaries.size());
                // 6개 미만이면 그대로 반환
                return buildResponseFromSummaries(summaries, userId, reservationCount, false);
            }
            
            // 3. StaySummary를 임시 Stay 객체로 변환 (AI 호출용)
            List<Stay> candidates = summaries.stream()
                .map(this::summaryToStay)
                .collect(Collectors.toList());
            
            // 4. OpenAI 호출 (AI 매칭 점수 포함)
            List<Long> selectedIds = callAIWithFallback(candidates, summaries, userId);
            
            // 5. 선정된 숙소만 필터링 (순서 유지)
            Map<Long, StayRecommendationResponse.StaySummary> summaryMap = summaries.stream()
                .collect(Collectors.toMap(
                    StayRecommendationResponse.StaySummary::getStayId,
                    summary -> summary
                ));
            
            List<StayRecommendationResponse.StaySummary> selectedSummaries = selectedIds.stream()
                .map(summaryMap::get)
                .filter(summary -> summary != null)
                .collect(Collectors.toList());
            
            log.info("숙소 기반 추천 조회 시작 - 숙소: {}개", selectedIds.size());
            Map<Long, List<Object>> stayRecommendations = 
                stayBasedFindService.findRecommendations(selectedIds, 2, 2);
            log.info("숙소 기반 추천 조회 완료 - 결과: {}개", stayRecommendations.size());

            // 6. Redis 캐시 저장
            saveSummariesToCache(userId, selectedSummaries, reservationCount);
            
            // 7. 응답 생성
            return buildResponseFromSummaries(selectedSummaries, userId, reservationCount, false);
            
        } catch (Exception e) {
            log.error("AI 추천 생성 실패 - userId: {}", userId, e);
            throw new RuntimeException("AI 숙소 추천 실패", e);
        }
    }

    /**
     * AI 호출 with 폴백
     */
    private List<Long> callAIWithFallback(
            List<Stay> candidates, 
            List<StayRecommendationResponse.StaySummary> summaries,
            Long userId) {
        try {
            return stayRecommendationAIService.selectTop6Stays(candidates, userId);
        } catch (Exception e) {
            log.error("OpenAI 호출 실패 - 폴백 처리: {}", e.getMessage(), e);
            // 폴백: 점수 기반 상위 6개
            return summaries.stream()
                .limit(6)
                .map(StayRecommendationResponse.StaySummary::getStayId)
                .collect(Collectors.toList());
        }
    }
    
    /**
     * StaySummary를 Stay 객체로 변환 (AI 호출용)
     */
    private Stay summaryToStay(StayRecommendationResponse.StaySummary summary) {
        Stay stay = Stay.builder()
            .id(summary.getStayId())
            .name(summary.getStayName())
            .stayType(summary.getStayType())
            .averageRating(summary.getAverageRating() != null ? 
                java.math.BigDecimal.valueOf(summary.getAverageRating()) : null)
            .reviewCount(summary.getReviewCount())
            .build();
        
        // @Transient 필드 설정
        stay.setRegionName(summary.getRegionName());
        stay.setMinPrice(summary.getMinPrice());
        
        return stay;
    }
    
    /**
     * StaySummary 리스트에서 응답 생성
     */
    private AIRecommendationResponse buildResponseFromSummaries(
            List<StayRecommendationResponse.StaySummary> summaries, 
            Long userId,
            int reservationCount,
            boolean fromCache) {
        
        List<AIStayResponse> stayDtos = summaries.stream()
            .map(summary -> {
                // Stay 상세 정보 조회 (이미지, 좌표, 체크인시간 등)
                Stay stay = stayRepository.findById(summary.getStayId())
                    .orElse(null);
                
                if (stay == null) {
                    return null; // 숙소 없으면 제외
                }
                
                // 대표 이미지 조회
                String thumbnailImage = getThumbnailImage(stay.getId());
                
                // location 생성: "지역명 • 상세주소"
                String location = String.format("%s • %s", 
                    summary.getRegionName(), 
                    stay.getAddress());
                
                // checkinTime 포맷팅: "15:00"
                String checkinTime = stay.getCheckInTime() != null ? 
                    stay.getCheckInTime().toString() : "15:00";
                
                // AI 추천 배지 계산 (AI 매칭 점수 사용)
                String badge = calculateBadge(summary.getStayId(), userId, reservationCount);
                
                return AIStayResponse.builder()
                    .id(summary.getStayId())
                    .title(summary.getStayName())
                    .image(thumbnailImage)
                    .rating(summary.getAverageRating() != null ? summary.getAverageRating() : 0.0)
                    .location(location)
                    .price(summary.getMinPrice() != null ? summary.getMinPrice().doubleValue() : 0.0)
                    .checkinTime(checkinTime)
                    .badge(badge)
                    .latitude(stay.getLatitude() != null ? stay.getLatitude().doubleValue() : 0.0)
                    .longitude(stay.getLongitude() != null ? stay.getLongitude().doubleValue() : 0.0)
                    .stayType(summary.getStayType())
                    .reviewCount(summary.getReviewCount() != null ? summary.getReviewCount() : 0)
                    .build();
            })
            .filter(dto -> dto != null) // null 제외
            .collect(Collectors.toList());
        
        return AIRecommendationResponse.builder()
            .stays(stayDtos)
            .totalCount(stayDtos.size())
            .userType(reservationCount == 0 ? "NEWBIE" : "EXISTING")
            .fromCache(fromCache)
            .cachedAt(LocalDateTime.now())
            .build();
    }

    /**
     * 대표 이미지 조회
     */
    private String getThumbnailImage(Long stayId) {
        return fileUploadRepository.findRepresentativeImage("STAY", stayId)
            .map(FileUpload::getS3Url)
            .orElse("/images/main/main-example.svg"); // 기본 이미지
    }

    /**
     * AI 추천 배지 계산 (AI 매칭 점수 기반)
     */
    private String calculateBadge(Long stayId, Long userId, int reservationCount) {
        // AI 매칭 점수 조회
        Integer aiScore = StayRecommendationAIService.getAIMatchScore(userId, stayId);
        
        if (aiScore == null) {
            log.warn("AI 매칭 점수 없음 - stayId: {}, userId: {}", stayId, userId);
            return "";
        }
        
        log.debug("배지 계산 - stayId: {}, AI 점수: {}%", stayId, aiScore);
        
        // 배지 생성
        return String.format("추천 %d%%", aiScore);
        
    }
    
    /**
     * Redis 캐시 저장 (StaySummary 기반)
     */
    private void saveSummariesToCache(
            Long userId, 
            List<StayRecommendationResponse.StaySummary> summaries, 
            int reservationCount) {
        try {
            List<Long> stayIds = summaries.stream()
                .map(StayRecommendationResponse.StaySummary::getStayId)
                .collect(Collectors.toList());
            
            List<StayRecommendationCache.CachedStayInfo> cachedStays = summaries.stream()
                .map(summary -> {
                    // Stay 정보 조회
                    Stay stay = stayRepository.findById(summary.getStayId()).orElse(null);
                    if (stay == null) return null;
                    
                    String thumbnailImage = getThumbnailImage(stay.getId());
                    String location = String.format("%s • %s", summary.getRegionName(), stay.getAddress());
                    String checkinTime = stay.getCheckInTime() != null ? stay.getCheckInTime().toString() : "15:00";
                    String badge = calculateBadge(summary.getStayId(), userId, reservationCount);
                    
                    return StayRecommendationCache.CachedStayInfo.builder()
                        .stayId(summary.getStayId())
                        .stayName(summary.getStayName())
                        .stayType(summary.getStayType())
                        .regionName(summary.getRegionName())
                        .minPrice(summary.getMinPrice() != null ? summary.getMinPrice().doubleValue() : 0.0)
                        .averageRating(summary.getAverageRating() != null ? summary.getAverageRating() : 0.0)
                        .reviewCount(summary.getReviewCount() != null ? summary.getReviewCount() : 0)
                        // 추가 필드
                        .thumbnailImage(thumbnailImage)
                        .location(location)
                        .checkinTime(checkinTime)
                        .badge(badge)
                        .latitude(stay.getLatitude() != null ? stay.getLatitude().doubleValue() : 0.0)
                        .longitude(stay.getLongitude() != null ? stay.getLongitude().doubleValue() : 0.0)
                        .build();
                })
                .filter(cached -> cached != null)
                .collect(Collectors.toList());
            
            StayRecommendationCache cache = StayRecommendationCache.builder()
                .userId(userId)
                .stayIds(stayIds)
                .reservationCount(reservationCount)
                .cachedAt(LocalDateTime.now())
                .stays(cachedStays)
                .build();
            
            String cacheKey = CACHE_KEY_PREFIX + userId;
            redisTemplate.opsForValue().set(cacheKey, cache, CACHE_TTL);
            
            log.info("Redis 캐시 저장 완료 - userId: {}, 숙소: {}개, 예약건수: {}", 
                userId, cachedStays.size(), reservationCount);
            
        } catch (Exception e) {
            log.error("Redis 캐시 저장 실패 - userId: {}", userId, e);
            // 캐시 저장 실패해도 응답은 정상 처리
        }
    }
    
    /**
     * 설문조사 완료 시 백그라운드 캐시 생성 (비동기)
     */
    @Async
    public CompletableFuture<Void> createCacheOnSurveyComplete(Long userId) {
        log.info("설문조사 완료 - 백그라운드 캐시 생성 시작: userId={}", userId);
        
        try {
            // 신규 사용자이므로 예약 건수 = 0
            generateNewRecommendations(userId, 0);
            log.info("설문조사 완료 - 캐시 생성 성공: userId={}", userId);
        } catch (Exception e) {
            log.error("설문조사 완료 - 캐시 생성 실패: userId={}", userId, e);
            // 실패해도 무시 (사용자 경험에 영향 없음)
        }
        
        return CompletableFuture.completedFuture(null);
    }
}