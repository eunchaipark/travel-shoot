package com.quadrant.travelshoot.domain.stay.service;

import com.quadrant.travelshoot.domain.stay.dto.request.SearchRequest;
import com.quadrant.travelshoot.domain.stay.dto.request.FilterRequest;
import com.quadrant.travelshoot.domain.stay.dto.response.SearchResponse;
import com.quadrant.travelshoot.domain.stay.dto.response.AutocompleteResponse;
import com.quadrant.travelshoot.domain.stay.dto.response.StayListItem;
import com.quadrant.travelshoot.domain.stay.entity.Stay;
import com.quadrant.travelshoot.domain.stay.entity.SearchHistory;
import com.quadrant.travelshoot.domain.stay.repository.StayRepository;
import com.quadrant.travelshoot.domain.stay.repository.SearchHistoryRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.quadrant.travelshoot.common.enums.PlaceType; //추가 1010

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
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

        List<String> regions = stayRepository.findRegionsByKeyword(keyword);

        return regions.stream()
                .limit(10)
                .map(region -> AutocompleteResponse.builder()
                        .keyword(region)
                        .type("REGION")
                        .build())
                .collect(Collectors.toList());
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

        return buildSearchResponse(stays);
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

        // 🆕 추가: 실제 이용 인원 계산 (검색창에서 입력한 adults + children)
        Integer actualGuests = request.getTotalGuests();

        // 🆕 추가: 필터에서 입력한 수용 인원 범위
        Integer filterMinGuests = request.getMinGuests();
        Integer filterMaxGuests = request.getMaxGuests();

        Page<Stay> stays = stayRepository.searchWithAdvancedFilters(
                request.getRegion(),
                request.getMinPrice(),
                request.getMaxPrice(),
                stayTypes,
                stayTypesSize,
                actualGuests,        // 🆕 추가: 실제 이용 인원
                filterMinGuests,     // 🔄 변경: 필터 최소 수용 인원
                filterMaxGuests,     // 🔄 변경: 필터 최대 수용 인원
                request.getBedroomCount(),
                request.getBathroomCount(),
                ratings,
                ratingsSize,
                amenities,
                amenityCount,
                pageable
        );

        return buildSearchResponse(stays);
    }

    @Override
    public SearchResponse infiniteSearch(
            SearchRequest searchRequest,
            FilterRequest filterRequest,
            Pageable pageable
    ) {
        if (filterRequest != null && filterRequest.getActiveFilterCount() > 0) {
            return filterSearch(filterRequest, pageable);
        } else {
            return search(searchRequest, pageable);
        }
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

    private SearchResponse buildSearchResponse(Page<Stay> stays) {
        List<StayListItem> items = stays.getContent().stream()
                .map(this::toStayListItem)
                .collect(Collectors.toList());

        return SearchResponse.builder()
                .stays(items)
                .totalCount(stays.getTotalElements())
                .currentPage(stays.getNumber())
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