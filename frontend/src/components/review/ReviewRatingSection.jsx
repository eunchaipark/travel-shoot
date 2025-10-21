/**
 * 평점 섹션 컴포넌트 (전체 평점 + 세부 평점)
 * @param {object} props
 * @param {object} props.ratings - 현재 평점 상태
 * @param {function} props.onRatingChange - 평점 변경 핸들러
 */
const ReviewRatingSection = ({ ratings, onRatingChange, detailCategories }) => {
    
    /**
     * 특정 카테고리의 별점 클릭 핸들러
     * @param {string} category - 평점 카테고리 ('overall' 또는 세부 카테고리 키)
     * @param {number} rating - 선택된 평점 (1~5)
     */
    const handleStarClick = (category, rating) => {
        onRatingChange(category, rating);
    };

    // 별점 목록을 렌더링하는 함수
    const renderStarRatingContainer = (category) => (
        <div className="star-rating-container" data-category={category}>
            {[1, 2, 3, 4, 5].map(ratingValue => (
                <StarButton
                    key={ratingValue}
                    ratingValue={ratingValue}
                    isActive={ratings[category] >= ratingValue}
                    onClick={() => handleStarClick(category, ratingValue)}
                />
            ))}
        </div>
    );


    /**
     * 별점 버튼 컴포넌트
     * @param {object} props
     * @param {number} props.ratingValue - 이 버튼이 나타내는 평점 값 (1~5)
     * @param {boolean} props.isActive - 현재 평점에 포함되는지 여부
     * @param {function} props.onClick - 클릭 핸들러
     */
    const StarButton = ({ ratingValue, isActive, onClick }) => (
        <button 
            className={`star-button ${isActive ? 'active' : ''}`} 
            data-rating={ratingValue} 
            type="button" 
            onClick={onClick}
        >
            ★
        </button>
    );

    return (
        <section className="rating-section">
            {/* 전체 만족도 */}
            <div className="overall-rating">
                <div className="rating-question">부산 더스카이 이용에 만족하셨나요?</div>
                {renderStarRatingContainer('overall')}
            </div>
            
            {/* 세부 평점 */}
            <div className="detailed-rating">
                <div className="rating-categories">
                    {detailCategories.map(({ key, label }) => (
                        <div className="rating-category" key={key}>
                            <div className="category-label">{label}</div>
                            {renderStarRatingContainer(key)}
                        </div>
                    ))}
                </div>
            </div>
        </section>
    );
};

export default ReviewRatingSection;