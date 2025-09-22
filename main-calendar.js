/* ==========================================================================
   Travel Calendar System - 최적화된 전체 코드
   - 날짜 동기화 문제 해결
   - 중복 코드 제거
   - 성능 최적화
   - 코드 정리 및 구조화
   - 로그인 상태 관리 추가
   ========================================================================== */

/* ==========================================================================
   전역 변수 및 설정
   ========================================================================== */
let isLoggedIn = true; 
let calendar = null;
let dateSelectionMode = true;
let selectedDates = {
    checkin: null,
    checkout: null
};

// 예약별 색상 풀 (5가지 색상으로 순차 할당)
const RESERVATION_COLOR_POOL = [
    '#0d6efd', // 파란색 (기본)
    '#198754', // 초록색
    '#dc3545', // 빨간색
    '#fd7e14', // 주황색
    '#6f42c1'  // 보라색
];

// 일정 유형별 색상 설정
const SCHEDULE_COLORS = {
    stay: '#1E3A8A',
    restaurants: '#F05650',
    tourist_spots: '#75B611'
};

// 예약 ID별 색상 매핑 저장
let reservationColorMap = {};

/* ==========================================================================
   로그인 상태 관리 함수들
   ========================================================================== */

/**
 * 로그인 상태 토글 (테스트용)
 */
function toggleLoginState() {
    isLoggedIn = !isLoggedIn;
    updateCalendarForLoginState();
    console.log('로그인 상태 변경:', isLoggedIn ? '로그인됨' : '비로그인');
}

/**
 * 로그인 상태에 따른 달력 업데이트
 */
function updateCalendarForLoginState() {
    const calendarCard = document.querySelector('.calendar-card');
    if (!calendarCard) return;
    
    // 기존 클래스 제거
    calendarCard.classList.remove('guest-mode', 'logged-in');
    
    // 기존 게스트 메시지 제거 (DOM 요소)
    const existingMessage = calendarCard.querySelector('.calendar-guest-message');
    if (existingMessage) {
        existingMessage.remove();
    }
    
    if (isLoggedIn) {
        // 로그인 상태: 실제 예약 데이터 표시
        calendarCard.classList.add('logged-in');
        
        // 달력 이벤트 다시 로드
        if (calendar) {
            calendar.removeAllEvents();
            const reservationEvents = convertToCalendarEvents(RAW_RESERVATION_DATA);
            calendar.addEventSource(reservationEvents);
        }
        
        console.log('로그인 모드: 예약 데이터 표시');
        
    } else {
        // 비로그인 상태: 게스트 모드
        calendarCard.classList.add('guest-mode');
        
        // 달력에서 모든 이벤트 제거
        if (calendar) {
            calendar.removeAllEvents();
        }
        
        // 게스트 안내 메시지를 달력 왼쪽 위에 표시
        showGuestMessage();
        
        console.log('게스트 모드: 안내 메시지 표시');
    }
}

/**
 * 게스트 안내 메시지 표시 (달력 왼쪽 위 고정 위치)
 */
function showGuestMessage() {
    const calendarCard = document.querySelector('.calendar-card');
    if (!calendarCard) return;
    
    // 기존 메시지 제거
    const existingMessage = calendarCard.querySelector('.calendar-guest-message');
    if (existingMessage) {
        existingMessage.remove();
    }
    
    const messageDiv = document.createElement('div');
    messageDiv.className = 'calendar-guest-message';
    messageDiv.textContent = '회원가입 후 설정된 사용자 맞춤형 여행 코스 추천을 확인합니다.';
    
    calendarCard.appendChild(messageDiv);
}

/* ==========================================================================
   날짜 처리 유틸리티 함수들
   ========================================================================== */

/**
 * 안전한 날짜 문자열 생성 (시간대 문제 해결)
 * @param {number} year - 연도
 * @param {number} month - 월 (0-11)
 * @param {number} day - 일
 * @returns {string} YYYY-MM-DD 형식의 날짜 문자열
 */
function createSafeDateString(year, month, day) {
    const date = new Date(year, month, day, 12, 0, 0, 0);
    const yyyy = date.getFullYear();
    const mm = String(date.getMonth() + 1).padStart(2, '0');
    const dd = String(date.getDate()).padStart(2, '0');
    return `${yyyy}-${mm}-${dd}`;
}

/**
 * 안전한 날짜 객체 생성
 * @param {string} dateStr - YYYY-MM-DD 형식의 날짜 문자열
 * @returns {Date|null} 날짜 객체
 */
function createSafeDate(dateStr) {
    if (!dateStr || typeof dateStr !== 'string') return null;
    
    const [year, month, day] = dateStr.split('-').map(Number);
    if (!year || !month || !day) return null;
    
    // 로컬 시간대 기준으로 날짜 객체 생성 (시간은 12:00으로 설정하여 DST 문제 방지)
    return new Date(year, month - 1, day, 12, 0, 0, 0);
}

/**
 * 날짜 객체를 YYYY-MM-DD 문자열로 변환
 * @param {Date} date - 날짜 객체
 * @returns {string|null} YYYY-MM-DD 형식의 문자열
 */
function formatDateToString(date) {
    if (!date || !(date instanceof Date)) return null;
    
    const yyyy = date.getFullYear();
    const mm = String(date.getMonth() + 1).padStart(2, '0');
    const dd = String(date.getDate()).padStart(2, '0');
    return `${yyyy}-${mm}-${dd}`;
}

/**
 * 날짜 비교 함수 (시간 제거)
 * @param {string|Date} date1 - 첫 번째 날짜
 * @param {string|Date} date2 - 두 번째 날짜
 * @returns {boolean} 같은 날짜인지 여부
 */
