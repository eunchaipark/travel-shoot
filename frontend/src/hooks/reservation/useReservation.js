import { useState, useEffect, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '@/components/context/AuthContext';
import reservationApiService from '@/services/reservation/reservationApiService';
import reservationValidationService from '@/services/reservation/reservationValidationService';
import { kakaoPayService } from '@/services/payment/kakaoPayService';

//예약 메인 로직 훅
export const useReservation = (roomId, checkInDate, checkOutDate, guestCount, skipAuthCheck = false) => {
    const navigate = useNavigate();
    const { openLoginModal, isAuthenticated } = useAuth();

    const [initData, setInitData] = useState(null);
    const [priceData, setPriceData] = useState(null);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);

    const hasCheckedAuth = useRef(false);
    const hasLoadedData = useRef(false);

    //로그인 체크 및 초기 데이터 로드
    useEffect(() => {
        if (hasCheckedAuth.current) {
            return;
        }

        hasCheckedAuth.current = true;

        if (!skipAuthCheck) {
            const isAuthenticated = reservationValidationService.checkAuthentication();

            if (!isAuthenticated) {
                const currentUrl = window.location.pathname + window.location.search;
                sessionStorage.setItem('redirectUrl', currentUrl);
                openLoginModal();
                return;
            }
        }

        if (hasLoadedData.current) {
            return;
        }

        const loadData = async () => {
            if (hasLoadedData.current) return;
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

    const createReservation = async (formData) => {
        try {
            // 로그인 재확인
            if (!isAuthenticated) {
                const currentUrl = window.location.pathname + window.location.search;
                sessionStorage.setItem('redirectUrl', currentUrl);
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

            // 1. 카카오페이 선택 시
            if (formData.paymentMethod === '카카오페이') {
                console.log('카카오페이 결제 시작 (리다이렉트)');

                const orderData = {
                    orderId: `ORDER_${Date.now()}`,
                    userId: 'user123',
                    itemName: initData?.stayName || '숙박 예약',
                    quantity: 1,
                    totalAmount: Math.round(priceData?.totalPrice || 0),
                };

                const kakaoPayResponse = await kakaoPayService.ready(orderData);

                // 세션에 예약 데이터 저장
                sessionStorage.setItem('tid', kakaoPayResponse.tid);
                sessionStorage.setItem('orderData', JSON.stringify(orderData));
                sessionStorage.setItem('reservationData', JSON.stringify(reservationData));

                // 리다이렉트 (팝업 아님!)
                console.log('카카오페이 페이지로 리다이렉트');
                window.location.href = kakaoPayResponse.next_redirect_pc_url;

                // 리다이렉트되므로 여기서는 return
                return;
            }
            // 2. 그 외 결제 방법
            else {
                console.log('가라 결제 처리:', formData.paymentMethod);

                await new Promise(resolve => setTimeout(resolve, 2000));

                const result = await reservationApiService.processReservation(reservationData);

                console.log(result.reservationId);

                // AI 코스 생성
                reservationApiService.generateAiCourse(result.reservationId, priceData?.totalNights);

                return {
                    success: true,
                    reservationId: result.reservationId
                };
            }

        } catch (err) {
            alert(err.message || '결제 준비에 실패했습니다.');
            console.error(err);
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