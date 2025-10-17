package com.quadrant.travelshoot.domains.travelcourse.service.impl;

import com.quadrant.travelshoot.domains.activity.entity.Activity;
import com.quadrant.travelshoot.domains.activity.service.ActivityService;
import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import com.quadrant.travelshoot.domains.reservation.service.ReservationService;
import com.quadrant.travelshoot.domains.restaurant.entity.Restaurant;
import com.quadrant.travelshoot.domains.restaurant.service.RestaurantService;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.service.StayService;
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

import java.math.BigDecimal;
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
    private final StayService stayService;

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

    public TravelCourseResponse getCourse(Long id, String type) {
        log.info("여행 코스 조회 - id: {}, type: {}", id, type);

        TravelCourse travelCourse;

        if ("reservation".equals(type)) {
            // reservationId로 TravelCourse 조회
            travelCourse = travelCourseRepository.findByReservationId(id)
                    .orElseThrow(() -> new IllegalArgumentException("해당 예약의 여행 코스를 찾을 수 없습니다."));
        } else {
            // courseId로 TravelCourse 조회
            travelCourse = travelCourseRepository.findById(id)
                    .orElseThrow(() -> new IllegalArgumentException("해당 여행 코스를 찾을 수 없습니다."));
        }

        //TODO: 로그인 구현 다 되면 travelCourse.getUserId()와 세션 id와 같지 않으면 에러 반영
        Reservation reservation = reservationService.getById(travelCourse.getReservationId());
        LocalDate startDate = reservation.getCheckInDate();
        List<CourseSpot> courseSpots = courseSpotRepository
                .findByTravelCourseIdOrderByDayAscSpotOrderAsc(travelCourse.getId());

        return convertToResponse(travelCourse, courseSpots, reservation.getRoom().getStay().getId(), startDate);
    }

    private TravelCourseResponse convertToResponse(
            TravelCourse travelCourse,
            List<CourseSpot> courseSpots,
            Long stayId,
            LocalDate startDate) {  // startDate 파라미터 추가!

        Stay stay = stayService.getById(stayId);
        TravelCourseResponse.StayInfo stayInfo = TravelCourseResponse.StayInfo.builder()
                .name(stay.getName())
                .address(stay.getAddress())
                .imageUrl(stay.getMainImageUrl())
                .latitude(stay.getLatitude())
                .longitude(stay.getLongitude())
                .build();

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
                .stay(stayInfo)
                .build();
    }

    private TravelCourseResponse.SpotDetail convertToSpotDetail(CourseSpot spot) {
        String spotName = "";
        String address = "";
        String type = "";
        BigDecimal latitude = BigDecimal.valueOf(0);
        BigDecimal longitude = BigDecimal.valueOf(0);

        // spotType에 따라 실제 데이터 조회
        if (spot.getSpotType() == CourseSpot.SpotType.관광지) {
            // Activity 조회 (Service 통해서!)
            Activity activity = activityService.getById(spot.getReferenceId());
            spotName = activity.getActivityName();
            address = activity.getAddress();
            latitude = activity.getLatitude();
            longitude = activity.getLongitude();
            type = activity.getActivityType();
        } else if (spot.getSpotType() == CourseSpot.SpotType.맛집) {
            // Restaurant 조회 (Service 통해서!)
            Restaurant restaurant = restaurantService.getById(spot.getReferenceId());
            spotName = restaurant.getRestaurantName();
            address = restaurant.getAddress();
            latitude = restaurant.getLatitude();
            longitude = restaurant.getLongitude();
            type = restaurant.getFoodType();
        }

        // DTO로 변환해서 반환
        return TravelCourseResponse.SpotDetail.builder()
                .spotId(spot.getId())
                .order(spot.getSpotOrder())
                .spotType(spot.getSpotType())
                .referenceId(spot.getReferenceId())
                .spotName(spotName)        // Activity/Restaurant에서 가져온 이름
                .address(address)          // Activity/Restaurant에서 가져온 주소
                .latitude(latitude)          // Activity/Restaurant에서 가져온 위도
                .longitude(longitude)          // Activity/Restaurant에서 가져온 경도
                .startTime(spot.getStartTime())
                .endTime(spot.getEndTime())
                .aiComment(spot.getAiComment())
                .type(type)
                .build();
    }
}