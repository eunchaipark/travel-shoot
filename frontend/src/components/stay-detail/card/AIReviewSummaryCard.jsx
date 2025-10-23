import { useEffect, useState } from "react";
import { formatNumber } from "@/utils/stay/StayDetailUtils";

const AIReviewSummaryCard = ({stayId, score, reviewCount}) => {

    const [aiSummary, setAiSummary] = useState("");
    const [loading, setLoading] = useState(true);

    const getAISummary = async() => {

        setLoading(true);

        const res = await fetch(`http://localhost:8000/api/reviews/ai-summary/${stayId}`);
         if (!res.ok) {
        throw new Error(`HTTP error! status: ${res.status}`);
        }
        const data = await res.json();
        console.log("AI 요약 결과:", data);
        setAiSummary(data.summary);
        setLoading(false);

    }

    useEffect(() => {
        // getAISummary();
    }, [])

    return (
        <div className="card mb-4 card-section-border">
            <div className="card-body p-4">
                {reviewCount > 0 ?
                    <>
                        <div className="rating-score">
                            <i className="bi bi-star-fill star-icon"></i>
                            <span className="score-number">{score}</span>
                        </div>
                        <div className="ai-review-title">AI 요약 리뷰</div>
                        {/* <div className="ai-review-text room-content">
                            {loading ? "로딩중 ..." : aiSummary}
                        </div> */}
                        <a href={`/reviews/stays/${stayId}`} className="view-more-btn">
                            전체 {formatNumber(reviewCount)}건 리뷰
                            <i className="bi bi-chevron-right"></i>
                        </a>
                    </> : 
                    <>
                        <div className="rating-score">
                            <i className="bi bi-star-fill star-icon"></i>
                            <span className="score-number">리뷰</span>
                        </div>
                        <div className="ai-review-title">작성된 리뷰가 없습니다.</div>
                        {/* <div className="ai-review-text room-content">
                            {loading ? "로딩중 ..." : aiSummary}
                        </div> */}
                    </>
                    
                }
                
            </div>
        </div>
    )
}

export default AIReviewSummaryCard;