package com.quadrant.travelshoot.domains.travelcourse.dto.response;

import com.quadrant.travelshoot.domains.travelcourse.entity.CourseSpot.SpotType;
import com.quadrant.travelshoot.domains.travelcourse.entity.TravelCourse.GenerationStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

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
    private Long stayId;
    private Integer totalDays;
    private GenerationStatus generationStatus;
    private List<DailyCourse> dailyCourses;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

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

        // 관광지/맛집 추가 정보
        private String imageUrl;
        private String description;
    }
}