function compareDatesOnly(date1, date2) {
    if (!date1 || !date2) return false;
    
    const d1 = typeof date1 === 'string' ? createSafeDate(date1) : date1;
    const d2 = typeof date2 === 'string' ? createSafeDate(date2) : date2;
    
    if (!d1 || !d2) return false;
    
    return formatDateToString(d1) === formatDateToString(d2);
}

/**
 * 오늘 날짜 문자열 반환
 * @returns {string} 오늘 날짜 YYYY-MM-DD 형식
 */
function getTodayString() {
    return formatDateToString(new Date());
}

/* ==========================================================================
   예약 데이터 및 색상 관리
   ========================================================================== */

/**
 * 예약에 색상 할당
 * @param {string} reservationId - 예약 ID
 * @returns {string} 할당된 색상 코드
 */
function assignReservationColor(reservationId) {
    if (!reservationColorMap[reservationId]) {
        const assignedCount = Object.keys(reservationColorMap).length;
        const colorIndex = assignedCount % RESERVATION_COLOR_POOL.length;
        reservationColorMap[reservationId] = RESERVATION_COLOR_POOL[colorIndex];
    }
    return reservationColorMap[reservationId];
}

/**
 * 시간 포맷팅 (24시간 → 12시간 형식)
 * @param {string} time - HH:MM 형식 시간
 * @returns {string} 포맷된 시간
 */
function formatScheduleTime(time) {
    const [hours, minutes] = time.split(':');
    const hour = parseInt(hours);
    const period = hour >= 12 ? 'p' : 'am';
    const displayHour = hour > 12 ? hour - 12 : (hour === 0 ? 12 : hour);
    const displayMinutes = minutes === '00' ? '' : `:${minutes}`;
    return `${displayHour}${displayMinutes}${period}`;
}

/**
 * 텍스트 길이 제한
 * @param {string} text - 원본 텍스트
 * @param {number} maxLength - 최대 길이
 * @returns {string} 잘린 텍스트
 */
function truncateText(text, maxLength = 12) {
    if (!text || text.length <= maxLength) return text;
    return text.substring(0, maxLength - 3) + '...';
}

/* ==========================================================================
   예약 데이터 및 이벤트 변환
   ========================================================================== */

// 예약 원본 데이터
const RAW_RESERVATION_DATA = [
    {
        id: 'reservation_001',
        title: '제주도 여행',
        startDate: '2025-09-08',
        endDate: '2025-09-10',
        accommodationName: '제주 오션뷰 펜션',
        status: 'confirmed',
        schedules: [
            { time: '10:30', title: '체크인', type: 'stay' },
            { time: '12:00', title: '점심 (흑돼지)', type: 'restaurants' },
            { time: '15:00', title: '한라산 등반', type: 'tourist_spots' },
            { time: '11:00', title: '체크아웃', type: 'stay', date: '2025-09-10' }
        ]
    },
    {
        id: 'reservation_002',
        title: '부산 출장',
        startDate: '2025-09-15',
        endDate: '2025-09-17',
        accommodationName: '해운대 호텔',
        status: 'checkedin',
        schedules: [
            { time: '14:00', title: '비즈니스 미팅', type: 'stay' },
            { time: '19:00', title: '회식', type: 'restaurants' }
        ]
    },
    {
        id: 'reservation_003',
        title: '강릉 휴가',
        startDate: '2025-09-20',
        endDate: '2025-09-22',
        accommodationName: '강릉 바다뷰 펜션',
        status: 'confirmed',
        schedules: [
            { time: '09:00', title: '정동진 일출', type: 'tourist_spots' },
            { time: '11:30', title: '커피거리', type: 'restaurants' },
            { time: '18:00', title: '해산물 저녁', type: 'restaurants' }
        ]
    }
];

/**
 * 예약 데이터를 FullCalendar 이벤트로 변환
 * @param {Array} reservationData - 예약 데이터 배열
 * @returns {Array} FullCalendar 이벤트 배열
 */
function convertToCalendarEvents(reservationData) {
    const events = [];
    
    reservationData.forEach(reservation => {
        const reservationColor = assignReservationColor(reservation.id);
        
        // 메인 예약 이벤트 추가
        events.push({
            id: reservation.id,
            title: reservation.title,
            start: reservation.startDate,
            end: reservation.endDate,
            className: `fc-event-reservation fc-event-${reservation.status}`,
            backgroundColor: reservationColor,
            borderColor: reservationColor,
            extendedProps: {
                reservationId: reservation.id,
                accommodationName: reservation.accommodationName,
                status: reservation.status,
                type: 'accommodation',
                isMainReservation: true,
                originalTitle: reservation.title
            }
        });

        // 하위 일정들을 각 날짜별로 그룹핑
        const schedulesByDate = {};
        reservation.schedules.forEach(schedule => {
            const scheduleDate = schedule.date || reservation.startDate;
            if (!schedulesByDate[scheduleDate]) {
                schedulesByDate[scheduleDate] = [];
            }
            schedulesByDate[scheduleDate].push(schedule);
        });

        // 날짜별로 일정 이벤트 생성
        Object.keys(schedulesByDate).forEach(date => {
            const daySchedules = schedulesByDate[date];
            
            daySchedules.forEach((schedule, index) => {
                const formattedTime = formatScheduleTime(schedule.time);
                const color = SCHEDULE_COLORS[schedule.type] || '#6c757d';
                const fullTitle = `${formattedTime} ${schedule.title}`;
                const truncatedTitle = truncateText(fullTitle, 14);
                
                events.push({
                    id: `${reservation.id}_schedule_${date}_${index}`,
                    title: truncatedTitle,
                    start: date,
                    className: 'fc-event-schedule',
                    backgroundColor: 'transparent',
                    borderColor: 'transparent',
                    textColor: '#333333',
                    extendedProps: {
                        parentReservationId: reservation.id,
                        parentTitle: reservation.title,
                        type: schedule.type,
                        time: schedule.time,
                        scheduleTitle: schedule.title,
                        dotColor: color,
                        isSchedule: true,
                        originalScheduleTitle: schedule.title,
                        originalFullTitle: fullTitle
                    }
                });
            });
        });
    });

    return events;
}

