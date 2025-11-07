package com.quadrant.travelshoot.domains.stay.repository;

import com.quadrant.travelshoot.domains.stay.document.StayDocument;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

/**
 * Elasticsearch 숙소 검색 Repository
 * 위치: backend/src/main/java/com/quadrant/travelshoot/domains/stay/repository/StayElasticsearchRepository.java
 */
@Repository
public interface StayElasticsearchRepository extends ElasticsearchRepository<StayDocument, Long> {
    // 기본 CRUD는 ElasticsearchRepository가 제공
    // 복잡한 쿼리는 Service에서 ElasticsearchClient로 직접 작성
}