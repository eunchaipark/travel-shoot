import { useState, useEffect } from 'react';
import { getReservations, getReviews, cancelReservation } from '@/services/mypage/reservationService';

function useReservation() {
    const [reservations, setReservations] = useState([]);
    const [reviews, setReviews] = useState([]);
    const [loading, setLoading] = useState(true);
    const [isSubmitting, setIsSubmitting] = useState(false);

    useEffect(() => {
        fetchData();
    }, []);

    const fetchData = async () => {
        try {
            const reservationData = await getReservations();
            const reviewData = await getReviews();
            setReservations(reservationData);
            setReviews(reviewData);
        } catch (error) {
            console.error('데이터 로드 실패:', error);
        } finally {
            setLoading(false);
        }
    };

    // 예약 목록 새로고침 함수
    const refreshReservations = () => {
        fetchData();
    };

    // 예약 취소 함수
    const handleCancelReservation = async (reservationId, cancelReason, cancelDetail) => {
        if (!cancelReason.trim()) {
            alert('취소 사유를 입력해주세요.');
            return false;
        }

        if (!reservationId) {
            alert('예약 정보가 없습니다.');
            return false;
        }

        setIsSubmitting(true);

        try {
            await cancelReservation(reservationId, cancelReason, cancelDetail);
            alert('예약이 취소되었습니다.');

            // 예약 목록 새로고침
            await fetchData();

            return true;
        } catch (error) {
            console.error('예약 취소 실패:', error);
            alert('예약 취소에 실패했습니다. 다시 시도해주세요.');
            return false;
        } finally {
            setIsSubmitting(false);
        }
    }

    return {
        reservations,
        reviews,
        loading,
        isSubmitting,
        refreshReservations,
        handleCancelReservation
    };
}

export default useReservation;