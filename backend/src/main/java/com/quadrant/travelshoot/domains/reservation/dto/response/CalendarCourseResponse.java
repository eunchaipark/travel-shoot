package com.quadrant.travelshoot.domains.reservation.dto.response;

import lombok.*;
import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CalendarCourseResponse {

    private String id;                      
    private String reservationCode;         // 예약 코드
    private String title;                   // "속초시 여행"
    private LocalDate startDate;            // 체크인 날짜
    private LocalDate endDate;              // 체크아웃 날짜
    private String accommodationName;       // 숙소명
    private String status;                  // 예약 상태 (예약확정, 이용완료, 예약취소)
    private List<ScheduleItem> schedules;   // 일정 목록

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class ScheduleItem {
        private String time;    // 시작 시간 "09:00"
        private String title;   // 장소명 "설악산 케이블카"
        private String type;    // 타입 "activity", "restaurant"
        private String date;    // 날짜 "2025-10-15" 
    }
}