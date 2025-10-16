package com.quadrant.travelshoot.domains.survey.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "user_survey_foods")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserSurveyFood {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "survey_id", nullable = false)
    private UserSurvey survey;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "food_category", nullable = false, length = 50)
    private FoodCategory foodCategory;
    
    @Column(name = "preference_order", nullable = false)
    private Integer preferenceOrder;
    
    @Column(nullable = false, precision = 3, scale = 2)
    private BigDecimal weight;
    
    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;
    
    // 음식 카테고리 Enum
    public enum FoodCategory {
        한식("한식"),
        중식("중식"),
        일식("일식"),
        양식("양식"),
        카페("카페"),
        해산물("해산물"),
        고기("고기"),
        디저트("디저트");
        
        private final String displayName;
        
        FoodCategory(String displayName) {
            this.displayName = displayName;
        }
        
        public String getDisplayName() {
            return displayName;
        }
        
        public static FoodCategory fromString(String value) {
            for (FoodCategory category : values()) {
                if (category.displayName.equals(value) || category.name().equals(value)) {
                    return category;
                }
            }
            throw new IllegalArgumentException("잘못된 음식 카테고리: " + value);
        }
    }
}