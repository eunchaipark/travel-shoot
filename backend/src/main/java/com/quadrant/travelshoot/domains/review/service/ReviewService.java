package com.quadrant.travelshoot.domains.review.service;

import com.quadrant.travelshoot.domains.review.dto.request.ReviewRegistRequest;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewDetailResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewListResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewPageResponse;
import com.quadrant.travelshoot.domains.review.dto.response.ReviewRegistResponse;
import jakarta.validation.Valid;

public interface ReviewService {

    ReviewRegistResponse createReview(Long userId, @Valid ReviewRegistRequest request);
    void deleteReview(Long userId, Long reviewId);
    ReviewRegistResponse updateReview(Long userId, Long reviewId, @Valid ReviewRegistRequest reviewUpdateRequest);
    ReviewDetailResponse getReviewDetail(Long reviewId);
    ReviewPageResponse<ReviewListResponse> getReviewsWithPaging(Long stayId, Long roomId, int page, int size, String sortBy);


}
