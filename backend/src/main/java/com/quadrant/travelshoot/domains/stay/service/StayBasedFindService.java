package com.quadrant.travelshoot.domains.stay.service;

import com.quadrant.travelshoot.domains.stay.dto.response.StayBasedFindResponse;

import java.util.List;

public interface StayBasedFindService {

    /**
     * 여러 숙소 ID를 기반으로 각 숙소별 맛집과 관광지 추천
     *
     * @param stayIds 숙소 ID 목록
     * @param restaurantCount 숙소당 맛집 개수
     * @param activityCount 숙소당 관광지 개수
     * @return 숙소별 추천 결과 목록
     */
    List<StayBasedFindResponse> findRecommendations(
            List<Long> stayIds,
            int restaurantCount,
            int activityCount
    );
}