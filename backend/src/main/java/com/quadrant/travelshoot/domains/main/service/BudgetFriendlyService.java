package com.quadrant.travelshoot.domains.main.service;

import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class BudgetFriendlyService {

    private final StayRepository stayRepository;

    private static final int TARGET_COUNT = 6;
    private static final BigDecimal MIN_RATING = BigDecimal.valueOf(3.5);

    /**
     * 가격 착한 숙소 6개 조회
     */
    public List<Map<String, Object>> getBudgetFriendlyStays() {
        log.info("=== 가격착한 숙소 조회 시작 ===");

        // 1단계: 지역별 평균 가격 계산
        Map<String, BigDecimal> regionAvgPrices = calculateRegionAveragePrices();
        log.info("지역별 평균 가격: {}", regionAvgPrices);

        // 2단계: 15% 할인으로 시도
        List<BudgetStay> candidates = findBudgetStays(regionAvgPrices, 15);
        log.info("15% 할인 기준: {}개", candidates.size());

        // 3단계: 부족하면 10% 할인으로 확대
        if (candidates.size() < TARGET_COUNT) {
            log.warn("후보 부족 - 10% 할인으로 확대");
            candidates = findBudgetStays(regionAvgPrices, 10);
            log.info("10% 할인 기준: {}개", candidates.size());
        }

        // 4단계: 여전히 부족하면 5% 할인으로 최종 확대
        if (candidates.size() < TARGET_COUNT) {
            log.warn("후보 부족 - 5% 할인으로 최종 확대");
            candidates = findBudgetStays(regionAvgPrices, 5);
            log.info("5% 할인 기준: {}개", candidates.size());
        }

        // 5단계: 지역별 분산 + 상위 6개 선정
        List<BudgetStay> finalStays = selectDiversifiedStays(candidates, TARGET_COUNT);
        log.info("=== 최종 선정: {}개 ===", finalStays.size());

        // 6단계: 응답 DTO 생성
        return finalStays.stream()
                .map(this::toResponseMap)
                .collect(Collectors.toList());
    }

    /**
     * 지역별 평균 가격 계산
     */
    private Map<String, BigDecimal> calculateRegionAveragePrices() {
        List<Object[]> regionPrices = stayRepository.findAveragePriceByRegion();
        
        Map<String, BigDecimal> avgPrices = new HashMap<>();
        for (Object[] row : regionPrices) {
            String regionName = (String) row[0];
            
            // Double을 BigDecimal로 변환
            Object priceObj = row[1];
            BigDecimal avgPrice;
            
            if (priceObj instanceof Double) {
                avgPrice = BigDecimal.valueOf((Double) priceObj);
            } else if (priceObj instanceof BigDecimal) {
                avgPrice = (BigDecimal) priceObj;
            } else {
                log.warn("예상치 못한 타입: {}", priceObj.getClass());
                continue;
            }
            
            avgPrices.put(regionName, avgPrice);
        }
        
        return avgPrices;
    }

    /**
     * 할인율 기준으로 가격착한 숙소 찾기
     */
    private List<BudgetStay> findBudgetStays(
            Map<String, BigDecimal> regionAvgPrices, 
            int discountPercent) {
        
        // 평점 3.5 이상, 활성화된 숙소만 조회
        List<Stay> allStays = stayRepository.findByAverageRatingGreaterThanEqualAndIsActiveTrue(MIN_RATING);
        
        List<BudgetStay> budgetStays = new ArrayList<>();
        
        for (Stay stay : allStays) {
            String regionName = stay.getRegion().getAreaName();
            BigDecimal regionAvg = regionAvgPrices.get(regionName);
            
            if (regionAvg == null) continue;
            
            // 해당 숙소의 최저 평일 가격
            BigDecimal stayPrice = stayRepository.findMinWeekdayPrice(stay.getId());
            if (stayPrice == null) continue;
            
            // 지역 평균 대비 할인율 계산
            BigDecimal discountThreshold = regionAvg.multiply(
                BigDecimal.valueOf(100 - discountPercent)
            ).divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP);
            
            // 할인 기준 충족 여부
            if (stayPrice.compareTo(discountThreshold) <= 0) {
                // 실제 할인율 계산
                BigDecimal actualDiscount = regionAvg.subtract(stayPrice)
                        .divide(regionAvg, 4, RoundingMode.HALF_UP)
                        .multiply(BigDecimal.valueOf(100));
                
                budgetStays.add(new BudgetStay(stay, stayPrice, actualDiscount.intValue()));
            }
        }
        
        // 할인율 높은 순으로 정렬
        budgetStays.sort(Comparator.comparingInt(BudgetStay::getDiscountPercent).reversed());
        
        return budgetStays;
    }

    /**
     * 지역별 분산하여 선정
     */
    private List<BudgetStay> selectDiversifiedStays(List<BudgetStay> candidates, int targetCount) {
        if (candidates.size() <= targetCount) {
            return candidates;
        }
        
        List<BudgetStay> selected = new ArrayList<>();
        Set<String> selectedRegions = new HashSet<>();
        
        // 1차: 지역별로 1개씩 선택
        for (BudgetStay stay : candidates) {
            String region = stay.getStay().getRegion().getAreaName();
            if (!selectedRegions.contains(region)) {
                selected.add(stay);
                selectedRegions.add(region);
                
                if (selected.size() >= targetCount) {
                    return selected;
                }
            }
        }
        
        // 2차: 남은 개수만큼 할인율 높은 순으로 추가
        for (BudgetStay stay : candidates) {
            if (!selected.contains(stay)) {
                selected.add(stay);
                
                if (selected.size() >= targetCount) {
                    break;
                }
            }
        }
        
        return selected;
    }

    /**
     * 응답 Map 생성
     */
    private Map<String, Object> toResponseMap(BudgetStay budgetStay) {
        Stay stay = budgetStay.getStay();
        
        Map<String, Object> response = new HashMap<>();
        response.put("id", stay.getId());
        response.put("stayCode", stay.getStayCode());
        response.put("title", stay.getStayName());
        response.put("image", null); // TODO: 나중에 추가
        response.put("rating", stay.getAverageRating());
        response.put("location", formatLocation(stay));
        response.put("price", budgetStay.getPrice());
        response.put("discount", budgetStay.getDiscountPercent());
        response.put("checkinTime", stay.getCheckInTime().toString().substring(0, 5));
        response.put("reviews", formatReviews(stay.getReviewCount()));
        
        log.info("선정: {} - 가격: {}원, 할인: {}%", 
                stay.getStayName(), budgetStay.getPrice(), budgetStay.getDiscountPercent());
        
        return response;
    }

    /**
     * 위치 포맷팅
     */
    private String formatLocation(Stay stay) {
        String city = stay.getRegion().getCityName();
        String area = stay.getRegion().getAreaName();
        return city + " • " + area;
    }

    /**
     * 리뷰 수 포맷팅
     */
    private String formatReviews(Integer reviewCount) {
        if (reviewCount >= 1000) {
            return String.format("%,d", reviewCount);
        }
        return reviewCount.toString();
    }

    /**
     * 내부 DTO
     */
    private static class BudgetStay {
        private final Stay stay;
        private final BigDecimal price;
        private final int discountPercent;

        public BudgetStay(Stay stay, BigDecimal price, int discountPercent) {
            this.stay = stay;
            this.price = price;
            this.discountPercent = discountPercent;
        }

        public Stay getStay() { return stay; }
        public BigDecimal getPrice() { return price; }
        public int getDiscountPercent() { return discountPercent; }
    }
}