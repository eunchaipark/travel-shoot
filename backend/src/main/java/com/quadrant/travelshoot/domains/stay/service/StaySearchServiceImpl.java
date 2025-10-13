package com.quadrant.travelshoot.domains.stay.service;

import com.quadrant.travelshoot.domains.stay.dto.request.SearchRequest;
import com.quadrant.travelshoot.domains.stay.dto.request.FilterRequest;
import com.quadrant.travelshoot.domains.stay.dto.response.SearchResponse;
import com.quadrant.travelshoot.domains.stay.dto.response.AutocompleteResponse;
import com.quadrant.travelshoot.domains.stay.dto.response.StayListItem;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.entity.SearchHistory;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;
import com.quadrant.travelshoot.domains.stay.repository.SearchHistoryRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.quadrant.travelshoot.common.enums.PlaceType; //추가 1010
import org.springframework.data.domain.PageRequest;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.ArrayList;
import java.util.stream.Collectors;

//숙소 검색
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class StaySearchServiceImpl implements StaySearchService {

    private final StayRepository stayRepository;
    private final SearchHistoryRepository searchHistoryRepository;
    private final JdbcTemplate jdbcTemplate;

    @Override
    public List<AutocompleteResponse> autocomplete(String keyword) {
        log.info("지역 자동완성 실행 - keyword: {}", keyword);

        List<AutocompleteResponse> results = new ArrayList<>();

        //지역 검색하기
        List<String> regions = stayRepository.findRegionsByKeyword(keyword);
        List<AutocompleteResponse> regionResults = regions.stream()
                .limit(5)
                .map(region -> AutocompleteResponse.builder()
                    .keyword(region)
                    .type("REGION")
                    .build())
                .collect(Collectors.toList());

        //호텔명 검색하기
        List<String> stayName = stayRepository.findStayNamesByKeyword(keyword);
        List<AutocompleteResponse> stayResults = stayName.stream()
                .limit(5)
                .map(name-> AutocompleteResponse.builder()
                    .keyword(name)
                    .type("STAY")
                    .build())
                .collect(Collectors.toList());

        results.addAll(regionResults);
        results.addAll(stayResults);

        log.info("자동완성 결과 - 지역 : {}개",regionResults.size(),stayResults.size());

        return results;
}

    @Override
    public SearchResponse search(SearchRequest request, Pageable pageable) {
        validateSearchRequest(request);

        Page<Stay> stays = stayRepository.searchStays(
                request.getRegion(),
                request.getCheckIn(),
                request.getCheckOut(),
                request.getTotalGuests(),
                pageable
        );

        return buildSearchResponse(stays,pageable.getPageNumber());
    }

    @Override
    public SearchResponse filterSearch(FilterRequest request, Pageable pageable) {
        log.info("사이드바 필터 검색 - 활성 필터: {} 개", request.getActiveFilterCount());

        // 리스트 크기 계산
        List<String> stayTypes = (request.getStayTypes() != null) ? request.getStayTypes() : List.of();
        List<Integer> ratings = (request.getRatings() != null) ? request.getRatings() : List.of();
        List<String> amenities = (request.getAmenities() != null) ? request.getAmenities() : List.of();

        int stayTypesSize = stayTypes.size();
        int ratingsSize = ratings.size();
        int amenityCount = amenities.size();

        // 빈 리스트 처리 (SQL IN 절 에러 방지)
        if (stayTypesSize == 0) {
            stayTypes = List.of("__DUMMY__");
        }
        if (ratingsSize == 0) {
            ratings = List.of(0);
        }
        if (amenityCount == 0) {
            amenities = List.of("__DUMMY__");
            amenityCount = 0;
        }

        // 실제 이용 인원 계산 (검색창에서 입력한 adults + children)
        Integer actualGuests = request.getTotalGuests();

        // 필터에서 입력한 수용 인원 범위
        Integer filterMinGuests = request.getMinGuests();
        Integer filterMaxGuests = request.getMaxGuests();

        Page<Stay> stays = stayRepository.searchWithAdvancedFilters(
                request.getRegion(),
                request.getMinPrice(),
                request.getMaxPrice(),
                stayTypes,
                stayTypesSize,
                actualGuests,
                filterMinGuests,
                filterMaxGuests,
                request.getBedroomCount(),
                request.getBathroomCount(),
                ratings,
                ratingsSize,
                amenities,
                amenityCount,
                pageable
        );

        return buildSearchResponse(stays,pageable.getPageNumber());
    }

    @Override
    public SearchResponse infiniteSearch(
            SearchRequest searchRequest,
            FilterRequest filterRequest,
            Pageable pageable
    ) {

        // 1011 몇페이지인지 데이터 담고 있게 추가함
        int currentPage = pageable.getPageNumber();
        int pageSize = pageable.getPageSize();

        log.info("무한 스크롤 - page: {}, size{}",currentPage,pageSize);

        // page > 0 이면 url 공유하는 경우가 발생하게 되며는 이제 으음 .... 앞에 누적되어있는 데이터도 반드시 같이 반환해줘야함..
        if(currentPage > 0 ){
            log.info("url 공유 시 페이징 처리 : 0 ~ {} 페이지까지 누적된 데이터 반환 처리해야함",currentPage);
            return getAccumulatedData(searchRequest,filterRequest,currentPage,pageSize,pageable);
        }

        // page = 0 첫번째 페이지에 해당하는 데이터 값 반환하기
        if (filterRequest != null && filterRequest.getActiveFilterCount() > 0) {
            return filterSearch(filterRequest, pageable);
        } else {
            return search(searchRequest, pageable);
        }
    }

    // 1011 추가
    // url 공유하기 위해서 누적 데이터 조회하기 page = 3 이면 0,1,2,3 페이지 모든 데이터 반환처리
    private SearchResponse getAccumulatedData(
            SearchRequest searchRequest,
            FilterRequest filterRequest,
            int targetPage,
            int pageSize,
            Pageable originalPageable
    ) {
        log.info("누적 데이터 조회 시작 - 목표 페이지: {}, 페이지 크기: {}", targetPage, pageSize);

        // 0부터 targetPage까지의 모든 데이터를 가져오기 위한 크기 계산
        int accumulatedSize = (targetPage + 1) * pageSize;
        // 새로운 Pageable 생성 (page=0, size=누적크기, 정렬은 유지)
        Pageable accumulatedPageable = PageRequest.of(0, accumulatedSize, originalPageable.getSort());

        Page<Stay> stays;

        // 필터가 있으면 필터 검색, 없으면 일반 검색
        if (filterRequest != null && filterRequest.getActiveFilterCount() > 0) {
            log.info("필터 적용된 누적 데이터 조회");
            stays = executeFilterSearch(filterRequest, accumulatedPageable);
        } else {
            log.info("일반 검색 누적 데이터 조회");
            validateSearchRequest(searchRequest);
            stays = stayRepository.searchStays(
                    searchRequest.getRegion(),
                    searchRequest.getCheckIn(),
                    searchRequest.getCheckOut(),
                    searchRequest.getTotalGuests(),
                    accumulatedPageable
            );
        }

        // 응답 생성 시 currentPage는 targetPage로 설정
        SearchResponse response = buildSearchResponse(stays, targetPage);

        log.info("누적 데이터 반환 완료 - 총 {} 개 항목, 현재 페이지: {}",
                stays.getContent().size(), targetPage);

        return response;
    }


    //
    private Page<Stay> executeFilterSearch(FilterRequest request, Pageable pageable) {
        List<String> stayTypes = (request.getStayTypes() != null) ?
                request.getStayTypes() : List.of();
        List<Integer> ratings = (request.getRatings() != null) ?
                request.getRatings() : List.of();
        List<String> amenities = (request.getAmenities() != null) ?
                request.getAmenities() : List.of();

        int stayTypesSize = stayTypes.size();
        int ratingsSize = ratings.size();
        int amenityCount = amenities.size();

        if (stayTypesSize == 0) stayTypes = List.of("__DUMMY__");
        if (ratingsSize == 0) ratings = List.of(0);
        if (amenityCount == 0) {
            amenities = List.of("__DUMMY__");
            amenityCount = 0;
        }

        Integer actualGuests = request.getTotalGuests();
        Integer filterMinGuests = request.getMinGuests();
        Integer filterMaxGuests = request.getMaxGuests();

        return stayRepository.searchWithAdvancedFilters(
                request.getRegion(),
                request.getMinPrice(),
                request.getMaxPrice(),
                stayTypes,
                stayTypesSize,
                actualGuests,
                filterMinGuests,
                filterMaxGuests,
                request.getBedroomCount(),
                request.getBathroomCount(),
                ratings,
                ratingsSize,
                amenities,
                amenityCount,
                pageable
        );
    }


    @Override
    @Transactional
    public void saveSearchHistory(Long userId, SearchRequest request) {
        boolean isDuplicate = searchHistoryRepository.existsByUserIdAndRegionAndCreatedAtAfter(
                userId,
                request.getRegion(),
                LocalDateTime.now().minusMinutes(1)
        );

        if (isDuplicate) {
            log.info(" 중복 검색 - 기록 저장 스킵");
            return;
        }

        SearchHistory history = SearchHistory.builder()
                .userId(userId)
                .region(request.getRegion())
                .checkIn(request.getCheckIn())
                .checkOut(request.getCheckOut())
                .adults(request.getAdults())
                .children(request.getChildren())
                .createdAt(LocalDateTime.now())
                .build();

        searchHistoryRepository.save(history);
        log.info("검색 기록 저장 완료 - userId: {}, 성인: {}명, 어린이: {}명",
                userId, request.getAdults(), request.getChildren());

        maintainRecentHistory(userId);
    }

    @Override
    public List<SearchRequest> getSearchHistory(Long userId) {
        List<SearchHistory> histories = searchHistoryRepository
                .findTop5ByUserIdOrderByCreatedAtDesc(userId);

        return histories.stream()
                .map(this::toSearchRequest)
                .collect(Collectors.toList());
    }

    @Override
    @Transactional
    public void deleteSearchHistory(Long userId, Long historyId) {
        SearchHistory history = searchHistoryRepository.findById(historyId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 검색 기록입니다."));

        if (!history.getUserId().equals(userId)) {
            throw new IllegalArgumentException("삭제 권한이 없습니다.");
        }

        searchHistoryRepository.delete(history);
        log.info("검색 기록 삭제 완료 - historyId: {}", historyId);
    }

    // ===== Private 메서드 =====

    private void validateSearchRequest(SearchRequest request) {
        LocalDate checkIn = request.getCheckIn();
        LocalDate checkOut = request.getCheckOut();

        if (checkIn == null || checkOut == null) {
            throw new IllegalArgumentException("체크인/체크아웃 날짜는 필수입니다.");
        }

        if (checkIn.isBefore(LocalDate.now())) {
            throw new IllegalArgumentException("체크인 날짜는 오늘 이후여야 합니다.");
        }

        if (checkOut.isBefore(checkIn.plusDays(1))) {
            throw new IllegalArgumentException("체크아웃은 체크인 다음 날 이후여야 합니다.");
        }

        Integer adults = (request.getAdults() != null) ? request.getAdults() : 0;
        Integer children = (request.getChildren() != null) ? request.getChildren() : 0;

        if (adults < 1) {
            throw new IllegalArgumentException("성인은 최소 1명 이상이어야 합니다.");
        }

        if (children < 0) {
            throw new IllegalArgumentException("어린이 인원은 0명 이상이어야 합니다.");
        }
    }

    private SearchResponse buildSearchResponse(Page<Stay> stays,int currentPage) {
        List<StayListItem> items = stays.getContent().stream()
                .map(this::toStayListItem)
                .collect(Collectors.toList());

        return SearchResponse.builder()
                .stays(items)
                .totalCount(stays.getTotalElements())
                .currentPage(currentPage)
                .totalPages(stays.getTotalPages())
                .hasNext(stays.hasNext())
                .build();
    }

    private StayListItem toStayListItem(Stay stay) {
        String regionName = getRegionName(stay.getRegionId());
        BigDecimal minPrice = getMinPrice(stay.getId());
        String thumbnailImage = getThumbnailImage(stay.getId());
        List<String> amenities = getAmenities(stay.getId());
        String checkInTimeStr = stay.getCheckInTime() != null
                ? stay.getCheckInTime().format(DateTimeFormatter.ofPattern("HH:mm"))
                : null;

        return StayListItem.builder()
                .stayId(stay.getId())
                .name(stay.getName())
                .stayType(stay.getStayType())
                .region(regionName)
                .address(stay.getAddress())
                .thumbnailImage(thumbnailImage)
                .lowestPrice(minPrice != null ? minPrice.intValue() : 0)
                .rating(stay.getAverageRating() != null ? stay.getAverageRating() : BigDecimal.ZERO)
                .reviewCount(stay.getReviewCount() != null ? stay.getReviewCount() : 0)
                .latitude(stay.getLatitude())
                .longitude(stay.getLongitude())
                .checkInTime(checkInTimeStr)
                .amenities(amenities)
                .placeType(PlaceType.STAY)
                .build();
    }

    private String getRegionName(Long regionId) {
        try {
            String sql = "SELECT CONCAT(area_name, ' ', COALESCE(city_name, '')) FROM regions WHERE region_id = ?";
            return jdbcTemplate.queryForObject(sql, String.class, regionId);
        } catch (Exception e) {
            log.warn("지역명 조회 실패 - regionId: {}", regionId);
            return "알 수 없음";
        }
    }

    private BigDecimal getMinPrice(Long stayId) {
        try {
            String sql = "SELECT MIN(weekday_price) FROM rooms WHERE stay_id = ? AND is_available = true";
            return jdbcTemplate.queryForObject(sql, BigDecimal.class, stayId);
        } catch (Exception e) {
            log.warn("최저가 조회 실패 - stayId: {}", stayId);
            return BigDecimal.ZERO;
        }
    }

    private String getThumbnailImage(Long stayId) {
        try {
            String sql = "SELECT image_url FROM stay_images WHERE stay_id = ? ORDER BY display_order LIMIT 1";
            List<String> images = jdbcTemplate.queryForList(sql, String.class, stayId);
            return images.isEmpty() ? null : images.get(0);
        } catch (Exception e) {
            log.warn("썸네일 이미지 조회 실패 - stayId: {}", stayId);
            return null;
        }
    }

    private List<String> getAmenities(Long stayId) {
        try {
            String sql =
                    "SELECT a.amenity_name " +
                            "FROM stays_amenities sa " +
                            "INNER JOIN amenities a ON sa.amenity_id = a.amenity_id " +
                            "WHERE sa.stay_id = ?";
            return jdbcTemplate.queryForList(sql, String.class, stayId);
        } catch (Exception e) {
            log.warn("편의시설 조회 실패 - stayId: {}", stayId);
            return List.of();
        }
    }

    private SearchRequest toSearchRequest(SearchHistory history) {
        return SearchRequest.builder()
                .region(history.getRegion())
                .checkIn(history.getCheckIn())
                .checkOut(history.getCheckOut())
                .adults(history.getAdults())
                .children(history.getChildren())
                .build();
    }

    private void maintainRecentHistory(Long userId) {
        List<SearchHistory> all = searchHistoryRepository
                .findByUserIdOrderByCreatedAtDesc(userId);

        if (all.size() > 5) {
            List<SearchHistory> toDelete = all.subList(5, all.size());
            searchHistoryRepository.deleteAll(toDelete);
            log.info("오래된 검색 {} 개 삭제", toDelete.size());
        }
    }
}