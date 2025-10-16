package com.quadrant.travelshoot.domains.stay.service.impl;

import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import com.quadrant.travelshoot.domains.common.service.impl.FileUploadServiceImpl;
import com.quadrant.travelshoot.domains.review.service.ReviewService;
import com.quadrant.travelshoot.domains.review.service.impl.ReviewServiceImpl;
import com.quadrant.travelshoot.domains.stay.dto.response.StayDetailResponse;
import com.quadrant.travelshoot.domains.stay.entity.Room;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.entity.StayAmenity;
import com.quadrant.travelshoot.domains.stay.mapper.StayMapper;
import com.quadrant.travelshoot.domains.stay.repository.RoomRepository;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;
import com.quadrant.travelshoot.domains.stay.service.StayService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Stream;

@Slf4j
@Service
@RequiredArgsConstructor
public class StayServiceImpl implements StayService {

    private final StayRepository stayRepository;
    private final RoomRepository roomRepository;
    private final FileUploadServiceImpl fileUploadService;
    private final StayAmenityServiceImpl stayAmenityService;
    private final ReviewServiceImpl reviewService;
    private final StayMapper stayMapper;

    /**
     * 숙소 상세 정보 조회
     * @param stayId 숙소 ID
     * @return StayDetailResponse
     */

    @Transactional
    public StayDetailResponse getStayDetail(Long stayId) {
        Stay stay = stayRepository.findByStayId(stayId)
                .orElseThrow(() -> new IllegalArgumentException("이용할 수 없는 숙소입니다."));

        // 조회수 증가 - 조회수 테이블 따로 있어서
//        stayRepository.incrementViewCount(stayId);
        String stayType = "숙소";

        // 최저가 minPrice 조회
        BigDecimal minPrice = findRoomMinPrice(stay.getRooms());
        stay.setMinPrice(minPrice);

        // 리뷰 개수 reviewCount
        stay.setReviewCount(reviewService.countReview(stayId));

        // 숙소 평균평점 averageRating
        stay.updateAverageRating(reviewService.getStayAverageRating(stayId)); // 엔티티 갱신

        // 편의시설 조회
        List<StayAmenity> stayAmenities = stayAmenityService.findByStayId(stayId);
        // 모든 이미지 조회
        List<FileUpload> images = fileUploadService.findAllByReferenceTypeAndReferenceId(stayType, stayId);
        return stayMapper.toStayDetailResponse(stay, images, stayAmenities);
    }


    /**
     * 최저가 구하는 메서드
     */
    public BigDecimal findRoomMinPrice(List<Room> rooms) {
        return rooms.stream()
                .flatMap(room -> Stream.of(room.getWeekdayPrice(), room.getWeekendPrice())) // 두 가격을 하나의 Stream으로
                .min(Comparator.naturalOrder()) // 가장 작은 값 찾기
                .orElse(BigDecimal.ZERO); // 예외 방지 (리스트가 비어있을 때)
    }

}
