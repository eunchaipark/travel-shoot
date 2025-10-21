package com.quadrant.travelshoot.domains.stay.service;

import java.util.List;
import java.util.Map;

public interface StayBasedFindService {

    /**
     * 여러 숙소 ID를 기반으로 각 숙소별 맛집과 관광지 추천
     *
     * @param stayIds 숙소 ID 목록
     * @param restaurantCount 숙소당 맛집 개수
     * @param activityCount 숙소당 관광지 개수
     * @return 숙소 ID별로 [숙소정보, 맛집1, 맛집2, 관광지1, 관광지2] 형태의 리스트
     */
    Map<Long, List<Object>> findRecommendations(
            List<Long> stayIds,
            int restaurantCount,
            int activityCount
    );
}