package com.quadrant.travelshoot.domain.stay.controller;

import com.quadrant.travelshoot.domain.stay.dto.request.SearchRequest;
import com.quadrant.travelshoot.domain.stay.dto.request.FilterRequest;
import com.quadrant.travelshoot.domain.stay.dto.response.SearchResponse;
import com.quadrant.travelshoot.domain.stay.dto.response.AutocompleteResponse;
import com.quadrant.travelshoot.domain.stay.service.StaySearchService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/search")
@RequiredArgsConstructor
public class StaySearchController {

    private final StaySearchService staySearchService;

    //지역 검색 자동완성 ?
    @GetMapping("/autocomplete")
    public ResponseEntity<List<AutocompleteResponse>> autocomplete(
            @RequestParam String keyword
    ) {
        log.info("지역 자동완성 요청 - keyword: {}", keyword);
        List<AutocompleteResponse> suggestions = staySearchService.autocomplete(keyword);

        log.info("자동완성 결과: {} 개", suggestions.size());
        return ResponseEntity.ok(suggestions);
    }

    //기본 검색창 검색
    @GetMapping
    public ResponseEntity<SearchResponse> search(
            @ModelAttribute SearchRequest request,
            @PageableDefault(size = 20) Pageable pageable,
            HttpSession session
    ) {
        log.info("검색창 검색 요청 - region: {}, checkIn: {}, checkOut: {}, adults: {}, children: {}",
                request.getRegion(), request.getCheckIn(), request.getCheckOut(),
                request.getAdults(), request.getChildren());

        SearchResponse response = staySearchService.search(request, pageable);

        // 로그인 사용자면 검색 히스토리 저장
        Long userId = (Long) session.getAttribute("userId");
        if (userId != null) {
            staySearchService.saveSearchHistory(userId, request);
        }

        log.info("검색 완료 - 총 인원: {}명, 결과: {} 개",
                request.getTotalGuests(), response.getTotalCount());
        return ResponseEntity.ok(response);
    }

    // 사이드바 필터
    @PostMapping("/filter")
    public ResponseEntity<SearchResponse> filterSearch(
            @RequestBody FilterRequest request,
            @PageableDefault(size = 20) Pageable pageable
    ) {
        log.info("필터 검색 요청 - 적용된 필터: {} 개", request.getActiveFilterCount());
        log.info("   - 가격 범위: {} ~ {}", request.getMinPrice(), request.getMaxPrice());
        log.info("   - 숙소 타입: {}", request.getStayTypes());
        log.info("   - 편의시설: {}", request.getAmenities());

        SearchResponse response = staySearchService.filterSearch(request, pageable);

        log.info("필터 검색 완료 - 결과: {} 개", response.getTotalCount());
        return ResponseEntity.ok(response);
    }

    //무한스크롤 처리
    @GetMapping("/infinite")
    public ResponseEntity<SearchResponse> infiniteScroll(
            @ModelAttribute SearchRequest searchRequest,
            @ModelAttribute FilterRequest filterRequest,
            @PageableDefault(size = 20) Pageable pageable
    ) {
        log.info("무한 스크롤 - page: {}, size: {}", pageable.getPageNumber(), pageable.getPageSize());

        SearchResponse response = staySearchService.infiniteSearch(
                searchRequest, filterRequest, pageable);

        return ResponseEntity.ok(response);
    }

    //최근 5개 검색 목록
    @GetMapping("/history")
    public ResponseEntity<List<SearchRequest>> getHistory(HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return ResponseEntity.ok(List.of());
        }

        List<SearchRequest> history = staySearchService.getSearchHistory(userId);
        return ResponseEntity.ok(history);
    }

    //검색 목록 삭제하기
    @DeleteMapping("/history/{historyId}")
    public ResponseEntity<Void> deleteHistory(
            @PathVariable Long historyId,
            HttpSession session
    ) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return ResponseEntity.status(401).build();
        }

        staySearchService.deleteSearchHistory(userId, historyId);
        return ResponseEntity.noContent().build();
    }
}