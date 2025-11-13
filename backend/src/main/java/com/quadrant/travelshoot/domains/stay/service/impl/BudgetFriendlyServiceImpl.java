package com.quadrant.travelshoot.domains.stay.service.impl;

import com.quadrant.travelshoot.domains.stay.dto.response.BudgetFriendlyResponse;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;
import com.quadrant.travelshoot.domains.stay.service.BudgetFriendlyService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class BudgetFriendlyServiceImpl implements BudgetFriendlyService {

    private final StayRepository stayRepository;
    private final JdbcTemplate jdbcTemplate;

    @Override
    public List<BudgetFriendlyResponse> getBudgetFriendlyStays() {
        log.info("가격착한 숙소 조회 시작");

        List<Stay> candidates = stayRepository.findBudgetFriendlyCandidates();

        if (candidates.isEmpty()) {
            log.warn("가격착한 숙소 후보가 없습니다.");
            return Collections.emptyList();
        }

        Map<String, List<Stay>> byType = candidates.stream()
                .collect(Collectors.groupingBy(Stay::getStayType));

        List<StayWithPrice> allProcessed = new ArrayList<>();
        String[] types = {"모텔", "호텔", "펜션"};

        for (String type : types) {
            List<Stay> typeStays = byType.getOrDefault(type, Collections.emptyList());

            List<StayWithPrice> typeSorted = typeStays.stream()
                    .map(this::enrichStayData)
                    .filter(Objects::nonNull)
                    .sorted(Comparator
                            .comparing(StayWithPrice::getDiscountRate, Comparator.reverseOrder())
                            .thenComparing(StayWithPrice::getAveragePrice)
                            .thenComparing(s -> s.getStay().getAverageRating(),
                                    Comparator.reverseOrder()))
                    .collect(Collectors.toList());

            allProcessed.addAll(typeSorted);
        }

        List<StayWithPrice> selected = selectWithRoundRobin(allProcessed, types);

        return selected.stream()
                .map(this::convertToBudgetFriendlyResponse)
                .collect(Collectors.toList());
    }

    private StayWithPrice enrichStayData(Stay stay) {
        try {
            BigDecimal averagePrice = calculateAveragePrice(stay.getId());
            String cityName = getCityName(stay.getRegionId());
            Integer discountRate = calculateDiscountRate(averagePrice, cityName, stay.getStayType());

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

    private List<StayWithPrice> selectWithRoundRobin(List<StayWithPrice> allStays, String[] types) {
        List<StayWithPrice> result = new ArrayList<>();

        Map<String, List<StayWithPrice>> byType = allStays.stream()
                .collect(Collectors.groupingBy(s -> s.getStay().getStayType()));

        int maxRounds = byType.values().stream()
                .mapToInt(List::size)
                .max()
                .orElse(0);

        for (int round = 0; round < maxRounds && result.size() < 6; round++) {
            for (String type : types) {
                List<StayWithPrice> typeList = byType.get(type);
                if (typeList != null && round < typeList.size()) {
                    result.add(typeList.get(round));
                    if (result.size() >= 6) break;
                }
            }
        }

        return result;
    }

    private BigDecimal calculateAveragePrice(Long stayId) {
        List<Object[]> result = stayRepository.findMinPricesByStayId(stayId);

        if (result.isEmpty() || result.get(0)[0] == null) {
            throw new RuntimeException("객실 가격 정보 없음");
        }

        BigDecimal weekdayPrice = (BigDecimal) result.get(0)[0];
        BigDecimal weekendPrice = (BigDecimal) result.get(0)[1];
        return weekdayPrice;
    }

    private Integer calculateDiscountRate(BigDecimal stayPrice, String cityName, String stayType) {
        try {
            String city = extractCityName(cityName);

            String sql = """
                SELECT COALESCE(AVG(r.weekday_price), 0)
                FROM stays s
                INNER JOIN rooms r ON s.stay_id = r.stay_id
                INNER JOIN regions reg ON s.region_id = reg.region_id
                WHERE reg.city_name = ?
                  AND s.stay_type = ?
                  AND r.is_active = true
                  AND s.is_active = true
                """;

            BigDecimal cityTypeAverage = jdbcTemplate.queryForObject(sql, BigDecimal.class, city, stayType);

            if (cityTypeAverage == null || cityTypeAverage.compareTo(BigDecimal.ZERO) == 0) {
                return 0;
            }

            BigDecimal discount = cityTypeAverage.subtract(stayPrice)
                    .divide(cityTypeAverage, 4, RoundingMode.HALF_UP)
                    .multiply(new BigDecimal("100"));

            int discountRate = discount.intValue();

            return Math.max(0, discountRate);
        } catch (Exception e) {
            return 0;
        }
    }

    private String extractCityName(String fullName) {
        if (fullName == null)
            return "";
        String[] parts = fullName.split(" ");
        return parts.length > 1 ? parts[1] : parts[0];
    }

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

    private String getThumbnailImage(Long stayId) {
        try {
            String sql = "SELECT s3_url FROM files " +
                    "WHERE reference_type = 'STAYS' " +
                    "AND reference_id = ? " +
                    "ORDER BY sort_order LIMIT 1";
            List<String> images = jdbcTemplate.queryForList(sql, String.class, stayId);
            return images.isEmpty() ? null : images.get(0);
        } catch (Exception e) {
            log.warn("썸네일 조회 실패 - stayId: {}", stayId);
            return null;
        }
    }

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

    @lombok.Getter
    @lombok.Builder
    private static class StayWithPrice {
        private Stay stay;
        private BigDecimal averagePrice;
        private String cityName;
        private Integer discountRate;
    }
}