/* ==========================================================================
   달력 초기화 및 메인 기능
   ========================================================================== */

/**
 * 달력 시스템 초기화
 */
function initializeCalendar() {
    const calendarEl = document.getElementById('calendar');
    
    if (!calendarEl) {
        console.error('달력 컨테이너를 찾을 수 없습니다.');
        return;
    }

    const reservationEvents = convertToCalendarEvents(RAW_RESERVATION_DATA);

    calendar = new FullCalendar.Calendar(calendarEl, {
        locale: 'ko',
        initialView: 'dayGridMonth',
        height: 'auto',
        expandRows: true,
        headerToolbar: {
            left: 'prev,next',
            center: 'title',
            right: 'today'
        },
        buttonText: {
            today: '오늘'
        },
        dayMaxEvents: 3,
        moreLinkClick: 'popover',
        displayEventTime: false,
        events: reservationEvents,
        
        // 이벤트 렌더링 (툴팁 제거)
        eventContent: function(arg) {
            const event = arg.event;
            const props = event.extendedProps;
            
            if (props.isSchedule) {
                return {
                    html: `
                        <div class="schedule-event-content">
                            <span class="schedule-dot" style="background-color: ${props.dotColor}"></span>
                            <span class="schedule-text">${event.title}</span>
                        </div>
                    `
                };
            } else if (props.isMainReservation) {
                return {
                    html: `
                        <div class="reservation-event-content">
                            ${event.title}
                        </div>
                    `
                };
            } else if (props.type === 'guest_info') {
                // 게스트 안내 메시지 렌더링
                return {
                    html: `
                        <div style="font-size: 11px; text-align: center; color: #666; padding: 2px; line-height: 1.2;">
                            ${event.title}
                        </div>
                    `
                };
            }
            
            return { html: event.title };
        },
        
        // 날짜 클릭 이벤트
        dateClick: function(info) {
            console.log('메인 달력 날짜 클릭:', info.dateStr, '선택모드:', dateSelectionMode);
            
            if (dateSelectionMode) {
                handleMainCalendarDateSelection(info.dateStr);
            } else {
                showDateInfo(info.dateStr);
            }
        },
        
        // 예약 이벤트 클릭
        eventClick: function(info) {
            console.log('이벤트 클릭:', info.event.title);
            
            info.jsEvent.preventDefault();
            info.jsEvent.stopPropagation();
            
            const props = info.event.extendedProps;
            
            // 게스트 정보 이벤트는 클릭 무시
            if (props.type === 'guest_info') {
                return;
            }
            
            if (props.isMainReservation) {
                alert(`"${props.originalTitle || info.event.title}" 예약 상세 페이지로 이동합니다.\n숙소: ${props.accommodationName}\n상태: ${props.status}\n예약 ID: ${props.reservationId}`);
            } else if (props.isSchedule) {
                alert(`"${props.originalScheduleTitle}" 일정에서 예약 상세 페이지로 이동합니다.\n소속 여행: ${props.parentTitle}\n시간: ${props.time}\n예약 ID: ${props.parentReservationId}`);
            }
        },
        
        // 달력 날짜 변경시 하이라이트 업데이트
        datesSet: function(info) {
            console.log('달력 날짜 변경됨:', info.start, info.end);
            setTimeout(() => {
                highlightMainCalendarDates();
                updateCalendarVisualMode();
            }, 50);
        }
    });

    // 달력 렌더링
    try {
        calendar.render();
        console.log('달력 렌더링 성공');
        console.log('할당된 예약 색상:', reservationColorMap);
        
        setTimeout(() => {
            calendar.updateSize();
            // 로그인 상태에 따른 초기 설정
            updateCalendarForLoginState();
        }, 100);
        
    } catch (error) {
        console.error('달력 렌더링 실패:', error);
    }
}

/* ==========================================================================
   날짜 선택 모드 관리
   ========================================================================== */

/**
 * 날짜 선택 모드 활성화
 */
function activateDateSelectionMode() {
    dateSelectionMode = true;
    updateCalendarVisualMode();
    updateDateInputPlaceholder();
    console.log('날짜 선택 모드 활성화');
}

/**
 * 날짜 선택 모드 비활성화
 */
function deactivateDateSelectionMode() {
    dateSelectionMode = false;
    updateCalendarVisualMode();
    updateDateInputPlaceholder();
    console.log('날짜 선택 모드 비활성화');
}

/**
 * 달력 시각적 모드 업데이트
 */
function updateCalendarVisualMode() {
    const calendarEl = document.getElementById('calendar');
    if (!calendarEl) return;
    
    if (dateSelectionMode) {
        calendarEl.classList.add('date-selection-mode');
    } else {
        calendarEl.classList.remove('date-selection-mode');
    }
}

/**
 * 날짜 입력 필드 플레이스홀더 업데이트
 */
function updateDateInputPlaceholder() {
    const dateInput = document.querySelector('.main-calendar-date-input');
    if (!dateInput) return;
    
    if (dateSelectionMode && !selectedDates.checkin && !selectedDates.checkout) {
        dateInput.value = '달력에서 날짜를 선택해주세요';
        dateInput.style.color = '#1da1f2';
    } else if (!selectedDates.checkin && !selectedDates.checkout) {
        dateInput.value = '날짜를 선택해주세요';
        dateInput.style.color = '#9ca3af';
    }
}

/* ==========================================================================
   날짜 선택 처리
   ========================================================================== */

/**
 * 메인 달력 날짜 선택 처리
 * @param {string} dateStr - 선택된 날짜 문자열
 */
