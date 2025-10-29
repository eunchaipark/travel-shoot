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
            console.log(summary);
            setAiSummary(summary);
        }catch(error){
            console.error('요약 조회 실패:', error);
        }
        setLoading(false);
    }

    useEffect(() => {
        console.log("평점 타입: ", typeof score);
        
        if(stayId && reviewCount > 0){
            getAISummary();
        }
    }, [stayId, reviewCount])

    return (
        <div className="card mb-4 card-section-border ai-summary-card-container">
            <div className="card-body p-4">
                {reviewCount > 0 ? (
                    <>
                        <div className="card-top">
                            <div className="card-title-container">
                                <div className="card-title me-2 fw-bold">후기 요약</div>
                                <div className="ai-badge mb-2">
                                    <svg className="ai-icon" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                                    </svg>
                                    <div>gpt-5 AI로 최근 후기를 요약했어요</div>
                                </div>
                            </div>

                            <div className="rating-score-container">
                                <div style={{gap: "3px"}}>
                                    <i className="bi bi-star-fill star-icon"></i>
                                    <span className="score-number">
                                        {score.toFixed(1)} 
                                        <span style={{color:"gray", fontWeight:"400", fontSize:"14px"}}>/5.0</span>
                                    </span>
                                </div>
                            </div>
                        </div>
                         
                        <div className="ai-review-title">AI가 분석한 주요 의견</div>
                        <div className="ai-review-text room-content">
                            {loading ? "loading..." : aiSummary}
                        </div>
                        <a href={`/reviews/stays/${stayId}`} className="view-more-btn">
                            전체 {formatNumber(reviewCount)}건 후기 보기
                            <i className="bi bi-chevron-right"></i>
                        </a>
                    </>
                ) : (
                    <>
                        <div className="card-top">
                            <div className="mt-2 card-title-container">
                                <div className="card-title me-2 fw-bold">이용 후기</div>
                                {/* <div className="ai-badge mb-2">
                                    <svg className="ai-icon" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                                    </svg>
                                    <div>AI 후기 요약</div>
                                </div> */}
                            </div>
                        </div>

                        <div className="no-review-container">
                            <div className="no-review-icon-wrapper">
                                <i className="bi bi-chat-dots no-review-icon"></i>
                            </div>
                            <div className="no-review-title">아직 작성된 후기가 없어요</div>
                            <div className="no-review-description">
                                이 숙소의 첫 번째 후기를 남겨주시면<br/>
                                다른 여행자들에게 큰 도움이 됩니다
                            </div>
                            {/* <div className="no-review-encourage">
                                <i className="bi bi-pencil"></i>
                                첫 후기 작성하고 혜택 받기
                            </div> */}
                        </div>
                    </>
                )}
            </div>
        </div>
    )
}

export default AIReviewSummaryCard;