package com.quadrant.travelshoot.domains.user.repository;

import com.quadrant.travelshoot.domains.user.entity.UserSurvey;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserSurveyRepository extends JpaRepository<UserSurvey, Long> {
    @Query("SELECT s FROM UserSurvey s " +
            "LEFT JOIN FETCH s.regions " +
            "WHERE s.user.id = :userId")
    Optional<UserSurvey> findByUserId(@Param("userId") Long userId);

    boolean existsByUserId(Long userId);
}