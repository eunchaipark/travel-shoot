package com.quadrant.travelshoot.domain.stay.repository;

import com.quadrant.travelshoot.domain.stay.entity.SearchHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

// 검색 기록
@Repository
public interface SearchHistoryRepository extends JpaRepository<SearchHistory, Long> {

    //최근 5개 검색 기록
    List<SearchHistory> findTop5ByUserIdOrderByCreatedAtDesc(Long userId);

    //전체 검색 기록
    List<SearchHistory> findByUserIdOrderByCreatedAtDesc(Long userId);

    //중복 검색 확인하기
    boolean existsByUserIdAndRegionAndCreatedAtAfter(
            Long userId, String region, LocalDateTime after);
}