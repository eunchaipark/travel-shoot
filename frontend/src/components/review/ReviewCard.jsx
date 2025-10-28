import React from "react";
import { formatDateTime } from "@/utils/review/reviewUtils";



const ReviewCard = ({ review }) => {

  const stars = "★★★★★".slice(0, Math.round(review.totalRating));
  
  return (
    <div className="review-item-card">
      <div className="row">
        <div className="col-auto review-photo-container">
          <div className="review-photo-background"
               style={{backgroundImage: `url(${review?.reviewImageUrl})`}}
          ></div>
        </div>
        <div className="col review-content-area">
          <div className="review-header-section">
            <div className="d-flex justify-content-between align-items-start mb-2 d-none d-sm-flex">
              <div>
                <div className="star-rating-icons mb-1">
                  {stars}
                  <span className="ms-1 text-muted">({review.totalRating.toFixed(1)}/5.0)</span>
                </div>
                <div className="fw-bold reviewer-info-text">{review.userName} | {review.roomName}</div>
              </div>
              <small className="review-date-text">{formatDateTime(review.createdAt)}</small>
            </div>

            <div className="d-block d-sm-none">
              <div className="star-rating-icons">
                {stars}
                <span className="ms-1 text-muted">({review.totalRating.toFixed(1)}/5.0)</span>
              </div>
              <div className="fw-bold reviewer-info-text">{review.userName} | {review.roomName}</div>
              <div className="review-date-text">{formatDateTime(review.createdAt)}</div>
            </div>

          </div>
          <p className="review-text-content mb-0 text-muted small">{review.reviewContent}</p>
        </div>
      </div>
    </div>
  );
};

export default ReviewCard;
