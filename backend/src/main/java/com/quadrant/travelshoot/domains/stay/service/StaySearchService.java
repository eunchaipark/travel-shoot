package com.quadrant.travelshoot.domain.stay.service;

import com.quadrant.travelshoot.domain.stay.dto.request.SearchRequest;
import com.quadrant.travelshoot.domain.stay.dto.request.FilterRequest;
import com.quadrant.travelshoot.domain.stay.dto.response.SearchResponse;
import com.quadrant.travelshoot.domain.stay.dto.response.AutocompleteResponse;
import org.springframework.data.domain.Pageable;

import java.util.List;

//숙소 검색
public interface StaySearchService {

    //검색창 ( 지역 자동완성 )
    List<AutocompleteResponse> autocomplete(String keyword);

    //검색창 검색 ( 지역 , 날짜, 인원수 )
    SearchResponse search(SearchRequest request, Pageable pageable);

    // 사이드바 실시간 필터
    SearchResponse filterSearch(FilterRequest request, Pageable pageable);

    //무한 스크롤 처리
    SearchResponse infiniteSearch(SearchRequest searchRequest, FilterRequest filterRequest, Pageable pageable);

    // 검색 기록 5개
    void saveSearchHistory(Long userId, SearchRequest request);

    //검색 기록 조회 ?
    List<SearchRequest> getSearchHistory(Long userId);

    //검색 기록 삭제
    void deleteSearchHistory(Long userId, Long historyId);
}