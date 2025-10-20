/**
 * 예약 상세 페이지에 필요한 모든 데이터를 관리하는 커스텀 훅
 * @param {string|number} reservationId - 예약 ID
 * @returns {Object} 예약 데이터, 코스 데이터, 로딩 상태, 에러
 */
import { useState, useEffect } from 'react';
import { fetchReservationDetail } from '@/services/reservation/reservationApiService';
import { fetchCourseData } from '@/services/reservation/courseApiService';
export const useReservationDetail = (reservationId) => {
    const [reservationData, setReservationData] = useState(null);
    const [courseData, setCourseData] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    const fetchData = async () => {
        try {
            setLoading(true);
            const [reservation, course] = await Promise.all([
                fetchReservationDetail(reservationId),
                fetchCourseData(reservationId)
            ]);
            setReservationData(reservation);
            setCourseData(course);
        } catch (err) {
            setError(err.message);
        } finally {
            setLoading(false);
        }
    };

    // 코스 데이터만 다시 로드하는 함수
    const refetchCourseData = async () => {
        try {
            const course = await fetchCourseData(reservationId);
            setCourseData(course);
        } catch (err) {
            setError(err.message);
        }
    };

    useEffect(() => {
        if (reservationId) {
            fetchData();
        }
    }, [reservationId]);

    return {
        reservationData,
        courseData,
        loading,
        error,
        refetchCourseData
    };
};