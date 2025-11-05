import { useEffect } from 'react';
import { useSearchParams } from 'react-router-dom';

function PaymentSuccess() {
    const [searchParams] = useSearchParams();

    useEffect(() => {
        const processPayment = () => {
            const pgToken = searchParams.get('pg_token');
            const isPopup = sessionStorage.getItem('isKakaoPayPopup') === 'true';
            if (isPopup) {
                // opener가 있으면 사용, 없으면 다른 방법
                if (window.opener && !window.opener.closed) {
                    window.opener.postMessage({
                        type: 'KAKAOPAY_SUCCESS',
                        pgToken: pgToken
                    }, window.location.origin);
                } else {
                    // ⭐ opener가 없어도 localStorage로 통신
                    localStorage.setItem('kakaoPayResult', JSON.stringify({
                        type: 'KAKAOPAY_SUCCESS',
                        pgToken: pgToken,
                        timestamp: Date.now()
                    }));
                }

                console.log('메시지 전송 완료');

                // 팝업 정보 삭제
                sessionStorage.removeItem('isKakaoPayPopup');

                // 팝업 닫기 시도
                window.close();

                // 닫히지 않으면 안내
                setTimeout(() => {
                    document.body.innerHTML = `
                    <div style="display: flex; justify-content: center; align-items: center; height: 100vh; flex-direction: column;">
                        <p style="font-size: 18px; margin-bottom: 20px;">✅ 결제가 완료되었습니다.</p>
                        <p style="font-size: 14px; color: #666; margin-bottom: 20px;">이 창을 닫아주세요.</p>
                        <button onclick="window.close()" style="padding: 10px 30px; font-size: 16px; cursor: pointer; border: 1px solid #3498db; border-radius: 5px; background: #3498db; color: white;">
                            창 닫기
                        </button>
                    </div>
                `;
                }, 100);

                return;
            }

            // 일반 접근
            console.log('잘못된 접근');
            alert('잘못된 접근입니다.');
            window.location.href = '/';
        };

        processPayment();
    }, [searchParams]);

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
        </div>
    );
}

export default PaymentSuccess;