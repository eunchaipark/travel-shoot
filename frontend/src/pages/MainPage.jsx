import React, { useState, useEffect, useRef } from "react";
import FullCalendar from "@fullcalendar/react";
import dayGridPlugin from "@fullcalendar/daygrid";
import interactionPlugin from "@fullcalendar/interaction";
import koLocale from "@fullcalendar/core/locales/ko";

// API Service 추가
import { fetchCalendarCourses } from "@/services/calendarApiService";

// Hooks
import {
  useCalendar,
  useGuest,
  useDropdownPosition,
} from "../hooks/useCalendarHooks";

// Components
import { MiniCalendar } from "@/components/CalendarComponents";
import BudgetFriendlySection from "@/components/BudgetFriendlySection";
import RecommendStaySection from "@/components/RecommendStaySection";
import TrendingSection from "@/components/TrendingSection";
import TravelNowSection from "@/components/TravelNowSection";

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

const MainPage = () => {
  const calendarRef = useRef(null);
  const [isLoggedIn] = useState(true);
  const [searchValue, setSearchValue] = useState("");
  const [locationValue, setLocationValue] = useState("");

  // 캘린더 이벤트 상태 추가
  const [calendarEvents, setCalendarEvents] = useState([]);
  const [isLoadingEvents, setIsLoadingEvents] = useState(false);

  // 드롭다운 상태
  const [showDateDropdown, setShowDateDropdown] = useState(false);
  const [showGuestDropdown, setShowGuestDropdown] = useState(false);
  const [showLocationDropdown, setShowLocationDropdown] = useState(false);
  const [showHeaderDropdown, setShowHeaderDropdown] = useState(false);

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
  const dateCardRef = useDropdownPosition(showDateDropdown, "date");
  const guestCardRef = useDropdownPosition(showGuestDropdown, "guest");

  // API에서 캘린더 데이터 가져오기
  useEffect(() => {
    const loadCalendarEvents = async () => {
      if (!isLoggedIn) {
        setCalendarEvents([]);
        return;
      }

      try {
        setIsLoadingEvents(true);

        // TODO: 실제 로그인한 사용자 ID로 변경
        const userId = 1;

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
  }, [isLoggedIn]);

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

  // 검색 처리
  const handleSearch = () => {
    if (!selectedDates.checkin || !selectedDates.checkout) {
      alert("체크인/체크아웃 날짜를 선택해주세요.");
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
    };

    console.log("검색 조건:", searchData);
    alert(
      `검색 실행:\n지역: ${locationValue}\n체크인: ${
        selectedDates.checkin
      }\n체크아웃: ${selectedDates.checkout}\n${nights}박 ${
        nights + 1
      }일\n성인: ${guestCounts.adult}명\n어린이: ${guestCounts.child}명`
    );
  };

  // 모든 드롭다운 닫기
  const closeAllDropdowns = () => {
    setShowDateDropdown(false);
    setShowGuestDropdown(false);
    setShowLocationDropdown(false);
    setShowHeaderDropdown(false);
  };

  // 날짜 입력 클릭
  const handleDateInputClick = (e) => {
    e.preventDefault();
    e.stopPropagation();

    setShowLocationDropdown(false);
    setShowGuestDropdown(false);
    setShowHeaderDropdown(false);

    if (!dateSelectionMode) {
      activateSelectionMode();
    }

    setShowDateDropdown((prev) => !prev);
  };

  // 인원 입력 클릭
  const handleGuestInputClick = (e) => {
    e.stopPropagation();

    setShowLocationDropdown(false);
    setShowDateDropdown(false);
    setShowHeaderDropdown(false);

    setShowGuestDropdown((prev) => !prev);
  };

  // 지역 입력 포커스/입력
  const handleLocationFocus = () => {
    setShowDateDropdown(false);
    setShowGuestDropdown(false);
    setShowHeaderDropdown(false);
    setShowLocationDropdown(true);
  };

  const handleLocationInput = (e) => {
    setLocationValue(e.target.value);
    if (e.target.value.length > 0) {
      setShowLocationDropdown(true);
    }
  };

  // 지역 선택
  const handleLocationSelect = (location) => {
    setLocationValue(location);
    setShowLocationDropdown(false);
  };

  // TravelNow 카드 클릭 핸들러
  const handleTravelNowCardClick = (destination) => {
    setLocationValue(destination.name);
    setShowLocationDropdown(false);

    const searchSection = document.querySelector(".search-section-container");
    if (searchSection) {
      searchSection.scrollIntoView({ behavior: "smooth", block: "center" });
    }
  };

  // 외부 클릭 감지
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

      if (!isDateCard && !isDateDropdown && !isCalendar && showDateDropdown) {
        setShowDateDropdown(false);
        if (!selectedDates.checkin || !selectedDates.checkout) {
          deactivateSelectionMode();
        }
      }

      if (!isGuestCard && !isGuestDropdown && showGuestDropdown) {
        setShowGuestDropdown(false);
      }

      if (!isLocationCard && !isLocationDropdown && showLocationDropdown) {
        setShowLocationDropdown(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, [
    showDateDropdown,
    showGuestDropdown,
    showLocationDropdown,
    selectedDates,
  ]);

  // ESC 키 및 Enter 키 처리
  useEffect(() => {
    const handleKeyDown = (e) => {
      if (e.key === "Escape") {
        closeAllDropdowns();
        deactivateSelectionMode();
      }

      if (
        e.key === "Enter" &&
        selectedDates.checkin &&
        selectedDates.checkout
      ) {
        handleSearch();
      }
    };

    document.addEventListener("keydown", handleKeyDown);
    return () => document.removeEventListener("keydown", handleKeyDown);
  }, [selectedDates]);

  // 체크아웃 선택 완료시 드롭다운 자동 닫기
  useEffect(() => {
    if (selectedDates.checkin && selectedDates.checkout) {
      setTimeout(() => {
        setShowDateDropdown(false);
        deactivateSelectionMode();
      }, 500);
    }
  }, [selectedDates]);

  return (
    <>
      {/* 헤더 */}
      <header className="app-header">
        <div className="container">
          <div className="row">
            <div className="col-12 d-flex align-items-center justify-content-evenly">
              <div className="col-sm-1 col-lg-1 col-2">
                <div
                  className="logo"
                  role="img"
                  aria-label="트래블샷 아이콘"
                ></div>
              </div>
              <div className="col-sm-7 col-lg-8 col-6 position-relative">
                <div className="search-container position-relative">
                  <input
                    type="text"
                    className="search-input w-100"
                    placeholder="어디로 떠나볼까요?"
                    value={searchValue}
                    onChange={(e) => setSearchValue(e.target.value)}
                    onFocus={() => setShowHeaderDropdown(true)}
                  />
                </div>
                {showHeaderDropdown && (
                  <div className="dropdown-suggestions">
                    <button
                      className="suggestion-item"
                      onClick={() => {
                        setSearchValue("SL 호텔 강릉");
                        setShowHeaderDropdown(false);
                      }}
                    >
                      <i className="fas fa-building"></i>
                      <div>
                        <div className="fw-bold">SL 호텔 강릉</div>
                        <small className="text-muted">
                          강릉특별자치도 강릉시 OO----
                        </small>
                      </div>
                    </button>
                    <button
                      className="suggestion-item"
                      onClick={() => {
                        setSearchValue("유담리솜펜션");
                        setShowHeaderDropdown(false);
                      }}
                    >
                      <i className="fas fa-home"></i>
                      <div>
                        <div className="fw-bold">유담리솜펜션</div>
                        <small className="text-muted">
                          강릉특별자치도 강릉시 OO----
                        </small>
                      </div>
                    </button>
                  </div>
                )}
              </div>
              <div className="col-md-3 d-flex justify-content-between col-3 px-0">
                <button className="icon-button">
                  <div className="search-icon"></div>
                </button>
                <div className="col-auto h-100 d-flex">
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
        </div>
      </header>

      {/* 메인 컨테이너 */}
      <main className="main-wrapper main-page">
        {/* 달력 섹션 */}
        <section className="calendar-section-wrapper">
          <div className="container-xxl px-5">
            <div className="calendar-search-container">
              {/* 달력 카드 */}
              <div
                className={`calendar-card card shadow-lg border-0 rounded-4 ${
                  isLoggedIn ? "logged-in" : "guest-mode"
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
                {!isLoggedIn && (
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
                    type="text"
                    className="search-input main-calendar-location-input"
                    placeholder="어디로 떠나시나요?"
                    value={locationValue}
                    onChange={handleLocationInput}
                    onFocus={handleLocationFocus}
                  />

                  {showLocationDropdown && (
                    <div className="dropdown-suggestions">
                      <button
                        className="suggestion-item"
                        onClick={() => handleLocationSelect("SL 호텔 강릉")}
                      >
                        <i className="fas fa-building"></i>
                        <div>
                          <div className="fw-bold">SL 호텔 강릉</div>
                          <small className="text-muted">
                            강릉특별자치도 강릉시 OO----
                          </small>
                        </div>
                      </button>
                      <button
                        className="suggestion-item"
                        onClick={() => handleLocationSelect("유담리솜펜션")}
                      >
                        <i className="fas fa-home"></i>
                        <div>
                          <div className="fw-bold">유담리솜펜션</div>
                          <small className="text-muted">
                            강릉특별자치도 강릉시 OO----
                          </small>
                        </div>
                      </button>
                      <button
                        className="suggestion-item"
                        onClick={() => handleLocationSelect("강릉씨고호텔")}
                      >
                        <i className="fas fa-building"></i>
                        <div>
                          <div className="fw-bold">강릉씨고호텔</div>
                          <small className="text-muted">
                            강릉특별자치도 강릉시 OO----
                          </small>
                        </div>
                      </button>
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

                {showDateDropdown && (
                  <div
                    className="date-dropdown-container"
                    style={{
                      maxHeight: "400px",
                      opacity: 1,
                      transition: "all 0.3s ease",
                    }}
                  >
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
                )}

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

                {showGuestDropdown && (
                  <div
                    className="guest-dropdown-container"
                    style={{
                      maxHeight: "160px",
                      opacity: 1,
                      transition: "all 0.3s ease",
                    }}
                  >
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
            {/* 숙소 추천 섹션 - React 컴포넌트 */}
            <RecommendStaySection isLoggedIn={isLoggedIn} />

            {/* 인기 급상승 섹션 - React 컴포넌트 */}
            <TrendingSection />

            {/* 가격착한 숙소 섹션 - React 컴포넌트 */}
            <BudgetFriendlySection />

            {/* 지금 떠나기 좋은 곳 섹션 - React 컴포넌트로 변경 */}
            <TravelNowSection onLocationSelect={handleTravelNowCardClick} />
          </div>
        </section>
      </main>
    </>
  );
};

export default MainPage;
