import React, { useState, useEffect } from "react";
import { useSearchParams } from 'react-router-dom';
import '@/assets/css/common.css';
import '@/assets/css/mypage.css';
import SimpleHeader from '@/components/layout/SimpleHeader';
import MyPageNav from '@/components/mypage/MyPageNav';
import MemberInfo from '@/components/mypage/MemberInfo';
import PasswordChange from '@/components/mypage/PasswordChange';
import ReservationList from '@/components/mypage/ReservationList';
import ReviewManagement from '@/components/mypage/ReviewManagement';

function MyPage() {
    const [searchParams, setSearchParams] = useSearchParams();
    const [activeTab, setActiveTab] = useState('member');
    const [activeSidebar, setActiveSidebar] = useState('info');

    // URL에서 초기 activeTab 설정
    useEffect(() => {
        const typeParam = searchParams.get('type');
        if (typeParam && ['member', 'reservation', 'review'].includes(typeParam)) {
            setActiveTab(typeParam);
        }
    }, [searchParams]);

    // activeTab이 변경될 때 URL 업데이트
    const handleTabChange = (tab) => {
        setActiveTab(tab);
        setSearchParams({ type: tab });
    };

    const renderContent = () => {
        if (activeTab === 'member') {
            return activeSidebar === 'info' ? <MemberInfo /> : <PasswordChange />;
        } else if (activeTab === 'reservation') {
            return <ReservationList />;
        } else if (activeTab === 'review') {
            return <ReviewManagement />;
        }
        return null;
    };

    return (
        <>
            <SimpleHeader />
            <main className="content-area mypage">
                <div className="container">
                    <MyPageNav activeTab={activeTab} setActiveTab={handleTabChange} />

                    <div className="main-content">
                        <div className="content-wrapper">
                            {/* Sidebar */}
                            {activeTab === 'member' && (
                                <div className="sidebar">
                                    <div className="profile-section">
                                        <div
                                            className={`profile-title ${activeSidebar === 'info' ? 'active' : ''}`}
                                            onClick={() => setActiveSidebar('info')}
                                        >
                                            내 정보
                                        </div>
                                        <div
                                            className={`profile-title ${activeSidebar === 'password' ? 'active' : ''}`}
                                            onClick={() => setActiveSidebar('password')}
                                        >
                                            비밀번호 변경
                                        </div>
                                    </div>
                                </div>
                            )}

                            {(activeTab === 'reservation' || activeTab === 'review') && (
                                <div className="sidebar">
                                    <div className="profile-section">
                                        <div className="profile-title active">
                                            {activeTab === 'reservation' ? '예약 내역' : '이용 후기'}
                                        </div>
                                    </div>
                                </div>
                            )}

                            {renderContent()}
                        </div>
                    </div>
                </div>
            </main>
        </>
    );
}

export default MyPage;