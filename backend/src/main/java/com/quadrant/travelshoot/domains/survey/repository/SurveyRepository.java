package com.quadrant.travelshoot.domains.survey.repository;

import com.quadrant.travelshoot.domains.survey.entity.UserSurvey;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SurveyRepository extends JpaRepository<UserSurvey, Long> {

    @Query("SELECT s FROM UserSurvey s " +
           "LEFT JOIN FETCH s.regions " +
           "LEFT JOIN FETCH s.foods " +
           "LEFT JOIN FETCH s.activities " +
           "WHERE s.user.id = :userId")
    Optional<UserSurvey> findByUserIdWithDetails(@Param("userId") Long userId);
    
    /**
     * 사용자 ID로 설문조사 존재 여부 확인
     * (중복 제출 방지용)
     */
    boolean existsByUserId(Long userId);
    
    /**
     * 사용자 ID로 간단 조회 (연관 데이터 제외)
     */
    @Query("SELECT s FROM UserSurvey s WHERE s.user.id = :userId")
    Optional<UserSurvey> findByUserId(@Param("userId") Long userId);
}