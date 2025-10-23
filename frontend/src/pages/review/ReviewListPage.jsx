import React, { useEffect, useState } from "react";
import ReviewCard from "@/components/review/ReviewCard";
import ReviewFilter from "@/components/review/ReviewFilter";
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
    const [reviews, setReviews] = useState([]);
    const [stayRating, setStayRating] = useState(null);
    const [rooms, setRooms] = useState([]);
    const [reviewImages, setReviewImages] = useState([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);

    const [sortFilter, setSortFilter] = useState(sortOptions[0].value);
    const selectedOption = sortOptions.find(opt => opt.value === sortFilter);

    const [roomFilter, setRoomFilter] = useState("객실 전체");
    const selectedRoomId = rooms.find(room => room.roomName === roomFilter)?.roomId;

    const fetchReviews = async () => {
        setLoading(true);
        setError(null);
        try {
            const reviewData = await getReviews(stayId, {
                roomId: selectedRoomId,
                page: 0,
                size: 100,
                sortBy: sortFilter,
            });

            // API 응답 구조
            const reviewList = reviewData.content || reviewData;
            setReviews(Array.isArray(reviewList) ? reviewList : []);
            
        } catch (err) {
            console.error("리뷰 로드 실패:", err);
            setError(err.message);
            setReviews([]);
        } finally {
            setLoading(false);
        }
    };

    // 숙박시설 평점 및 객실 목록 조회
    useEffect(() => {
        const fetchInitialData = async () => {
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
            // fetchReviews();
        }
    }, [stayId]);


    // 리뷰 목록 조회 (정렬 필터 변경시)
    useEffect(() => {
        if (stayId) {
            fetchReviews();
        }
    }, [stayId, sortFilter, selectedRoomId]);

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
                                                        onClick={() => setSortFilter(opt.value)}
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
                                                    onClick={() => setRoomFilter("객실 전체")}
                                                >
                                                    객실 전체
                                                </button>
                                            </li>
                                            {rooms.map(room => (
                                                <li key={room.roomId}>
                                                    <button
                                                        className="dropdown-item"
                                                        onClick={() => setRoomFilter(room.roomName)}
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
                        {loading && <div className="text-center">로딩 중...</div>}
                        {error && <div className="alert alert-danger">{error}</div>}
                        {!loading && reviews.length > 0 ? (
                            reviews.map(review => (
                                <ReviewCard review={review} />
                            ))
                        ) : (
                            !loading && <div>리뷰가 없습니다.</div>
                        )}
                    </div>
                </div>
            </div>
        </div>
    );
};

export default ReviewListPage;