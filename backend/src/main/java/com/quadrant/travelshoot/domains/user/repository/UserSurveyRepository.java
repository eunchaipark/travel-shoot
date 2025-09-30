package com.quadrant.travelshoot.domains.user.repository;

import com.quadrant.travelshoot.domains.user.entity.UserSurvey;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserSurveyRepository extends JpaRepository<UserSurvey, Long> {
    Optional<UserSurvey> findByUserId(Long userId);
    boolean existsByUserId(Long userId);
}