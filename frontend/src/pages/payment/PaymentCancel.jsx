import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

function PaymentCancel() {
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
            <h2>결제가 취소되었습니다</h2>
            <p>다시 시도하시려면 예약 페이지로 돌아가주세요.</p>
            <button
                className="btn btn-primary mt-3"
                onClick={() => navigate('/')}
            >
                홈으로 돌아가기
            </button>
        </div>
    );
}

export default PaymentCancel;