package com.quadrant.travelshoot.domains.review.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalDateTime;

@Entity
@Table(name = "review_summaries")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewAiSummary {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "review_summary_id")
    private Long id;

    @Column(name = "stay_id", nullable = false)
    private Long stayId;

    @Column(name = "positive_summary")
    private String positiveSummary;
    @Column(name = "negative_summary")
    private String negativeSummary;

    @Column(name = "overall_summary")
    private String overallSummary;

    @Column(columnDefinition = "json")
    private String keywords;

    @Column(name = "analyzed_at")
    @UpdateTimestamp
    private LocalDateTime analyzedAt;

    @Column(name = "created_at", nullable = false, updatable = false)
    @CreationTimestamp
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    @UpdateTimestamp
    private LocalDateTime updatedAt;

    @Column(name = "review_count", nullable = false)
    private Integer reviewCount;

    public void updateSummary(String overallSummary, Integer reviewCount) {
        this.overallSummary = overallSummary;
        this.reviewCount = reviewCount;
    }

    /**
     * 장점/단점 요약 업데이트
     */
    public void updateStructuredSummary(String positiveSummary, String negativeSummary, Integer reviewCount) {
        this.positiveSummary = positiveSummary;
        this.negativeSummary = negativeSummary;
        this.reviewCount = reviewCount;
    }
}
