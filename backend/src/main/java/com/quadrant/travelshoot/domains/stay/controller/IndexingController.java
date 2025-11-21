package com.quadrant.travelshoot.domains.stay.controller;

import com.quadrant.travelshoot.domains.stay.service.StayIndexingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/api/stays/indexing")
@RequiredArgsConstructor
public class IndexingController {

    private final StayIndexingService stayIndexingService;

    /**
     * 인덱스 초기 설정 (최초 1회 실행)
     * Elasticsearch stays 인덱스 생성 + 매핑 설정
     */
    @PostMapping("/create-index")
    public ResponseEntity<String> createIndex() {
        try {
            log.info("stays 인덱스 생성 시작...");
            stayIndexingService.createIndex();
            return ResponseEntity.ok("인덱스 생성 완료!");
        } catch (Exception e) {
            log.error("인덱스 생성 실패", e);
            return ResponseEntity.internalServerError().body("인덱스 생성 실패: " + e.getMessage());
        }
    }

    /**
     * 전체 숙소 데이터 재색인
     */
    @PostMapping("/reindex-all")
    public ResponseEntity<String> reindexAll() {
        try {
            log.info("전체 재색인 시작...");
            stayIndexingService.reindexAll();
            return ResponseEntity.ok("재색인 완료!");
        } catch (Exception e) {
            log.error("재색인 실패", e);
            return ResponseEntity.internalServerError().body("재색인 실패: " + e.getMessage());
        }
    }

    /**
     * 특정 숙소 색인
     */
    @PostMapping("/index/{stayId}")
    public ResponseEntity<String> indexStay(@PathVariable Long stayId) {
        try {
            log.info("숙소 색인 시작 - stayId: {}", stayId);
            stayIndexingService.indexStay(stayId);
            return ResponseEntity.ok("숙소 색인 완료!");
        } catch (Exception e) {
            log.error("숙소 색인 실패", e);
            return ResponseEntity.internalServerError().body("색인 실패: " + e.getMessage());
        }
    }
}