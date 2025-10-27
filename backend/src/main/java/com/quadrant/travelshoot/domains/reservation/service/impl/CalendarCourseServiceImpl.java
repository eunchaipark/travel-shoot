package com.quadrant.travelshoot.domains.reservation.service.impl;

import com.quadrant.travelshoot.domains.reservation.dto.response.CalendarCourseResponse;
import com.quadrant.travelshoot.domains.reservation.repository.ReservationRepository;
import com.quadrant.travelshoot.domains.reservation.service.CalendarCourseService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 캘린더 코스 서비스 구현체
 */
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class CalendarCourseServiceImpl implements CalendarCourseService {

    private final ReservationRepository reservationRepository;

    @Override
    public List<CalendarCourseResponse> getCalendarCourses(Long userId) {
        log.info("캘린더 코스 조회 시작 - userId: {}", userId);

        List<Object[]> results = reservationRepository.findReservationsWithCoursesByUserId(userId);

        // 예약별로 그룹핑 (reservation_code 기준)
        Map<String, List<Object[]>> groupedByReservation = results.stream()
                .collect(Collectors.groupingBy(row -> (String) row[1])); // [0] → [1] reservation_code

        return groupedByReservation.entrySet().stream()
                .map(entry -> mapToCalendarCourseResponse(entry.getKey(), entry.getValue()))
                .collect(Collectors.toList());
    }

    /**
     * 예약 단위로 그룹핑된 데이터를 CalendarCourseResponse로 변환
     */
    private CalendarCourseResponse mapToCalendarCourseResponse(String reservationCode, List<Object[]> rows) {
        try {
            // 첫 번째 row에서 예약 기본 정보 추출 (모든 row가 같은 예약 정보)
            Object[] firstRow = rows.get(0);
            
            Long reservationId = ((Number) firstRow[0]).longValue(); // reservation_id 추출
            LocalDate checkInDate = convertToLocalDate(firstRow[2]); // [1] → [2]
            LocalDate checkOutDate = convertToLocalDate(firstRow[3]); // [2] → [3]
            String stayName = (String) firstRow[4]; // [3] → [4]
            String stayType = (String) firstRow[5]; // [4] → [5]
            String cityName = (String) firstRow[6]; // [5] → [6]
            String reservationStatus = (String) firstRow[7]; // [6] → [7]

            // 모든 row에서 스케줄 생성 (checkInDate 전달)
            List<CalendarCourseResponse.ScheduleItem> schedules = rows.stream()
                    .map(row -> mapToScheduleItem(row, checkInDate))
                    .collect(Collectors.toList());

            return CalendarCourseResponse.builder()
                    .id(String.valueOf(reservationId)) // reservation_id를 String으로
                    .reservationCode(reservationCode) // reservation_code 추가
                    .title(cityName + " 여행")
                    .startDate(checkInDate)
                    .endDate(checkOutDate)
                    .accommodationName(stayName)
                    .status(reservationStatus)
                    .schedules(schedules)
                    .build();

        } catch (Exception e) {
            log.error("CalendarCourseResponse 변환 중 오류 발생 - reservationCode: {}", reservationCode, e);
            throw new RuntimeException("여행 코스 데이터 변환 실패", e);
        }
    }

    /**
     * Object[] row를 ScheduleItem으로 변환
     * row 구조: [0]reservation_code, [1]check_in_date, [2]check_out_date, [3]stay_name, 
     *          [4]stay_type, [5]city_name, [6]reservation_status, [7]course_id, [8]day, 
     *          [9]spot_order, [10]spot_type, [11]start_time, [12]end_time, [13]spot_name, [14]spot_address
     */
    private CalendarCourseResponse.ScheduleItem mapToScheduleItem(Object[] row, LocalDate checkInDate) {
        Integer day = (Integer) row[9];  // [8] → [9]
        String spotType = (String) row[11];  // [10] → [11]
        Time startTime = (Time) row[12];  // [11] → [12]
        String spotName = (String) row[14];  // [13] → [14]
        
        // spotType 매핑
        String mappedType = mapSpotType(spotType);
        
        // Time을 "HH:mm" 형식 문자열로 변환
        String timeStr = startTime != null ? startTime.toLocalTime().toString().substring(0, 5) : "";

        // 실제 날짜 계산: checkInDate + (day - 1)
        LocalDate actualDate = checkInDate.plusDays(day - 1);
        String dateStr = actualDate.toString(); // "2025-10-15" 형식

        return CalendarCourseResponse.ScheduleItem.builder()
                .time(timeStr)
                .title(spotName)
                .type(mappedType)
                .date(dateStr)
                .build();
    }

    /**
     * spotType을 프론트 요구사항에 맞게 매핑
     */
    private String mapSpotType(String spotType) {
        switch (spotType) {
            case "관광지":
                return "activity";
            case "맛집":
                return "restaurant";
            default:
                return spotType.toLowerCase();
        }
    }

    /**
     * SQL Date/Timestamp를 LocalDate로 변환
     */
    private LocalDate convertToLocalDate(Object dateObj) {
        if (dateObj instanceof Date) {
            return ((Date) dateObj).toLocalDate();
        } else if (dateObj instanceof java.sql.Timestamp) {
            return ((java.sql.Timestamp) dateObj).toLocalDateTime().toLocalDate();
        } else if (dateObj instanceof LocalDate) {
            return (LocalDate) dateObj;
        }
        throw new IllegalArgumentException("Unknown date type: " + dateObj.getClass());
    }
}