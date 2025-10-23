import React, { useState, useEffect, useCallback, useRef } from 'react';
import "@/assets/css/review-regist.css";
import ReviewWriteHeader from "@/components/review/ReviewWriteHeader";
import ReviewRatingSection from "@/components/review/ReviewRatingSection";
import PhotoUploadSection from '@/components/review/PhotoUploadSection';
import { useNavigate, useParams } from 'react-router-dom';
import ReviewReservationSection from '@/components/review/ReviewReservationSection';
import { createReview, updateReview } from '@/services/review/reviewApiService';

// 세부 평점 카테고리
const detailCategories = [
    { key: 'cleanRating', label: '청결도' },
    { key: 'convenienceRating', label: '편의성' },
    { key: 'checkinRating', label: '체크인' },
    { key: 'communicationRating', label: '의사소통' },
    { key: 'locationRating', label: '위치' },
    { key: 'valueRating', label: '가성비' },
];


const ReviewWritePage = () => {

    const navigate = useNavigate();
    const {reservationId} = useParams();

    const initialRatings = detailCategories.reduce((acc, cat) => ({ ...acc, [cat.key]: 0 }), { totalRating: 0 });
    const [ratings, setRatings] = useState(initialRatings);
    const [isRecommended, setIsRecommended] = useState(false);
    const [uploadedFile, setUploadedFile] = useState(null);
    const [reviewText, setReviewText] = useState('');
    const [isEditMode, setIsEditMode] = useState(false);
    const [reviewId, setReviewId] = useState(null);
    // const [existingImageUrl, setExistingImageUrl] = useState(null);
    const [isLoading, setIsLoading] = useState(true);
    const [reservationInfo, setReservationInfo] = useState(null);
    const isUpdatingFromTotalRef = useRef(false);
    const photoInputRef = useRef(null);

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

            if (category === 'totalRating') {
                // 전체 평점 변경 시 -> 세부 평점 업데이트
                isUpdatingFromTotalRef.current = true;
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
        if (isUpdatingFromTotalRef.current) {
            isUpdatingFromTotalRef.current = false;
            return;
        }

        const averageRating = calculateOverallAverage();
        if (ratings.totalRating !== averageRating) {
            setRatings(prevRatings => ({ ...prevRatings, totalRating: averageRating }));
        }
    }, [ratings, calculateOverallAverage]);


    // 예약 + 기존 리뷰 데이터 불러오기
    useEffect(() => {
        const fetchReviewData = async () => {
            try {
                // 예약번호를 기반으로 리뷰 조회 API 호출
                const API_BASE_URL = "http://localhost:8080/api";
                const response = await fetch(`${API_BASE_URL}/reviews/reservations/${reservationId}`);
                
                if (response.ok) {
                    const result = await response.json();
                    console.log("response ok 예약내역 조회");
                    
                    
                    if (result.success && result.data) {
                        const data = result.data;

                        console.log("예약 데이터: ", data);
                        // 예약 정보 설정
                        setReservationInfo(data.reservationInfoDto);

                        if(data.reviewId){
                        console.log("예약 + 리뷰 데이터: ", data);

                            setIsEditMode(true);
                            setReviewId(data.reviewId);

                             // 평점 데이터 설정
                            const loadedRatings = {
                                totalRating: Math.round(data.totalRating),
                                cleanRating: data.cleanRating,
                                convenienceRating: data.convenienceRating,
                                checkinRating: data.checkinRating,
                                communicationRating: data.communicationRating,
                                locationRating: data.locationRating,
                                valueRating: data.valueRating,
                            };
                            setRatings(loadedRatings);
                            
                            // 텍스트 및 기타 데이터 설정
                            setReviewText(data.reviewContent || '');
                            setIsRecommended(data.isRecommended);
                            // setExistingImageUrl(data.reviewImageUrl);
                        } else {
                            // 리뷰가 없는 경우 - 등록 모드
                            setIsEditMode(false);
                        }
                    }

                } else {
                    console.error('리뷰 조회 실패');
                    setIsEditMode(false);
                }
            } catch (error) {
                console.error('리뷰 조회 중 오류:', error);
                setIsEditMode(false);
            } finally {
                setIsLoading(false);
            }
        };

        fetchReviewData();
    }, [reservationId]);

    // 제출 버튼 활성화 조건
    const isSubmitEnabled = detailCategories.every(cat => ratings[cat.key] > 0) && ratings.totalRating > 0;
    
    // 파일 변경/제거 핸들러
    const handleFileChange = (file) => setUploadedFile(file);
    const handleFileRemove = () => {
        setUploadedFile(null);
        if (photoInputRef.current) photoInputRef.current.value = ''; // input 초기화
    };


    // 제출 버튼 핸들러
    const handleSubmit = async() => {
        if (isSubmitEnabled) {
            try {
                // FormData 생성
                const formData = new FormData();
                
                // 기본 필드 추가
                formData.append('reservationId', Number(reservationId));
                formData.append('stayId', reservationInfo.stayId);
                // ratings 객체의 각 필드를 개별적으로 추가
                Object.keys(ratings).forEach(key => {
                    formData.append(key, ratings[key]);
                }); 
                formData.append('reviewContent', reviewText);
                formData.append('isRecommended', isRecommended);
                // 이미지 파일 추가 (있는 경우)
                if (uploadedFile) {
                    formData.append('reviewImage', uploadedFile);
                }
                console.log('리뷰 제출 데이터 준비 완료');
                
                // API 호출
                if(isEditMode){
                    const res = await updateReview(reviewId, formData);
                    console.log('리뷰 수정 성공:', res?.data);
                    alert('리뷰가 수정되었습니다.');
                }else{
                    const res = await createReview(formData);
                    console.log('리뷰 등록 성공:', res?.data);
                    alert('리뷰가 등록되었습니다.');
                }

                 // 성공 후 페이지 이동
                navigate('/'); 
                
            } catch (error) {
                console.error(`리뷰 ${isEditMode ? '수정' : '등록'} 실패:`, error);
                alert(`리뷰 ${isEditMode ? '수정' : '등록'}에 실패했습니다. 다시 시도해주세요.`);
            }
        } else {
            alert('모든 필수 항목을 입력해주세요.');
        }
    };


     // 취소 버튼 핸들러
    const handleCancel = () => {
        if (window.confirm('정말 취소하시겠습니까?')) {
            navigate(-1);
        }
    };

    
    return (
        <div className="review-write-page">
            {/* 헤더 */}
            <ReviewWriteHeader />
            {/* 메인 콘텐츠 */}
            <main className="main-content py-5">
                {/* 숙소 예약 정보 */}
                {reservationInfo && <ReviewReservationSection reservationInfo={reservationInfo}/> }

                {/* 평점 섹션 (전체 + 세부) */}
                <ReviewRatingSection ratings={ratings} onRatingChange={handleRatingChange} detailCategories={detailCategories}/>
                {/* 텍스트 후기 */}
                <section className="text-review-section">
                    <h3 className="section-title">텍스트 후기 작성</h3>
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
                        className={`recommendation-button ${isRecommended ? 'active' : ''}`} 
                        id="recommendation-button"
                        type="button"
                        onClick={() => setIsRecommended(prev => !prev)}
                    >
                        <i className="fas fa-heart"></i>네, 추천합니다.
                    </button>
                </section>

                {/* 액션 버튼 */}
                <section className="action-buttons-section">
                    <div className="button-group">
                        <button
                            className="cancel-button"
                            type="button"
                            onClick={handleCancel}
                        >취소</button>

                        <button 
                            className={`submit-button ${isSubmitEnabled ? 'active' : ''}`} 
                            id="submit-button" 
                            type="button"
                            disabled={!isSubmitEnabled}
                            onClick={handleSubmit}
                        > {isEditMode ? '수정' : '등록'} </button>
                    </div>
                </section>

            </main>
        </div>
    );
};

export default ReviewWritePage;