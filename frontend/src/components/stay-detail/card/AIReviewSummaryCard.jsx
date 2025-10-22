import { useEffect } from "react";
import { formatNumber } from "../../../utils/stay/StayDetailUtils";

const AIReviewSummaryCard = ({stayId, score, review, totalReview}) => {

    return (
        <div className="card mb-4 card-section-border">
            <div className="card-body p-4">
                <div className="rating-score">
                    <i className="bi bi-star-fill star-icon"></i>
                    <span className="score-number">{score}</span>
                </div>
                <div className="ai-review-title">AI 요약 리뷰</div>
                <div className="ai-review-text room-content">
                    {review}
                </div>
                <a href={`/reviews/stays/${stayId}`} className="view-more-btn">
                    전체 {formatNumber(totalReview)}건 리뷰
                    <i className="bi bi-chevron-right"></i>
                </a>
            </div>
        </div>
    )
}

export default AIReviewSummaryCard;