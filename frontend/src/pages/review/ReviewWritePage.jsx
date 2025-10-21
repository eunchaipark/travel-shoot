import React, { useState, useEffect, useCallback, useRef } from 'react';
import "../../assets/css/review-regist.css";
import ReviewWriteHeader from "@/components/review/ReviewWriteHeader";
import ReviewRatingSection from "@/components/review/ReviewRatingSection";
import PhotoUploadSection from '../../components/review/PhotoUploadSection';

// 세부 평점 카테고리
const detailCategories = [
    { key: 'clean', label: '청결도' },
    { key: 'convenience', label: '편의성' },
    { key: 'checkin', label: '체크인' },
    { key: 'communication', label: '의사소통' },
    { key: 'location', label: '위치' },
    { key: 'value', label: '가성비' },
];

const ReviewWritePage = () => {

    // 초기 평점 상태: 모든 카테고리 0
    const initialRatings = detailCategories.reduce((acc, cat) => ({ ...acc, [cat.key]: 0 }), { overall: 0 });
    const [ratings, setRatings] = useState(initialRatings);
    const [recommendationSelected, setRecommendationSelected] = useState(false);
    const [uploadedFile, setUploadedFile] = useState(null);
    const [reviewText, setReviewText] = useState('');

    const [isEditMode, setIsEditMode] = useState(false);
    const [reviewId, setReviewId] = useState(null);
    const [existingImageUrl, setExistingImageUrl] = useState(null);
    const [isLoading, setIsLoading] = useState(true);
    const isUpdatingFromOverallRef = useRef(false);

    // 전체 평점 평균 계산 로직
    const calculateOverallAverage = useCallback(() => {
        const validRatings = detailCategories
            .map(category => ratings[category.key])
            .filter(rating => rating > 0);
        
        if (validRatings.length === 0) return 0;
        
        const sum = validRatings.reduce((acc, rating) => acc + rating, 0);
        return Math.round(sum / validRatings.length);
    }, [ratings]);

    // 평점 변경 핸들러
    const handleRatingChange = (category, rating) => {
        setRatings(prevRatings => {
            const newRatings = { ...prevRatings, [category]: rating };

            if (category === 'overall') {
                // 전체 평점 변경 시 -> 세부 평점 업데이트
                isUpdatingFromOverallRef.current = true;
                const updatedDetails = detailCategories.reduce((acc, cat) => ({ ...acc, [cat.key]: rating }), {});
                return { ...newRatings, ...updatedDetails };
            } else {
                // 세부 평점 변경 시 -> 전체 평점 업데이트 (useEffect에서 처리)
                return newRatings;
            }
        });
    };

    // 세부 평점 변경에 따른 전체 평점 업데이트 (Side Effect)
    useEffect(() => {
        if (isUpdatingFromOverallRef.current) {
            isUpdatingFromOverallRef.current = false;
            return;
        }

        const averageRating = calculateOverallAverage();
        if (ratings.overall !== averageRating) {
            setRatings(prevRatings => ({ ...prevRatings, overall: averageRating }));
        }
    }, [ratings, calculateOverallAverage]);

    // 제출 버튼 활성화 조건
    const isSubmitEnabled = detailCategories.every(cat => ratings[cat.key] > 0) && ratings.overall > 0;
    
    // 파일 변경/제거 핸들러
    const handleFileChange = (file) => setUploadedFile(file);
    const handleFileRemove = () => {
        setUploadedFile(null);
        if (photoInputRef.current) photoInputRef.current.value = ''; // input 초기화
    };
    const photoInputRef = useRef(null); // PhotoUploadSection에서 사용할 ref

    // 제출 버튼 클릭 핸들러 (실제 제출 로직은 여기에 구현)
    const handleSubmit = () => {
        if (isSubmitEnabled) {
            const reviewData = {
                reservationNumber: '250603002946000110',
                ratings: ratings,
                text: reviewText,
                recommendation: recommendationSelected,
                hasPhoto: !!uploadedFile,
                // uploadedFile: uploadedFile // 실제 제출 시에는 파일을 FormData에 담아 전송
            };
            console.log('리뷰 제출 데이터:', reviewData);
            alert('리뷰를 등록합니다.');
            // API 호출 로직
        } else {
            alert('모든 필수 항목(별점)을 입력해주세요.');
        }
    };
    
    return (
        <div className="review-write-page">
            {/* 헤더 */}
            <ReviewWriteHeader />

            {/* 메인 콘텐츠 */}
            <main className="main-content py-5">
                {/* 숙소 정보 */}
                <section className="accommodation-info-section">
                    <div className="reservation-number">
                        <span className="reservation-value">숙소 예약번호: 250603002946000110</span>
                        <div className="accommodation-card">
                            <div className="accommodation-image-wrapper">
                                <img src="" alt="부산 더스카이" className="accommodation-image" />
                            </div>
                            <div className="accommodation-details">
                                <div className="accommodation-header">
                                    <h2 className="accommodation-name">부산 더스카이</h2>
                                    <span className="status-badge">이용완료</span>
                                </div>
                                <div className="booking-details">
                                    <div className="booking-item">
                                        <i className="fas fa-calendar-alt booking-icon calendar-icon"></i>
                                        <span className="booking-text">2025.04.21 ~ 04.22 (1박)</span>
                                    </div>
                                    <div className="booking-item">
                                        <i className="fas fa-users booking-icon users-icon"></i>
                                        <span className="booking-text">성인 2명 · 객실 1개</span>
                                    </div>
                                    <div className="booking-item">
                                        <i className="fas fa-clock booking-icon clock-icon"></i>
                                        <span className="booking-text">체크인 15:00 | 체크아웃 11:00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                {/* 평점 섹션 (전체 + 세부) */}
                <ReviewRatingSection ratings={ratings} onRatingChange={handleRatingChange} detailCategories={detailCategories}/>

                {/* 텍스트 후기 */}
                <section className="text-review-section">
                    <h3 className="section-title">텍스트 후기 작성 (선택)</h3>
                    <textarea 
                        className="review-textarea" 
                        placeholder="이용한 경험을 자세히 알려주세요." 
                        rows="4"
                        value={reviewText}
                        onChange={(e) => setReviewText(e.target.value)}
                    ></textarea>
                </section>

                {/* 사진 업로드 */}
                <PhotoUploadSection
                    uploadedFile={uploadedFile} 
                    onFileChange={handleFileChange} 
                    onFileRemove={handleFileRemove} 
                    photoInputRef={photoInputRef}
                />

                {/* 추천 여부 */}
                <section className="recommendation-section">
                    <div className="recommendation-question">이 숙소를 다른 사람에게 추천하시겠습니까?</div>
                    <button 
                        className={`recommendation-button ${recommendationSelected ? 'active' : ''}`} 
                        id="recommendation-button" 
                        type="button"
                        onClick={() => setRecommendationSelected(prev => !prev)}
                    >
                        <i className="fas fa-heart"></i>네, 추천합니다.
                    </button>
                </section>

                {/* 액션 버튼 */}
                <section className="action-buttons-section">
                    <div className="button-group">
                        <button className="cancel-button" type="button">취소</button>
                        <button 
                            className={`submit-button ${isSubmitEnabled ? 'active' : ''}`} 
                            id="submit-button" 
                            type="button"
                            disabled={!isSubmitEnabled}
                            onClick={handleSubmit}
                        >
                            등록
                        </button>
                    </div>
                </section>

            </main>
        </div>
    );
};

export default ReviewWritePage;