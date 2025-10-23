import { useEffect, useState } from "react";
import { formatNumber } from "@/utils/stay/StayDetailUtils";
import { getReviewSummary } from "@/services/stay-detail/stayDetailApiService";

const AIReviewSummaryCard = ({stayId, score, reviewCount}) => {

    const [aiSummary, setAiSummary] = useState("");
    const [loading, setLoading] = useState(true);

    const getAISummary = async() => {

        setLoading(true);

        try{
            const summary = await getReviewSummary(stayId);
            console.log(summary); // AI 요약 텍스트
            setAiSummary(summary);
        }catch(error){
            console.error('요약 조회 실패:', error);
        }
        setLoading(false);

    }

    useEffect(() => {
        if(stayId){
            getAISummary();

        }
    }, [stayId])

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
                        <div className="ai-review-text room-content">
                            {loading ? "로딩중 ..." : aiSummary}
                        </div>
                        <a href={`/reviews/stays/${stayId}`} className="view-more-btn">
                            전체 {formatNumber(reviewCount)}건 리뷰
                            <i className="bi bi-chevron-right"></i>
                        </a>
                    </> : 
                    <>
                        <div className="rating-score">
                            <i className="bi bi-star-fill star-icon"></i>
                            <span className="score-number"></span>
                        </div>
                        <div className="ai-review-title">작성된 리뷰가 없습니다.</div>
                        <div className="ai-review-text room-content">
                            {loading ? "로딩중 ..." : aiSummary}
                        </div>
                    </>
                    
                }
                
            </div>
        </div>
    )
}

export default AIReviewSummaryCard;