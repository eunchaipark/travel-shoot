import React, { useEffect, useRef } from 'react';

const MyPageNav = ({ activeTab, setActiveTab }) => {
    const navContainerRef = useRef(null);

    useEffect(() => {
        const navContainer = navContainerRef.current;
        if (navContainer) {
            const handleWheel = (e) => {
                if (e.deltaY !== 0) {
                    e.preventDefault();
                    navContainer.scrollLeft += e.deltaY;
                }
            };
            navContainer.addEventListener('wheel', handleWheel);
            return () => navContainer.removeEventListener('wheel', handleWheel);
        }
    }, []);

    return (
        <div className="main-nav">
            <div className="container">
                <div ref={navContainerRef} className="nav-container d-flex justify-content-center">
                    <a
                        href="#"
                        className={`nav-item ${activeTab === 'member' ? 'active' : ''}`}
                        onClick={(e) => { e.preventDefault(); setActiveTab('member'); }}
                    >
                        회원 정보
                    </a>
                    <a
                        href="#"
                        className={`nav-item ${activeTab === 'reservation' ? 'active' : ''}`}
                        onClick={(e) => { e.preventDefault(); setActiveTab('reservation'); }}
                    >
                        예약 내역
                    </a>
                    <a
                        href="#"
                        className={`nav-item ${activeTab === 'review' ? 'active' : ''}`}
                        onClick={(e) => { e.preventDefault(); setActiveTab('review'); }}
                    >
                        이용 후기
                    </a>
                    {/*<a href="#" className="nav-item">찜한 숙소</a>*/}
                    {/*<a href="#" className="nav-item">사업자 번호</a>*/}
                </div>
            </div>
        </div>
    );
}

export default MyPageNav;