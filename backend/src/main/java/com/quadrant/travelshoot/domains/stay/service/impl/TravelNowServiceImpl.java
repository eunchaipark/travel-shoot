package com.quadrant.travelshoot.domains.stay.service.impl;

import com.quadrant.travelshoot.domains.stay.dto.response.TravelNowResponse;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;
import com.quadrant.travelshoot.domains.stay.service.TravelNowService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TravelNowServiceImpl implements TravelNowService {

    private final StayRepository stayRepository;

    /**
     * 데이터베이스의 지역별 숙소 수 조회
     */
    private Map<String, Long> getAccommodationCountByRegion() {
        try {
            List<Object[]> results = stayRepository.findAccommodationCountByRegion();
            return results.stream()
                .collect(Collectors.toMap(
                    row -> (String) row[0], // 지역명
                    row -> ((Number) row[1]).longValue() // 숙소 수
                ));
        } catch (Exception e) {
            // DB 조회 실패 시 빈 맵 반환
            return new HashMap<>();
        }
    }

    /**
     * DB 데이터 가져오기 (제주도, 강원도)
     */
    private List<TravelNowResponse> getDbDestinations() {
        Map<String, Long> counts = getAccommodationCountByRegion();
        
        List<TravelNowResponse> dbDestinations = new ArrayList<>();

        // 제주도
        dbDestinations.add(TravelNowResponse.builder()
            .id(3L)
            .name("제주")
            .location("제주특별자치도")
            .image("https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/6adc0728-a898-4cf1-971e-f1fa7d181736_TrvaelNowJeju.jpg")
            .features(Arrays.asList("자연", "힐링", "드라이브"))
            .accommodationCount(counts.getOrDefault("제주", 4156L))
            .build());

        // 강원도 - 강릉
        dbDestinations.add(TravelNowResponse.builder()
            .id(4L)
            .name("강릉")
            .location("강원도")
            .image("https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/26c4a0d1-96a6-4e9f-a40b-953d77ddf9cf_TrvaelNowGangleung.jpg")
            .features(Arrays.asList("해변", "커피", "산책"))
            .accommodationCount(counts.getOrDefault("강원", 1832L))
            .build());

        // 강원도 - 춘천
        dbDestinations.add(TravelNowResponse.builder()
            .id(10L)
            .name("춘천")
            .location("강원도")
            .image("https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/f65ae424-2648-46db-b0ac-c07db9dcfcab_TrvaelNowChuncheon.jpg")
            .features(Arrays.asList("호수", "닭갈비", "자연"))
            .accommodationCount(counts.getOrDefault("강원", 645L))
            .build());

        return dbDestinations;
    }

    /**
     * Util의 정적 데이터 (DB에 없는 지역들)
     */
    private List<TravelNowResponse> getUtilDestinations() {
        return Arrays.asList(
            TravelNowResponse.builder()
                .id(1L)
                .name("서울")
                .location("수도권")
                .image("https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/6cde004e-5a5d-4b8e-877d-46719c677341_Ex_seoul.jpg")
                .features(Arrays.asList("벚꽃", "도심", "쇼핑"))
                .accommodationCount(9L)
                .build(),
            
            TravelNowResponse.builder()
                .id(2L)
                .name("부산")
                .location("경상남도")
                .image("https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/f5d6ad97-57b2-465b-9ace-91c470132178_TrvaelNowBusan.jpg")
                .features(Arrays.asList("해변", "온천", "맛집"))
                .accommodationCount(8L)
                .build(),
            
            TravelNowResponse.builder()
                .id(5L)
                .name("대구")
                .location("경상북도")
                .image("https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/ed03a2b7-b827-4435-baa3-030f1c26f0b2_TrvaelNowDegue.jpg")
                .features(Arrays.asList("문화", "야경", "전통"))
                .accommodationCount(7L)
                .build(),
            
            TravelNowResponse.builder()
                .id(6L)
                .name("인천")
                .location("경기도")
                .image("https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/96109dad-81b1-4bb6-a723-c522eff2ff1e_TrvaelNowIncheon.jpg")
                .features(Arrays.asList("공항", "항구", "차이나타운"))
                .accommodationCount(6L)
                .build(),
            
            TravelNowResponse.builder()
                .id(7L)
                .name("전주")
                .location("전라북도")
                .image("https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/6f79aa0a-7089-4a8a-b123-3d2f28c9443e_TrvaelNowJeonju.jpg")
                .features(Arrays.asList("한옥", "전통", "맛집"))
                .accommodationCount(5L)
                .build(),
            
            TravelNowResponse.builder()
                .id(8L)
                .name("경주")
                .location("경상북도")
                .image("https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/14786a47-e684-4913-ae68-c06bf6e3b686_TravelNowGyeongju.jpg")
                .features(Arrays.asList("역사", "문화", "유적"))
                .accommodationCount(4L)
                .build(),
            
            TravelNowResponse.builder()
                .id(9L)
                .name("여수")
                .location("전라남도")
                .image("https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/f5ef1a6b-392a-4bf9-bf1d-a27ebd3f0093_TravelNowYeosu.jpg")
                .features(Arrays.asList("해상", "야경", "섬"))
                .accommodationCount(3L)
                .build(),
            
            TravelNowResponse.builder()
                .id(11L)
                .name("통영")
                .location("경상남도")
                .image("https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/14ed76f9-41fc-4a5f-bf35-bf6602b7809e_TravelNowTongyeong.jpg")
                .features(Arrays.asList("바다", "케이블카", "굴"))
                .accommodationCount(2L)
                .build(),
            
            TravelNowResponse.builder()
                .id(12L)
                .name("안동")
                .location("경상북도")
                .image("https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/2436466b-d8a8-4eb0-ac1a-f0701de5a444_TravelNowAndong.jpg")
                .features(Arrays.asList("하회마을", "전통", "역사"))
                .accommodationCount(1L)
                .build()
        );
    }

    /**
     * 모든 데이터 통합 (12개 유지)
     */
    @Override
    public List<TravelNowResponse> getAllTravelNowDestinations() {
        List<TravelNowResponse> allDestinations = new ArrayList<>();
        
        // DB 데이터 먼저 추가 (제주도, 강원도)
        allDestinations.addAll(getDbDestinations());
        
        // Util 데이터 추가 (나머지 지역)
        allDestinations.addAll(getUtilDestinations());
        
        // 숙소 개수가 많은 순서로 정렬
        return allDestinations.stream()
            .sorted(Comparator.comparingLong(TravelNowResponse::getAccommodationCount).reversed())
            .collect(Collectors.toList());
    }
}