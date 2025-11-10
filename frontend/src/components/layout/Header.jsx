import React, {useState, useRef, useEffect} from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { useAuth } from '@/components/context/AuthContext'
import HeaderCalendar from "@/components/layout/HeaderCalendar";
import useSearchParamsSync from '@/hooks/search/useSearchParamsSync';
import { useDefaultStayParams } from '@/hooks/search/useDefaultStayParams';

const Header = () => {
    const [showSuggestions, setShowSuggestions] = useState(false);
    const [showCalendarDropdown, setShowCalendarDropdown] = useState(false);
    const [showGuestDropdown, setShowGuestDropdown] = useState(false);

    const { isAuthenticated, openLoginModal } = useAuth();
    const navigate = useNavigate();

    // Hook 사용 - URL에서 파라미터 가져오기
    const {
        checkIn,
        checkOut,
        adults,
        children,
        region,
        stayName,
        setCheckIn,
        setCheckOut,
        setAdults,
        setChildren,
        setRegion,
        setStayName
    } = useSearchParamsSync();
    const { getDefaultDates, getDefaultGuests } = useDefaultStayParams();

    // 검색창 초기값: URL에서 가져온 값 사용
    // region 또는 stayName 중 있는 값 표시
    const [searchValue, setSearchValue] = useState(stayName || region || '');
    const [suggestions, setSuggestions] = useState([]);

    // stayName이 있으면 STAY, 없으면 REGION
    const [selectedType, setSelectedType] = useState(
        stayName ? "STAY" : "REGION"
    );

    // URL 파라미터 변경 시 검색창 업데이트
    useEffect(() => {
        setSearchValue(stayName || region || '');
        setSelectedType(stayName ? "STAY" : "REGION");
    }, [stayName, region]);

    // 날짜 초기값: URL에서 가져온 값 사용 (기본값 설정)
    const [selectedDates, setSelectedDates] = useState(() => {
        const { checkIn: defIn, checkOut: defOut } = getDefaultDates({ nights: 2, startFromTomorrow: true });
        return {
            checkin: checkIn || defIn,
            checkout: checkOut || defOut
        };
    });

    // 인원 초기값: URL에서 가져온 값 사용
    const [adultCount, setAdultCount] = useState(adults || getDefaultGuests().adults);
    const [childCount, setChildCount] = useState(children || getDefaultGuests().children);

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
                `${window.API_BASE_URL}/api/stays/autocomplete?keyword=${encodeURIComponent(value)}`
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

    // 자동완성 항목 선택 (URL 업데이트)
    const handleSuggestionClick = (suggestion) => {
        setSearchValue(suggestion.keyword);
        setSelectedType(suggestion.type);
        setShowSuggestions(false);

        // URL 업데이트
        if (suggestion.type === "STAY") {
            setStayName(suggestion.keyword);
            setRegion(''); // 지역 초기화
        } else {
            setRegion(suggestion.keyword);
            setStayName(''); // 숙소명 초기화
        }
    };

    // 날짜 선택 핸들러 (URL 업데이트)
    const handleDateSelect = (newDates) => {
        console.log("선택된 날짜:", newDates);
        setSelectedDates({
            checkin: newDates.checkIn,
            checkout: newDates.checkOut,
        });
        setCheckIn(newDates.checkIn);
        setCheckOut(newDates.checkOut);
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

    // 검색 실행 (URL 파라미터 사용)
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

        // 숙소 / 지역 선택 각각 다르게 전달
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

    // 인원 변경 핸들러 (URL 업데이트)
    const changeGuestCount = (type, change) => {
        if (type === 'adult') {
            const newCount = Math.max(1, adultCount + change);
            setAdultCount(newCount);
            setAdults(newCount);
        } else if (type === 'child') {
            const newCount = Math.max(0, childCount + change);
            setChildCount(newCount);
            setChildren(newCount);
        }
    };

    const getGuestDisplayText = () => {
        let displayText = `성인 ${adultCount}명`;
        if (childCount > 0) {
            displayText += `, 어린이 ${childCount}명`;
        }
        return displayText;
    };

    const handleUserIconClick = () => {
        if (isAuthenticated) {
            navigate('/mypage');
        } else {
            openLoginModal();
        }
    };

    return (
        <>
            <link
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
                rel="stylesheet"
            />

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

                                            {/*검색창 - 숙소명 우선 표시 */}
                                            <input
                                                ref={searchInputRef}
                                                type="text"
                                                className="search-input position-relative flex-grow-1 ms-1"
                                                placeholder={stayName ? stayName : "지역 또는 숙소명 검색"}
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
                                            </span>

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
                                                            handleDateSelect(newDates);
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