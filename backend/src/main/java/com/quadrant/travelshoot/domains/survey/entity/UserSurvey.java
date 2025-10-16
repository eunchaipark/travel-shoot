package com.quadrant.travelshoot.domains.survey.entity;

import com.quadrant.travelshoot.domains.user.entity.User;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user_surveys")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserSurvey {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "survey_id")
    private Long id;
    
    @OneToOne
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    private User user;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "stay_type", length = 20, nullable = false)
    private StayType stayType;
    
    @Builder.Default
    @Column(name = "is_completed", nullable = false)
    private Boolean isCompleted = false;
    
    @Column(name = "completed_at")
    private LocalDateTime completedAt;
    
    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;
    
    // 양방향 관계 - CascadeType.ALL로 자식 엔티티 자동 저장
    @Builder.Default
    @OneToMany(mappedBy = "survey", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<UserSurveyRegion> regions = new ArrayList<>();
    
    @Builder.Default
    @OneToMany(mappedBy = "survey", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<UserSurveyFood> foods = new ArrayList<>();
    
    @Builder.Default
    @OneToMany(mappedBy = "survey", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<UserSurveyActivity> activities = new ArrayList<>();
    
    // 숙소 유형 Enum
    public enum StayType {
        PENSION("펜션"),
        MOTEL("모텔"),
        HOTEL("호텔");
        
        private final String koreanName;
        
        StayType(String koreanName) {
            this.koreanName = koreanName;
        }
        
        public String getKoreanName() {
            return koreanName;
        }
        
        public static StayType fromKoreanName(String koreanName) {
            for (StayType type : values()) {
                if (type.koreanName.equals(koreanName)) {
                    return type;
                }
            }
            throw new IllegalArgumentException("잘못된 숙소 유형: " + koreanName);
        }
    }
}