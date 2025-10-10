import { useEffect } from 'react';
import Header from '@/components/layout/Header';
import { useMainCalendar } from '@/hooks/useMainCalendar';
import '@/assets/css/common.css';
import '@/assets/css/main-calendar.css';
import '@/assets/css/budget-friendly.css';
import '@/assets/css/recommend-stay.css';
import '@/assets/css/trending-section.css';
import '@/assets/css/travel-now.css';


function MainPage() {
    const {
        calendarRef,
        location,
        setLocation,
        adults,
        setAdults,
        children,
        setChildren,
        showLocationSuggestions,
        setShowLocationSuggestions,
        showDateDropdown,
        showGuestDropdown,
        dateDisplayText,
        guestDisplayText,
        miniCalendarHTML,
        handleMiniCalendarDateSelection,
        handleSearch,
        toggleDateDropdown,
        toggleGuestDropdown,
        hideAllDropdowns,
        setDateSelectionMode,
        setMiniCalendarYear,
        setMiniCalendarMonth
    } = useMainCalendar();

    // 미니 달력 이벤트 바인딩
    useEffect(() => {
        if (showDateDropdown) {
            const miniCalDays = document.querySelectorAll('.mini-calendar-day:not(.disabled):not(.other-month)');
            miniCalDays.forEach(day => {
                day.addEventListener('click', function(e) {
                    e.stopPropagation();
                    const dateStr = this.dataset.date;
                    handleMiniCalendarDateSelection(dateStr);
                });
            });

            const prevBtns = document.querySelectorAll('.mini-cal-prev');
            const nextBtns = document.querySelectorAll('.mini-cal-next');

            prevBtns.forEach(btn => {
                btn.addEventListener('click', function(e) {
                    e.stopPropagation();
                    let year = parseInt(this.dataset.year);
                    let month = parseInt(this.dataset.month) - 1;
                    if (month < 0) {
                        month = 11;
                        year--;
                    }
                    setMiniCalendarYear(year);
                    setMiniCalendarMonth(month);
                });
            });

            nextBtns.forEach(btn => {
                btn.addEventListener('click', function(e) {
                    e.stopPropagation();
                    let year = parseInt(this.dataset.year);
                    let month = parseInt(this.dataset.month) + 1;
                    if (month > 11) {
                        month = 0;
                        year++;
                    }
                    setMiniCalendarYear(year);
                    setMiniCalendarMonth(month);
                });
            });
        }
    }, [showDateDropdown, miniCalendarHTML, handleMiniCalendarDateSelection, setMiniCalendarYear, setMiniCalendarMonth]);

    // 외부 클릭시 드롭다운 닫기
    useEffect(() => {
        const handleClickOutside = (e) => {
            const clickedElement = e.target;
            
            const clickedLocationCard = clickedElement.closest('.search-card:has(.main-calendar-location-input)');
            const clickedLocationDropdown = clickedElement.closest('.dropdown-suggestions');
            
            const dateCard = clickedElement.closest('.search-card:has(.main-calendar-date-input)');
            const guestCard = clickedElement.closest('.search-card:has(.main-calendar-guest-input)');
            const dateDropdown = clickedElement.closest('.date-dropdown-container');
            const guestDropdown = clickedElement.closest('.guest-dropdown-container');
            const calendarEl = clickedElement.closest('#calendar');
            
            if (!clickedLocationCard && !clickedLocationDropdown) {
                setShowLocationSuggestions(false);
            }

            if (!dateCard && !guestCard && !dateDropdown && !guestDropdown && !calendarEl) {
                hideAllDropdowns();
                setDateSelectionMode(false);
            }
        };

        document.addEventListener('click', handleClickOutside);
        return () => document.removeEventListener('click', handleClickOutside);
    }, [hideAllDropdowns, setDateSelectionMode, setShowLocationSuggestions]);

    return (
        <>
            <Header />

            <main className="main-wrapper main-page">
                {/* 달력 섹션 */}
                <section className="calendar-section-wrapper">
                    <div className="container-xxl px-5">
                        <div className="calendar-search-container">
                            {/* 달력 카드 */}
                            <div className="calendar-card card shadow-lg border-0 rounded-4">
                                <div className="card-body">
                                    <div ref={calendarRef} id="calendar"></div>
                                </div>
                            </div>

                            {/* 검색 섹션 */}
                            <div className="search-section-container">
                                <div className="slogan">끊임없는 여행</div>
                                
                                {/* 지역 검색 */}
                                <div className="search-card position-relative">
                                    <div className="search-icon-box">
                                        <img src="/images/main-calendar-searchcard-location-icon.svg" alt="지역아이콘" />
                                    </div>
                                    <input 
                                        type="text" 
                                        className="search-input main-calendar-location-input" 
                                        placeholder="어디로 떠나시나요?"
                                        value={location}
                                        onChange={(e) => setLocation(e.target.value)}
                                        onFocus={() => setShowLocationSuggestions(true)}
                                    />
                                    
                                    {showLocationSuggestions && (
                                        <div className="dropdown-suggestions">
                                            <button className="suggestion-item" onClick={() => { setLocation('강릉'); setShowLocationSuggestions(false); }}>
                                                <i className="fas fa-building"></i>
                                                <div>
                                                    <div className="fw-bold">강릉</div>
                                                    <small className="text-muted">강원도 강릉시</small>
                                                </div>
                                            </button>
                                            <button className="suggestion-item" onClick={() => { setLocation('부산'); setShowLocationSuggestions(false); }}>
                                                <i className="fas fa-building"></i>
                                                <div>
                                                    <div className="fw-bold">부산</div>
                                                    <small className="text-muted">부산광역시</small>
                                                </div>
                                            </button>
                                            <button className="suggestion-item" onClick={() => { setLocation('제주'); setShowLocationSuggestions(false); }}>
                                                <i className="fas fa-building"></i>
                                                <div>
                                                    <div className="fw-bold">제주</div>
                                                    <small className="text-muted">제주특별자치도</small>
                                                </div>
                                            </button>
                                        </div>
                                    )}
                                </div>

                                {/* 날짜 선택 */}
                                <div className="search-card">
                                    <div className="search-icon-box">
                                        <img src="/images/main-calendar-searchcard-calendar-icon.svg" alt="달력 아이콘" />
                                    </div>
                                    <input 
                                        type="text" 
                                        className="search-input main-calendar-date-input" 
                                        value={dateDisplayText} 
                                        readOnly 
                                        style={{ cursor: 'pointer' }}
                                        onClick={toggleDateDropdown}
                                    />
                                </div>

                                {/* 날짜 드롭다운 */}
                                {showDateDropdown && (
                                    <div className="date-dropdown-container" style={{ maxHeight: '400px', opacity: 1 }}>
                                        <div style={{ padding: '15px' }}>
                                            <div 
                                                className="mini-calendar-container" 
                                                dangerouslySetInnerHTML={{ __html: miniCalendarHTML }}
                                            />
                                        </div>
                                    </div>
                                )}

                                {/* 인원 선택 */}
                                <div className="search-card position-relative">
                                    <div className="search-icon-box">
                                        <img src="/images/main-calendar-searchcard-user-icon.svg" alt="유저 아이콘" />
                                    </div>
                                    <input 
                                        type="text" 
                                        className="search-input main-calendar-guest-input" 
                                        value={guestDisplayText} 
                                        readOnly 
                                        style={{ cursor: 'pointer' }}
                                        onClick={toggleGuestDropdown}
                                    />
                                </div>

                                {/* 인원 선택 드롭다운 */}
                                {showGuestDropdown && (
                                    <div className="guest-dropdown-container" style={{ maxHeight: '160px', opacity: 1 }}>
                                        <div style={{ padding: '20px' }}>
                                            {/* 성인 */}
                                            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '20px' }}>
                                                <div>
                                                    <div style={{ fontWeight: 600, marginBottom: '4px' }}>성인</div>
                                                    <small style={{ color: '#6c757d' }}>18세 이상</small>
                                                </div>
                                                <div style={{ display: 'flex', alignItems: 'center', gap: '15px' }}>
                                                    <button 
                                                        type="button" 
                                                        className="counter-btn guest-btn guest-btn-minus"
                                                        onClick={() => adults > 1 && setAdults(adults - 1)}
                                                        disabled={adults <= 1}
                                                    >
                                                        -
                                                    </button>
                                                    <span className="guest-count">{adults}</span>
                                                    <button 
                                                        type="button" 
                                                        className="counter-btn guest-btn guest-btn-plus"
                                                        onClick={() => adults < 32 && setAdults(adults + 1)}
                                                        disabled={adults >= 32}
                                                    >
                                                        +
                                                    </button>
                                                </div>
                                            </div>
                                            
                                            {/* 어린이 */}
                                            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                                                <div>
                                                    <div style={{ fontWeight: 600, marginBottom: '4px' }}>어린이</div>
                                                    <small style={{ color: '#6c757d' }}>0-17세</small>
                                                </div>
                                                <div style={{ display: 'flex', alignItems: 'center', gap: '15px' }}>
                                                    <button 
                                                        type="button" 
                                                        className="counter-btn guest-btn guest-btn-minus"
                                                        onClick={() => children > 0 && setChildren(children - 1)}
                                                        disabled={children <= 0}
                                                    >
                                                        -
                                                    </button>
                                                    <span className="guest-count">{children}</span>
                                                    <button 
                                                        type="button" 
                                                        className="counter-btn guest-btn guest-btn-plus"
                                                        onClick={() => children < 4 && setChildren(children + 1)}
                                                        disabled={children >= 4}
                                                    >
                                                        +
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                )}

                                {/* 검색 버튼 */}
                                <button 
                                    type="button" 
                                    className="search-button main-calendar-search-button"
                                    onClick={handleSearch}
                                >
                                    <span>검색하기</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </section>
                
                {/* 추가 콘텐츠 섹션 */}
                <section className="additional-content-section">
                    <div className="container-xxl px-5">
                        {/* 숙소 추천 섹션 */}
                        <section className="recommend-stay-section">
                            <div className="recommend-stay-container">
                                <div className="section-header">
                                    <h2 className="section-title">
                                        <span className="username" id="recommendUsername">김여행</span>님 스타일의 숙소
                                    </h2>
                                    <p className="section-subtitle">
                                        <span className="location-name" id="recommendLocation">부산</span>을 좋아하시는 
                                        <span className="username-sub" id="recommendUsernameSub">○○○</span>님!
                                    </p>
                                </div>
                                
                                <div className="content-wrapper">
                                    <div className="accommodation-list-container">
                                        <div className="accommodation-list" id="accommodationList">
                                            {/* 숙소 아이템들이 JavaScript로 동적 생성됩니다 */}
                                        </div>
                                    </div>
                                    
                                    <div className="map-container">
                                        <div className="map-placeholder">
                                            <i className="fas fa-map-marker-alt map-icon"></i>
                                            <p className="map-text">카카오맵 영역</p>
                                            <small className="map-subtext">숙소 위치가 표시됩니다</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                        {/* 인기 급상승 섹션 */}
                        <section className="trending-section">
                            <div className="trending-container">
                                <div className="section-header">
                                    <h2 className="section-title">
                                        <span className="trending-highlight">인기 급상승</span>
                                    </h2>
                                    <p className="section-subtitle">(최근 7일 예약률 급상승)</p>
                                </div>
                                
                                <div className="tab-navigation">
                                    <button className="tab-button active" data-tab="stay">숙소</button>
                                    <button className="tab-button" data-tab="restaurants">맛집</button>
                                    <button className="tab-button" data-tab="attractions">관광지</button>
                                </div>
                                
                                <div className="content-wrapper">
                                    <button className="slider-nav slider-nav-prev">
                                        <i className="fas fa-chevron-left"></i>
                                    </button>
                                    <button className="slider-nav slider-nav-next">
                                        <i className="fas fa-chevron-right"></i>
                                    </button>
                                    
                                    <div className="slider-container">
                                        <div className="slider-wrapper" id="trendingSlider">
                                            <div className="tab-content" data-tab="stay">
                                                <div className="cards-grid" id="stayGrid"></div>
                                            </div>
                                            
                                            <div className="tab-content" data-tab="restaurants">
                                                <div className="cards-grid" id="restaurantsGrid"></div>
                                            </div>
                                            
                                            <div className="tab-content" data-tab="attractions">
                                                <div className="cards-grid" id="attractionsGrid"></div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div className="slider-indicators" id="trendingIndicators" style={{ display: 'none' }}></div>
                                </div>
                            </div>
                        </section>

                        {/* 가격착한 숙소 섹션 */}
                        <section className="budget-friendly-section">
                            <div className="budget-friendly-container">
                                <div className="section-header">
                                    <h2 className="section-title">
                                        <span className="budget-highlight">가격착한 숙소</span>
                                    </h2>
                                    <p className="section-subtitle">평균가 대비 (1박당 숙박)</p>
                                </div>
                                
                                <div className="content-wrapper">
                                    <div className="budget-grid" id="budgetGrid"></div>
                                    <div className="slider-indicators" id="budgetIndicators" style={{ display: 'none' }}></div>
                                </div>
                            </div>
                        </section>
                        
                        {/* 지금 떠나기 좋은 곳 섹션 */}
                        <section className="travel-now-section">
                            <div className="travel-now-container">
                                <div className="section-header">
                                    <h2 className="section-title">
                                        <span className="travel-now-highlight">지금 떠나기 좋은 곳</span>
                                    </h2>
                                </div>
                                
                                <div className="content-wrapper">
                                    <button className="slider-nav slider-nav-prev" id="travelNowPrevBtn">
                                        <i className="fas fa-chevron-left"></i>
                                    </button>
                                    <button className="slider-nav slider-nav-next" id="travelNowNextBtn">
                                        <i className="fas fa-chevron-right"></i>
                                    </button>
                                    
                                    <div className="slider-container">
                                        <div className="slider-wrapper" id="travelNowSliderWrapper"></div>
                                    </div>
                                </div>
                                
                                <div className="slider-indicators" id="travelNowIndicators"></div>
                            </div>
                        </section>
                    </div>
                </section>
            </main>
        </>
    );
}

export default MainPage;