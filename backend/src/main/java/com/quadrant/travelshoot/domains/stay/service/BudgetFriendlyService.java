package com.quadrant.travelshoot.domains.stay.service;

import com.quadrant.travelshoot.domains.stay.dto.response.BudgetFriendlyResponse;

import java.util.List;

/**
 * 가격착한 숙소 서비스 인터페이스
 */
public interface BudgetFriendlyService {

    /**
     * 가격착한 숙소 6개 조회
     * - 시 단위별 평균 최저가 기준
     * - 타입 다양성 보장 (모텔/호텔/펜션 각 최소 1개)
     * - 같은 시에서 최대 2개
     * - 가격 동일 시 평점 높은 순
     * 
     * @return 가격착한 숙소 목록 (최대 6개)
     */
    List<BudgetFriendlyResponse> getBudgetFriendlyStays();
}