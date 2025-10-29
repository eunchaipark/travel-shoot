import React, { useEffect, useState, useCallback, useRef } from "react";
import ReviewCard from "@/components/review/ReviewCard";
import ReviewFilter from "@/components/review/ReviewFilter";
import ReviewHeader from "@/components/review/ReviewHeader";
import ReviewPhotoList from "@/components/review/ReviewPhotoList";
import ReviewAvgRating from "@/components/review/ReviewAvgRating";

import {useInView} from "react-intersection-observer";
import "@/assets/css/review-list.css";
import { useParams } from "react-router-dom";
import {
    getRoomFilters,
    getStayRating,
    getReviews,
    getReviewImages,
} from "@/services/review/reviewApiService";

const sortOptions = [
    { option: "최신 순", value: "latest" },
    { option: "높은 별점 순", value: "rating_desc" },
    { option: "낮은 별점 순", value: "rating_asc" },
];

const ReviewListPage = () => {
    const { stayId } = useParams();
    const [stayRating, setStayRating] = useState(null);
    const [rooms, setRooms] = useState([]);
    const [reviewImages, setReviewImages] = useState([]);

    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);
    
    const [ref, inView] = useInView();
    const [page, setPage] = useState(0);
    const [reviews, setReviews] = useState([]);
    const [hasMore, setHasMore] = useState(true); // 더 불러올 데이터가 있는지

    const [sortFilter, setSortFilter] = useState(sortOptions[0].value);
    const selectedOption = sortOptions.find(opt => opt.value === sortFilter);

    const [roomFilter, setRoomFilter] = useState("객실 전체");
    const selectedRoomId = rooms.find(room => room.roomName === roomFilter)?.roomId;

    // 중복 호출 방지를 위한 ref
    const isFetchingRef = useRef(false);

    // fetchReviews를 useCallback으로 감싸서 의존성 관리
    const fetchReviews = useCallback(async (currentPage, isReset = false) => {
        // 이미 로딩 중이거나 더 이상 데이터가 없으면 return
        if (isFetchingRef.current || (!hasMore && !isReset)) {
            return;
        }

        isFetchingRef.current = true;
        setLoading(true);
        setError(null);

        try {
            const reviewData = await getReviews(stayId, {
                roomId: selectedRoomId,
                page: currentPage,
                size: 10,
                sortBy: sortFilter,
            });

            const reviewList = reviewData.content || reviewData;
            console.log(`fetch page : ${currentPage}`, reviewList);
            
            if (Array.isArray(reviewList)) {
                if (reviewList.length === 0) {
                    // 더 이상 데이터가 없음
                    setHasMore(false);
                } else {
                    // 리셋인 경우 기존 데이터 대체, 아니면 추가
                    setReviews(prev => isReset ? reviewList : [...prev, ...reviewList]);
                    setPage(currentPage + 1);
                    
                    // 받아온 데이터가 요청한 사이즈보다 적으면 마지막 페이지
                    if (reviewList.length < 10) {
                        setHasMore(false);
                    }
                }
            }
        } catch (err) {
            console.error("리뷰 로드 실패:", err);
            setError(err.message);
            if (isReset) {
                setReviews([]);
            }
        } finally {
            setLoading(false);
            isFetchingRef.current = false;
        }
    }, [stayId, selectedRoomId, sortFilter, hasMore]);

    // 무한 스크롤 감지
    useEffect(() => {
        if (inView && hasMore && !loading) {
            console.log("스크롤 요청", inView, "현재 페이지:", page);
            fetchReviews(page);
        }
    }, [inView, hasMore, loading, page, fetchReviews]);

    
    // 초기 데이터 로드
    useEffect(() => {
        const fetchInitialData = async () => {
            console.log("초기 데이터 호출");
            
            setLoading(true);
            setError(null);
            try {
                const [ratingData, roomsData, imagesData] = await Promise.all([
                    getStayRating(stayId),
                    getRoomFilters(stayId),
                    getReviewImages(stayId),
                ]);

                setStayRating(ratingData);
                setRooms(roomsData);
                setReviewImages(imagesData || []);
            } catch (err) {
                console.error("초기 데이터 로드 실패:", err);
                setError(err.message);
            } finally {
                setLoading(false);
            }
        };

        if (stayId) {
            fetchInitialData();
        }
    }, [stayId]);


    // 필터 변경 시 리뷰 목록 리셋 및 재조회
    useEffect(() => {
        if (stayId && rooms.length > 0) {
            console.log("필터 변경 감지 - 리뷰 리셋");
            // 상태 초기화
            setReviews([]);
            setPage(0);
            setHasMore(true);
            isFetchingRef.current = false;
            
            // 첫 페이지 데이터 로드
            fetchReviews(0, true);
        }
    }, [stayId, sortFilter, selectedRoomId, rooms.length]);

    // 정렬 필터 변경 핸들러
    const handleSortChange = (value) => {
        setSortFilter(value);
    };

    // 객실 필터 변경 핸들러
    const handleRoomChange = (roomName) => {
        setRoomFilter(roomName);
    };

    return (
        <div className="review-list-container">
            <ReviewHeader />

            <div className="container-fluid py-5">
                <div className="main-review-container">
                    <div className="container overall-rating-section">
                        <ReviewAvgRating stayRating={stayRating} />
                    </div>
                </div>

                <ReviewPhotoList images={reviewImages}/>

                <div className="reviews-section">
                    {/* 필터 카드 */}
                    <div className="rating-filters-section mb-3">
                        <div className="row g-3">
                            {/* 별점 필터 */}
                            <div className="col-md-2 filter-dropdown-container">
                                <div className="d-flex align-items-center">
                                    <span className="me-3 fw-bold small">별점: </span>
                                    <div className="dropdown">
                                        <button
                                            className="btn btn-outline-secondary btn-sm dropdown-toggle"
                                            type="button"
                                            data-bs-toggle="dropdown"
                                        >
                                            <span className="review-star-color me-2">★</span>
                                            {selectedOption?.option}
                                        </button>
                                        <ul className="dropdown-menu dropdown-menu-lg">
                                            {sortOptions.map(opt => (
                                                <li key={opt.value}>
                                                    <button
                                                        className="dropdown-item"
                                                        onClick={(e) => {
                                                            e.preventDefault();
                                                            handleSortChange(opt.value);
                                                        }}
                                                    >
                                                        <span className="review-star-color me-2">★</span>
                                                        {opt.option}
                                                    </button>
                                                </li>
                                            ))}
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            {/* 객실 필터 */}
                            <div className="col-md-10">
                                <div className="d-flex align-items-center">
                                    <span className="me-3 fw-bold small">객실:</span>
                                    <div className="dropdown">
                                        <button
                                            className="btn btn-outline-secondary btn-sm dropdown-toggle"
                                            type="button"
                                            data-bs-toggle="dropdown"
                                        >
                                            {roomFilter}
                                        </button>
                                        <ul className="dropdown-menu dropdown-menu-lg">
                                            <li>
                                                <button
                                                    className="dropdown-item"
                                                    onClick={(e) => {
                                                        e.preventDefault();
                                                        handleRoomChange("객실 전체");
                                                    }}
                                                >
                                                    객실 전체
                                                </button>
                                            </li>
                                            {rooms.map(room => (
                                                <li key={room.roomId}>
                                                    <button
                                                        className="dropdown-item"
                                                        onClick={(e) => {
                                                            e.preventDefault();
                                                            handleRoomChange(room.roomName);
                                                        }}
                                                    >
                                                        {room.roomName}
                                                    </button>
                                                </li>
                                            ))}
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* 리뷰 리스트 */}
                    <div className="reviews-list-section">
                        {error && <div className="alert alert-danger">{error}</div>}

                        <div className="list-scroll-container">
                            {reviews.length > 0 ? (
                                <>
                                    {reviews.map(review => (
                                        <ReviewCard key={review.reviewId} review={review} />
                                    ))}
                                    
                                    {/* 무한 스크롤 트리거 */}
                                    {hasMore && (
                                        <div ref={ref} className={`scroll-trigger ${loading ? "active" : ""}`}>
                                            {loading ? '로딩 중...' : ''}
                                        </div>
                                    )}
                                    
                                    {!hasMore && (
                                        <div style={{ padding: '20px', textAlign: 'center', color: '#999' }}>
                                            {/* 모든 리뷰를 불러왔습니다. */}
                                        </div>
                                    )}
                                </>
                            ) : (
                                <div style={{ padding: '40px', textAlign: 'center' }}>
                                    {loading ? '로딩 중...' : '리뷰가 없습니다.'}
                                </div>
                            )}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default ReviewListPage;