function handleMainCalendarDateSelection(dateStr) {
    console.log('메인달력 날짜 선택:', dateStr);
    
    const selectedDate = createSafeDate(dateStr);
    const today = createSafeDate(getTodayString());

    if (selectedDate < today) {
        alert('과거 날짜는 선택할 수 없습니다.');
        return;
    }

    if (!selectedDates.checkin) {
        // 첫 번째 선택: 체크인 날짜 설정
        selectedDates.checkin = dateStr;
        selectedDates.checkout = null;
        console.log('메인달력 - 체크인 날짜 선택:', dateStr);
    } else if (!selectedDates.checkout) {
        // 두 번째 선택: 체크아웃 날짜 검증 및 설정
        const checkinDate = createSafeDate(selectedDates.checkin);
        
        if (selectedDate.getTime() <= checkinDate.getTime()) {
            alert('체크아웃 날짜는 체크인 날짜보다 늦어야 합니다.');
            return;
        }
        
        selectedDates.checkout = dateStr;
        console.log('메인달력 - 체크아웃 날짜 선택:', dateStr);
        
        // 선택 완료 후 즉시 모든 곳 동기화
        syncAllCalendars();
        calculateStayInfo();
        
        setTimeout(() => {
            deactivateDateSelectionMode();
            hideAllDropdowns();
        }, 500);
        
    } else {
        // 이미 둘 다 선택된 경우: 새로운 선택 시작
        selectedDates.checkin = dateStr;
        selectedDates.checkout = null;
        console.log('메인달력 - 새로운 체크인 날짜 선택:', dateStr);
    }
    
    // 변경사항 즉시 모든 곳에 적용
    syncAllCalendars();
}

/**
 * 미니 달력 날짜 선택 처리
 * @param {string} dateStr - 선택된 날짜 문자열
 */
function handleMiniCalendarDateSelection(dateStr) {
    console.log('미니달력 날짜 선택:', dateStr);
    
    const selectedDate = createSafeDate(dateStr);
    const today = createSafeDate(getTodayString());

    if (selectedDate < today) {
        console.log('과거 날짜 선택 시도:', dateStr);
        return;
    }

    if (!selectedDates.checkin) {
        selectedDates.checkin = dateStr;
        console.log('미니달력 - 체크인 날짜 설정:', dateStr);
    } else if (!selectedDates.checkout) {
        const checkinDate = createSafeDate(selectedDates.checkin);
        
        if (selectedDate.getTime() <= checkinDate.getTime()) {
            selectedDates.checkin = dateStr;
            selectedDates.checkout = null;
            console.log('미니달력 - 새로운 체크인 날짜 설정:', dateStr);
        } else {
            selectedDates.checkout = dateStr;
            console.log('미니달력 - 체크아웃 날짜 설정:', dateStr);
            
            // 체크아웃 선택 완료 후 즉시 동기화 및 드롭다운 닫기
            syncAllCalendars();
            calculateStayInfo();
            
            setTimeout(() => {
                hideAllDropdowns();
            }, 500);
            return;
        }
    } else {
        selectedDates.checkin = dateStr;
        selectedDates.checkout = null;
        console.log('미니달력 - 선택 초기화 후 새 체크인:', dateStr);
    }
    
    // 미니 달력과 메인 달력 모두 업데이트
    syncAllCalendars();
}

/**
 * 날짜 정보 표시 (선택 모드가 아닐 때)
 * @param {string} dateStr - 날짜 문자열
 */
function showDateInfo(dateStr) {
    const selectedDate = createSafeDate(dateStr);
    const today = createSafeDate(getTodayString());
    
    const dateText = selectedDate.toLocaleDateString('ko-KR', {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
        weekday: 'long'
    });
    
    let message = `선택하신 날짜: ${dateText}`;
    
    if (selectedDate < today) {
        message += '\n(과거 날짜입니다)';
    } else if (compareDatesOnly(selectedDate, today)) {
        message += '\n(오늘입니다)';
    }
    
    const events = calendar.getEvents().filter(event => {
        const eventStart = new Date(event.start);
        const eventEnd = event.end ? new Date(event.end) : eventStart;
        return selectedDate >= eventStart && selectedDate < eventEnd;
    });
    
    if (events.length > 0) {
        const eventTitles = events.map(e => {
            const props = e.extendedProps;
            return props.originalTitle || props.originalScheduleTitle || e.title;
        });
        message += `\n\n이 날짜의 예약: ${eventTitles.join(', ')}`;
    }
    
    message += '\n\n날짜를 선택하려면 "날짜를 선택해주세요" 입력창을 클릭하세요.';
    
    alert(message);
}

/* ==========================================================================
   모든 달력 동기화
   ========================================================================== */

/**
 * 모든 달력 동기화 통합 함수
 */
function syncAllCalendars() {
    updateDateDisplay();
    highlightMainCalendarDates();
    updateMiniCalendarDisplay();
    
    console.log('모든 달력 동기화 완료:', {
        checkin: selectedDates.checkin,
        checkout: selectedDates.checkout
    });
}

/**
 * 날짜 표시 업데이트
 */
