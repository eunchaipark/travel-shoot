package com.quadrant.travelshoot.domains.travelcourse.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import java.time.LocalDateTime;

import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EntityListeners(AuditingEntityListener.class)
@Table(name = "travel_courses")
public class TravelCourse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "course_id")
    private Long id;

    @Column(name = "reservation_id")
    private Long reservationId;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(name = "total_days", nullable = false)
    private Integer totalDays;

    @Enumerated(EnumType.STRING)
    @Column(name = "generation_status", nullable = false, columnDefinition = "ENUM('생성중', '생성완료', '생성실패')")
    @Builder.Default
    private GenerationStatus generationStatus = GenerationStatus.생성중;

    @OneToMany(mappedBy = "travelCourse", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private List<CourseSpot> courseSpots = new ArrayList<>();

    @CreatedDate
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @LastModifiedDate
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;


    public enum GenerationStatus {
        생성중, 생성완료, 생성실패
    }

    public void updateGenerationStatus(GenerationStatus status) {
        this.generationStatus = status;
    }

    public void addCourseSpot(CourseSpot courseSpot) {
        this.courseSpots.add(courseSpot);
        courseSpot.setTravelCourse(this);
    }
}