package com.quadrant.travelshoot.domains.review.service.impl;

import com.quadrant.travelshoot.domains.review.dto.request.ReviewRegistRequest;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewDetailResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewListResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewPageResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewRegistResponse;
import com.quadrant.travelshoot.domains.review.entity.Review;
import com.quadrant.travelshoot.domains.review.mapper.ReviewMapper;
import com.quadrant.travelshoot.domains.review.repository.ReviewRepository;
import com.quadrant.travelshoot.domains.reservation.repository.ReservationRepository;
import com.quadrant.travelshoot.domains.review.service.ReviewService;
import com.quadrant.travelshoot.domains.user.repository.UserRepository;
import jakarta.persistence.EntityNotFoundException;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Slf4j
@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

    private final ReviewRepository reviewRepository;
    private final ReviewMapper reviewMapper;

    /* 이미지 업로드 */

    /* 예약 검증 메서드 - 리뷰 등록, 수정, 삭제 전 검증 */
    // 예약이 존재하는지
    // 예약 상태가 '이용완료'인지
    // 예약자와 사용자가 일치하는지
    /**
     * 리뷰 등록
     *
     * @param userId
     * @param request
     * @return
     */
    private final UserRepository userRepository;
    private final ReservationRepository reservationRepository;
    @Transactional
    public ReviewRegistResponse createReview(Long userId, @Valid ReviewRegistRequest request) {
        log.info("리뷰 등록 시작 - userId: {}, reservationId: {}", userId, request.getReservationId());

        // 리뷰 중복 검증
        if (reviewRepository.existsByReservationId(request.getReservationId())) {
            throw new IllegalStateException("이미 해당 예약에 대한 리뷰가 존재합니다.");
        }

        // 저장
        Review review = Review.builder()
                .reservation(reservationRepository.getReferenceById(request.getReservationId()))
                .user(userRepository.getReferenceById(userId))
                .stayId(request.getStayId())
                .cleanRating(request.getCleanRating())
                .convenienceRating(request.getConvenienceRating())
                .checkinRating(request.getCheckinRating())
                .communicationRating(request.getCommunicationRating())
                .locationRating(request.getLocationRating())
                .totalRating(request.getTotalRating())
                .valueRating(request.getValueRating())
                .reviewContent(request.getReviewContent())
                .isRecommended(request.getIsRecommended())
//                .reviewImageUrl(imageUrl)
                .build();

        Review newReview = reviewRepository.save(review);
        log.info("리뷰 등록 완료 - reviewId: {}", newReview.getReviewId());

        return reviewMapper.toReviewRegistResponse(newReview);
    }


    /**
     * 리뷰 삭제
     *
     * @param userId
     * @param reviewId
     */
    @Transactional
    public void deleteReview(Long userId, Long reviewId) {
        // 존재하는 리뷰인지 확인
        Review review = reviewRepository.findById(reviewId)
                .orElseThrow(() -> new IllegalArgumentException("리뷰를 찾을 수 없습니다."));

        // 작성자 본인 확인
        if (!review.getUser().getId().equals(userId)) {
            throw new IllegalStateException("본인이 작성한 리뷰만 삭제할 수 있습니다.");
        }

        // 이미지 삭제
//        if (review.getReviewImageUrl() != null) {
//            deleteReviewImage(review.getReviewImageUrl());
//        }

        reviewRepository.delete(review);
        log.info("리뷰 삭제 완료 - reviewId: {}", reviewId);

    }


    /**
     * 리뷰 수정
     *
     * @param userId 현재 로그인한 사용자 ID
     * @param reviewId 수정할 리뷰 ID
     * @param reviewUpdateRequest 수정 요청 데이터
     * @return 수정된 리뷰 정보
     */
    @Transactional
    public ReviewRegistResponse updateReview(Long userId, Long reviewId, @Valid ReviewRegistRequest reviewUpdateRequest) {

        // 리뷰가 존재하는지
        Review review = reviewRepository.findById(reviewId).orElseThrow(() -> new IllegalArgumentException("리뷰를 찾을 수 없습니다. ID: " + reviewId));
        // 사용자 확인
        if(!review.getUser().getId().equals(userId)){
            throw new IllegalStateException("본인이 작성한 리뷰만 수정할 수 있습니다.");
        }
        // review 데이터 수정
        review.setCleanRating(reviewUpdateRequest.getCleanRating());
        review.setConvenienceRating(reviewUpdateRequest.getConvenienceRating());
        review.setCheckinRating(reviewUpdateRequest.getCheckinRating());
        review.setCommunicationRating(reviewUpdateRequest.getCommunicationRating());
        review.setLocationRating(reviewUpdateRequest.getLocationRating());
        review.setValueRating(reviewUpdateRequest.getValueRating());
        review.setTotalRating(reviewUpdateRequest.getTotalRating());
        review.setReviewContent(reviewUpdateRequest.getReviewContent());
        review.setIsRecommended(reviewUpdateRequest.getIsRecommended());

        // 이미지 수정

        Review updatedReview = reviewRepository.save(review);

        return reviewMapper.toReviewRegistResponse(updatedReview);
    }


    /**
     * 리뷰 상세 조회
     *
     * @param reviewId
     * @return
     */
    public ReviewDetailResponse getReviewDetail(Long reviewId) {
        Review review = reviewRepository.findById(reviewId)
                .orElseThrow(() -> new EntityNotFoundException("리뷰를 찾을 수 없습니다. ID: " + reviewId));

        return reviewMapper.toReviewDetailResponse(review);
    }


    /**
     * 숙소의 리뷰 페이징 조회
     * 무한 스크롤링
     *
     * @param stayId 숙박시설 ID
     * @param page   페이지 번호 (0부터 시작)
     * @param size   페이지 크기 (기본 10개)
     * @param sortBy 정렬 기준 (latest: 최신순, rating: 평점순)
     * @return 페이징된 리뷰 목록
     */
    public ReviewPageResponse<ReviewListResponse> getReviewsWithPaging(Long stayId, Long roomId, int page, int size, String sortBy) {
        log.info("숙박시설 리뷰 페이징 조회 - stayId: {}, roomId : {}, page: {}, size: {}, sortBy: {}",
                stayId, roomId, page, size, sortBy);

        // 숙소에 6개 평점 추가 안하면 ? - 리뷰의 평점 불러온 다음 그걸로 계산해서 dto에 세팅해서 보여주어야 함
        // 숙소에 6개 평점 추가 하면 ? - 추가 하면 계산한 다음 저장할 수 있긴 한데, 어차피 다음 번에 리뷰 갱신 전 이력을 안 불러와도 됨

        // pageable
        Pageable pageable = createPageable(page, size, sortBy);

        // roomId 필터링 & 페이징
        Page<Review> reviewPage;
        if(roomId != null){
            reviewPage =  reviewRepository.findByStayIdAndRoomId(stayId, roomId, pageable);
        }else{
            reviewPage = reviewRepository.findPageByStayId(stayId, pageable);
        }

        // Review -> ReviewResponse 변환
        Page<ReviewListResponse> responsePage = reviewPage.map(reviewMapper::toReviewListResponse);
        return ReviewPageResponse.of(responsePage);
    }


    /**
     * 숙소에 따른 리뷰 개수
     * 만약 리뷰 개수가 2,147,483,647 (Integer 최대값)보다 많아지면 오버플로우 발생
     */
    public Integer countReview(Long stayId){
        return Math.toIntExact(reviewRepository.countByStayId(stayId));
    }

    /**
     * 리뷰 별점에 따른 숙소 평균별점
     * 1. 리뷰들 모아서 집계 평균 조회
     * 2. 조회한 값을 숙소 엔티티에 setAverageRating(1번)
     * 3. 그거를 리뷰 cud에 호출
     */

    public BigDecimal getStayAverageRating(Long stayId){
        Double totalRating = reviewRepository.findAverageByStayId(stayId);

        if(totalRating == null){
            totalRating = 0.0;
        }

        return BigDecimal.valueOf(totalRating).setScale(2, RoundingMode.HALF_UP); // 2자리까지
    }

    /**
     * Pageable 객체 생성
     */
    private Pageable createPageable(int page, int size, String sortBy) {
        // 페이지 크기 제한 (최대 50개)
        size = Math.max(1, Math.min(size, 50));

        // 정렬 기준에 따라 Pageable 생성
        Sort sort;
        switch (sortBy.toLowerCase()) {
            case "rating_desc":
                // 평점 높은 순, 같은 평점이면 최신순
                sort = Sort.by(
                        Sort.Order.desc("totalRating"),
                        Sort.Order.desc("createdAt")
                );
                break;
            case "rating_asc":
                // 평점 낮은 순, 같은 평점이면 최신순
                sort = Sort.by(
                        Sort.Order.asc("totalRating"),
                        Sort.Order.desc("createdAt")
                );
                break;
            case "latest":
            default:
                // 기본: 최신순
                sort = Sort.by(Sort.Direction.DESC, "createdAt");
                break;
        }

        return PageRequest.of(page, size, sort);
    }

}
