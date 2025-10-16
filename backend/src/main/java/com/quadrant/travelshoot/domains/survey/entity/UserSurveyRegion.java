package com.quadrant.travelshoot.domains.survey.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "user_survey_regions")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserSurveyRegion {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "survey_id", nullable = false)
    private UserSurvey survey;
    
    @Column(name = "region_name", nullable = false, length = 50)
    private String regionName;
    
    @Column(name = "rank_order", nullable = false)
    private Integer rankOrder;
    
    @Column(nullable = false, precision = 3, scale = 2)
    private BigDecimal weight;
    
    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;
}