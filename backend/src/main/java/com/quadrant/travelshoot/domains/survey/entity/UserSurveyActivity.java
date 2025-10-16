package com.quadrant.travelshoot.domains.survey.entity;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(
        name = "user_survey_activities",
        uniqueConstraints = {
                @UniqueConstraint(name = "uk_survey_activity_order", columnNames = {"survey_id", "preference_order"})
        },
        indexes = {
                @Index(name = "idx_survey_id", columnList = "survey_id"),
                @Index(name = "idx_activity_category", columnList = "activity_category")
        }
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class UserSurveyActivity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "survey_id", nullable = false, foreignKey = @ForeignKey(name = "user_survey_activities_ibfk_1"))
    private UserSurvey survey;

    @Enumerated(EnumType.STRING)
    @Column(name = "activity_category", nullable = false, columnDefinition = "ENUM('자연관광', '문화체험', '레포츠', '맛집탐방', '쇼핑', '사진', '휴양', '축제')")
    private ActivityCategory activityCategory;

    @Column(name = "preference_order", nullable = false)
    private Integer preferenceOrder;

    @Column(name = "weight", nullable = false, precision = 3, scale = 2)
    private BigDecimal weight;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    //TODO: 은채님 만약에 enum 쓴다면 common/enums로 따로 빼서 써야 함.
    public enum ActivityCategory {
        자연관광, 문화체험, 레포츠, 맛집탐방, 쇼핑, 사진, 휴양, 축제
    }

    // 연관관계 편의 메서드
    public void setSurvey(UserSurvey survey) {
        this.survey = survey;
    }

    // 가중치 자동 계산 메서드
    public void calculateWeight() {
        if (preferenceOrder != null) {
            this.weight = BigDecimal.valueOf(5 - preferenceOrder);
        }
    }

    @PrePersist
    @PreUpdate
    private void validateConstraints() {
        if (preferenceOrder < 1 || preferenceOrder > 4) {
            throw new IllegalArgumentException("preference_order must be between 1 and 4");
        }
        if (weight.compareTo(BigDecimal.ZERO) < 0 || weight.compareTo(BigDecimal.valueOf(5)) > 0) {
            throw new IllegalArgumentException("weight must be between 0 and 5");
        }
    }
}