function updateDateDisplay() {
    const dateInput = document.querySelector('.main-calendar-date-input');
    
    console.log('updateDateDisplay 호출됨:', selectedDates);
    
    if (selectedDates.checkin && selectedDates.checkout) {
        const checkinDate = createSafeDate(selectedDates.checkin);
        const checkoutDate = createSafeDate(selectedDates.checkout);
        
        const checkinText = checkinDate.toLocaleDateString('ko-KR', {
            month: 'short',
            day: 'numeric'
        });
        const checkoutText = checkoutDate.toLocaleDateString('ko-KR', {
            month: 'short', 
            day: 'numeric'
        });
        
        if (dateInput) {
            dateInput.value = `${checkinText} - ${checkoutText}`;
            dateInput.style.color = '#333';
        }
        
        console.log('날짜 입력창 업데이트:', `${checkinText} - ${checkoutText}`);
        
    } else if (selectedDates.checkin) {
        const checkinDate = createSafeDate(selectedDates.checkin);
        const checkinText = checkinDate.toLocaleDateString('ko-KR', {
            month: 'short',
            day: 'numeric'
        });
        
        if (dateInput) {
            dateInput.value = `${checkinText} - 체크아웃`;
            dateInput.style.color = '#1da1f2';
        }
        
        console.log('체크인만 선택됨:', checkinText);
    } else if (dateSelectionMode) {
        if (dateInput) {
            dateInput.value = '달력에서 날짜를 선택해주세요';
            dateInput.style.color = '#1da1f2';
        }
    } else {
        if (dateInput) {
            dateInput.value = '날짜를 선택해주세요';
            dateInput.style.color = '#9ca3af';
        }
    }
}

/**
 * 메인 달력 날짜 하이라이트
 */
function highlightMainCalendarDates() {
    // 기존 하이라이트 제거
    document.querySelectorAll('.fc-day-selected-checkin, .fc-day-selected-checkout, .fc-day-selected-range')
        .forEach(el => {
            el.classList.remove('fc-day-selected-checkin', 'fc-day-selected-checkout', 'fc-day-selected-range');
        });

    if (selectedDates.checkin) {
        const checkinEl = document.querySelector(`[data-date="${selectedDates.checkin}"]`) || 
                         document.querySelector(`td[data-date="${selectedDates.checkin}"]`) ||
                         document.querySelector(`.fc-daygrid-day[data-date="${selectedDates.checkin}"]`);
        if (checkinEl) checkinEl.classList.add('fc-day-selected-checkin');
    }

    if (selectedDates.checkout) {
        const checkoutEl = document.querySelector(`[data-date="${selectedDates.checkout}"]`) ||
                          document.querySelector(`td[data-date="${selectedDates.checkout}"]`) ||
                          document.querySelector(`.fc-daygrid-day[data-date="${selectedDates.checkout}"]`);
        if (checkoutEl) checkoutEl.classList.add('fc-day-selected-checkout');

        if (selectedDates.checkin && selectedDates.checkout) {
            const checkinDate = createSafeDate(selectedDates.checkin);
            const checkoutDate = createSafeDate(selectedDates.checkout);
            const currentDate = new Date(checkinDate);
            currentDate.setDate(currentDate.getDate() + 1);

            while (currentDate < checkoutDate) {
                const dateStr = formatDateToString(currentDate);
                const dayEl = document.querySelector(`[data-date="${dateStr}"]`) ||
                             document.querySelector(`td[data-date="${dateStr}"]`) ||
                             document.querySelector(`.fc-daygrid-day[data-date="${dateStr}"]`);
                if (dayEl) dayEl.classList.add('fc-day-selected-range');
                currentDate.setDate(currentDate.getDate() + 1);
            }
        }
    }
}

/**
 * 미니 달력 표시 업데이트
 */
function updateMiniCalendarDisplay() {
    const allDays = document.querySelectorAll('.mini-calendar-day[data-date]');
    
    allDays.forEach(day => {
        const dateStr = day.dataset.date;
        
        // 기존 선택 클래스들 모두 제거
        day.classList.remove('selected-checkin', 'selected-checkout', 'selected-range');
        
        // 체크인 날짜 표시
        if (selectedDates.checkin === dateStr) {
            day.classList.add('selected-checkin');
        }
        
        // 체크아웃 날짜 표시
        if (selectedDates.checkout === dateStr) {
            day.classList.add('selected-checkout');
        }
        
        // 체크인과 체크아웃 사이 날짜들 표시
        if (selectedDates.checkin && selectedDates.checkout) {
            const dayDate = createSafeDate(dateStr);
            const checkinDate = createSafeDate(selectedDates.checkin);
            const checkoutDate = createSafeDate(selectedDates.checkout);
            
            if (dayDate.getTime() > checkinDate.getTime() && dayDate.getTime() < checkoutDate.getTime()) {
                day.classList.add('selected-range');
            }
        }
    });
    
    console.log('미니 달력 업데이트 완료:', {
        checkin: selectedDates.checkin,
        checkout: selectedDates.checkout
    });
}

/* ==========================================================================
   미니 달력 생성 및 관리
   ========================================================================== */

/**
 * 미니 달력 생성
 * @param {number} year - 연도
 * @param {number} month - 월 (0-11)
 * @returns {string} 미니 달력 HTML
 */
