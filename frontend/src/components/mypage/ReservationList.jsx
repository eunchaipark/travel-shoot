import React, { useState } from 'react';
import useReservation from '@/hooks/mypage/useReservation';
import {formatDate, formatDateWithDay, formatTime} from "@/utils/formatters/dateFormatter.js";
import { useNavigate } from 'react-router-dom';
import CancelModal from '@/components/modals/CancelModal';

const ReservationList = () => {
    const { reservations, loading, isSubmitting, handleCancelReservation } = useReservation();
    const navigate = useNavigate();
    const [showCancelModal, setShowCancelModal] = useState(false);
    const [selectedReservation, setSelectedReservation] = useState(null);
    const [cancelReason, setCancelReason] = useState('');
    const [cancelDetail, setCancelDetail] = useState('');

    const handleCancelClick = (reservation) => {
        setSelectedReservation(reservation);
        setShowCancelModal(true);
    };

    const handleCancelSubmit = async () => {
        const success = await handleCancelReservation(
            selectedReservation?.reservationId,
            cancelReason,
            cancelDetail
        );

        if (success) {
            handleModalClose();
        }
    };

    const handleModalClose = () => {
        setShowCancelModal(false);
        setCancelReason('');
        setCancelDetail('');
        setSelectedReservation(null);
    };

    const getStatusClass = (status) => {
        const statusMap = {
            '이용완료': 'completed',
            '이용예정': 'upcoming',
            '예약취소': 'cancelled',
            '예약확정': 'confirmed'
        };
        return statusMap[status] || '';
    };

    return (
        <>
            <div className="profile-form">
                <h2 className="form-title">예약 내역</h2>

                <div className="booking-list">
                    {reservations.length === 0 ? (
                        <div className="text-center py-5">예약 내역이 없습니다.</div>
                    ) : (
                        reservations.map((reservation, index) => (
                            <div key={index} className="booking-item">
                                <div className="booking-header">
                                    <div className="booking-date"> {formatDate(reservation?.createdAt)}</div>
                                    <a className="booking-details-link" onClick={() => navigate(`/reservation/detail?reservationId=${reservation?.reservationId}`)}>예약 상세조회</a>
                                </div>

                                <div className="justify-content-between d-flex">
                                    <div className="booking-number">
                                        숙소 예약번호 {reservation.reservationCode}
                                    </div>
                                    <div className={`booking-status ${getStatusClass(reservation.reservationStatus)}`}>
                                        {reservation.reservationStatus}
                                    </div>
                                </div>

                                <div className="booking-content">
                                    <img
                                        src={reservation.mainImageUrl}
                                        alt={reservation.stayName}
                                        className="lodging-image"
                                    />
                                    <div className="booking-info">
                                        <div className="lodging-name">{reservation.stayName}</div>
                                        <div className="booking-dates mb-1">
                                            {formatDateWithDay(reservation.checkInDate)} ~ {formatDateWithDay(reservation.checkOutDate)} | {reservation.totalNights}박
                                        </div>
                                        <div className="booking-dates">
                                            체크인 {formatTime(reservation.checkInTime)} | 체크아웃 {formatTime(reservation.checkOutTime)}
                                        </div>
                                    </div>
                                </div>

                                <div className="booking-actions">
                                    {reservation?.reservationStatus === '예약확정' && (
                                        <button
                                            className="btn-cancel"
                                            onClick={() => handleCancelClick(reservation)}
                                        >
                                            예약 취소
                                        </button>
                                    )}
                                    {reservation?.reviewId === null && reservation?.reservationStatus === '이용완료' && (
                                        <button className="btn-review" onClick={() => navigate(`/reviews/reservations/${reservation?.reservationId}`)}>후기 작성하기</button>
                                    )}
                                    {reservation?.reviewId && (
                                        <button className="btn-review" style={{cursor:"default"}}>후기 작성 완료</button>
                                    )}
                                </div>
                            </div>
                        )))}
                </div>
            </div>

            <CancelModal
                show={showCancelModal}
                reservation={selectedReservation}
                cancelReason={cancelReason}
                setCancelReason={setCancelReason}
                cancelDetail={cancelDetail}
                setCancelDetail={setCancelDetail}
                onSubmit={handleCancelSubmit}
                onClose={handleModalClose}
                isSubmitting={isSubmitting}
            />
        </>
    );
}

export default ReservationList;