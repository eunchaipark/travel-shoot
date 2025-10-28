import { useEffect } from 'react';
import { useSearchParams, useNavigate } from 'react-router-dom';
import { kakaoPayService } from '@/services/payment/kakaoPayService';
import reservationApiService from '@/services/reservation/reservationApiService';

function PaymentSuccess() {
    const [searchParams] = useSearchParams();
    const navigate = useNavigate();

    useEffect(() => {
        const processPayment = async () => {
            const pgToken = searchParams.get('pg_token');

            console.log('=== PaymentSuccess 시작 ===');
            console.log('pg_token:', pgToken);

            // pg_token이 없으면 아직 결제 전
            if (!pgToken) {
                console.log('pg_token 없음 - 결제 대기 중');
                return;
            }

            try {
                // 세션 데이터 가져오기
                const tid = sessionStorage.getItem('tid');
                const orderDataStr = sessionStorage.getItem('orderData');
                const reservationDataStr = sessionStorage.getItem('reservationData');

                console.log('세션 데이터 확인:', {
                    tid: !!tid,
                    orderData: !!orderDataStr,
                    reservationData: !!reservationDataStr
                });

                if (!tid || !orderDataStr || !reservationDataStr) {
                    console.error('세션 데이터 없음');
                    alert('결제 정보를 찾을 수 없습니다. 다시 시도해주세요.');
                    navigate('/');
                    return;
                }

                const orderData = JSON.parse(orderDataStr);
                const reservationData = JSON.parse(reservationDataStr);

                console.log('결제 승인 API 호출 시작');

                // 결제 승인
                const approveResult = await kakaoPayService.approve(
                    pgToken,
                    tid,
                    orderData.orderId,
                    orderData.userId
                );
                console.log('결제 승인 완료:', approveResult);

                // 예약 생성
                console.log('예약 생성 시작');
                const result = await reservationApiService.processReservation(reservationData);
                console.log('예약 생성 완료:', result.reservationId);

                // AI 코스 생성
                const totalNights = reservationData.totalNights ||
                    Math.ceil((new Date(reservationData.checkOutDate) - new Date(reservationData.checkInDate)) / (1000 * 60 * 60 * 24));

                console.log('AI 코스 생성 시작, totalNights:', totalNights);
                try {
                    await reservationApiService.generateAiCourse(result.reservationId, totalNights);
                    console.log('AI 코스 생성 완료');
                } catch (aiError) {
                    console.error('AI 코스 생성 실패 (무시):', aiError);
                }

                // 세션 정리
                sessionStorage.removeItem('tid');
                sessionStorage.removeItem('orderData');
                sessionStorage.removeItem('reservationData');
                console.log('세션 정리 완료');

                // 완료 페이지로 리다이렉트
                console.log('완료 페이지로 이동');
                navigate(`/payment-complete?reservationId=${result.reservationId}`, { replace: true });

            } catch (error) {
                console.error('결제 처리 실패:', error);
                alert('결제 처리 중 오류가 발생했습니다.');
                navigate('/');
            }
        };

        processPayment();
    }, [searchParams, navigate]);

    return (
        <div style={{
            display: 'flex',
            justifyContent: 'center',
            alignItems: 'center',
            height: '100vh',
            flexDirection: 'column',
            backgroundColor: '#f8f9fa'
        }}>
            <div style={{
                width: '50px',
                height: '50px',
                border: '5px solid #f3f3f3',
                borderTop: '5px solid #3498db',
                borderRadius: '50%',
                animation: 'spin 1s linear infinite'
            }}></div>
            <style>{`
        @keyframes spin {
          0% { transform: rotate(0deg); }
          100% { transform: rotate(360deg); }
        }
      `}</style>
            <p style={{
                marginTop: '20px',
                fontSize: '18px',
                fontWeight: '500',
                color: '#333'
            }}>
                결제를 처리하고 있습니다.
            </p>
            <p style={{
                marginTop: '10px',
                fontSize: '14px',
                color: '#666'
            }}>
                잠시만 기다려주세요
            </p>
        </div>
    );
}

export default PaymentSuccess;