function createMiniCalendar(year, month) {
    const firstDate = new Date(year, month, 1, 12, 0, 0, 0);
    const lastDate = new Date(year, month + 1, 0, 12, 0, 0, 0);
    
    const firstDay = firstDate.getDay(); // 첫째 날의 요일 (0: 일요일)
    const daysInMonth = lastDate.getDate(); // 해당 월의 총 일수
    
    const todayStr = getTodayString();
    
    let html = `
        <div class="mini-calendar">
            <div class="mini-calendar-header">
                <button type="button" class="mini-cal-prev" data-year="${year}" data-month="${month}">‹</button>
                <span>${year}년 ${month + 1}월</span>
                <button type="button" class="mini-cal-next" data-year="${year}" data-month="${month}">›</button>
            </div>
            <div class="mini-calendar-grid">
                <div class="mini-calendar-day-header">일</div>
                <div class="mini-calendar-day-header">월</div>
                <div class="mini-calendar-day-header">화</div>
                <div class="mini-calendar-day-header">수</div>
                <div class="mini-calendar-day-header">목</div>
                <div class="mini-calendar-day-header">금</div>
                <div class="mini-calendar-day-header">토</div>
    `;
    
    // 빈 셀들 (이전 달)
    for (let i = 0; i < firstDay; i++) {
        html += '<div class="mini-calendar-day other-month"></div>';
    }
    
    // 현재 달의 날짜들
    for (let day = 1; day <= daysInMonth; day++) {
        const dateStr = createSafeDateString(year, month, day);
        const currentDate = createSafeDate(dateStr);
        const todayDate = createSafeDate(todayStr);
        
        // 날짜 상태 확인
        const isToday = compareDatesOnly(dateStr, todayStr);
        const isPast = currentDate < todayDate;
        
        // 선택된 날짜 상태 확인
        const isCheckin = selectedDates.checkin === dateStr;
        const isCheckout = selectedDates.checkout === dateStr;
        
        let classes = 'mini-calendar-day';
        if (isToday) classes += ' today';
        if (isPast) classes += ' disabled';
        if (isCheckin) classes += ' selected-checkin';
        if (isCheckout) classes += ' selected-checkout';
        
        // 체크인과 체크아웃 사이 날짜 범위 확인
        if (selectedDates.checkin && selectedDates.checkout) {
            const checkinDate = createSafeDate(selectedDates.checkin);
            const checkoutDate = createSafeDate(selectedDates.checkout);
            
            if (currentDate.getTime() > checkinDate.getTime() && 
                currentDate.getTime() < checkoutDate.getTime()) {
                classes += ' selected-range';
            }
        }
        
        html += `<div class="${classes}" data-date="${dateStr}">${day}</div>`;
    }
    
    html += '</div></div>';
    return html;
}

/**
 * 미니 달력 업데이트
 * @param {number} year - 연도
 * @param {number} month - 월 (0-11)
 */
function updateMiniCalendar(year, month) {
    const container = document.querySelector('.mini-calendar-container');
    if (container) {
        container.innerHTML = createMiniCalendar(year, month);
        addMiniCalendarEvents();
        // 새로 생성된 미니 달력에 선택된 날짜 적용
        setTimeout(() => {
            updateMiniCalendarDisplay();
        }, 10);
    }
}

/* ==========================================================================
   드롭다운 관리
   ========================================================================== */

/**
 * 모든 드롭다운 숨기기
 */
function hideAllDropdowns() {
    const guestDropdown = document.querySelector('.guest-dropdown-container');
    const dateDropdown = document.querySelector('.date-dropdown-container');
    
    if (guestDropdown) {
        guestDropdown.style.maxHeight = '0';
        guestDropdown.style.opacity = '0';
        setTimeout(() => {
            if (guestDropdown.parentNode) {
                guestDropdown.remove();
            }
        }, 300);
    }
    
    if (dateDropdown) {
        dateDropdown.style.maxHeight = '0';
        dateDropdown.style.opacity = '0';
        setTimeout(() => {
            if (dateDropdown.parentNode) {
                dateDropdown.remove();
            }
        }, 300);
    }
    
    // 검색 카드 모서리 복원
    document.querySelectorAll('.search-card').forEach(card => {
        card.style.borderRadius = '16px';
        card.style.borderBottomLeftRadius = '16px';
        card.style.borderBottomRightRadius = '16px';
        card.style.marginBottom = '1rem';
    });
}

/**
 * 인원 선택 드롭다운 토글
 */
function toggleGuestDropdown() {
    const guestInput = document.querySelector('.main-calendar-guest-input');
    const parentCard = guestInput.closest('.search-card');
    const searchContainer = document.querySelector('.search-section-container');
    
    let existingDropdown = document.querySelector('.guest-dropdown-container');
    
    if (existingDropdown) {
        hideAllDropdowns();
        return;
    }
    
    hideAllDropdowns();
    
    // 현재 인원 수 파싱
    const currentGuestText = guestInput.value;
    let currentAdultCount = 2;
    let currentChildCount = 0;
    
    const adultMatch = currentGuestText.match(/성인 (\d+)명/);
    const childMatch = currentGuestText.match(/어린이 (\d+)명/);
    
    if (adultMatch) currentAdultCount = parseInt(adultMatch[1]);
    if (childMatch) currentChildCount = parseInt(childMatch[1]);
    
    const dropdownContainer = document.createElement('div');
    dropdownContainer.className = 'guest-dropdown-container';
    dropdownContainer.style.cssText = `
        max-height: 0;
        overflow: hidden;
        transition: all 0.3s ease;
        opacity: 0;
        background: white;
        border-left: 1px solid #ddd;
        border-right: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
        border-bottom-left-radius: 16px;
        border-bottom-right-radius: 16px;
        margin-bottom: 1rem;
        width: 100%;
        box-sizing: border-box;
    `;
    
    dropdownContainer.innerHTML = `
        <div style="padding: 20px;">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                <div>
                    <div style="font-weight: 600; margin-bottom: 4px;">성인</div>
                    <small style="color: #6c757d;">13세 이상</small>
                </div>
                <div style="display: flex; align-items: center; gap: 15px;">
                    <button type="button" class="guest-btn guest-btn-minus" data-type="adult">
                        <i class="fas fa-minus"></i>
                    </button>
                    <span class="guest-count" data-type="adult">${currentAdultCount}</span>
                    <button type="button" class="guest-btn guest-btn-plus" data-type="adult">
                        <i class="fas fa-plus"></i>
                    </button>
                </div>
            </div>
            
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <div>
                    <div style="font-weight: 600; margin-bottom: 4px;">어린이</div>
                    <small style="color: #6c757d;">2-12세</small>
                </div>
                <div style="display: flex; align-items: center; gap: 15px;">
                    <button type="button" class="guest-btn guest-btn-minus" data-type="child">
                        <i class="fas fa-minus"></i>
                    </button>
                    <span class="guest-count" data-type="child">${currentChildCount}</span>
                    <button type="button" class="guest-btn guest-btn-plus" data-type="child">
                        <i class="fas fa-plus"></i>
                    </button>
                </div>
            </div>
        </div>
    `;
    
    if (parentCard) {
        parentCard.style.borderBottomLeftRadius = '0';
        parentCard.style.borderBottomRightRadius = '0';
        parentCard.style.marginBottom = '0';
    }
    
    const searchButton = searchContainer.querySelector('.search-button');
    searchContainer.insertBefore(dropdownContainer, searchButton);
    
    setTimeout(() => {
        dropdownContainer.style.maxHeight = '160px';
        dropdownContainer.style.opacity = '1';
    }, 10);
    
    addGuestButtonEvents();
}

