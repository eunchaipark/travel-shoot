package com.quadrant.travelshoot.domains.travelcourse.dto.response;

import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.travelcourse.entity.CourseSpot.SpotType;
import com.quadrant.travelshoot.domains.travelcourse.entity.TravelCourse.GenerationStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TravelCourseResponse {

    private Long courseId;
    private Long reservationId;
    private Long userId;
    private Integer totalDays;
    private GenerationStatus generationStatus;
    private List<DailyCourse> dailyCourses;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private StayInfo stay;

    @Getter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class StayInfo {
        private String name;
        private String address;
        private String imageUrl;
        private BigDecimal latitude;
        private BigDecimal longitude;
        private String stayType;
    }

    @Getter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class DailyCourse {
        private Integer day;
        private LocalDate date;
        private List<SpotDetail> spots;
    }

    @Getter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class SpotDetail {
        private Long spotId;
        private Integer order;
        private SpotType spotType;
        private Long referenceId;
        private String spotName;
        private String address;
        private LocalTime startTime;
        private LocalTime endTime;
        private String aiComment;
        private BigDecimal latitude;
        private BigDecimal longitude;
        private String type;
        // 관광지/맛집 추가 정보
        private String imageUrl;
        private String description;
    }
}
