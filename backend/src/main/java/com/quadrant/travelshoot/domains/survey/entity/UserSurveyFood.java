package com.quadrant.travelshoot.domains.survey.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(
        name = "user_survey_foods",
        uniqueConstraints = {
                @UniqueConstraint(name = "uk_survey_food_order", columnNames = {"survey_id", "preference_order"})
        },
        indexes = {
                @Index(name = "idx_survey_id", columnList = "survey_id"),
                @Index(name = "idx_food_category", columnList = "food_category")
        }
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class UserSurveyFood {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "survey_id", nullable = false, foreignKey = @ForeignKey(name = "user_survey_foods_ibfk_1"))
    private UserSurvey survey;

    @Enumerated(EnumType.STRING)
    @Column(name = "food_category", nullable = false, columnDefinition = "ENUM('한식', '중식', '일식', '양식', '카페', '해산물', '고기', '디저트')")
    private FoodCategory foodCategory;

    @Column(name = "preference_order", nullable = false)
    private Integer preferenceOrder;

    @Column(name = "weight", nullable = false, precision = 3, scale = 2)
    private BigDecimal weight;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    public enum FoodCategory {
        한식, 중식, 일식, 양식, 카페, 해산물, 고기, 디저트
    }

    // 연관관계 편의 메서드
    public void setSurvey(UserSurvey survey) {
        this.survey = survey;
    }

    // Enum을 String으로 반환하는 편의 메서드
    public String getFoodCategoryAsString() {
        return foodCategory.name();
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
        if (preferenceOrder < 1 || preferenceOrder > 5) {
            throw new IllegalArgumentException("preference_order must be between 1 and 5");
        }
        if (weight.compareTo(BigDecimal.ZERO) < 0 || weight.compareTo(BigDecimal.valueOf(5)) > 0) {
            throw new IllegalArgumentException("weight must be between 0 and 5");
        }
    }
}