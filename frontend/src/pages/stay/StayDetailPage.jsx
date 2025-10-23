import React from "react";
import { useNavigate } from 'react-router-dom';
import '@/assets/css/common.css';
import Header from '@/components/layout/Header';

function StayDetailPage() {
    const navigate = useNavigate();

    // 테스트용 예약하기
    const handleReservation = () => {
        navigate('/reservation/payment?roomId=22&checkInDate=2025-11-21&checkOutDate=2025-11-23&guestCount=2');
    };

    return (
        <>
            <Header />
            <div className="container text-center" style={{ paddingTop: '100px' }}>
                <h2>숙소 상세 페이지</h2>
                <button
                    className="btn btn-primary mt-4"
                    onClick={handleReservation}
                    style={{
                        backgroundColor: '#FF6B6B',
                        border: 'none',
                        padding: '12px 40px',
                        fontSize: '16px'
                    }}
                >
                    예약하기 (테스트)
                </button>
            </div>
        </>
    );
}

export default StayDetailPage;