/**
 * 날짜 선택 드롭다운 토글
 */
function toggleDateDropdown() {
    const dateInput = document.querySelector('.main-calendar-date-input');
    const parentCard = dateInput.closest('.search-card');
    const searchContainer = document.querySelector('.search-section-container');
    
    let existingDropdown = document.querySelector('.date-dropdown-container');
    
    if (existingDropdown) {
        hideAllDropdowns();
        return;
    }
    
    hideAllDropdowns();
    
    const today = new Date();
    const currentMonth = today.getMonth();
    const currentYear = today.getFullYear();
    
    const dropdownContainer = document.createElement('div');
    dropdownContainer.className = 'date-dropdown-container';
    dropdownContainer.style.cssText = `
        max-height: 0;
        overflow: hidden;
        transition: all 0.3s ease;
        opacity: 0;
        background: white;
        border-left: 1px solid #ddd;
        border-right: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
        border-bottom-left-radius: 16px;
        border-bottom-right-radius: 16px;
        margin-bottom: 1rem;
        width: 100%;
        box-sizing: border-box;
    `;
    
    dropdownContainer.innerHTML = `
        <div style="padding: 15px;">
            <div class="mini-calendar-container" style="justify-content: center; width: 100%;">
                ${createMiniCalendar(currentYear, currentMonth)}
            </div>
        </div>
    `;
    
    if (parentCard) {
        parentCard.style.borderBottomLeftRadius = '0';
        parentCard.style.borderBottomRightRadius = '0';
        parentCard.style.marginBottom = '0';
    }
    
    const guestCard = searchContainer.querySelector('.search-card:has(.main-calendar-guest-input)');
    searchContainer.insertBefore(dropdownContainer, guestCard);
    
    setTimeout(() => {
        dropdownContainer.style.maxHeight = '350px';
        dropdownContainer.style.opacity = '1';
    }, 10);
    
    addMiniCalendarEvents();
}

/* ==========================================================================
   이벤트 핸들러
   ========================================================================== */

/**
 * 인원 선택 버튼 이벤트 추가
 */
function addGuestButtonEvents() {
    const guestBtns = document.querySelectorAll('.guest-dropdown-container .guest-btn');
    
    guestBtns.forEach(button => {
        button.addEventListener('click', function(e) {
            e.stopPropagation();
            
            const type = this.dataset.type;
            const isPlus = this.classList.contains('guest-btn-plus');
            const countEl = document.querySelector(`.guest-dropdown-container .guest-count[data-type="${type}"]`);
            
            if (!countEl) return;
            
            let currentCount = parseInt(countEl.textContent) || 0;
            
            if (isPlus) {
                const maxLimit = type === 'adult' ? 32 : 4;
                if (currentCount < maxLimit) {
                    countEl.textContent = currentCount + 1;
                }
            } else {
                const minLimit = type === 'adult' ? 1 : 0;
                if (currentCount > minLimit) {
                    countEl.textContent = currentCount - 1;
                }
            }
            
            updateGuestDisplay();
            updateGuestButtonStates();
        });
    });

    updateGuestButtonStates();
}

/**
 * 미니 달력 이벤트 추가
 */
function addMiniCalendarEvents() {
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
            updateMiniCalendar(year, month);
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
            updateMiniCalendar(year, month);
        });
    });
}

/**
 * 인원 표시 업데이트
 */
function updateGuestDisplay() {
    const guestInput = document.querySelector('.main-calendar-guest-input');
    const adultCountEl = document.querySelector('.guest-dropdown-container .guest-count[data-type="adult"]');
    const childCountEl = document.querySelector('.guest-dropdown-container .guest-count[data-type="child"]');
    
    if (guestInput && adultCountEl && childCountEl) {
        const adultCount = parseInt(adultCountEl.textContent) || 2;
        const childCount = parseInt(childCountEl.textContent) || 0;
        
        let displayText = `성인 ${adultCount}명`;
        if (childCount > 0) {
            displayText += `, 어린이 ${childCount}명`;
        }
        
        guestInput.value = displayText;
    }
}

/**
 * 인원 선택 버튼 상태 업데이트
 */
function updateGuestButtonStates() {
    const adultCountEl = document.querySelector('.guest-dropdown-container .guest-count[data-type="adult"]');
    const childCountEl = document.querySelector('.guest-dropdown-container .guest-count[data-type="child"]');
    
    if (adultCountEl) {
        const adultCount = parseInt(adultCountEl.textContent) || 2;
        const adultMinusBtn = document.querySelector('.guest-dropdown-container .guest-btn-minus[data-type="adult"]');
        const adultPlusBtn = document.querySelector('.guest-dropdown-container .guest-btn-plus[data-type="adult"]');
        
        if (adultMinusBtn) adultMinusBtn.disabled = adultCount <= 1;
        if (adultPlusBtn) adultPlusBtn.disabled = adultCount >= 32;
    }
    
    if (childCountEl) {
        const childCount = parseInt(childCountEl.textContent) || 0;
        const childMinusBtn = document.querySelector('.guest-dropdown-container .guest-btn-minus[data-type="child"]');
        const childPlusBtn = document.querySelector('.guest-dropdown-container .guest-btn-plus[data-type="child"]');
        
        if (childMinusBtn) childMinusBtn.disabled = childCount <= 0;
        if (childPlusBtn) childPlusBtn.disabled = childCount >= 4;
    }
}

