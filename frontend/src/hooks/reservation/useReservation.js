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

    const createReservation = async (formData, setIsPaymentLoading) => {
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
                console.log('카카오페이 결제 시작 (팝업)');

                const orderData = {
                    orderId: `ORDER_${Date.now()}`,
                    userId: 'user123',
                    itemName: initData?.stayName || '숙박 예약',
                    quantity: 1,
                    totalAmount: Math.round(priceData?.totalPrice || 0),
                };

                const kakaoPayResponse = await kakaoPayService.ready(orderData);

                // 세션 저장
                sessionStorage.setItem('tid', kakaoPayResponse.tid);
                sessionStorage.setItem('orderData', JSON.stringify(orderData));
                sessionStorage.setItem('reservationData', JSON.stringify(reservationData));
                sessionStorage.setItem('isKakaoPayPopup', 'true');

                // 팝업 설정
                const popupConfig = {
                    width: 500,
                    height: 700,
                    left: (window.screen.width - 500) / 2,
                    top: (window.screen.height - 700) / 2
                };

                // 팝업 열기
                const popup = window.open(
                    kakaoPayResponse.next_redirect_pc_url,
                    'kakaopay',
                    `width=${popupConfig.width},height=${popupConfig.height},left=${popupConfig.left},top=${popupConfig.top},scrollbars=yes,resizable=yes`
                );

                // 팝업 차단 확인
                if (!popup || popup.closed || typeof popup.closed === 'undefined') {
                    alert('팝업이 차단되었습니다. 팝업 차단을 해제해주세요.');
                    setIsPaymentLoading(false);
                    setLoading(false);
                    return;
                }

                // 상태 관리
                let isHandled = false;

                // 정리 함수
                const cleanup = () => {
                    if (isHandled) return;
                    isHandled = true;
                    window.removeEventListener('message', handleMessage);
                    window.removeEventListener('storage', handleStorageChange);
                    window.removeEventListener('focus', checkPopupOnFocus);
                };

                // 결제 완료 처리 공통 로직
                const processPaymentSuccess = async (pgToken) => {
                    cleanup();

                    try {
                        // 세션 데이터 가져오기
                        const tid = sessionStorage.getItem('tid');
                        const orderData = JSON.parse(sessionStorage.getItem('orderData'));
                        const reservationData = JSON.parse(sessionStorage.getItem('reservationData'));

                        // 카카오페이 승인
                        const approveResult = await kakaoPayService.approve(
                            pgToken,
                            tid,
                            orderData.orderId,
                            orderData.userId
                        );
                        console.log('결제 승인 완료:', approveResult);

                        // 예약 생성
                        const result = await reservationApiService.processReservation(reservationData);
                        console.log('예약 생성 완료:', result.reservationId);

                        // AI 코스 생성 (비동기, 실패해도 무시)
                        const totalNights = Math.ceil(
                            (new Date(reservationData.checkOutDate) - new Date(reservationData.checkInDate)) / (1000 * 60 * 60 * 24)
                        );
                        reservationApiService.generateAiCourse(result.reservationId, totalNights);

                        // 세션 정리
                        sessionStorage.removeItem('tid');
                        sessionStorage.removeItem('orderData');
                        sessionStorage.removeItem('reservationData');
                        sessionStorage.removeItem('isKakaoPayPopup');
                        localStorage.removeItem('kakaoPayResult');

                        // 완료 페이지로 이동
                        navigate(`/payment-complete?reservationId=${result.reservationId}`, { replace: true });

                    } catch (error) {
                        console.error('결제 처리 실패:', error);
                        setIsPaymentLoading(false);
                        setLoading(false);
                        alert('결제 승인에 실패했습니다.');
                        localStorage.removeItem('kakaoPayResult');
                    }
                };

                // 결제 취소 처리 공통 로직
                const processPaymentCancel = () => {
                    cleanup();
                    setIsPaymentLoading(false);
                    setLoading(false);
                    alert('결제가 취소되었습니다.');
                    localStorage.removeItem('kakaoPayResult');
                };

                // postMessage 리스너
                const handleMessage = async (event) => {
                    if (event.origin !== window.location.origin) return;

                    if (event.data.type === 'KAKAOPAY_SUCCESS') {
                        await processPaymentSuccess(event.data.pgToken);
                    } else if (event.data.type === 'KAKAOPAY_FAIL' || event.data.type === 'KAKAOPAY_CANCEL') {
                        processPaymentCancel();
                    }
                };

                // localStorage 리스너 (window.opener 끊김 대비)
                const handleStorageChange = async (e) => {
                    if (e.key !== 'kakaoPayResult' || !e.newValue) return;

                    const result = JSON.parse(e.newValue);

                    if (result.type === 'KAKAOPAY_SUCCESS') {
                        await processPaymentSuccess(result.pgToken);
                    } else if (result.type === 'KAKAOPAY_FAIL' || result.type === 'KAKAOPAY_CANCEL') {
                        processPaymentCancel();
                    }
                };

                // focus 리스너 (팝업 수동 닫기 대비)
                const checkPopupOnFocus = () => {
                    if (isHandled) return;

                    setTimeout(() => {
                        if (isHandled) return;

                        const userConfirm = confirm(
                            '결제를 취소하셨나요?\n\n' +
                            '• 확인: 결제 취소 및 화면으로 돌아가기\n' +
                            '• 취소: 결제 계속 진행하기'
                        );

                        if (userConfirm) {
                            processPaymentCancel();
                        }
                    }, 500);
                };

                // 이벤트 리스너 등록
                window.addEventListener('message', handleMessage);
                window.addEventListener('storage', handleStorageChange);
                window.addEventListener('focus', checkPopupOnFocus);

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