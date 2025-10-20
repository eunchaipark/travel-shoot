import { useState, useEffect, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '@/components/context/AuthContext';
import reservationApiService from '@/services/reservation/reservationApiService';
import reservationValidationService from '@/services/reservation/reservationValidationService';

//예약 메인 로직 훅
export const useReservation = (roomId, checkInDate, checkOutDate, guestCount, skipAuthCheck = false) => {
    const navigate = useNavigate();
    const { openLoginModal } = useAuth(); //AuthContext에서 openLoginModal 가져오기

    const [initData, setInitData] = useState(null);
    const [priceData, setPriceData] = useState(null);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);

    const hasCheckedAuth = useRef(false);
    const hasLoadedData = useRef(false);

    //로그인 체크 및 초기 데이터 로드
    useEffect(() => {
        // 이미 체크했으면 스킵
        if (hasCheckedAuth.current) {
            return;
        }

        // 로그인 체크
        hasCheckedAuth.current = true;

        // skipAuthCheck가 false일 때만 로그인 체크
        if (!skipAuthCheck) {
            const isAuthenticated = reservationValidationService.checkAuthentication();

            if (!isAuthenticated) {
                const currentUrl = window.location.pathname + window.location.search;
                sessionStorage.setItem('redirectUrl', currentUrl);
                openLoginModal();
                return;
            }
        }

        //데이터 로드도 한 번만
        if (hasLoadedData.current) {
            return;
        }

        // 초기 데이터 로드
        const loadData = async () => {
            if (hasLoadedData.current) return; //중복 실행 방지
            hasLoadedData.current = true;

            try {
                setLoading(true);
                setError(null);

                const { initData, priceData } = await reservationApiService.initializeReservation(
                    roomId,
                    checkInDate,
                    checkOutDate,
                    guestCount
                );

                setInitData(initData);
                setPriceData(priceData);
            } catch (err) {
                setError(err.message || '데이터를 불러오는데 실패했습니다.');
                console.error(err);
            } finally {
                setLoading(false);
            }
        };

        loadData();
    }, [roomId, checkInDate, checkOutDate, guestCount, openLoginModal, skipAuthCheck]);

    //예약 생성
    const createReservation = async (formData) => {
        try {
            // 로그인 재확인
            if (!reservationValidationService.checkAuthentication()) {

                //현재 URL 저장
                const currentUrl = window.location.pathname + window.location.search;
                sessionStorage.setItem('redirectUrl', currentUrl);

                //로그인 모달 열기
                openLoginModal();

                return;
            }

            // 유효성 검사
            reservationValidationService.validateReservationForm(formData);

            setLoading(true);

            // 예약 데이터 생성
            const reservationData = {
                roomId,
                checkInDate,
                checkOutDate,
                guestCount,
                totalPrice: priceData?.totalPrice || 0,
                ...formData,
            };

            // 예약 처리
            const result = await reservationApiService.processReservation(reservationData);

            alert('예약이 완료되었습니다!');
            navigate(`/reservation/complete/${result.reservationId}`);
        } catch (err) {
            alert(err.message || '예약에 실패했습니다.');
            console.error(err);
        } finally {
            setLoading(false);
        }
    };

    return {
        initData,
        priceData,
        loading,
        error,
        createReservation,
    };
};