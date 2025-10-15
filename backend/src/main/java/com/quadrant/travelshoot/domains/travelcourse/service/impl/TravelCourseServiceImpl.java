package com.quadrant.travelshoot.domains.travelcourse.service.impl;

import com.quadrant.travelshoot.domains.activity.entity.Activity;
import com.quadrant.travelshoot.domains.activity.service.ActivityService;
import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import com.quadrant.travelshoot.domains.reservation.service.ReservationService;
import com.quadrant.travelshoot.domains.restaurant.entity.Restaurant;
import com.quadrant.travelshoot.domains.restaurant.service.RestaurantService;
import com.quadrant.travelshoot.domains.travelcourse.dto.response.TravelCourseRecommendationData;
import com.quadrant.travelshoot.domains.travelcourse.dto.response.TravelCourseResponse;
import com.quadrant.travelshoot.domains.travelcourse.dto.request.TravelCourseRequest;
import com.quadrant.travelshoot.domains.travelcourse.entity.CourseSpot;
import com.quadrant.travelshoot.domains.travelcourse.entity.TravelCourse;
import com.quadrant.travelshoot.domains.travelcourse.entity.TravelCourse.GenerationStatus;
import com.quadrant.travelshoot.domains.travelcourse.repository.CourseSpotRepository;
import com.quadrant.travelshoot.domains.travelcourse.repository.TravelCourseRepository;
import com.quadrant.travelshoot.domains.ai.service.TravelCourseGenerationService;
import com.quadrant.travelshoot.domains.travelcourse.service.TravelCourseRecommendationService;
import com.quadrant.travelshoot.domains.travelcourse.service.TravelCourseService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class TravelCourseServiceImpl implements TravelCourseService {

    private final TravelCourseRepository travelCourseRepository;
    private final CourseSpotRepository courseSpotRepository;
    private final TravelCourseGenerationService travelCourseGenerationService;
    private final TravelCourseRecommendationService travelCourseRecommendationService;
    private final ReservationService reservationService;
    private final ActivityService activityService;
    private final RestaurantService restaurantService;

    @Override
    @Transactional
    public void generateCourse(TravelCourseRequest request, Long userId) {
        log.info("여행 코스 생성 시작 - userId: {}, totalDays: {}",
                userId, request.getTotalDays());

        // TODO:가라 데이터 아래 데이터 변경해야 함.
        //  초기 코스 생성 (생성중 상태)
//        TravelCourse travelCourse = TravelCourse.builder()
//                .reservationId(request.getReservationId())
//                .userId(userId)
//                .totalDays(request.getTotalDays())
//                .generationStatus(GenerationStatus.생성중)
//                .build();

        TravelCourse travelCourse = TravelCourse.builder()
                .reservationId(1L)
                .userId(userId)
                .totalDays(3)
                .generationStatus(GenerationStatus.생성중)
                .build();

        TravelCourse savedCourse = travelCourseRepository.save(travelCourse);

        // 비동기로 AI 코스 생성
//        generateCourseAsync(savedCourse.getId(), request.getReservationId(), request.getTotalDays(), userId);
        generateCourseAsync(savedCourse.getId(), 1L, 3, userId);

        log.info("여행 코스 생성 요청 완료 - courseId: {}", savedCourse.getId());
    }

    @Async
    @Override
    @Transactional
    public void generateCourseAsync(Long courseId, Long reservationId, Integer totalDays, Long userId) {
        try {
            log.info("AI 코스 생성 시작 - courseId: {}", courseId);

            TravelCourse travelCourse = travelCourseRepository.findById(courseId)
                    .orElseThrow(() -> new IllegalArgumentException("코스를 찾을 수 없습니다."));

            TravelCourseRecommendationData travelCourseRecommendationData = travelCourseRecommendationService.getRecommendations(reservationId, userId, totalDays);
            // 여행 코스 생성 서비스 호출
            List<CourseSpot> generatedSpots = travelCourseGenerationService.generateCourse(
                    reservationId, totalDays, travelCourse, travelCourseRecommendationData);

            courseSpotRepository.saveAll(generatedSpots);
            travelCourse.updateGenerationStatus(GenerationStatus.생성완료);

            log.info("AI 코스 생성 완료 - courseId: {}, spots: {}", courseId, generatedSpots.size());

        } catch (Exception e) {
            log.error("AI 코스 생성 실패 - courseId: {}, error: {}", courseId, e.getMessage(), e);

            TravelCourse travelCourse = travelCourseRepository.findById(courseId)
                    .orElseThrow(() -> new IllegalArgumentException("코스를 찾을 수 없습니다."));

            travelCourse.updateGenerationStatus(GenerationStatus.생성실패);
        }
    }

    @Override
    public TravelCourseResponse getCourse(Long courseId) {
        log.info("여행 코스 조회 - courseId: {}", courseId);

        // 1. TravelCourse 조회
        TravelCourse travelCourse = travelCourseRepository.findById(courseId)
                .orElseThrow(() -> new IllegalArgumentException("해당 여행 코스를 찾을 수 없습니다."));

        // 2. Reservation 조회 (Service 통해서!)
        Reservation reservation = reservationService.getById(travelCourse.getReservationId());

        // 3. 여행 시작 날짜 추출
        LocalDate startDate = reservation.getCheckInDate();

        // 4. CourseSpot 조회
        List<CourseSpot> courseSpots = courseSpotRepository
                .findByTravelCourseIdOrderByDayAscSpotOrderAsc(courseId);

        // 5. 응답 생성
        return convertToResponse(travelCourse, courseSpots, startDate);
    }

    private TravelCourseResponse convertToResponse(
            TravelCourse travelCourse,
            List<CourseSpot> courseSpots,
            LocalDate startDate) {  // startDate 파라미터 추가!

        // Day별로 그룹핑
        Map<Integer, List<CourseSpot>> spotsByDay = courseSpots.stream()
                .collect(Collectors.groupingBy(CourseSpot::getDay));

        List<TravelCourseResponse.DailyCourse> dailyCourses = new ArrayList<>();

        // 각 날짜별로 처리
        for (int day = 1; day <= travelCourse.getTotalDays(); day++) {
            // 해당 날짜의 스팟들 가져오기
            List<CourseSpot> daySpots = spotsByDay.getOrDefault(day, List.of());

            // SpotDetail로 변환
            List<TravelCourseResponse.SpotDetail> spotDetails = daySpots.stream()
                    .map(this::convertToSpotDetail)
                    .collect(Collectors.toList());

            // 실제 날짜 계산
            LocalDate actualDate = startDate.plusDays(day - 1);

            // DailyCourse 생성
            dailyCourses.add(TravelCourseResponse.DailyCourse.builder()
                    .day(day)
                    .date(actualDate)
                    .spots(spotDetails)
                    .build());
        }

        return TravelCourseResponse.builder()
                .courseId(travelCourse.getId())
                .reservationId(travelCourse.getReservationId())
                .userId(travelCourse.getUserId())
                .totalDays(travelCourse.getTotalDays())
                .generationStatus(travelCourse.getGenerationStatus())
                .dailyCourses(dailyCourses)
                .createdAt(travelCourse.getCreatedAt())
                .updatedAt(travelCourse.getUpdatedAt())
                .build();
    }

    private TravelCourseResponse.SpotDetail convertToSpotDetail(CourseSpot spot) {
        String spotName = "";
        String address = "";

        // spotType에 따라 실제 데이터 조회
        if (spot.getSpotType() == CourseSpot.SpotType.관광지) {
            // Activity 조회 (Service 통해서!)
            Activity activity = activityService.getById(spot.getReferenceId());
            spotName = activity.getActivityName();
            address = activity.getAddress();

        } else if (spot.getSpotType() == CourseSpot.SpotType.맛집) {
            // Restaurant 조회 (Service 통해서!)
            Restaurant restaurant = restaurantService.getById(spot.getReferenceId());
            spotName = restaurant.getRestaurantName();
            address = restaurant.getAddress();
        }

        // DTO로 변환해서 반환
        return TravelCourseResponse.SpotDetail.builder()
                .spotId(spot.getId())
                .order(spot.getSpotOrder())
                .spotType(spot.getSpotType())
                .referenceId(spot.getReferenceId())
                .spotName(spotName)        // Activity/Restaurant에서 가져온 이름
                .address(address)          // Activity/Restaurant에서 가져온 주소
                .startTime(spot.getStartTime())
                .endTime(spot.getEndTime())
                .aiComment(spot.getAiComment())
                .build();
    }
}