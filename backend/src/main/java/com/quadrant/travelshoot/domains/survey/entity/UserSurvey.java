package com.quadrant.travelshoot.domains.survey.entity;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user_surveys")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class UserSurvey {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "survey_id")
    private Long surveyId;

    @Column(name = "user_id", nullable = false, unique = true)
    private Long userId;

    @Enumerated(EnumType.STRING)
    @Column(name = "stay_type", nullable = false, columnDefinition = "ENUM('PENSION', 'MOTEL', 'HOTEL')")
    private StayType stayType;

    @Column(name = "is_completed", nullable = false, columnDefinition = "TINYINT(1) DEFAULT 0")
    private Boolean isCompleted;

    @Column(name = "completed_at")
    private LocalDateTime completedAt;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "survey", cascade = CascadeType.ALL, orphanRemoval = true)
    @BatchSize(size = 100)
    @Builder.Default
    private List<UserSurveyFood> foods = new ArrayList<>();

    @OneToMany(mappedBy = "survey", cascade = CascadeType.ALL, orphanRemoval = true)
    @BatchSize(size = 100)
    @Builder.Default
    private List<UserSurveyActivity> activities = new ArrayList<>();

    @OneToMany(mappedBy = "survey", cascade = CascadeType.ALL, orphanRemoval = true)
    @BatchSize(size = 100)
    @Builder.Default
    private List<UserSurveyRegion> regions = new ArrayList<>();

    public enum StayType {
        PENSION, MOTEL, HOTEL
    }

    // 편의 메서드

    public void addRegion(UserSurveyRegion region) {
        regions.add(region);
        region.setSurvey(this);
    }

    public void addFood(UserSurveyFood food) {
        foods.add(food);
        food.setSurvey(this);
    }

    public void addActivity(UserSurveyActivity activity) {
        activities.add(activity);
        activity.setSurvey(this);
    }

    public void completeSurvey() {
        this.isCompleted = true;
        this.completedAt = LocalDateTime.now();
    }
}