package com.quadrant.travelshoot.domains.stay.service.impl;

import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import com.quadrant.travelshoot.domains.reservation.repository.ReservationRepository;
import com.quadrant.travelshoot.domains.stay.dto.response.StayRecommendationResponse;
import com.quadrant.travelshoot.domains.stay.entity.Region;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.enums.UserType;
import com.quadrant.travelshoot.domains.stay.repository.RegionRepository;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;
import com.quadrant.travelshoot.domains.stay.service.StayRecommendationService;
import com.quadrant.travelshoot.domains.survey.entity.UserSurvey;
import com.quadrant.travelshoot.domains.survey.repository.UserSurveyRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class StayRecommendationServiceImpl implements StayRecommendationService {

    private final StayRepository stayRepository;
    private final ReservationRepository reservationRepository;
    private final UserSurveyRepository userSurveyRepository;
    private final RegionRepository regionRepository;

    private static final int TARGET_COUNT = 15;

    @Override
    public StayRecommendationResponse.Response getRecommendedStays(Long userId) {
        log.info(" 추천 계산 시작 - userId: {}", userId);

        // 1. 기본 데이터 조회
        UserSurvey survey = userSurveyRepository.findByUserId(userId)
            .orElseThrow(() -> new IllegalStateException("설문조사를 찾을 수 없습니다. userId: " + userId));
        
        List<Reservation> reservations = reservationRepository.findCompletedReservations(userId);
        
        // 2. 사용자 타입 분류
        UserType userType = UserType.classify(reservations.size());
        log.info(" 사용자 타입: {} (예약 {}건)", userType, reservations.size());

        // 3. 모든 활성 숙소 조회
        List<Stay> allStays = stayRepository.findAllActiveWithRooms();
        log.info(" 활성 숙소 총 {}개", allStays.size());

        // 4. Region 정보 일괄 조회
        Map<Long, String> regionMap = loadRegionMap(allStays);

        // 5. 점수 계산 및 정렬
        List<StayRecommendationResponse.StayScore> scoredStays = allStays.stream()
            .map(stay -> {
                String regionName = regionMap.getOrDefault(stay.getRegionId(), "지역정보없음");
                return calculateScore(stay, regionName, survey, reservations, userType);
            })
            .sorted(Comparator.comparing(StayRecommendationResponse.StayScore::getTotalScore).reversed())
            .limit(TARGET_COUNT)
            .collect(Collectors.toList());

        log.info(" 추천 완료 - 상위 {}개 선정", scoredStays.size());

        // 6. 응답 생성
        return StayRecommendationResponse.Response.of(scoredStays, userType.name());
    }

    /**
     * Region 정보 일괄 조회
     */
    private Map<Long, String> loadRegionMap(List<Stay> stays) {
        List<Long> regionIds = stays.stream()
            .map(Stay::getRegionId)
            .distinct()
            .collect(Collectors.toList());

        Map<Long, String> regionMap = regionRepository.findAllById(regionIds).stream()
            .collect(Collectors.toMap(
                Region::getId,
                Region::getCityName
            ));

        log.info(" Region 정보 로드 완료 - {}개", regionMap.size());
        return regionMap;
    }

    /**
     * 숙소 점수 계산
     */
    private StayRecommendationResponse.StayScore calculateScore(
            Stay stay,
            String regionName,
            UserSurvey survey,
            List<Reservation> reservations,
            UserType userType) {

        double surveyScore = calculateSurveyScore(stay, regionName, survey);
        double reservationScore = calculateReservationScore(stay, reservations);
        double ratingScore = calculateRatingScore(stay);

        double totalScore = 
            (surveyScore * userType.getSurveyWeight()) +
            (reservationScore * userType.getReservationWeight()) +
            (ratingScore * userType.getRatingWeight());

        return new StayRecommendationResponse.StayScore(
            stay, regionName, totalScore, surveyScore, reservationScore, ratingScore
        );
    }

    /**
     * 설문조사 일치율
     */
    private double calculateSurveyScore(Stay stay, String stayRegionName, UserSurvey survey) {
        int matches = 0;

        // 지역 일치
        boolean regionMatch = survey.getRegions().stream()
            .anyMatch(userSurveyRegion -> 
                userSurveyRegion.getRegionName().equals(stayRegionName)
            );
        if (regionMatch) matches++;

        // 타입 일치
        String surveyStayType = convertStayTypeToString(survey.getStayType());
        boolean typeMatch = stay.getStayType().equals(surveyStayType);
        if (typeMatch) matches++;

        return (matches / 2.0) * 100;
    }

    private String convertStayTypeToString(UserSurvey.StayType stayType) {
        return switch (stayType) {
            case PENSION -> "펜션";
            case HOTEL -> "호텔";
            case MOTEL -> "모텔";
        };
    }

    /**
     * 예약내역 일치율
     */
    private double calculateReservationScore(Stay stay, List<Reservation> reservations) {
        if (reservations.isEmpty()) {
            return 0.0;
        }

        long regionMatches = reservations.stream()
            .filter(r -> r.getRoom().getStay().getRegionId().equals(stay.getRegionId()))
            .count();
        double regionRatio = (double) regionMatches / reservations.size();

        long typeMatches = reservations.stream()
            .filter(r -> r.getRoom().getStay().getStayType().equals(stay.getStayType()))
            .count();
        double typeRatio = (double) typeMatches / reservations.size();

        return ((regionRatio + typeRatio) / 2.0) * 100;
    }

    /**
     * 평점 점수
     */
    private double calculateRatingScore(Stay stay) {
        double rating = stay.getAverageRating().doubleValue();
        return Math.max(0, ((rating - 3.0) / 2.0) * 100);
    }
}