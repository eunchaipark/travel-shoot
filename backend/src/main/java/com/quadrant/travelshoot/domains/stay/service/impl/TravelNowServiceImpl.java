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
            .image("https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=500&h=400&fit=crop")
            .features(Arrays.asList("자연", "힐링", "드라이브"))
            .accommodationCount(counts.getOrDefault("제주", 4156L))
            .build());

        // 강원도 - 강릉
        dbDestinations.add(TravelNowResponse.builder()
            .id(4L)
            .name("강릉")
            .location("강원도")
            .image("https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=500&h=400&fit=crop")
            .features(Arrays.asList("해변", "커피", "산책"))
            .accommodationCount(counts.getOrDefault("강원", 1832L))
            .build());

        // 강원도 - 춘천
        dbDestinations.add(TravelNowResponse.builder()
            .id(10L)
            .name("춘천")
            .location("강원도")
            .image("https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=500&h=400&fit=crop")
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
                .image("https://images.unsplash.com/photo-1586375300773-8384e3e4916f?w=500&h=400&fit=crop")
                .features(Arrays.asList("해변", "온천", "맛집"))
                .accommodationCount(8L)
                .build(),
            
            TravelNowResponse.builder()
                .id(5L)
                .name("대구")
                .location("경상북도")
                .image("https://images.unsplash.com/photo-1590736969955-71cc94901144?w=500&h=400&fit=crop")
                .features(Arrays.asList("문화", "야경", "전통"))
                .accommodationCount(7L)
                .build(),
            
            TravelNowResponse.builder()
                .id(6L)
                .name("인천")
                .location("경기도")
                .image("https://images.unsplash.com/photo-1578895101408-1a36b834405b?w=500&h=400&fit=crop")
                .features(Arrays.asList("공항", "항구", "차이나타운"))
                .accommodationCount(6L)
                .build(),
            
            TravelNowResponse.builder()
                .id(7L)
                .name("전주")
                .location("전라북도")
                .image("https://images.unsplash.com/photo-1584464491033-06628f3a6b7b?w=500&h=400&fit=crop")
                .features(Arrays.asList("한옥", "전통", "맛집"))
                .accommodationCount(5L)
                .build(),
            
            TravelNowResponse.builder()
                .id(8L)
                .name("경주")
                .location("경상북도")
                .image("https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=500&h=400&fit=crop")
                .features(Arrays.asList("역사", "문화", "유적"))
                .accommodationCount(4L)
                .build(),
            
            TravelNowResponse.builder()
                .id(9L)
                .name("여수")
                .location("전라남도")
                .image("https://images.unsplash.com/photo-1590736969955-71cc94901144?w=500&h=400&fit=crop")
                .features(Arrays.asList("해상", "야경", "섬"))
                .accommodationCount(3L)
                .build(),
            
            TravelNowResponse.builder()
                .id(11L)
                .name("통영")
                .location("경상남도")
                .image("https://images.unsplash.com/photo-1586375300773-8384e3e4916f?w=500&h=400&fit=crop")
                .features(Arrays.asList("바다", "케이블카", "굴"))
                .accommodationCount(2L)
                .build(),
            
            TravelNowResponse.builder()
                .id(12L)
                .name("안동")
                .location("경상북도")
                .image("https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=500&h=400&fit=crop")
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