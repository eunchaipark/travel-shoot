import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

function PaymentFail() {
    const navigate = useNavigate();

    useEffect(() => {
        // 세션 정리
        sessionStorage.removeItem('tid');
        sessionStorage.removeItem('orderData');
        sessionStorage.removeItem('reservationData');
    }, []);

    return (
        <div style={{
            display: 'flex',
            justifyContent: 'center',
            alignItems: 'center',
            height: '100vh',
            flexDirection: 'column'
        }}>
            <h2>결제에 실패했습니다</h2>
            <p>결제 처리 중 오류가 발생했습니다. 다시 시도해주세요.</p>
            <button
                className="btn btn-primary mt-3"
                onClick={() => navigate('/')}
            >
                홈으로 돌아가기
            </button>
        </div>
    );
}

export default PaymentFail;