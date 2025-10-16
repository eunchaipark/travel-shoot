package com.quadrant.travelshoot.domains.survey.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "user_survey_activities")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserSurveyActivity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "survey_id", nullable = false)
    private UserSurvey survey;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "activity_category", nullable = false, length = 50)
    private ActivityCategory activityCategory;
    
    @Column(name = "preference_order", nullable = false)
    private Integer preferenceOrder;
    
    @Column(nullable = false, precision = 3, scale = 2)
    private BigDecimal weight;
    
    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;
    
    // 액티비티 카테고리 Enum
    public enum ActivityCategory {
        자연관광("자연관광"),
        문화체험("문화체험"),
        레포츠("레포츠"),
        맛집탐방("맛집탐방"),
        쇼핑("쇼핑"),
        사진("사진"),
        휴양("휴양"),
        축제("축제");
        
        private final String displayName;
        
        ActivityCategory(String displayName) {
            this.displayName = displayName;
        }
        
        public String getDisplayName() {
            return displayName;
        }
        
        public static ActivityCategory fromString(String value) {
            for (ActivityCategory category : values()) {
                if (category.displayName.equals(value) || category.name().equals(value)) {
                    return category;
                }
            }
            throw new IllegalArgumentException("잘못된 액티비티 카테고리: " + value);
        }
    }
}