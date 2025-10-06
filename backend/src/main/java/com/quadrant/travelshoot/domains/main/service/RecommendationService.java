package com.quadrant.travelshoot.domains.main.service;

import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;
import com.quadrant.travelshoot.domains.user.entity.UserSurvey;
import com.quadrant.travelshoot.domains.user.repository.UserSurveyRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class RecommendationService {

    private final UserSurveyRepository userSurveyRepository;
    private final StayRepository stayRepository;

    public List<Stay> getRecommendations(Long userId) {

        // 1. 설문조사 조회
        UserSurvey survey = userSurveyRepository.findByUserId(userId)
                .orElseThrow(() -> new RuntimeException("설문조사를 완료해주세요"));

        // 2. 1순위 지역 찾기
        String topRegion = survey.getRegions().stream()
                .filter(r -> r.getRankOrder() == 1)
                .findFirst()
                .map(r -> r.getRegionName())
                .orElseThrow(() -> new RuntimeException("선호 지역이 없습니다"));

        // 3. 숙박 타입 변환
        Stay.StayType stayType;
        switch (survey.getStayType()) {
            case PENSION:
                stayType = Stay.StayType.펜션;
                break;
            case HOTEL:
                stayType = Stay.StayType.호텔;
                break;
            case MOTEL:
                stayType = Stay.StayType.모텔;
                break;
            default:
                throw new RuntimeException("알 수 없는 타입");
        }

        // 4. 숙소 검색
        List<Stay> allStays = stayRepository.findTop10ByRegionAndType(topRegion, stayType);

        // 5. 상위 10개만
        List<Stay> top10 = allStays.stream()
                .limit(10)
                .collect(Collectors.toList());

        log.info("추천 완료 - 지역: {}, 타입: {}, 결과: {}개", topRegion, stayType, top10.size());

        return top10;
    }
}