package com.quadrant.travelshoot.domains.review.controller;

import com.quadrant.travelshoot.domains.ai.dto.response.ReviewAiSummaryResponse;
import com.quadrant.travelshoot.domains.ai.service.ReviewAiSummaryService;
import com.quadrant.travelshoot.domains.review.dto.request.ReviewRegistRequest;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewDetailResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewListResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewPageResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewRegistResponse;
import com.quadrant.travelshoot.domains.review.service.impl.ReviewServiceImpl;
import com.quadrant.travelshoot.shared.response.ApiResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/api/reviews")
@RequiredArgsConstructor
public class ReviewController {

    private final ReviewServiceImpl reviewService;
    private final ReviewAiSummaryService reviewAiSummaryService;

    @GetMapping("/ai-summary/{stayId}")
    public ResponseEntity<String> getReviewSummary(@PathVariable Long stayId) {
        log.info("리뷰 AI 요약 요청 - stayId: {}", stayId);

        String response = reviewService.getReviewSummary(stayId);
        return ResponseEntity.ok(response);
    }

    /**
     * 리뷰 등록
     * @param userId 현재 로그인한 사용자 ID (인증에서 추출)
     * @param reviewRegistRequest 리뷰 등록 요청 데이터
     * @return 등록된 리뷰 정보
     * 프론트엔드가 등록 직후 화면을 갱신할 수 있음
     * 리뷰 작성 후 바로 새 리뷰 카드가 보여야 할 때, 응답으로 새로 등록된 리뷰 데이터를 보내주면 추가 API 호출이 필요 없음.
     */
    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<ApiResponse<ReviewRegistResponse>> createReview(
            HttpSession session,
            @Valid @ModelAttribute ReviewRegistRequest reviewRegistRequest){

        Long userId = (Long) session.getAttribute("userId");

        log.info("리뷰 등록 요청 - userId: {}", userId);
        log.info("리뷰 등록 요청 - reservationId: {}", reviewRegistRequest.getReservationId());
        log.info("리뷰 등록 요청!!! -  {}", reviewRegistRequest);

        ReviewRegistResponse resultResponse = reviewService.createReview(userId, reviewRegistRequest);
        return ResponseEntity.status(HttpStatus.CREATED).body(ApiResponse.success("리뷰 등록 성공", resultResponse));
    }


    /**
     * 리뷰 수정
     *
     * @param userId 현재 로그인한 사용자 ID
     * @param reviewId 수정할 리뷰 ID
     * @param request 리뷰 수정 데이터
     * @return 수정된 리뷰 정보
     */
    @PutMapping(value = "/{reviewId}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<ApiResponse<ReviewRegistResponse>> updateReview(
            HttpSession session,
            @PathVariable Long reviewId,
            @Valid @ModelAttribute ReviewRegistRequest reviewUpdateRequest) {

        Long userId = (Long) session.getAttribute("userId");

        log.info("리뷰 수정 요청 - userId: {}, reviewId: {}", userId, reviewId);
        reviewUpdateRequest.setReviewId(reviewId);
        ReviewRegistResponse response = reviewService.updateReview(userId, reviewId, reviewUpdateRequest);

        return ResponseEntity.ok(ApiResponse.success("리뷰 수정 성공", response));
    }

    /**
     * 리뷰 삭제
     * @param userId 현재 로그인한 사용자 ID
     * @param reviewId 삭제할 리뷰 ID
     * @return 성공 메시지
     */
    @DeleteMapping("/{reviewId}")
    public ResponseEntity<Void> deleteReview(
//            @AuthenticationPrincipal UserDetails user,
            @PathVariable Long reviewId) {

        Long userId = 1L;
        log.info("리뷰 삭제 요청 - userId: {}, reviewId: {}", userId, reviewId);

        reviewService.deleteReview(userId, reviewId);
        return ResponseEntity.noContent().build();
    }


    /**
     * 리뷰 상세 조회
     * 수정할 때 사용
     */
    @GetMapping("/reservations/{reservationId}")
    public ResponseEntity<ApiResponse<ReviewDetailResponse>> getReviewDetail(
            @PathVariable Long reservationId,
            HttpSession session
    ){
        log.info("리뷰 상세 조회 - reservationId: {}", reservationId);
        Long userId = (Long) session.getAttribute("userId");
        log.info("현재 사용자 - userId: {}", userId);


        ReviewDetailResponse reviewDetailResponse = reviewService.getReviewDetail(reservationId);
        return ResponseEntity.ok().body(ApiResponse.success("리뷰 상세 조회 성공", reviewDetailResponse));
    }


    /**
     * 특정 숙박시설의 리뷰 목록 조회 (페이징 - 무한 스크롤링)
     *
     * @param stayId 숙박시설 ID
     * @param roomId 객실 ID
     * @param page 페이지 번호 (0부터 시작, 기본값: 0)
     * @param size 페이지 크기 (기본값: 10, 최대: 50)
     * @param sortBy 정렬 기준 (latest: 최신순, rating_desc: 별점높은순, rating_asc: 별점낮은순, 기본값: latest)
     * @return 페이징된 리뷰 목록
     */
    @GetMapping("/stays/{stayId}/paging")
    public ResponseEntity<ReviewPageResponse<?>> getReviewsWithPaging(
            @PathVariable Long stayId,
            @RequestParam(required = false) Long roomId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "latest") String sortBy) {

        log.info("숙박시설 리뷰 페이징 조회 - stayId: {}, page: {}, size: {}, sortBy: {}",
                stayId, page, size, sortBy);

        ReviewPageResponse<ReviewListResponse> reviewsPage = reviewService.getReviewsWithPaging(stayId, roomId ,page, size, sortBy);
        return ResponseEntity.ok().body(reviewsPage);
    }

    /**
     * 리뷰 이미지 목록 조회
     */
    @GetMapping("/{stayId}/review-images")
    public ResponseEntity<List<String>> getReviewImages(@PathVariable Long stayId) {
        List<String> imageUrls = reviewService.getReviewImagesUrl(stayId);
        return ResponseEntity.ok(imageUrls);
    }


    /**
     * ai 리뷰 요약
     * 최근 10개 이상 리뷰 요약 or 최대 50개 이내 리뷰 요약
     */

}
