import React, {useState, useRef, useEffect} from 'react';

const Header = () => {
    const [searchValue, setSearchValue] = useState('SL 호텔 강릉');
    const [showSuggestions, setShowSuggestions] = useState(false);
    const [showCalendarDropdown, setShowCalendarDropdown] = useState(false);
    const [showGuestDropdown, setShowGuestDropdown] = useState(false);
    const [adultCount, setAdultCount] = useState(2);
    const [childCount, setChildCount] = useState(0);

    const searchInputRef = useRef(null);
    const suggestionsRef = useRef(null);
    const calendarRef = useRef(null);
    const guestRef = useRef(null);

    // 외부 클릭 감지
    useEffect(() => {
        const handleClickOutside = (event) => {
            if (searchInputRef.current && !searchInputRef.current.contains(event.target) &&
                suggestionsRef.current && !suggestionsRef.current.contains(event.target)) {
                setShowSuggestions(false);
            }

            if (calendarRef.current && !calendarRef.current.contains(event.target)) {
                setShowCalendarDropdown(false);
            }

            if (guestRef.current && !guestRef.current.contains(event.target)) {
                setShowGuestDropdown(false);
            }
        };

        document.addEventListener('mousedown', handleClickOutside);
        return () => {
            document.removeEventListener('mousedown', handleClickOutside);
        };
    }, []);

    const handleSearchFocus = () => {
        setShowSuggestions(true);
    };

    const handleDateClick = (e) => {
        e.stopPropagation();
        setShowCalendarDropdown(!showCalendarDropdown);
        setShowGuestDropdown(false);
    };

    const handleGuestClick = (e) => {
        e.stopPropagation();
        setShowGuestDropdown(!showGuestDropdown);
        setShowCalendarDropdown(false);
    };

    const changeGuestCount = (type, change) => {
        if (type === 'adult') {
            setAdultCount(prev => Math.max(1, prev + change));
        } else if (type === 'child') {
            setChildCount(prev => Math.max(0, prev + change));
        }
    };

    const getGuestDisplayText = () => {
        let displayText = `성인 ${adultCount}명`;
        if (childCount > 0) {
            displayText += `, 어린이 ${childCount}명`;
        }
        return displayText;
    };

    return (
        <>
            {/* Bootstrap CSS */}
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                rel="stylesheet"
            />
            {/* Font Awesome CSS */}
            <link
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
                rel="stylesheet"
            />

            {/* Version 1 헤더 (검색창이 있는 상세한 헤더) */}
            <header className="app-header">
                <div className="container">
                    <div className="row">
                        <div className="col-12 d-flex align-items-center justify-content-evenly">
                            <div className="col-sm-1 col-lg-1 col-2">
                                <a href="/">
                                    <div className="logo" role="img" aria-label="트래블샷 아이콘"></div>
                                </a>
                            </div>
                            <div className="col-sm-7 col-lg-8 col-6">
                                <div className="search-container position-relative">
                                    <div className="row g-0 align-items-center">
                                        <div className="col-12 col-xxl-5 d-flex align-items-center">
                                            <div
                                                className="col-2 position-relative search-input-icon location-icon"
                                                role="img"
                                            ></div>
                                            <input
                                                ref={searchInputRef}
                                                type="text"
                                                className="search-input position-relative flex-grow-1 ms-1"
                                                placeholder="SL 호텔 강릉"
                                                value={searchValue}
                                                onChange={(e) => setSearchValue(e.target.value)}
                                                onFocus={handleSearchFocus}
                                            />
                                            {/* 드롭다운 suggestions */}
                                            <div
                                                ref={suggestionsRef}
                                                className={`dropdown-suggestions ${showSuggestions ? '' : 'd-none'}`}
                                            >
                                                <button className="suggestion-item">
                                                    <i className="fas fa-building"></i>
                                                    <div>
                                                        <div className="fw-bold">SL 호텔 강릉</div>
                                                        <small className="text-muted">강릉특별자치도 강릉시 OO----</small>
                                                    </div>
                                                </button>
                                                <button className="suggestion-item">
                                                    <i className="fas fa-home"></i>
                                                    <div>
                                                        <div className="fw-bold">유담리솜펜션</div>
                                                        <small className="text-muted">강릉특별자치도 강릉시 OO----</small>
                                                    </div>
                                                </button>
                                                <button className="suggestion-item">
                                                    <i className="fas fa-building"></i>
                                                    <div>
                                                        <div className="fw-bold">강릉씨고호텔</div>
                                                        <small className="text-muted">강릉특별자치도 강릉시 OO----</small>
                                                    </div>
                                                </button>
                                            </div>
                                        </div>
                                        <div className="col-auto search-divider-con">
                                            <div className="search-divider mx-3"></div>
                                        </div>
                                        <div className="col-lg-auto col-md-12 d-flex align-items-center">
                                            <div
                                                className="col-2 position-relative search-input-icon calendar-icon"
                                                role="img"
                                            ></div>

                                            <span
                                                className="ms-2 text-muted position-relative text-nowrap fw-medium"
                                                style={{cursor: 'pointer'}}
                                                onClick={handleDateClick}
                                                ref={calendarRef}
                                                id="dateDisplay"
                                            >
                        09.08(월) ~ 09.10(수)
                      </span>
                                        </div>
                                        <div className="col-auto search-divider-con">
                                            <div className="search-divider mx-3"></div>
                                        </div>
                                        <div className="col-lg-auto col-md-12 d-flex align-items-center">
                                            <div
                                                className="col-2 position-relative search-input-icon user-icon"
                                                role="img"
                                            ></div>
                                            <span
                                                className="ms-2 text-muted position-relative text-nowrap fw-medium"
                                                style={{cursor: 'pointer'}}
                                                onClick={handleGuestClick}
                                                id="guestDisplay"
                                            >
                        {getGuestDisplayText()}
                      </span>
                                            {/* 인원 선택 드롭다운 */}
                                            <div
                                                ref={guestRef}
                                                className="guest-dropdown"
                                                style={{display: showGuestDropdown ? 'block' : 'none'}}
                                            >
                                                <div className="guest-type">
                                                    <div className="guest-info">
                                                        <h6>성인</h6>
                                                        <small>18세 이상</small>
                                                    </div>
                                                    <div className="counter-controls">
                                                        <button
                                                            className="counter-btn"
                                                            onClick={() => changeGuestCount('adult', -1)}
                                                        >
                                                            -
                                                        </button>
                                                        <span>{adultCount}</span>
                                                        <button
                                                            className="counter-btn"
                                                            onClick={() => changeGuestCount('adult', 1)}
                                                        >
                                                            +
                                                        </button>
                                                    </div>
                                                </div>
                                                <div className="guest-type">
                                                    <div className="guest-info">
                                                        <h6>어린이</h6>
                                                        <small>0 - 17세</small>
                                                    </div>
                                                    <div className="counter-controls">
                                                        <button
                                                            className="counter-btn"
                                                            onClick={() => changeGuestCount('child', -1)}
                                                        >
                                                            -
                                                        </button>
                                                        <span>{childCount}</span>
                                                        <button
                                                            className="counter-btn"
                                                            onClick={() => changeGuestCount('child', 1)}
                                                        >
                                                            +
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-md-3 col-3 px-0">
                                <button className="icon-button">
                                    <div className="search-icon"></div>
                                </button>
                                <button className="icon-button">
                                    <div className="user-white-icon"></div>
                                </button>
                                <button className="icon-button">
                                    <div className="heart-icon"></div>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            {/* 메인 컨텐츠 영역 (데모용) */}
            <main className="content-area">
                <h1>영역</h1>
            </main>
        </>
    );
};

export default Header;