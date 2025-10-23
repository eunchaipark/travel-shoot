import React from 'react';

// 개별 숙소 카드 스켈레톤
const StayCardSkeleton = () => {
    return (
        <div className="hotel-card skeleton-card">
            <div className="hotel-stay_image skeleton-image">
                <div className="skeleton-shimmer"></div>
            </div>
            <div className="stay_content">
                <div className="stay_info">
                    {/* 숙소명 */}
                    <div className="skeleton-text skeleton-title mb-2"></div>

                    {/* 평점 & 위치 */}
                    <div className="stay-location-wrapper">
                        <div className="stay-score-wrapper">
                            <div className="skeleton-text skeleton-score"></div>
                        </div>
                        <div className="stay_location">
                            <div className="skeleton-text skeleton-location"></div>
                        </div>
                    </div>

                    {/* 옵션 제목 */}
                    <div className="card_options">
                        <div className="skeleton-text skeleton-option-title"></div>
                    </div>

                    {/* 태그들 */}
                    <div className="card_tags">
                        <div className="skeleton-text skeleton-tag"></div>
                        <div className="skeleton-text skeleton-tag"></div>
                        <div className="skeleton-text skeleton-tag"></div>
                    </div>
                </div>

                <div className="card_bottom">
                    <div className="skeleton-text skeleton-check-in"></div>
                    <div className="stay_price">
                        <div className="skeleton-text skeleton-price"></div>
                    </div>
                </div>
            </div>
        </div>
    );
};

// 여러 개의 스켈레톤을 렌더링하는 컴포넌트
const StayListSkeleton = ({ count = 5 }) => {
    return (
        <>
            {Array.from({ length: count }).map((_, index) => (
                <StayCardSkeleton key={`skeleton-${index}`} />
            ))}
        </>
    );
};

export { StayCardSkeleton };
export default StayListSkeleton;