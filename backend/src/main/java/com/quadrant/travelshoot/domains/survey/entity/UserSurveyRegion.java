package com.quadrant.travelshoot.domains.survey.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(
        name = "user_survey_regions",
        uniqueConstraints = {
                @UniqueConstraint(name = "uk_survey_region_rank", columnNames = {"survey_id", "rank_order"})
        },
        indexes = {
                @Index(name = "idx_survey_id", columnList = "survey_id"),
                @Index(name = "idx_region_name", columnList = "region_name")
        }
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class UserSurveyRegion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "survey_id", nullable = false, foreignKey = @ForeignKey(name = "user_survey_regions_ibfk_1"))
    private UserSurvey survey;

    @Column(name = "region_name", nullable = false, length = 50)
    private String regionName;

    @Column(name = "rank_order", nullable = false)
    private Integer rankOrder;

    @Column(name = "weight", nullable = false, precision = 3, scale = 2)
    private BigDecimal weight;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    // 연관관계 편의 메서드
    public void setSurvey(UserSurvey survey) {
        this.survey = survey;
    }

    // 가중치 자동 계산 메서드
    public void calculateWeight() {
        if (rankOrder != null) {
            this.weight = BigDecimal.valueOf(5 - rankOrder);
        }
    }

    @PrePersist
    @PreUpdate
    private void validateConstraints() {
        if (rankOrder < 1 || rankOrder > 5) {
            throw new IllegalArgumentException("rank_order must be between 1 and 5");
        }
        if (weight.compareTo(BigDecimal.ZERO) < 0 || weight.compareTo(BigDecimal.valueOf(5)) > 0) {
            throw new IllegalArgumentException("weight must be between 0 and 5");
        }
    }
}