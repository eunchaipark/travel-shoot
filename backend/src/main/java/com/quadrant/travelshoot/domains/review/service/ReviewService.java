package com.quadrant.travelshoot.domains.review.service;

import com.quadrant.travelshoot.domains.review.dto.request.ReviewRegistRequest;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewDetailResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewListResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewRegistResponse;
import com.quadrant.travelshoot.domains.review.entity.Review;
import com.quadrant.travelshoot.domains.review.mapper.ReviewMapper;
import com.quadrant.travelshoot.domains.review.repository.ReviewRepository;
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

@Slf4j
@Service
@RequiredArgsConstructor
public class ReviewService {

    private final ReviewRepository reviewRepository;
    private final UserRepository userRepository;
    private final ReviewMapper reviewMapper;


    /* 이미지 업로드 */

    /* 예약 검증 메서드 */
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
    @Transactional
    public ReviewRegistResponse createReview(Long userId, @Valid ReviewRegistRequest request) {
        log.info("리뷰 등록 시작 - userId: {}, reservationId: {}", userId, request.getReservationId());

        // 리뷰 중복 검증
        if (reviewRepository.existsByReservationId(request.getReservationId())) {
            throw new IllegalStateException("이미 해당 예약에 대한 리뷰가 존재합니다.");
        }

        // 이미지 업로드

        // 저장
        Review review = Review.builder()
                .reservationId(request.getReservationId())
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

        return ReviewRegistResponse.from(newReview);
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
     * 리뷰 상세 조회
     *
     * @param userId
     * @param reviewId
     * @return
     */
    public ReviewDetailResponse getReviewDetail(Long userId, Long reviewId) {
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
    public Page<?> getReviewsWithPaging(Long stayId, int page, int size, String sortBy) {
        log.info("숙박시설 리뷰 페이징 조회 - stayId: {}, page: {}, size: {}, sortBy: {}",
                stayId, page, size, sortBy);

        // Pageable 생성
        Pageable pageable = createPageable(page, size, sortBy);

        // 페이징 조회
        Page<Review> reviewPage = reviewRepository.findByStayId(stayId, pageable);
//        if ("rating".equalsIgnoreCase(sortBy)) {
//            // 평점순
//            reviewPage = reviewRepository.findByStayIdOrderByTotalRating(stayId, pageable);
//        } else {
//            // 기본: 최신순
//            reviewPage = reviewRepository.findByStayId(stayId, pageable);
//        }

        // Review -> ReviewResponse 변환
//        Page<ReviewListResponse> responsePage = reviewPage.map(ReviewListResponse::from);
//
//        return responsePage;
        return null;
    }


    /**
     * Pagable 객체 생성
     */
    private Pageable createPageable(int page, int size, String sortBy) {
        // 페이지 크기 제한 (최대 50개)
        if (size > 50) {
            size = 50;
        }
        if (size <= 0) {
            size = 10;
        }

        // 정렬 기준에 따라 Pageable 생성
        if ("rating".equalsIgnoreCase(sortBy)) {
            // 평점 높은 순, 같은 평점이면 최신순
            return PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "totalRating"));
        }
        // 평점 순, 객실에 따라서도 해야함

        else {
            // 기본: 최신순
            return PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "createdAt"));
        }
    }


}
