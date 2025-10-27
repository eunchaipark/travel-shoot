import { useState, useRef, useEffect } from 'react';
import { fetchReservationDetail } from '@/services/reservation/reservationDetailApiService';
import { fetchCourseData } from '@/services/reservation/courseApiService';

export const useReservationDetail = (reservationId) => {
    const [reservationData, setReservationData] = useState(null);
    const [courseData, setCourseData] = useState(null);
    const [loading, setLoading] = useState(true);
    const [courseLoading, setCourseLoading] = useState(true); // 코스 로딩 상태 추가
    const [isCourseGenerating, setIsCourseGenerating] = useState(false); // AI 생성 중 상태 추가
    const [error, setError] = useState(null);
    const pollingIntervalRef = useRef(null);

    const pollCourseData = async () => {
        const maxAttempts = 30;
        let attempts = 0;

        const poll = async () => {
            try {
                attempts++;
                const course = await fetchCourseData(reservationId);

                if (course) {
                    // 성공: 실제 데이터 설정
                    setCourseData(course);
                    setCourseLoading(false);
                    setIsCourseGenerating(false);
                    if (pollingIntervalRef.current) {
                        clearInterval(pollingIntervalRef.current);
                    }
                    return;
                } else {
                    // 실패(404 등): AI 생성 중
                    setIsCourseGenerating(true);
                    setCourseLoading(false);
                }

                if (attempts >= maxAttempts) {
                    setError('코스 생성 시간이 초과되었습니다.');
                    setCourseLoading(false);
                    setIsCourseGenerating(false);
                    if (pollingIntervalRef.current) {
                        clearInterval(pollingIntervalRef.current);
                    }
                    return;
                }
            } catch (err) {
                setError(err.message);
                setCourseLoading(false);
                setIsCourseGenerating(false);
                if (pollingIntervalRef.current) {
                    clearInterval(pollingIntervalRef.current);
                }
            }
        };

        await poll();

        if (isCourseGenerating || !courseData) {
            pollingIntervalRef.current = setInterval(poll, 10000);
        }
    };

    const fetchData = async () => {
        try {
            setLoading(true);
            const reservation = await fetchReservationDetail(reservationId);
            setReservationData(reservation);
            setLoading(false);

            await pollCourseData();
        } catch (err) {
            setError(err.message);
            setLoading(false);
        }
    };

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

        return () => {
            if (pollingIntervalRef.current) {
                clearInterval(pollingIntervalRef.current);
            }
        };
    }, [reservationId]);

    return {
        reservationData,
        courseData,
        loading,
        courseLoading,
        isCourseGenerating,
        error,
        refetchCourseData
    };
};