package com.quadrant.travelshoot.domains.stay.service.impl;

import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import com.quadrant.travelshoot.domains.common.service.impl.FileUploadServiceImpl;
import com.quadrant.travelshoot.domains.reservation.repository.ReservationRepository;
import com.quadrant.travelshoot.domains.review.repository.ReviewRepository;
import com.quadrant.travelshoot.domains.review.service.impl.ReviewServiceImpl;
import com.quadrant.travelshoot.domains.stay.dto.response.RoomFilterDto;
import com.quadrant.travelshoot.domains.stay.dto.response.StayDetailResponse;
import com.quadrant.travelshoot.domains.stay.dto.response.StayImageDto;
import com.quadrant.travelshoot.domains.stay.dto.response.StayRatingResponse;
import com.quadrant.travelshoot.domains.stay.dto.response.RoomDto;
import com.quadrant.travelshoot.domains.stay.entity.Room;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.entity.StayAmenity;
import com.quadrant.travelshoot.domains.stay.mapper.StayMapper;
import com.quadrant.travelshoot.domains.stay.repository.RoomRepository;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;
import com.quadrant.travelshoot.domains.stay.service.StayImageService;
import com.quadrant.travelshoot.domains.stay.service.StayService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Slf4j
@Service
@RequiredArgsConstructor
public class StayServiceImpl implements StayService {

    private final StayRepository stayRepository;
    private final RoomRepository roomRepository;
    private final StayImageService stayImageService;
    private final FileUploadServiceImpl fileUploadService;
    private final StayAmenityServiceImpl stayAmenityService;
    private final ReviewServiceImpl reviewService;
    private final StayMapper stayMapper;
    private final ReviewRepository reviewRepository;
    private final ReservationRepository reservationRepository;

    /**
     * 숙소 상세 정보 조회 (기존 메서드 - 그대로 유지)
     * @param stayId 숙소 ID
     * @return StayDetailResponse
     */
    @Override
    @Transactional
    public StayDetailResponse getStayDetail(Long stayId) {
        Stay stay = stayRepository.findByStayId(stayId)
                .orElseThrow(() -> new IllegalArgumentException("해당 숙소를 찾을 수 없습니다."));

        // 최저가 minPrice 조회
        BigDecimal minPrice = findRoomMinPrice(stay.getRooms());
        stay.setMinPrice(minPrice);
        // 리뷰 개수 reviewCount
        stay.setReviewCount(reviewService.countReview(stayId));
        // 편의시설 조회
        List<StayAmenity> stayAmenities = stayAmenityService.findByStayId(stayId);
        // 썸네일 이미지 5개 조회
        List<StayImageDto> thumbnailImages = stayImageService.getThumbnailImages(stayId);

        return stayMapper.toStayDetailResponse(stay, thumbnailImages, stayAmenities);
    }

    //새로 추가: 숙소 상세 정보 조회 (날짜별 예약 가능 여부 포함)
    @Override
    @Transactional
    public StayDetailResponse getStayDetail(Long stayId, LocalDate checkIn, LocalDate checkOut) {
        log.info("숙소 상세 조회 (재고 포함) - stayId: {}, checkIn: {}, checkOut: {}",
                stayId, checkIn, checkOut);

        Stay stay = stayRepository.findByStayId(stayId)
                .orElseThrow(() -> new IllegalArgumentException("해당 숙소를 찾을 수 없습니다."));

        // 최저가 minPrice 조회
        BigDecimal minPrice = findRoomMinPrice(stay.getRooms());
        stay.setMinPrice(minPrice);
        // 리뷰 개수 reviewCount
        stay.setReviewCount(reviewService.countReview(stayId));
        // 편의시설 조회
        List<StayAmenity> stayAmenities = stayAmenityService.findByStayId(stayId);
        // 썸네일 이미지 5개 조회
        List<StayImageDto> thumbnailImages = stayImageService.getThumbnailImages(stayId);

        // 기본 응답 생성
        StayDetailResponse response = stayMapper.toStayDetailResponse(stay, thumbnailImages, stayAmenities);

        // 날짜가 있으면 각 객실의 availableRooms 계산
        if (checkIn != null && checkOut != null && response.getRooms() != null) {
            List<RoomDto> updatedRooms = response.getRooms().stream()
                    .map(roomDto -> {
                        try {
                            Long maxBookingCount = reservationRepository
                                    .findMaxDailyBookingCount(
                                            roomDto.getRoomId(),
                                            checkIn.toString(),
                                            checkOut.toString()
                                    );

                            Integer availableRooms = roomDto.getRoomCount() - maxBookingCount.intValue();
                            roomDto.setAvailableRooms(availableRooms);

                            log.debug("객실 재고 - roomId: {}, 전체: {}, 예약: {}, 남음: {}",
                                    roomDto.getRoomId(), roomDto.getRoomCount(), maxBookingCount, availableRooms);

                        } catch (Exception e) {
                            log.error("재고 계산 실패 - roomId: {}", roomDto.getRoomId(), e);
                            roomDto.setAvailableRooms(0);
                        }
                        return roomDto;
                    })
                    .collect(Collectors.toList());

            response = response.toBuilder()
                    .rooms(updatedRooms)
                    .build();
        }

        return response;
    }

    /**
     * 숙소 내 객실 조회
     */
    public List<RoomFilterDto> getRoomFilters(Long stayId){
        return roomRepository.findByStayId(stayId);
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

    @Override
    public Stay getById(Long stayId) {
        return stayRepository.findById(stayId)
                .orElseThrow(() -> new IllegalArgumentException("숙소 정보를 찾을 수 없습니다."));
    }

    /**
     * 숙소 리뷰 별점 7개 조회
     */
    public StayRatingResponse getStayRating(Long stayId) {
        StayRatingResponse stayRatingResponse = reviewRepository.findStayRatingByStayId(stayId);
        System.out.println("stayRatingResponse : " + stayRatingResponse);
        return stayRatingResponse;
    }
}