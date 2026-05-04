import React, { useEffect, useState } from "react";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { useInView } from "react-intersection-observer";
import ReviewCard from "@/components/review/ReviewCard";
import ReviewHeader from "@/components/review/ReviewHeader";
import ReviewPhotoList from "@/components/review/ReviewPhotoList";
import ReviewAvgRating from "@/components/review/ReviewAvgRating";
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
    const queryClient = useQueryClient();
    
    // 리뷰 목록 상태
    const [reviews, setReviews] = useState([]);
    const [page, setPage] = useState(0);
    const [hasMore, setHasMore] = useState(true);
    const [isFetching, setIsFetching] = useState(false);
    
    // 필터 상태
    const [sortFilter, setSortFilter] = useState(sortOptions[0].value);
    const [roomFilter, setRoomFilter] = useState("객실 전체");
    
    // 무한 스크롤
    const [ref, inView] = useInView();

    // 1. 초기 데이터를 React Query로 캐싱
    // 캐시 키: `['stayRating', '숙소1']`
    // 저장 내용: 평점 4.5, 리뷰수 100개 등
    // 
    // 메모리 캐시:
    // {
    // 'stayRating-숙소1': { rating: 4.5, reviewCount: 100 },
    // 'roomFilters-숙소1': [{ roomId: 1, name: '디럭스' }, ...],
    // 'reviewImages-숙소1': ['img1.jpg', 'img2.jpg', ...]
    // }
    const { data: stayRating, isLoading: ratingLoading } = useQuery({
        queryKey: ['stayRating', stayId],
        queryFn: () => getStayRating(stayId),
        staleTime: 5 * 60 * 1000, // 5분간 신선한 데이터로 간주
        gcTime: 10 * 60 * 1000, // 10분간 캐시 유지
        enabled: !!stayId,
    });

    const { data: rooms = [], isLoading: roomsLoading } = useQuery({
        queryKey: ['roomFilters', stayId],
        queryFn: () => getRoomFilters(stayId),
        staleTime: 5 * 60 * 1000,
        gcTime: 10 * 60 * 1000,
        enabled: !!stayId,
    });

    const { data: reviewImages = [], isLoading: imagesLoading } = useQuery({
        queryKey: ['reviewImages', stayId],
        queryFn: () => getReviewImages(stayId),
        staleTime: 5 * 60 * 1000,
        gcTime: 10 * 60 * 1000,
        enabled: !!stayId,
    });

    const initialLoading = ratingLoading || roomsLoading || imagesLoading;
    
    // 선택된 객실 ID
    const selectedRoomId = rooms.find(room => room.roomName === roomFilter)?.roomId;

    // 2. 리뷰 데이터 가져오기 (수동 관리 + React Query의 캐싱 활용)
    const fetchReviews = async (currentPage, isReset = false) => {
        console.log(`[fetchReviews] 호출 - page: ${currentPage}, isReset: ${isReset}, isFetching: ${isFetching}`);
        
        if (isFetching) {
            console.log('[fetchReviews] 이미 요청 중 - 중단');
            return;
        }

        setIsFetching(true);

        try {
            console.log(`[API 요청] stayId: ${stayId}, roomId: ${selectedRoomId}, page: ${currentPage}, sortBy: ${sortFilter}`);
            
            // React Query 캐시를 먼저 확인
            const cachedData = queryClient.getQueryData([
                'reviews',
                stayId,
                selectedRoomId,
                currentPage,
                sortFilter,
            ]);

            let reviewList;
            
            if (cachedData) {
                console.log(`[캐시 히트] page ${currentPage} - 캐시에서 불러옴`);
                reviewList = cachedData.content || cachedData;
            } else {
                console.log(`[캐시 미스] page ${currentPage} - API 호출`);
                const reviewData = await getReviews(stayId, {
                    roomId: selectedRoomId,
                    page: currentPage,
                    size: 10,
                    sortBy: sortFilter,
                });
                
                // 캐시에 저장
                queryClient.setQueryData(
                    ['reviews', stayId, selectedRoomId, currentPage, sortFilter],
                    reviewData,
                    { cacheTime: 5 * 60 * 1000 } // 5분간 캐시
                );
                
                reviewList = reviewData.content || reviewData;
            }
            
            console.log(`[API 응답] page ${currentPage} - 받은 리뷰 수: ${reviewList.length}`);
            
            if (Array.isArray(reviewList)) {
                if (reviewList.length === 0) {
                    console.log('[상태 변경] 더 이상 데이터 없음 - hasMore: false');
                    setHasMore(false);
                } else {
                    const newHasMore = reviewList.length >= 10;
                    console.log(`[상태 변경] ${isReset ? '리뷰 교체' : '리뷰 추가'} - 다음 페이지: ${currentPage + 1}, hasMore: ${newHasMore}`);
                    
                    setReviews(prev => {
                        const result = isReset ? reviewList : [...prev, ...reviewList];
                        console.log(`[리뷰 목록] 총 ${result.length}개`);
                        return result;
                    });
                    setPage(currentPage + 1);
                    setHasMore(newHasMore);
                }
            }
        } catch (err) {
            console.error("[에러] 리뷰 로드 실패:", err);
            if (isReset) {
                setReviews([]);
            }
        } finally {
            setIsFetching(false);
            console.log('[fetchReviews] 완료');
        }
    };

    // 무한 스크롤 감지
    useEffect(() => {
        console.log(`[무한 스크롤] inView: ${inView}, hasMore: ${hasMore}, isFetching: ${isFetching}, page: ${page}`);
        
        if (inView && hasMore && !isFetching) {
            console.log(`[무한 스크롤] 조건 충족 - 페이지 ${page} 요청`);
            fetchReviews(page);
        }
    }, [inView, hasMore]);

    // 필터 변경 시 리뷰 목록 리셋
    useEffect(() => {
        if (stayId && rooms.length > 0) {
            console.log('[필터 변경] 감지 - 리뷰 리셋');
            console.log(`  - sortFilter: ${sortFilter}`);
            console.log(`  - roomFilter: ${roomFilter} (ID: ${selectedRoomId})`);
            
            setPage(0);
            setHasMore(true);
            setIsFetching(false);
            fetchReviews(0, true);
        }
    }, [stayId, sortFilter, selectedRoomId, rooms.length]);

    // 초기 로딩 화면
    if (initialLoading) {
        return (
            <div className="review-list-container">
                <ReviewHeader />
                <div className="container-fluid py-5">
                    <div className="spinner-container">
                        <div className="spinner-border" role="status" />
                    </div>
                </div>
            </div>
        );
    }

    return (
        <div className="review-list-container">
            <ReviewHeader />

            <div className="container-fluid py-5">
                {/* 평점 섹션 */}
                <div className="main-review-container">
                    <div className="container overall-rating-section">
                        <ReviewAvgRating stayRating={stayRating} />
                    </div>
                </div>

                {/* 리뷰 사진 */}
                <ReviewPhotoList images={reviewImages} />

                <div className="reviews-section">
                    {/* 필터 */}
                    <div className="rating-filters-section mb-3">
                        <div className="row g-3">
                            {/* 별점 필터 */}
                            <div className="col-md-2 filter-dropdown-container">
                                <div className="d-flex align-items-center">
                                    <span className="me-3 fw-bold small">별점:</span>
                                    <div className="dropdown">
                                        <button
                                            className="btn btn-outline-secondary btn-sm dropdown-toggle"
                                            type="button"
                                            data-bs-toggle="dropdown"
                                        >
                                            <span className="review-star-color me-2">★</span>
                                            {sortOptions.find(opt => opt.value === sortFilter)?.option}
                                        </button>
                                        <ul className="dropdown-menu dropdown-menu-lg">
                                            {sortOptions.map(opt => (
                                                <li key={opt.value}>
                                                    <button
                                                        className="dropdown-item"
                                                        onClick={() => {
                                                            console.log(`[정렬 변경] ${opt.option} (${opt.value})`);
                                                            setSortFilter(opt.value);
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
                                                    onClick={() => {
                                                        console.log('[객실 변경] 객실 전체');
                                                        setRoomFilter("객실 전체");
                                                    }}
                                                >
                                                    객실 전체
                                                </button>
                                            </li>
                                            {rooms.map(room => (
                                                <li key={room.roomId}>
                                                    <button
                                                        className="dropdown-item"
                                                        onClick={() => {
                                                            console.log(`[객실 변경] ${room.roomName} (ID: ${room.roomId})`);
                                                            setRoomFilter(room.roomName);
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
                        <div className="list-scroll-container">
                            {reviews.length > 0 && (
                                <>
                                    {reviews.map(review => (
                                        <ReviewCard key={review.reviewId} review={review} />
                                    ))}
                                    
                                    {hasMore && (
                                        <div 
                                            ref={ref} 
                                            className="scroll-trigger"
                                            style={{ 
                                                height: '50px', 
                                                margin: '20px 0',
                                                background: 'transparent' 
                                            }}
                                        />
                                    )}
                                </>
                            )}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default ReviewListPage;