/* ==========================================================================
   숙박 정보 및 검색 처리
   ========================================================================== */

/**
 * 숙박 정보 계산
 */
function calculateStayInfo() {
    if (selectedDates.checkin && selectedDates.checkout) {
        const checkinDate = createSafeDate(selectedDates.checkin);
        const checkoutDate = createSafeDate(selectedDates.checkout);
        
        // 체크인일과 체크아웃일 사이의 실제 숙박 일수 계산
        const timeDiff = checkoutDate.getTime() - checkinDate.getTime();
        const nights = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
        
        console.log(`선택된 기간: ${nights}박 ${nights + 1}일`);
        console.log(`체크인: ${selectedDates.checkin}, 체크아웃: ${selectedDates.checkout}`);
        showStayInfo(nights);
    }
}

/**
 * 숙박 정보 표시
 * @param {number} nights - 숙박 일수
 */
function showStayInfo(nights) {
    console.log(`총 숙박 일수: ${nights}박`);
}

/**
 * 검색 처리
 */
function handleSearch() {
    console.log('검색 버튼 클릭');
    
    if (!selectedDates.checkin || !selectedDates.checkout) {
        alert('체크인/체크아웃 날짜를 선택해주세요.');
        const dateInput = document.querySelector('.main-calendar-date-input');
        if (dateInput) {
            dateInput.click();
        }
        return;
    }
    
    const guestCountEls = document.querySelectorAll('.guest-count');
    let adultCount = 2;
    let childCount = 0;
    
    if (guestCountEls.length >= 2) {
        adultCount = parseInt(guestCountEls[0].textContent) || 2;
        childCount = parseInt(guestCountEls[1].textContent) || 0;
    }
    
    const searchData = {
        checkin: selectedDates.checkin,
        checkout: selectedDates.checkout,
        adults: adultCount,
        children: childCount
    };
    
    console.log('검색 조건:', searchData);
    
    alert(`검색 실행:\n체크인: ${selectedDates.checkin}\n체크아웃: ${selectedDates.checkout}\n성인: ${adultCount}명\n어린이: ${childCount}명`);
}

/**
 * 선택된 날짜 초기화
 */
function clearSelectedDates() {
    selectedDates = {
        checkin: null,
        checkout: null
    };
    
    // 모든 달력 동기화
    syncAllCalendars();
    
    console.log('날짜 선택 초기화 완료');
}

/* ==========================================================================
   DOM 로드 완료 후 초기화 및 이벤트 바인딩
   ========================================================================== */

document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM 로드 완료');
    
    // 달력 초기화
    initializeCalendar();
    
    // 이벤트 리스너 설정
    setupEventListeners();
    
    // 초기 로그인 상태 설정
    setTimeout(() => {
        updateCalendarForLoginState();
    }, 200);
    
    console.log('달력 시스템 초기화 완료');
    console.log('테스트 명령어: testLogin(), testLogout(), toggleLogin()');
});

/**
 * 이벤트 리스너 설정
 */
function setupEventListeners() {
    // 날짜 입력 필드 클릭
    const dateInput = document.querySelector('.main-calendar-date-input');
    if (dateInput) {
        dateInput.addEventListener('click', function(e) {
            console.log('날짜 입력 필드 클릭');
            e.preventDefault();
            e.stopPropagation();
            
            if (!dateSelectionMode) {
                activateDateSelectionMode();
            }
            
            toggleDateDropdown();
        });
    }

    // 인원 입력 필드 클릭
    const guestInput = document.querySelector('.main-calendar-guest-input');
    if (guestInput) {
        guestInput.addEventListener('click', function(e) {
            console.log('인원 입력 필드 클릭');
            e.stopPropagation();
            toggleGuestDropdown();
        });
    }

    // 검색 버튼
    const searchButton = document.querySelector('.main-calendar-search-button');
    if (searchButton) {
        searchButton.addEventListener('click', function() {
            handleSearch();
        });
    }

    // 외부 클릭시 드롭다운 닫기
    document.addEventListener('click', function(e) {
        const clickedElement = e.target;
        const dateCard = clickedElement.closest('.search-card:has(.main-calendar-date-input)');
        const guestCard = clickedElement.closest('.search-card:has(.main-calendar-guest-input)');
        const dateDropdown = clickedElement.closest('.date-dropdown-container');
        const guestDropdown = clickedElement.closest('.guest-dropdown-container');
        const calendarEl = clickedElement.closest('#calendar');
        
        if (!dateCard && !guestCard && !dateDropdown && !guestDropdown && !calendarEl) {
            hideAllDropdowns();
            deactivateDateSelectionMode();
        }
    });

    // 키보드 이벤트 처리
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            hideAllDropdowns();
            deactivateDateSelectionMode();
        }
        
        if (e.key === 'Enter' && (selectedDates.checkin && selectedDates.checkout)) {
            handleSearch();
        }
    });
}

/* ==========================================================================
   테스트용 전역 함수 (개발자 콘솔에서 사용)
   ========================================================================== */

// 개발자 콘솔에서 테스트할 수 있도록 전역 함수로 노출
window.testLogin = function() {
    isLoggedIn = true;
    updateCalendarForLoginState();
    console.log('테스트: 로그인 상태로 변경');
};

window.testLogout = function() {
    isLoggedIn = false;
    updateCalendarForLoginState();
    console.log('테스트: 비로그인 상태로 변경');
};

window.toggleLogin = toggleLoginState;

/* ==========================================================================
   전역 함수 노출 (외부에서 접근 가능)
   ========================================================================== */

window.TravelCalendar = {
    activateDateSelectionMode,
    deactivateDateSelectionMode,
    clearSelectedDates,
    getSelectedDates: () => selectedDates,
    isSelectionMode: () => dateSelectionMode,
    syncAllCalendars,
    handleSearch
};