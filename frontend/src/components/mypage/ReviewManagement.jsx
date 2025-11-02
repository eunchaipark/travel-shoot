import React from 'react';
import useReservation from '@/hooks/mypage/useReservation';
import {formatDate, formatDateWithDay, formatTime} from "@/utils/formatters/dateFormatter.js";
import { useNavigate } from "react-router-dom";
import {navigateToStayDetail} from "@/utils/stay/stayNavigationUtil";
import useSearchParamsSync from '@/hooks/search/useSearchParamsSync';
import {useDefaultStayParams} from '@/hooks/search/useDefaultStayParams';

const ReviewManagement = () => {
    const { reviews } = useReservation();
    const navigate = useNavigate();
    const {getDefaultDates, getDefaultGuests} = useDefaultStayParams(); //1024
    const {setDefaultParams} = useSearchParamsSync();

    return (
        <div className="profile-form">
            <h2 className="form-title">이용 후기</h2>

            <div className="booking-list">
                {reviews.length === 0 ? (
                    <div className="text-center py-5">예약 내역이 없습니다.</div>
                ) : (
                reviews.map((review, index) => (
                    <div key={index} className="booking-item">
                        <div className="booking-header">
                            <div className="booking-date">{formatDate(review?.createdAt)}</div>
                            <div className="write-date">{formatDate(review?.reviewCreatedAt)} 작성</div>
                        </div>

                        <div className="justify-content-between d-flex">
                            <div className="booking-number">
                                숙소 예약번호 {review.reservationCode}
                            </div>
                        </div>

                        <div className="booking-content">
                            <img
                                src={review.mainImageUrl}
                                alt={review.stayName}
                                className="lodging-image"
                                onClick={() => {
                                    navigateToStayDetail({
                                        stayId: review.stayId,
                                        stayName: review.stayName,
                                        navigate,
                                        setDefaultParams,
                                        getDefaultDates,
                                        getDefaultGuests
                                    });
                                }}
                            />
                            <div className="booking-info">
                                <div className="lodging-name"
                                     onClick={() => {
                                         navigateToStayDetail({
                                             stayId: review.stayId,
                                             stayName: review.stayName,
                                             navigate,
                                             setDefaultParams,
                                             getDefaultDates,
                                             getDefaultGuests
                                         });
                                     }}>{review.stayName}</div>
                                <div className="booking-dates mb-1">
                                    {formatDateWithDay(review.checkInDate)} ~ {formatDateWithDay(review.checkOutDate)} | {review.totalNights}박
                                </div>
                                <div className="booking-dates">
                                    체크인 {formatTime(review.checkInTime)} | 체크아웃 {formatTime(review.checkOutTime)}
                                </div>
                            </div>
                        </div>

                        <div className="booking-actions">
                            <button className="btn-cancel" onClick={() => navigate(`/reviews/reservations/${review?.reservationId}`)}>자세히 보기</button>
                        </div>
                    </div>
                )))}
            </div>
        </div>
    );
}

export default ReviewManagement;