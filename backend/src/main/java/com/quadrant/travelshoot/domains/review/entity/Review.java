package com.quadrant.travelshoot.domains.review.entity;

import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import com.quadrant.travelshoot.domains.user.entity.User;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import lombok.*;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;

@Entity
@Table(name = "reviews", indexes = {
        @Index(name = "idx_stay", columnList = "stay_id"),
        @Index(name = "idx_total_rating", columnList = "total_rating")
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "review_id")
    private Long reviewId;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "reservation_id")
    private Reservation reservation;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @JoinColumn(name = "stay_id", nullable = false)
    private Long stayId;

    @DecimalMin("0.00")
    @DecimalMax("5.00")
    @Column(name = "total_rating", nullable = false, precision = 3, scale = 2)
    private BigDecimal totalRating;

    @DecimalMin("0.00")
    @DecimalMax("5.00")
    @Column(name = "clean_rating", nullable = false, precision = 3, scale = 2)
    private BigDecimal cleanRating;

    @DecimalMin("0.00")
    @DecimalMax("5.00")
    @Column(name = "convenience_rating", nullable = false, precision = 3, scale = 2)
    private BigDecimal convenienceRating;

    @DecimalMin("0.00")
    @DecimalMax("5.00")
    @Column(name = "checkin_rating", nullable = false, precision = 3, scale = 2)
    private BigDecimal checkinRating;

    @DecimalMin("0.00")
    @DecimalMax("5.00")
    @Column(name = "communication_rating", nullable = false, precision = 3, scale = 2)
    private BigDecimal communicationRating;

    @DecimalMin("0.00")
    @DecimalMax("5.00")
    @Column(name = "location_rating", nullable = false, precision = 3, scale = 2)
    private BigDecimal locationRating;

    @DecimalMin("0.00")
    @DecimalMax("5.00")
    @Column(name = "value_rating", nullable = false, precision = 3, scale = 2)
    private BigDecimal valueRating;

    @Column(name = "review_content", nullable = false, columnDefinition = "TEXT")
    private String reviewContent;

    @Column(name = "is_recommended", nullable = false)
    private Boolean isRecommended = false;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    // 추가: 리뷰 이미지
//    @OneToMany(mappedBy = "review", cascade = CascadeType.ALL, orphanRemoval = true)
//    private ReviewImage reviewImage;


    // 6개 항목의 평균으로 종합 평점 계산 - 이거는 서버 왔다갔다 보다는 프론트에서 바로바로 반영되는게 나을거 같음.
//    public void getTotalRating() {
//        BigDecimal sum = cleanRating
//                .add(convenienceRating)
//                .add(checkinRating)
//                .add(communicationRating)
//                .add(locationRating)
//                .add(valueRating);
//
//        this.totalRating = sum.divide(BigDecimal.valueOf(6), 2, RoundingMode.HALF_UP);
//    }

    // 연관관계 매핑
    /*
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "reservation_id", insertable = false, updatable = false)
    private Reservation reservation;



    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "stay_id", insertable = false, updatable = false)
    private Stay stay;
    */
}