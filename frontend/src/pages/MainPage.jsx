import React, { useState, useEffect, useRef, useCallback } from "react";
import FullCalendar from "@fullcalendar/react";
import dayGridPlugin from "@fullcalendar/daygrid";
import interactionPlugin from "@fullcalendar/interaction";
import koLocale from "@fullcalendar/core/locales/ko";
import { useNavigate } from "react-router-dom";

// API Service
import { fetchCalendarCourses } from "@/services/main/calendarApiService";

// Layout Components
import SimpleHeader from "@/components/layout/SimpleHeader";
import Footer from "@/components/layout/Footer";

// Hooks
import {
  useCalendar,
  useGuest,
  useDropdownPosition,
} from "../hooks/main/useCalendarHooks";

// Components
import { MiniCalendar } from "@/components/main/CalendarComponents";
import BudgetFriendlySection from "@/components/main/BudgetFriendlySection";
import RecommendStaySection from "@/components/main/RecommendStaySection";
import TrendingSection from "@/components/main/TrendingSection";
import TravelNowSection from "@/components/main/TravelNowSection";
import { useAuth } from "@/components/context/AuthContext";

// Utils
import {
  formatDateKorean,
  convertToCalendarEvents,
  CALENDAR_CONFIG,
  GUEST_LIMITS,
  RAW_RESERVATION_DATA,
} from "@/utils/main/calendarUtils";

// CSS
import "@/assets/css/common.css";
import "@/assets/css/main-calendar.css";
import "@/assets/css/recommend-stay.css";
import "@/assets/css/trending-section.css";
import "@/assets/css/budget-friendly.css";
import "@/assets/css/travel-now.css";
// import "@/assets/css/map.css";

