import React, { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import CompleteHeader from '@/components/layout/CompleteHeader';
import '@/assets/css/common.css';

function PaymentCompletePage() {
    const navigate = useNavigate();

    const queryParams = new URLSearchParams(window.location.search);
    const reservationId = queryParams.get("reservationId");

    // 뒤로가기 방지 추가
    useEffect(() => {
        const preventGoBack = () => {
            window.history.pushState(null, '', window.location.href);
        };

        preventGoBack();
        window.addEventListener('popstate', preventGoBack);

        return () => {
            window.removeEventListener('popstate', preventGoBack);
        };
    }, []);

    return(
        <>
            <CompleteHeader />
            <main>
                <div className="complete-page">
                    <div className="complete-card">
                        <div className="complete-text">
                            <div className="complete-title">숙소예약이 완료되었습니다.</div>
                            <div className="complete-subtitle">
                                Travel Shoot에서 끊김 없는 여행을 경험해보세요.
                            </div>
                        </div>

                        <div className="complete-page-btn">
                            <button className="btn1" onClick={() => navigate(`/reservation/detail?reservationId=${reservationId}`)}>
                                예약 상세 조회
                            </button>
                            <button className="btn2" onClick={() => navigate("/")}>홈으로</button>
                        </div>
                    </div>
                </div>
            </main>
        </>
    );
};
export default PaymentCompletePage;