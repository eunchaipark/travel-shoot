package com.quadrant.travelshoot.domains.survey.repository;

import com.quadrant.travelshoot.domains.survey.entity.UserSurvey;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserSurveyRepository extends JpaRepository<UserSurvey, Long> {

    /**
     * 사용자 ID로 설문조사 조회
     * @BatchSize로 N+1 방지
     */
    Optional<UserSurvey> findByUserId(@Param("userId") Long userId);

    /**
     * 사용자 ID로 완료된 설문조사만 조회
     */
    @Query("SELECT us FROM UserSurvey us " +
            "WHERE us.userId = :userId AND us.isCompleted = true")
    Optional<UserSurvey> findCompletedSurveyByUserId(@Param("userId") Long userId);

    // 실존하는 ID인가 검증
    boolean existsByUserId(Long userId);

    @Query("SELECT s FROM UserSurvey s " +
           "LEFT JOIN FETCH s.regions " +
           "LEFT JOIN FETCH s.foods " +
           "LEFT JOIN FETCH s.activities " +
           "WHERE s.userId = :userId")
    Optional<UserSurvey> findByUserIdWithDetails(@Param("userId") Long userId);
}