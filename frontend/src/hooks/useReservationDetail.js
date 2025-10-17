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

    useEffect(() => {
        const loadData = async () => {
            if (!reservationId) {
                setError('예약 ID가 없습니다.');
                setLoading(false);
                return;
            }

            try {
                setLoading(true);
                setError(null);

                // 두 API를 병렬로 호출
                const [reservation, course] = await Promise.all([
                    fetchReservationDetail(reservationId),
                    fetchCourseData(reservationId)
                ]);

                setReservationData(reservation);
                setCourseData(course);
            } catch (err) {
                console.error('데이터 로딩 실패:', err);
                setError(err.message || '데이터를 불러오는데 실패했습니다.');
            } finally {
                setLoading(false);
            }
        };

        loadData();
    }, [reservationId]);

    return {
        reservationData,
        courseData,
        loading,
        error
    };
};