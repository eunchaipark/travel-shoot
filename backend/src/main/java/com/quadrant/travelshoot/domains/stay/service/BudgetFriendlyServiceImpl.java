package com.quadrant.travelshoot.domains.stay.service;

import com.quadrant.travelshoot.domains.stay.dto.response.BudgetFriendlyResponse;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.repository.BudgetFriendlyRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 가격착한 숙소 서비스 구현체
 */
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class BudgetFriendlyServiceImpl implements BudgetFriendlyService {

    private final BudgetFriendlyRepository budgetFriendlyRepository;
    private final JdbcTemplate jdbcTemplate;

    @Override
    public List<BudgetFriendlyResponse> getBudgetFriendlyStays() {
        log.info("가격착한 숙소 조회 시작");

        // 1. 기본 필터링된 후보 조회
        List<Stay> candidates = budgetFriendlyRepository.findBudgetFriendlyCandidates();
        log.info("후보 숙소 개수: {}", candidates.size());

        if (candidates.isEmpty()) {
            log.warn("가격착한 숙소 후보가 없습니다.");
            return Collections.emptyList();
        }

        // 2. 각 숙소의 평균 최저가 계산 & 지역 정보 추가
        List<StayWithPrice> staysWithPrice = candidates.stream()
                .map(this::enrichStayData)
                .filter(Objects::nonNull)
                .sorted(Comparator
                        .comparing(StayWithPrice::getAveragePrice)
                        .thenComparing(s -> s.getStay().getAverageRating(), Comparator.reverseOrder())
                        .thenComparing(s -> s.getStay().getReviewCount(), Comparator.reverseOrder()))
                .collect(Collectors.toList());

        log.info("가격 계산 완료: {} 개", staysWithPrice.size());

        // 3. 타입별로 최저가 1개씩 선택 (최대 3개)
        List<StayWithPrice> selected = selectOnePerType(staysWithPrice);
        log.info("타입별 선택 완료: {} 개", selected.size());

        // 4. 남은 자리 채우기 (최대 6개)
        fillRemaining(selected, staysWithPrice);
        log.info("최종 선택 완료: {} 개", selected.size());

        // 5. DTO 변환
        return selected.stream()
                .map(this::convertToBudgetFriendlyResponse)
                .collect(Collectors.toList());
    }

    // ========== Private 헬퍼 메서드들 ==========

    /**
     * Stay 데이터에 가격, 지역명 추가
     */
    private StayWithPrice enrichStayData(Stay stay) {
        try {
            BigDecimal averagePrice = calculateAveragePrice(stay.getId());
            String cityName = getCityName(stay.getRegionId());
            Integer discountRate = calculateDiscountRate(averagePrice, cityName);

            return StayWithPrice.builder()
                    .stay(stay)
                    .averagePrice(averagePrice)
                    .cityName(cityName)
                    .discountRate(discountRate)
                    .build();
        } catch (Exception e) {
            log.warn("숙소 데이터 조회 실패 - stayId: {}", stay.getId(), e);
            return null;
        }
    }

    /**
     * 타입별로 최저가 1개씩 선택
     */
    private List<StayWithPrice> selectOnePerType(List<StayWithPrice> candidates) {
        List<StayWithPrice> selected = new ArrayList<>();
        Set<String> usedCities = new HashSet<>();

        String[] targetTypes = { "모텔", "호텔", "펜션" };

        for (String type : targetTypes) {
            Optional<StayWithPrice> found = candidates.stream()
                    .filter(s -> type.equals(s.getStay().getStayType()))
                    .filter(s -> !usedCities.contains(s.getCityName()) ||
                            countSameCity(selected, s.getCityName()) < 2)
                    .findFirst();

            if (found.isPresent()) {
                StayWithPrice stay = found.get();
                selected.add(stay);
                usedCities.add(stay.getCityName());
                log.info("타입 선택: {} - {} ({}원)", type, stay.getStay().getName(),
                        stay.getAveragePrice());
            }
        }

        return selected;
    }

    /**
     * 남은 자리 채우기
     */
    private void fillRemaining(List<StayWithPrice> selected, List<StayWithPrice> candidates) {
        Set<Long> selectedIds = selected.stream()
                .map(s -> s.getStay().getId())
                .collect(Collectors.toSet());

        Map<String, Long> typeCounts = selected.stream()
                .collect(Collectors.groupingBy(
                        s -> s.getStay().getStayType(),
                        Collectors.counting()));

        for (StayWithPrice candidate : candidates) {
            if (selected.size() >= 6) {
                break;
            }

            if (selectedIds.contains(candidate.getStay().getId())) {
                continue;
            }

            String type = candidate.getStay().getStayType();
            String city = candidate.getCityName();

            long typeCount = typeCounts.getOrDefault(type, 0L);
            if (typeCount >= 2) {
                continue;
            }

            long cityCount = countSameCity(selected, city);
            if (cityCount >= 2) {
                continue;
            }

            selected.add(candidate);
            selectedIds.add(candidate.getStay().getId());
            typeCounts.put(type, typeCount + 1);

            log.info("추가 선택: {} - {} ({}원)", type, candidate.getStay().getName(),
                    candidate.getAveragePrice());
        }
    }

    /**
     * 같은 시에서 선택된 숙소 개수
     */
    private long countSameCity(List<StayWithPrice> selected, String cityName) {
        return selected.stream()
                .filter(s -> cityName.equals(s.getCityName()))
                .count();
    }

    /**
     * 평균 최저가 계산 (평일 + 주말) / 2
     */
    private BigDecimal calculateAveragePrice(Long stayId) {
        List<Object[]> result = budgetFriendlyRepository.findMinPricesByStayId(stayId);

        if (result.isEmpty() || result.get(0)[0] == null) {
            throw new RuntimeException("객실 가격 정보 없음");
        }

        BigDecimal weekdayPrice = (BigDecimal) result.get(0)[0];
        BigDecimal weekendPrice = (BigDecimal) result.get(0)[1];

        return weekdayPrice.add(weekendPrice)
                .divide(new BigDecimal("2"), 0, RoundingMode.HALF_UP);
    }

    /**
     * 할인율 계산 (해당 시 평균가 대비)
     */
    private Integer calculateDiscountRate(BigDecimal stayPrice, String cityName) {
        try {
            // city_name만 추출 (예: "강원도 춘천시" -> "춘천시")
            String city = extractCityName(cityName);

            BigDecimal cityAverage = budgetFriendlyRepository.findAveragePriceByCityName(city);

            if (cityAverage == null || cityAverage.compareTo(BigDecimal.ZERO) == 0) {
                log.warn("지역 평균가 조회 실패 - cityName: {}", city);
                return 0;
            }

            // 할인율 = (평균가 - 현재가) / 평균가 * 100
            BigDecimal discount = cityAverage.subtract(stayPrice)
                    .divide(cityAverage, 4, RoundingMode.HALF_UP)
                    .multiply(new BigDecimal("100"));

            int discountRate = discount.intValue();

            // 0보다 작으면 0으로 (할인이 아닌 경우)
            return Math.max(0, discountRate);
        } catch (Exception e) {
            log.warn("할인율 계산 실패 - cityName: {}", cityName, e);
            return 0;
        }
    }

    /**
     * "강원도 춘천시" -> "춘천시" 추출
     */
    private String extractCityName(String fullName) {
        if (fullName == null)
            return "";
        String[] parts = fullName.split(" ");
        return parts.length > 1 ? parts[1] : parts[0];
    }

    /**
     * 시(city_name) 조회
     */
    private String getCityName(Long regionId) {
        try {
            String sql = "SELECT CONCAT(area_name, ' ', city_name) " +
                    "FROM regions WHERE region_id = ?";
            return jdbcTemplate.queryForObject(sql, String.class, regionId);
        } catch (Exception e) {
            log.warn("지역명 조회 실패 - regionId: {}", regionId);
            return "알 수 없음";
        }
    }

    /**
     * 대표 이미지 조회
     */
    private String getThumbnailImage(Long stayId) {
        try {
            String sql = "SELECT s3_url FROM files " +
                    "WHERE reference_type = 'STAY' " +
                    "AND reference_id = ? " +
                    "AND is_representative = true " +
                    "AND is_deleted = false " +
                    "ORDER BY sort_order LIMIT 1";
            List<String> images = jdbcTemplate.queryForList(sql, String.class, stayId);
            return images.isEmpty() ? null : images.get(0);
        } catch (Exception e) {
            log.warn("썸네일 조회 실패 - stayId: {}", stayId);
            return null;
        }
    }

    /**
     * 편의시설 조회 (최대 5개)
     */
    private List<String> getAmenities(Long stayId) {
        try {
            String sql = "SELECT a.amenity_name " +
                    "FROM stays_amenities sa " +
                    "INNER JOIN amenities a ON sa.amenity_id = a.amenity_id " +
                    "WHERE sa.stay_id = ? " +
                    "LIMIT 5";
            return jdbcTemplate.queryForList(sql, String.class, stayId);
        } catch (Exception e) {
            log.warn("편의시설 조회 실패 - stayId: {}", stayId);
            return Collections.emptyList();
        }
    }

    /**
     * BudgetFriendlyResponse 변환
     */
    private BudgetFriendlyResponse convertToBudgetFriendlyResponse(StayWithPrice stayWithPrice) {
        Stay stay = stayWithPrice.getStay();

        return BudgetFriendlyResponse.builder()
                .stayId(stay.getId())
                .stayName(stay.getName())
                .stayType(stay.getStayType())
                .address(stay.getAddress())
                .regionName(stayWithPrice.getCityName())
                .averagePrice(stayWithPrice.getAveragePrice())
                .discountRate(stayWithPrice.getDiscountRate())
                .averageRating(stay.getAverageRating())
                .reviewCount(stay.getReviewCount())
                .thumbnailUrl(getThumbnailImage(stay.getId()))
                .amenities(getAmenities(stay.getId()))
                .checkInTime(stay.getCheckInTime().toString())
                .checkOutTime(stay.getCheckOutTime().toString())
                .build();
    }

    // ========== 내부 DTO ==========

    /**
     * 내부 DTO: Stay + 가격 + 지역명 + 할인율
     */
    @lombok.Getter
    @lombok.Builder
    private static class StayWithPrice {
        private Stay stay;
        private BigDecimal averagePrice;
        private String cityName;
        private Integer discountRate;
    }
}