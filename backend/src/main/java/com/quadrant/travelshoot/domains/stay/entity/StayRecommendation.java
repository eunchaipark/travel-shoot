package com.quadrant.travelshoot.domains.stay.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Comment;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "user_stay_recommendations")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class StayRecommendation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Comment("추천 ID")
    private Long id;

    @Column(name = "user_id", nullable = false)
    @Comment("사용자 ID")
    private Long userId;

    @Column(name = "stay_id", nullable = false)
    @Comment("숙소 ID")
    private Long stayId;

    @Column(name = "filter_level", nullable = false)
    @Comment("성공한 완화 레벨 (1~5)")
    private Integer filterLevel;

    @Column(name = "base_price", nullable = false, precision = 10, scale = 2)
    @Comment("계산 시점의 basePrice")
    private BigDecimal basePrice;

    @Column(name = "recommendation_rank", nullable = false)
    @Comment("추천 순위 (1~15)")
    private Integer recommendationRank;

    @Column(name = "created_at", nullable = false, updatable = false)
    @Comment("생성일시")
    private LocalDateTime createdAt;

    @Column(name = "updated_at", nullable = false)
    @Comment("수정일시")
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}