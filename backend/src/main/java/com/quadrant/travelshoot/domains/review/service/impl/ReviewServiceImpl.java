package com.quadrant.travelshoot.domains.review.service.impl;

import com.quadrant.travelshoot.common.service.S3Service;
import com.quadrant.travelshoot.domains.ai.dto.response.ReviewAiSummaryResponse;
import com.quadrant.travelshoot.domains.ai.service.ReviewAiSummaryService;
import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import com.quadrant.travelshoot.domains.common.repository.FileUploadRepository;
import com.quadrant.travelshoot.domains.common.service.FileUploadService;
import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import com.quadrant.travelshoot.domains.review.dto.request.ReviewRegistRequest;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewDetailResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewListResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewPageResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewRegistResponse;
import com.quadrant.travelshoot.domains.review.entity.Review;
import com.quadrant.travelshoot.domains.review.entity.ReviewAiSummary;
import com.quadrant.travelshoot.domains.review.mapper.ReviewMapper;
import com.quadrant.travelshoot.domains.review.repository.ReviewAiSummaryRepository;
import com.quadrant.travelshoot.domains.review.repository.ReviewRepository;
import com.quadrant.travelshoot.domains.reservation.repository.ReservationRepository;
import com.quadrant.travelshoot.domains.review.service.ReviewService;
import com.quadrant.travelshoot.domains.user.repository.UserRepository;
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
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

    private final ReviewRepository reviewRepository;
    private final ReviewMapper reviewMapper;
    private final ReviewAiSummaryRepository reviewAiSummaryRepository;
    private final ReviewAiSummaryService reviewAiSummaryService;
    private final FileUploadService fileUploadService;



    /**
     * 기존 ai요약 검증
     */
    @Transactional
    public ReviewAiSummaryResponse getReviewSummary(Long stayId) {
        // 현재 리뷰 개수 조회
        int currentReviewCount = reviewRepository.countByStayId(stayId);
        if (currentReviewCount == 0) {
            throw new IllegalArgumentException("아직 숙소의 리뷰가 없습니다.");
        }

        // 기존 AI 요약 조회
        ReviewAiSummary existingSummary = reviewAiSummaryRepository.findByStayId(stayId)
                .orElse(null);

        // 기존 요약이 없거나, 리뷰가 5개 이상 증가했으면 새로 생성
        // 시연을 위해 리뷰 1개만 증가해도 새로 생성
        if (existingSummary == null || currentReviewCount >= existingSummary.getReviewCount() + 1) {
            log.info("AI 요약 새로 생성 - stayId: {}, 현재 리뷰: {}, 이전 리뷰: {}",
                    stayId, currentReviewCount, existingSummary != null ? existingSummary.getReviewCount() : 0);
            return reviewAiSummaryService.generateAiSummary(stayId, currentReviewCount, existingSummary);
        }

        // 기존 요약 반환
        log.info("기존 AI 요약 반환 - stayId: {}", stayId);
        return ReviewAiSummaryResponse.from(existingSummary);
    }


    @Override
    public boolean existsByReservationId(Long reservationId){
        return reviewRepository.existsByReservationId(reservationId);
    }

    /**
     * 리뷰 등록
     * @param userId
     * @param request
     * @return
     */
    private final UserRepository userRepository;
    private final ReservationRepository reservationRepository;
    @Transactional
    public ReviewRegistResponse createReview(Long userId, @Valid ReviewRegistRequest request) {
        log.info("리뷰 등록 시작 - userId: {}, reservationId: {}", userId, request.getReservationId());

        // + 예약 내역에서 예약 상태가 '이용 완료'여야 한다.

        // 리뷰 중복 검증
        if (existsByReservationId(request.getReservationId())) {
            throw new IllegalStateException("이미 해당 예약에 대한 리뷰가 존재합니다.");
        }

        // 1. 리뷰 생성하고 저장
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
                .build();

        Review savedReview = reviewRepository.save(review);

        // 2. 이미지 업로드 처리
        String imageUrl = null;
        if (request.getReviewImage() != null && !request.getReviewImage().isEmpty()) {
            try {
                FileUpload fileUpload = fileUploadService.uploadAndSave(
                        request.getReviewImage(),
                        "REVIEWS",
                        savedReview.getReviewId(),
                        userId,
                        0,
                        true
                );
                imageUrl = fileUpload.getS3Url();
                log.info("리뷰 이미지 업로드 성공 - fileId: {}, s3Url: {}",
                        fileUpload.getId(), fileUpload.getS3Url());
            } catch (Exception e) {
                log.error("리뷰 이미지 업로드 실패", e);
                throw new RuntimeException("이미지 업로드 실패", e);
            }
        }

        return reviewMapper.toReviewRegistResponse(savedReview, imageUrl);
    }


    /**
     * 리뷰 수정
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
        Review updatedReview = reviewRepository.save(review);

        // 2. 이미지 업로드 처리
        String imageUrl = null;

        // 기존 리뷰 이미지 조회
        Optional<FileUpload> existedImage = fileUploadRepository.findFirstByReferenceTypeAndReferenceIdAndIsDeletedFalseOrderBySortOrderAsc("REVIEWS", reviewId);

        // 새로운 이미지 등록
        if (reviewUpdateRequest.getReviewImage() != null && !reviewUpdateRequest.getReviewImage().isEmpty()) {
            try {
                // 기존 파일 id가 있을 때만 실행
                existedImage.ifPresent(image -> fileUploadRepository.deleteById(image.getId()));
                log.info("기존 리뷰 이미지 삭제");

                FileUpload fileUpload = fileUploadService.uploadAndSave(
                        reviewUpdateRequest.getReviewImage(),
                        "REVIEWS",
                        updatedReview.getReviewId(),
                        userId,
                        0,
                        true
                );
                imageUrl = fileUpload.getS3Url();
                log.info("리뷰 이미지 수정 성공 - fileId: {}, s3Url: {}",
                        fileUpload.getId(), fileUpload.getS3Url());
            } catch (Exception e) {
                log.error("리뷰 이미지 수정 실패", e);
                throw new RuntimeException("이미지 수정 실패", e);
            }
        }

        // 기존 이미지 유지
        else if(!existedImage.isEmpty()){
            imageUrl = existedImage.map(FileUpload::getS3Url).orElse(null);
            log.info("기존 리뷰 이미지 유지 - s3Url: {}", imageUrl);

        }

        return reviewMapper.toReviewRegistResponse(updatedReview, imageUrl);
    }


    /**
     * 리뷰 상세 조회
     *
     * @param reservationId
     * @return
     */

    public ReviewDetailResponse getReviewDetail(Long reservationId) {

        // 예약 내역있는지 확인
        Reservation reservation = reservationRepository.findById(reservationId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 예약 내역입니다."));
        log.info("예약 조회 - {}",  reservation);

        Optional<Review> reviewInfo = reviewRepository.findByReservation_Id(reservationId);
//                .orElseThrow(() -> new EntityNotFoundException("해당 예약에 대한 리뷰가 없습니다. ID: " + reservationId));
        log.info("리뷰 조회 - {}", reviewInfo);

        // 숙소 이미지 1개 조회
        String reservationImageUrl = fileUploadRepository.findFirstByReferenceTypeAndReferenceIdAndIsDeletedFalseOrderBySortOrderAsc("STAYS", reservation.getRoom().getStay().getId())
                .map(FileUpload::getS3Url).orElse("/images/product/hotel-bathroom-modern-design.jpg");

        ReviewDetailResponse response;
        if (reviewInfo.isPresent()) {
            // 리뷰가 있는 경우 - 전체 정보 반환
            Review review = reviewInfo.get();
            Optional<FileUpload> optionalFileUpload = fileUploadRepository.findFirstByReferenceTypeAndReferenceIdAndIsDeletedFalseOrderBySortOrderAsc("REVIEWS", review.getReviewId());

            String reviewImageUrl = optionalFileUpload
                    .map(FileUpload::getS3Url)
                    .orElse("/images/product/hotel-room-city-view.png"); // 리뷰 목록 이미지 1개와 같은 이미지

            response = reviewMapper.toReviewDetailResponse(review, reservationImageUrl, reviewImageUrl);

        } else {
            // 리뷰가 없는 경우 - 예약 정보만 반환
            response = ReviewDetailResponse.builder()
                    .reservationInfoDto(reviewMapper.toReservationInfoDto(reservation, reservationImageUrl))
                    .build();
            // @JsonInclude(NON_NULL) 덕분에 null 필드는 자동 제외됨
        }
        return response;
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

        // pageable
        Pageable pageable = createPageable(page, size, sortBy);
        // roomId 필터링 & 페이징
        Page<Review> reviewPage;
        if(roomId != null){
            reviewPage =  reviewRepository.findByStayIdAndRoomId(stayId, roomId, pageable);
        }else{
            reviewPage = reviewRepository.findPageByStayId(stayId, pageable);
        }


        // 단일 파일 버전
        Page<ReviewListResponse> responsePage = reviewPage.map(
                review -> {
                    List<FileUpload> fileUploads = fileUploadService.findAllByReferenceTypeAndReferenceId("REVIEWS", review.getReviewId());

                    String imageUrl;
                    if(!fileUploads.isEmpty()){
                        imageUrl = fileUploads.get(0).getS3Url();
                    }else{ // 이미지가 없는 경우 (등록할 때 강제할거임)
                        imageUrl = "/images/product/hotel-room-city-view.png";
                    }
                    return reviewMapper.toReviewListResponse(review, imageUrl);
                });

        // 파일 여러 개 버전
//        return reviewPage.map(
//            review -> {
//                List<FileUpload> fileUploads = fileUploadService.findByReferenceTypeAndReferenceId("REVIEWS", review.getReviewId());
//                List<String> imageUrls = fileUploads.stream()
//                        .map(FileUpload::getS3Url)
//                        .toList();
//
//                String representativeUrl = fileUploads.stream()
//                        .filter(FileUpload::getIsRepresentative)
//                        .findFirst()
//                        .map(FileUpload::getS3Url)
//                        .orElseGet(() -> imageUrls.isEmpty() ? null : imageUrls.get(0));
//
//                // Mapper에 이미지 URL 전달
//                return reviewMapper.toListResponse(review, representativeUrl, imageUrls);
//            }
//        ).toList();

        // Review -> ReviewResponse 변환
//        Page<ReviewListResponse> responsePage = reviewPage.map(reviewMapper::toReviewListResponse);
//        Page<ReviewListResponse> responsePage = reviewPage.map(r -> reviewMapper.toReviewListResponse(r));
        return ReviewPageResponse.of(responsePage);
    }

    /**
     * 숙소에 따른 리뷰 개수
     * 만약 리뷰 개수가 2,147,483,647(Integer 최대값)보다 많아지면 오버플로우 발생
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

    /**
     * 리뷰 이미지 목록
     * @param stayId
     * @return
     */
    private final FileUploadRepository fileUploadRepository;
    public List<String> getReviewImagesUrl(Long stayId) {
        // stayId로 모든 review의 id를 조회
        List<Long> reviewIds = reviewRepository.findIdsByStayId(stayId);

        // 각 review마다 이미지 조회
        return reviewIds.stream()
            .flatMap(reviewId -> fileUploadService
                    .findAllByReferenceTypeAndReferenceId("REVIEWS", reviewId)
                    .stream()
                    .map(FileUpload::getS3Url))
            .collect(Collectors.toList());
    }




    /**
     * 리뷰 삭제
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

}