const MainPage = () => {
  const calendarRef = useRef(null);
  const { isAuthenticated, user } = useAuth();
  const [locationValue, setLocationValue] = useState("");
  const [calendarEvents, setCalendarEvents] = useState([]);
  const [isLoadingEvents, setIsLoadingEvents] = useState(false);

  //  핵심 수정: 지역은 따로, 날짜/인원은 하나로 통합
  const [showLocationDropdown, setShowLocationDropdown] = useState(false);
  const [activeDropdown, setActiveDropdown] = useState(null); // 'date' | 'guest' | null

  const [suggestions, setSuggestions] = useState([]);
  const locationInputRef = useRef(null);
  const locationDropdownRef = useRef(null);

  // 커스텀 훅
  const {
    selectedDates,
    dateSelectionMode,
    handleMainCalendarDateSelection,
    handleMiniCalendarDateSelection,
    activateSelectionMode,
    deactivateSelectionMode,
    calculateNights,
  } = useCalendar();

  const { guestCounts, handleGuestChange, getGuestText } = useGuest();

  // 드롭다운 위치 관리
  const locationCardRef = useDropdownPosition(showLocationDropdown, "location");
  const dateCardRef = useDropdownPosition(activeDropdown === 'date', "date");
  const guestCardRef = useDropdownPosition(activeDropdown === 'guest', "guest");

  // API에서 캘린더 데이터 가져오기 
  useEffect(() => {
    const loadCalendarEvents = async () => {
      if (!isAuthenticated || !user) {
        setCalendarEvents([]);
        return;
      }

      try {
        setIsLoadingEvents(true);
        const userId = user.userId;
        const reservationData = await fetchCalendarCourses(userId);
        const events = convertToCalendarEvents(reservationData);
        setCalendarEvents(events);
        console.log("캘린더 이벤트 로드 성공:", events);
      } catch (error) {
        console.error("캘린더 데이터 로딩 실패, fallback 데이터 사용:", error);
        const fallbackEvents = convertToCalendarEvents(RAW_RESERVATION_DATA);
        setCalendarEvents(fallbackEvents);
      } finally {
        setIsLoadingEvents(false);
      }
    };

    loadCalendarEvents();
  }, [isAuthenticated, user]);

  // 날짜 표시 텍스트 
  const getDateDisplayText = () => {
    if (selectedDates.checkin && selectedDates.checkout) {
      const checkinText = formatDateKorean(selectedDates.checkin);
      const checkoutText = formatDateKorean(selectedDates.checkout);
      return `${checkinText} - ${checkoutText}`;
    } else if (selectedDates.checkin) {
      const checkinText = formatDateKorean(selectedDates.checkin);
      return `${checkinText} - 체크아웃`;
    } else if (dateSelectionMode) {
      return "달력에서 날짜를 선택해주세요";
    }
    return "날짜를 선택해주세요";
  };

  // 달력 날짜 클릭 
  const handleDateClick = (info) => {
    if (dateSelectionMode) {
      handleMainCalendarDateSelection(info.dateStr);
    }
  };

  // 이벤트 클릭 
  const handleEventClick = (info) => {
    info.jsEvent.preventDefault();
    info.jsEvent.stopPropagation();

    const props = info.event.extendedProps;

    if (props.isMainReservation) {
      alert(
        `"${
          props.originalTitle || info.event.title
        }" 예약 상세 페이지로 이동합니다.\n숙소: ${
          props.accommodationName
        }\n상태: ${props.status}\n예약 ID: ${props.reservationId}`
      );
    } else if (props.isSchedule) {
      alert(
        `"${props.originalScheduleTitle}" 일정에서 예약 상세 페이지로 이동합니다.\n소속 여행: ${props.parentTitle}\n시간: ${props.time}\n예약 ID: ${props.parentReservationId}`
      );
    }
  };

  // 이벤트 렌더링 
  const renderEventContent = (eventInfo) => {
    const event = eventInfo.event;
    const props = event.extendedProps;

    if (props.isSchedule) {
      return {
        html: `
          <div class="schedule-event-content">
            <span class="schedule-dot" style="background-color: ${props.dotColor}"></span>
            <span class="schedule-text">${event.title}</span>
          </div>
        `,
      };
    } else if (props.isMainReservation) {
      return {
        html: `
          <div class="reservation-event-content">
            ${event.title}
          </div>
        `,
      };
    }

    return { html: event.title };
  };

  const navigate = useNavigate();
  // 검색 처리 
  const handleSearch = () => {
    if(!locationValue & (!selectedDates.checkin || !selectedDates.checkout)){
      alert("여행가실 지역과 여행가실 날짜를 선택해주세요");
      return;
    }


    if (!selectedDates.checkin || !selectedDates.checkout) {
      alert("체크인/체크아웃 날짜를 선택해주세요.");
      return;
    }

    if(!locationValue){
      alert("여행가실 지역을 정해주세요");
      return;
    }

    const nights = calculateNights();

    const searchData = {
      location: locationValue,
      checkin: selectedDates.checkin,
      checkout: selectedDates.checkout,
      nights: nights,
      adults: guestCounts.adult,
      children: guestCounts.child,
    };locationValue

    console.log("검색 조건:", searchData);

    const params = new URLSearchParams({
      region: locationValue,
      checkin: selectedDates.checkin,
      checkout: selectedDates.checkout,
      adults: guestCounts.adult,
      children: guestCounts.child,
    });

    const searchUrl = `/search?${params.toString()}`;
    alert(
      `검색 실행:
      지역: ${locationValue}
      체크인: ${selectedDates.checkin}
      체크아웃: ${selectedDates.checkout} 
      ${nights}박 ${nights + 1}일
      성인: ${guestCounts.adult}명
      어린이: ${guestCounts.child}명
      이동URL:${searchUrl}`
    );
    navigate(searchUrl);

  };

  //  수정: 모든 드롭다운 닫기 - useCallback 추가
  const closeAllDropdowns = useCallback(() => {
    setShowLocationDropdown(false);
    setActiveDropdown(null);
  }, []);

  // 날짜 입력 클릭 핸들러
  const handleDateInputClick = () => {
    if (activeDropdown === 'date') {
      setActiveDropdown(null);
      deactivateSelectionMode();
    } else {
      setActiveDropdown('date');
      activateSelectionMode();
    }
    setShowLocationDropdown(false);
  };

  // 인원 입력 클릭 핸들러
  const handleGuestInputClick = () => {
    if (activeDropdown === 'guest') {
      setActiveDropdown(null);
    } else {
      setActiveDropdown('guest');
    }
    setShowLocationDropdown(false);
    deactivateSelectionMode();
};

  // 지역 입력 포커스 (원본 로직 유지, 다른 드롭다운 닫기만 추가)
  const handleLocationFocus = () => {
    setActiveDropdown(null); // 날짜/인원 닫기
    if (suggestions.length > 0) {
      setShowLocationDropdown(true);
    }
  };

  // 원본 로직 100% 유지: 실제 API 호출
  const handleLocationInput = async (e) => {
    const value = e.target.value;
    setLocationValue(value);
    
    setActiveDropdown(null); // 날짜/인원 닫기
    
    if (value.trim().length < 1) {
      setSuggestions([]);
      setShowLocationDropdown(false);
      return;
    }

    try {
      const response = await fetch(
        `http://localhost:8080/api/stays/autocomplete?keyword=${encodeURIComponent(value)}`
      );
      const data = await response.json();
      console.log('자동완성 결과:', data);
      setSuggestions(data || []);
      setShowLocationDropdown(true);
    } catch (error) {
      console.error('자동완성 에러:', error);
      setSuggestions([]);
    }
  };

  // 지역 선택 (원본 로직 유지)
  const handleSuggestionSelect = (suggestion) => {
    setLocationValue(suggestion.keyword);
    setShowLocationDropdown(false);
  };

  // TravelNow 카드 클릭 핸들러 (원본 로직 유지)
  const handleTravelNowCardClick = (destination) => {
    setLocationValue(destination.name);
    setShowLocationDropdown(false);

    const searchSection = document.querySelector(".search-section-container");
    if (searchSection) {
      searchSection.scrollIntoView({ behavior: "smooth", block: "center" });
    }
  };

  // 외부 클릭 핸들러 - 의존성 최소화
  useEffect(() => {
    const handleClickOutside = (e) => {
      const isDateCard = e.target
        .closest(".search-card")
        ?.querySelector(".main-calendar-date-input");
      const isGuestCard = e.target
        .closest(".search-card")
        ?.querySelector(".main-calendar-guest-input");
      const isLocationCard = e.target
        .closest(".search-card")
        ?.querySelector(".main-calendar-location-input");
      const isDateDropdown = e.target.closest(".date-dropdown-container");
      const isGuestDropdown = e.target.closest(".guest-dropdown-container");
      const isLocationDropdown = e.target.closest(".dropdown-suggestions");
      const isCalendar = e.target.closest("#calendar");

      // 날짜 드롭다운 닫기
      if (!isDateCard && !isDateDropdown && !isCalendar && activeDropdown === 'date') {
        setActiveDropdown(null);
        if (!selectedDates.checkin || !selectedDates.checkout) {
          deactivateSelectionMode();
        }
      }

      // 인원 드롭다운 닫기
      if (!isGuestCard && !isGuestDropdown && activeDropdown === 'guest') {
        setActiveDropdown(null);
      }

      // 지역 드롭다운 닫기
      if (!isLocationCard && !isLocationDropdown && showLocationDropdown) {
        setShowLocationDropdown(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, [
    activeDropdown,
    showLocationDropdown,
    selectedDates,
    deactivateSelectionMode,
  ]);

  // ESC 키 및 Enter 키 처리 
  useEffect(() => {
    const handleKeyDown = (e) => {
      if (e.key === "Escape") {
        closeAllDropdowns();
        deactivateSelectionMode();
      }

      if (e.key === "Enter" && selectedDates.checkin && selectedDates.checkout) {
        handleSearch();
      }
    };

    document.addEventListener("keydown", handleKeyDown);
    return () => document.removeEventListener("keydown", handleKeyDown);
  }, [selectedDates, closeAllDropdowns, deactivateSelectionMode, handleSearch]);

  // 체크아웃 선택 완료시 드롭다운 자동 닫기 
  useEffect(() => {
    if (selectedDates.checkin && selectedDates.checkout) {
      setTimeout(() => {
        setActiveDropdown(null);
        deactivateSelectionMode();
      }, 500);
    }
  }, [selectedDates, deactivateSelectionMode]);

  //지역 드롭다운 높이에 따라 다음 카드 밀어내기
  useEffect(() => {
    if (showLocationDropdown && locationDropdownRef.current && suggestions.length > 0) {
      const dropdown = locationDropdownRef.current;
      const nextCard = locationCardRef.current?.nextElementSibling;
      
      if (nextCard && nextCard.classList.contains('search-card')) {
        // requestAnimationFrame으로 DOM 렌더링 완료 대기
        requestAnimationFrame(() => {
          const dropdownHeight = dropdown.offsetHeight;
          console.log('드롭다운 높이:', dropdownHeight); // 디버깅용
          
          if (dropdownHeight > 0) {
            nextCard.style.marginTop = `${dropdownHeight + 16}px`;
            nextCard.style.transition = 'margin-top 0.3s ease';
          }
        });
      }
    } else {
      // 드롭다운 닫힐 때 margin 제거
      const nextCard = locationCardRef.current?.nextElementSibling;
      if (nextCard && nextCard.classList.contains('search-card')) {
        nextCard.style.marginTop = '';
      }
    }
  }, [showLocationDropdown, suggestions]);

  return (
    <>
      {/* 헤더 컴포넌트 사용 */}
      <SimpleHeader />

      {/* 메인 컨테이너 */}
      <main className="main-wrapper main-page">
        {/* 달력 섹션 */}
        <section className="calendar-section-wrapper">
          <div className="container-xxl px-5">
            <div className="calendar-search-container">
              {/* 달력 카드 */}
              <div
                className={`calendar-card card shadow-lg border-0 rounded-4 ${
                  isAuthenticated ? "logged-in" : "guest-mode"
                }`}
              >
                <div className="card-body">
                  {isLoadingEvents && (
                    <div
                      style={{
                        position: "absolute",
                        top: "50%",
                        left: "50%",
                        transform: "translate(-50%, -50%)",
                        zIndex: 10,
                        fontSize: "14px",
                        color: "#666",
                      }}
                    >
                      캘린더 데이터 로딩 중...
                    </div>
                  )}
                  <FullCalendar
                    ref={calendarRef}
                    plugins={[dayGridPlugin, interactionPlugin]}
                    {...CALENDAR_CONFIG}
                    locale={koLocale}
                    events={calendarEvents}
                    dateClick={handleDateClick}
                    eventClick={handleEventClick}
                    eventContent={renderEventContent}
                  />
                </div>

                {/* 게스트 모드 메시지 */}
                {!isAuthenticated && (
                  <>
                    <div className="calendar-guest-message">
                      회원가입 후 설정된 사용자 맞춤형 여행 코스 추천을
                      확인합니다.
                    </div>
                    <div className="calendar-signup-message">
                      회원가입 후 더 많은 서비스를 만나보세요
                    </div>
                  </>
                )}
              </div>

              {/* 검색 섹션 */}
              <div className="search-section-container">
                <div className="slogan">끊임없는 여행</div>

                {/* 지역 검색 */}
                <div
                  className="search-card position-relative"
                  ref={locationCardRef}
                >
                  <div className="search-icon-box">
                    <img
                      src="../../public/images/main/main-calendar-searchcard-location-icon.svg"
                      alt="지역아이콘"
                    />
                  </div>
                  <input
                    ref={locationInputRef}
                    type="text"
                    className="search-input main-calendar-location-input"
                    placeholder="어디로 떠나시나요?"
                    value={locationValue}
                    onChange={handleLocationInput}
                    onFocus={handleLocationFocus}
                  />

                  {showLocationDropdown && suggestions.length > 0 && (
                    <div ref={locationDropdownRef} className="dropdown-suggestions">
                      {suggestions.map((suggestion, index) => (
                        <button
                          key={index}
                          className="suggestion-item"
                          onClick={() => handleSuggestionSelect(suggestion)}
                        >
                          <i className={
                            suggestion.type === 'REGION' 
                              ? 'fas fa-map-marker-alt' 
                              : 'fas fa-building'
                          }></i>
                          <div>
                            <div className="fw-bold">{suggestion.keyword}</div>
                            <small className="text-muted">{suggestion.type}</small>
                          </div>
                        </button>
                      ))}
                    </div>
                  )}
                </div>

                {/* 날짜 선택 */}
                <div className="search-card" ref={dateCardRef}>
                  <div className="search-icon-box">
                    <img
                      src="../../public/images/main/main-calendar-searchcard-calendar-icon.svg"
                      alt="달력 아이콘"
                    />
                  </div>
                  <input
                    type="text"
                    className="search-input main-calendar-date-input"
                    value={getDateDisplayText()}
                    readOnly
                    onClick={handleDateInputClick}
                    style={{ cursor: "pointer" }}
                  />
                </div>

                {/*  activeDropdown 기반 */}
                <div className={`date-dropdown-container ${activeDropdown === 'date' ? 'open' : ''}`}>
                  <div style={{ padding: "15px" }}>
                    <div
                      className="mini-calendar-container"
                      style={{ justifyContent: "center", width: "100%" }}
                    >
                      <MiniCalendar
                        selectedDates={selectedDates}
                        onDateSelect={handleMiniCalendarDateSelection}
                      />
                    </div>
                  </div>
                </div>

                {/* 인원 선택 */}
                <div
                  className="search-card position-relative"
                  ref={guestCardRef}
                >
                  <div className="search-icon-box">
                    <img
                      src="../../public/images/main/main-calendar-searchcard-user-icon.svg"
                      alt="유저 아이콘"
                    />
                  </div>
                  <input
                    type="text"
                    className="search-input main-calendar-guest-input"
                    value={getGuestText()}
                    readOnly
                    onClick={handleGuestInputClick}
                    style={{ cursor: "pointer" }}
                  />
                </div>

                {/*  수정: activeDropdown 기반 */}
                <div className={`guest-dropdown-container ${activeDropdown === 'guest' ? 'open' : ''}`}>
                  <div style={{ padding: "20px" }}>
                    {/* 성인 */}
                    <div
                      style={{
                        display: "flex",
                        justifyContent: "space-between",
                        alignItems: "center",
                        marginBottom: "20px",
                      }}
                    >
                      <div>
                        <div style={{ fontWeight: 600, marginBottom: "4px" }}>
                          성인
                        </div>
                        <small style={{ color: "#6c757d" }}>18세 이상</small>
                      </div>
                      <div
                        className="counter-controls"
                        style={{
                          display: "flex",
                          alignItems: "center",
                          gap: "15px",
                        }}
                      >
                        <button
                          type="button"
                          className="counter-btn guest-btn guest-btn-minus"
                          onClick={() => handleGuestChange("adult", "minus")}
                          disabled={guestCounts.adult <= 1}
                        >
                          -
                        </button>
                        <span className="guest-count" data-type="adult">
                          {guestCounts.adult}
                        </span>
                        <button
                          type="button"
                          className="counter-btn guest-btn guest-btn-plus"
                          onClick={() => handleGuestChange("adult", "plus")}
                          disabled={guestCounts.adult >= 32}
                        >
                          +
                        </button>
                      </div>
                    </div>

                    {/* 어린이 */}
                    <div
                      style={{
                        display: "flex",
                        justifyContent: "space-between",
                        alignItems: "center",
                      }}
                    >
                      <div>
                        <div style={{ fontWeight: 600, marginBottom: "4px" }}>
                          어린이
                        </div>
                        <small style={{ color: "#6c757d" }}>0-17세</small>
                      </div>
                      <div
                        className="counter-controls"
                        style={{
                          display: "flex",
                          alignItems: "center",
                          gap: "15px",
                        }}
                      >
                        <button
                          type="button"
                          className="counter-btn guest-btn guest-btn-minus"
                          onClick={() => handleGuestChange("child", "minus")}
                          disabled={guestCounts.child <= 0}
                        >
                          -
                        </button>
                        <span className="guest-count" data-type="child">
                          {guestCounts.child}
                        </span>
                        <button
                          type="button"
                          className="counter-btn guest-btn guest-btn-plus"
                          onClick={() => handleGuestChange("child", "plus")}
                          disabled={guestCounts.child >= 4}
                        >
                          +
                        </button>
                      </div>
                    </div>
                  </div>
                </div>

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
            {/* 숙소 추천 섹션 - React 컴포넌트 */}
            <RecommendStaySection isLoggedIn={isAuthenticated} />

            {/* 인기 급상승 섹션 - React 컴포넌트 */}
            <TrendingSection />

            {/* 가격착한 숙소 섹션 - React 컴포넌트 */}
            <BudgetFriendlySection />

            {/* 지금 떠나기 좋은 곳 섹션 - React 컴포넌트로 변경 */}
            <TravelNowSection onLocationSelect={handleTravelNowCardClick} />
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
};

export default MainPage;