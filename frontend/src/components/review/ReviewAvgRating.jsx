import React from "react";
import "@/assets/css/review-list.css";

const ReviewAvgRating = ({stayRating}) => {
  const categories = stayRating ? [
    { label: "의사소통", score: stayRating.communicationRating },
    { label: "위치", score: stayRating.locationRating },
    { label: "가성비", score: stayRating.valueRating },
    { label: "청결도", score: stayRating.cleanRating },
    { label: "체크인", score: stayRating.checkinRating },
    { label: "편의성", score: stayRating.convenienceRating },
  ] : [];

  return (
        <div className="row justify-content-center">
          <div className="col-12 text-center">
            <div className="row justify-content-center align-items-center">
              {/* 전체 평점 */}
              <div className="total-score col-auto me-6">
                <div className="d-flex align-items-center">
                  <span className="overall-rating-star-icon">★</span>
                  <span className="overall-rating-number">
                    {(stayRating?.totalRating || 0).toFixed(2)}
                  </span>
                </div>
              </div>

              {/* 평가 항목들 */}
              <div className="col-auto">
                <div className="row g-3">
                  {categories.map((item, idx) => (
                    <div className="col-4" key={idx}>
                      <div className="rating-category-item text-center">
                        <div className="category-label-text">{item.label}</div>
                        <div className="rating-score-bar">
                          <div
                            className="score-fill-indicator"
                            data-score={item.score}
                            style={{ width: `${(item.score / 5) * 100}%` }}
                          ></div>
                          <div className="score-number-text">{item.score}</div>
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              </div>

            </div>
          </div>
        </div>
  );
};

export default ReviewAvgRating;
