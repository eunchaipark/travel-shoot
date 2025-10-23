import React, {useState, useRef, useEffect} from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import { useNavigate,useSearchParams } from 'react-router-dom';
// import { useAuth } from '@/hooks/auth/useAuth'
import { useAuth } from '@/components/context/AuthContext'
import HeaderCalendar from "@/components/layout/HeaderCalendar";

const Header = () => {
    const [showSuggestions, setShowSuggestions] = useState(false);
    const [showCalendarDropdown, setShowCalendarDropdown] = useState(false);
    const [showGuestDropdown, setShowGuestDropdown] = useState(false);

    const { isAuthenticated, openLoginModal } = useAuth();
    const navigate = useNavigate();
    const [searchParams] = useSearchParams();


    //region 또는 stayName 중 있는 값을 가져옴
    const [searchValue, setSearchValue] = useState(
        searchParams.get('region') || searchParams.get('stayName') || ''
    );
    const [suggestions, setSuggestions] = useState([]);

    // stayName이 있으면 STAY, 없으면 REGION
    const [selectedType, setSelectedType] = useState(
        searchParams.get('stayName') ? "STAY" : "REGION"
    );


    // URL에서 날짜/인원 초기값 설정
    const [selectedDates, setSelectedDates] = useState({
        checkin: searchParams.get('checkIn') || (() => {
            const tomorrow = new Date();
            tomorrow.setDate(tomorrow.getDate() + 1);
            return tomorrow.toISOString().split('T')[0];
        })(),
        checkout: searchParams.get('checkOut') || (() => {
            const dayAfter = new Date();
            dayAfter.setDate(dayAfter.getDate() + 3);
            return dayAfter.toISOString().split('T')[0];
        })()
    });

    const [adultCount, setAdultCount] = useState(
        searchParams.get('adults') ? Number(searchParams.get('adults')) : 2
    );
    const [childCount, setChildCount] = useState(
        searchParams.get('children') ? Number(searchParams.get('children')) : 0
    );

    // TODO : 디버깅할라고 추가함( 개발 완료 후 지워도 됨 )
    console.log('Header - isAuthenticated:', isAuthenticated);

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
                const isDatePickerClick = event.target.closest('.react-datepicker') ||
                    event.target.closest('.react-datepicker-wrapper') ||
                    event.target.closest('.react-datepicker-popper');

                if (!isDatePickerClick) {
                    setShowCalendarDropdown(false);
                }
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
        if (suggestions.length > 0) {
            setShowSuggestions(true);
        }
    };

    const handleSearchClick = () => {
        if (suggestions.length > 0) {
            setShowSuggestions(true);
        }
    };

    // 자동완성 API 호출
    const handleSearchChange = async (e) => {
        const value = e.target.value;
        setSearchValue(value);

        if (value.trim().length < 1) {
            setSuggestions([]);
            setShowSuggestions(false);
            return;
        }

        try {
            const response = await fetch(
                `http://localhost:8080/api/stays/autocomplete?keyword=${encodeURIComponent(value)}`
            );

            if (!response.ok) {
                console.error('자동완성 API 에러:', response.status);
                setSuggestions([]);
                setShowSuggestions(false);
                return;
            }

            const data = await response.json();

            if (Array.isArray(data)) {
                setSuggestions(data);
                setShowSuggestions(data.length > 0);
            } else {
                setSuggestions([]);
                setShowSuggestions(false);
            }
        } catch (error) {
            console.error('자동완성 에러:', error);
            setSuggestions([]);
            setShowSuggestions(false);
        }
    };

    // 자동완성 항목 선택
        const handleSuggestionClick = (suggestion) => {
            setSearchValue(suggestion.keyword);
            setSelectedType(suggestion.type);
            setShowSuggestions(false);
        };

    // 날짜 선택 핸들러
        const handleDateSelect = (newDates) => {
            // newDates = { checkin: "2025-10-22", checkout: "2025-10-25" } 형태로 들어옴
            console.log("선택된 날짜:", newDates);
            setSelectedDates(newDates);
        };

    // 날짜 포맷팅
        const formatDisplayDate = (dateStr) => {
            if (!dateStr) return '';
            const date = new Date(dateStr);
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const day = String(date.getDate()).padStart(2, '0');
            const weekdays = ['일', '월', '화', '수', '목', '금', '토'];
            const weekday = weekdays[date.getDay()];
            return `${month}.${day}(${weekday})`;
        };

    // 검색 실행
        const handleSearchSubmit = () => {
            if (!searchValue.trim()) {
                alert('검색어를 입력해주세요');
                return;
            }

            if (!selectedDates.checkin || !selectedDates.checkout) {
                alert('날짜를 선택해주세요');
                return;
            }

            const params = new URLSearchParams({
                checkIn: selectedDates.checkin,
                checkOut: selectedDates.checkout,
                adults: adultCount,
                children: childCount
            });

            // 숙소 / 지역 선택 각각 다르게 전달해야함.
            if (selectedType === "STAY") {
                params.append("stayName", searchValue);
            } else {
                params.append("region", searchValue);
            }

            navigate(`/search?${params.toString()}`);
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

    //TODO : 로그인 완료 상태면 마이페이지로
    const handleUserIconClick = () => {
        if (isAuthenticated) {
            navigate('/mypage');
        } else {
            openLoginModal();
        }
    };

    return (
        <>
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
                                                placeholder="지역 또는 숙소명 검색"
                                                value={searchValue}
                                                onChange={handleSearchChange}
                                                onFocus={handleSearchFocus}
                                                onClick={handleSearchClick}
                                            />
                                            {/* 드롭다운 suggestions */}
                                            <div
                                                ref={suggestionsRef}
                                                className={`dropdown-suggestions ${showSuggestions && suggestions.length > 0 ? '' : 'd-none'}`}
                                            >
                                                {suggestions.map((suggestion, index) => (
                                                    <button
                                                        key={index}
                                                        className="suggestion-item"
                                                        onClick={() => handleSuggestionClick(suggestion)}
                                                    >
                                                        <i className={suggestion.type === 'REGION' ? 'fas fa-map-marker-alt' : 'fas fa-building'}></i>
                                                        <div>
                                                            <div className="fw-bold">{suggestion.keyword}</div>

                                                            {/*<small className="text-muted">{suggestion.type}</small>*/}

                                                        </div>
                                                    </button>
                                                ))}
                                            </div>
                                        </div>
                                        <div className="col-auto search-divider-con">
                                            <div className="search-divider mx-3"></div>
                                        </div>
                                        <div className="col-lg-auto col-md-12 d-flex align-items-center position-relative">
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

                         {formatDisplayDate(selectedDates.checkin)} ~ {formatDisplayDate(selectedDates.checkout)}
                        {/*09.08(월) ~ 09.10(수)*/}
                      </span>
                                            {/* 달력 UI 드롭다운 추가함 */}
                                            {showCalendarDropdown && (
                                                <div
                                                    style={{
                                                        position: "absolute",
                                                        top: "100%",
                                                        left: 0,
                                                        marginTop: "8px",
                                                        zIndex: 9999,
                                                        pointerEvents: "auto",
                                                    }}
                                                    onClick={(e) => e.stopPropagation()}
                                                >
                                                    <HeaderCalendar
                                                        selectedDates={selectedDates}
                                                        onDateSelect={(newDates) => {
                                                            console.log("날짜 선택됨:", newDates);
                                                            setSelectedDates(newDates);
                                                            // 선택 완료되면 드롭다운 닫기
                                                            setTimeout(() => setShowCalendarDropdown(false), 300);
                                                        }}
                                                    />
                                                </div>
                                            )}

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
                                <button className="icon-button" onClick={handleSearchSubmit}>
                                    <div className="search-icon"></div>
                                </button>
                                <button className="icon-button" onClick={handleUserIconClick} >
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
        </>
    );
};

export default Header;