package com.quadrant.travelshoot.domains.travelcourse.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import java.time.LocalTime;
import java.time.LocalDateTime;

@Entity
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EntityListeners(AuditingEntityListener.class)
@Table(name = "course_spots")
public class CourseSpot {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "spot_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "course_id", nullable = false)
    private TravelCourse travelCourse;

    @Column(name = "day", nullable = false)
    private Integer day;

    @Column(name = "spot_order", nullable = false)
    private Integer spotOrder;

    @Enumerated(EnumType.STRING)
    @Column(name = "spot_type", nullable = false, columnDefinition = "ENUM('관광지', '맛집')")
    private SpotType spotType;

    @Column(name = "reference_id", nullable = false)
    private Long referenceId;

    @Column(name = "start_time", nullable = false)
    private LocalTime startTime;

    @Column(name = "end_time", nullable = false)
    private LocalTime endTime;

    @Column(name = "ai_comment", length = 500)
    private String aiComment;

    @CreatedDate
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    public enum SpotType {
        관광지, 맛집
    }

    public void setTravelCourse(TravelCourse travelCourse) {
        this.travelCourse = travelCourse;
    }
}