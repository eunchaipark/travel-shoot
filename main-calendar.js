// 메인 달력 날짜 선택 처리
function handleMainCalendarDateSelection(dateStr) {
    const selectedDate = new Date(dateStr);
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    // 과거 날짜 선택 방지
    if (selectedDate < today) {
        alert('과거 날짜는 선택할 수 없습니다.');
        return;
    }

    if (!selectedDates.checkin) {
        selectedDates.checkin = dateStr;
        updateDateDisplay();
        highlightMainCalendarDates();
        // 미니 달력도 업데이트
        updateMiniCalendarDisplay();
    } else if (!selectedDates.checkout) {
        const checkinDate = new Date(selectedDates.checkin);
        if (selectedDate <= checkinDate) {
            alert('체크아웃 날짜는 체크인 날짜보다 늦어야 합니다.');
            return;
        }
        
        selectedDates.checkout = dateStr;
        updateDateDisplay();
        highlightMainCalendarDates();
        calculateStayInfo();
        // 미니 달력도 업데이트
        updateMiniCalendarDisplay();
    } else {
        // 새로운 선택 시작
        clearSelectedDates();
        selectedDates.checkin = dateStr;
        updateDateDisplay();
        highlightMainCalendarDates();
        // 미니 달력도 업데이트
        updateMiniCalendarDisplay();
    }
}

// 메인 달력 날짜 하이라이트
function highlightMainCalendarDates() {
    // 기존 하이라이트 제거
    document.querySelectorAll('.fc-day-selected-checkin, .fc-day-selected-checkout, .fc-day-selected-range')
        .forEach(el => {
            el.classList.remove('fc-day-selected-checkin', 'fc-day-selected-checkout', 'fc-day-selected-range');
        });

    if (selectedDates.checkin) {
        // FullCalendar의 날짜 셀 찾기 (더 정확한 셀렉터 사용)
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

        // 체크인과 체크아웃 사이 날짜들 하이라이트
        if (selectedDates.checkin && selectedDates.checkout) {
            const checkinDate = new Date(selectedDates.checkin);
            const checkoutDate = new Date(selectedDates.checkout);
            const currentDate = new Date(checkinDate);
            currentDate.setDate(currentDate.getDate() + 1);

            while (currentDate < checkoutDate) {
                const dateStr = currentDate.toISOString().split('T')[0];
                const dayEl = document.querySelector(`[data-date="${dateStr}"]`) ||
                             document.querySelector(`td[data-date="${dateStr}"]`) ||
                             document.querySelector(`.fc-daygrid-day[data-date="${dateStr}"]`);
                if (dayEl) dayEl.classList.add('fc-day-selected-range');
                currentDate.setDate(currentDate.getDate() + 1);
            }
        }
    }
}

// 선택된 날짜 초기화
function clearSelectedDates() {
    selectedDates = {
        checkin: null,
        checkout: null
    };
    highlightMainCalendarDates();
    updateMiniCalendarDisplay(); // 미니 달력도 초기화
    updateDateDisplay();
}

// 숙박 정보 계산
function calculateStayInfo() {
    if (selectedDates.checkin && selectedDates.checkout) {
        const checkinDate = new Date(selectedDates.checkin);
        const checkoutDate = new Date(selectedDates.checkout);
        const nights = Math.ceil((checkoutDate - checkinDate) / (1000 * 60 * 60 * 24));
        
        console.log(`선택된 기간: ${nights}박 ${nights + 1}일`);
    }
}

// ==========================================================================
// 날짜 포맷 유틸리티 함수
// ==========================================================================
function formatDate(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const weekdays = ['일', '월', '화', '수', '목', '금', '토'];
    const weekday = weekdays[date.getDay()];
    
    return `${year}.${month}.${day}(${weekday})`;
}

// ==========================================================================
// 전역 변수
// ==========================================================================
let calendar = null;
let dateSelectionMode = false;
let selectedDates = {
    checkin: null,
    checkout: null
};

// ==========================================================================
// 미니 달력 생성 함수
// ==========================================================================
function createMiniCalendar(year, month) {
    const date = new Date(year, month, 1);
    const firstDay = date.getDay();
    const daysInMonth = new Date(year, month + 1, 0).getDate();
    const today = new Date();
    
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
        const currentDate = new Date(year, month, day);
        const dateStr = currentDate.toISOString().split('T')[0];
        const isToday = currentDate.toDateString() === today.toDateString();
        const isPast = currentDate < today.setHours(0, 0, 0, 0);
        const isCheckin = selectedDates.checkin === dateStr;
        const isCheckout = selectedDates.checkout === dateStr;
        
        let classes = 'mini-calendar-day';
        if (isToday) classes += ' today';
        if (isPast) classes += ' disabled';
        if (isCheckin) classes += ' selected-checkin';
        if (isCheckout) classes += ' selected-checkout';
        
        // 선택된 범위 확인
        if (selectedDates.checkin && selectedDates.checkout) {
            const checkinDate = new Date(selectedDates.checkin);
            const checkoutDate = new Date(selectedDates.checkout);
            if (currentDate > checkinDate && currentDate < checkoutDate) {
                classes += ' selected-range';
            }
        }
        
        html += `<div class="${classes}" data-date="${dateStr}">${day}</div>`;
    }
    
    html += '</div></div>';
    return html;
}

// ==========================================================================
// 드롭다운 관리 함수들
// ==========================================================================

// 모든 드롭다운 닫기 (슬라이드 애니메이션으로)
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
    
    // 모든 카드 스타일 완전히 초기화
    document.querySelectorAll('.search-card').forEach(card => {
        card.style.borderRadius = '16px';
        card.style.borderBottomLeftRadius = '16px';
        card.style.borderBottomRightRadius = '16px';
        card.style.marginBottom = '1rem'; // 원래 간격 복구
    });
}

// 인원 드롭다운 토글
function toggleGuestDropdown() {
    const guestInput = document.querySelector('.main-calendar-guest-input');
    const parentCard = guestInput.closest('.search-card');
    const searchContainer = document.querySelector('.search-section-container');
    
    // 기존 드롭다운이 있는지 확인
    let existingDropdown = document.querySelector('.guest-dropdown-container');
    
    if (existingDropdown) {
        hideAllDropdowns();
        return;
    }
    
    // 다른 드롭다운들 먼저 닫기
    hideAllDropdowns();
    
    // 현재 설정된 인원수 가져오기 (상단 입력 필드에서)
    const currentGuestText = guestInput.value;
    let currentAdultCount = 2;
    let currentChildCount = 0;
    
    // 현재 텍스트에서 인원수 파싱
    const adultMatch = currentGuestText.match(/성인 (\d+)명/);
    const childMatch = currentGuestText.match(/어린이 (\d+)명/);
    
    if (adultMatch) currentAdultCount = parseInt(adultMatch[1]);
    if (childMatch) currentChildCount = parseInt(childMatch[1]);
    
    // 새로운 드롭다운 컨테이너 생성
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
    `;
    
    // 현재 설정된 값으로 드롭다운 생성
    dropdownContainer.innerHTML = `
        <div class="p-3">
            <!-- 성인 -->
            <div class="d-flex justify-content-between align-items-center mb-3">
                <div>
                    <div class="fw-semibold">성인</div>
                    <small class="text-muted">13세 이상</small>
                </div>
                <div class="d-flex align-items-center gap-3">
                    <button type="button" class="guest-btn guest-btn-minus" data-type="adult">
                        <i class="fas fa-minus"></i>
                    </button>
                    <span class="guest-count" data-type="adult">${currentAdultCount}</span>
                    <button type="button" class="guest-btn guest-btn-plus" data-type="adult">
                        <i class="fas fa-plus"></i>
                    </button>
                </div>
            </div>
            
            <!-- 어린이 -->
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <div class="fw-semibold">어린이</div>
                    <small class="text-muted">2-12세</small>
                </div>
                <div class="d-flex align-items-center gap-3">
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
    
    // 부모 카드 스타일 수정 (자연스러운 연결)
    if (parentCard) {
        parentCard.style.borderBottomLeftRadius = '0';
        parentCard.style.borderBottomRightRadius = '0';
        parentCard.style.marginBottom = '0';
    }
    
    // 검색 버튼 찾아서 그 앞에 삽입
    const searchButton = searchContainer.querySelector('.search-button');
    searchContainer.insertBefore(dropdownContainer, searchButton);
    
    // 애니메이션으로 드롭다운 표시 (높이 줄임)
    setTimeout(() => {
        dropdownContainer.style.maxHeight = '150px'; // 적용 버튼 제거로 높이 줄임
        dropdownContainer.style.opacity = '1';
    }, 10);
    
    // 인원 조절 버튼 이벤트 추가
    addGuestButtonEvents();
}

// 날짜 드롭다운 토글  
function toggleDateDropdown() {
    const dateInput = document.querySelector('.main-calendar-date-input');
    const parentCard = dateInput.closest('.search-card');
    const searchContainer = document.querySelector('.search-section-container');
    
    // 기존 드롭다운이 있는지 확인
    let existingDropdown = document.querySelector('.date-dropdown-container');
    
    if (existingDropdown) {
        hideAllDropdowns();
        return;
    }
    
    // 다른 드롭다운들 먼저 닫기
    hideAllDropdowns();
    
    // 현재 날짜
    const today = new Date();
    const currentMonth = today.getMonth();
    const currentYear = today.getFullYear();
    
    // 새로운 드롭다운 컨테이너 생성
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
    `;
    
    // 간소화된 달력만 표시
    dropdownContainer.innerHTML = `
        <div class="p-3">
            <div class="mini-calendar-container" style="justify-content: center;">
                ${createMiniCalendar(currentYear, currentMonth)}
            </div>
        </div>
    `;
    
    // 부모 카드 스타일 수정
    if (parentCard) {
        parentCard.style.borderBottomLeftRadius = '0';
        parentCard.style.borderBottomRightRadius = '0';
        parentCard.style.marginBottom = '0';
    }
    
    // 인원 선택 카드 찾아서 그 앞에 삽입
    const guestCard = searchContainer.querySelector('.search-card:has(.main-calendar-guest-input)');
    searchContainer.insertBefore(dropdownContainer, guestCard);
    
    // 애니메이션으로 드롭다운 표시 (높이 증가)
    setTimeout(() => {
        dropdownContainer.style.maxHeight = '320px'; // 높이 늘림
        dropdownContainer.style.opacity = '1';
    }, 10);
    
    // 미니 달력 이벤트 추가
    addMiniCalendarEvents();
}

// ==========================================================================
// 이벤트 핸들러 함수들
// ==========================================================================

// 인원 버튼 이벤트 추가
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
            
            // 실시간으로 상단 입력 필드 업데이트
            updateGuestDisplay();
            updateGuestButtonStates();
        });
    });

    // 적용 버튼 제거됨 - 실시간 업데이트로 대체
    updateGuestButtonStates();
}

// 미니 달력 이벤트 추가
function addMiniCalendarEvents() {
    // 날짜 클릭 이벤트
    const miniCalDays = document.querySelectorAll('.mini-calendar-day:not(.disabled):not(.other-month)');
    miniCalDays.forEach(day => {
        day.addEventListener('click', function(e) {
            e.stopPropagation(); // 이벤트 전파 방지
            const dateStr = this.dataset.date;
            handleMiniCalendarDateSelection(dateStr);
        });
    });
    
    // 이전/다음 버튼 이벤트
    const prevBtns = document.querySelectorAll('.mini-cal-prev');
    const nextBtns = document.querySelectorAll('.mini-cal-next');
    
    prevBtns.forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.stopPropagation(); // 중요: 이벤트 전파 방지
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
            e.stopPropagation(); // 중요: 이벤트 전파 방지
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

// 미니 달력 업데이트
function updateMiniCalendar(year, month) {
    const container = document.querySelector('.mini-calendar-container');
    
    container.innerHTML = createMiniCalendar(year, month);
    
    addMiniCalendarEvents();
}

// 미니 달력 날짜 선택 처리
function handleMiniCalendarDateSelection(dateStr) {
    const selectedDate = new Date(dateStr);
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    if (selectedDate < today) return;

    if (!selectedDates.checkin) {
        selectedDates.checkin = dateStr;
    } else if (!selectedDates.checkout) {
        const checkinDate = new Date(selectedDates.checkin);
        if (selectedDate <= checkinDate) {
            selectedDates.checkin = dateStr;
            selectedDates.checkout = null;
        } else {
            selectedDates.checkout = dateStr;
            // 체크아웃 날짜를 선택하면 바로 적용하고 드롭다운 닫기
            updateDateDisplay();
            highlightMainCalendarDates(); // 메인 달력도 업데이트
            hideAllDropdowns();
            return;
        }
    } else {
        selectedDates.checkin = dateStr;
        selectedDates.checkout = null;
    }
    
    // 화면 업데이트 (미니 달력과 메인 달력 모두)
    updateMiniCalendarDisplay();
    highlightMainCalendarDates(); // 메인 달력도 업데이트
}

// 미니 달력 표시 업데이트
function updateMiniCalendarDisplay() {
    const allDays = document.querySelectorAll('.mini-calendar-day[data-date]');
    
    allDays.forEach(day => {
        const dateStr = day.dataset.date;
        day.classList.remove('selected-checkin', 'selected-checkout', 'selected-range');
        
        if (selectedDates.checkin === dateStr) {
            day.classList.add('selected-checkin');
        }
        if (selectedDates.checkout === dateStr) {
            day.classList.add('selected-checkout');
        }
        
        // 범위 표시
        if (selectedDates.checkin && selectedDates.checkout) {
            const dayDate = new Date(dateStr);
            const checkinDate = new Date(selectedDates.checkin);
            const checkoutDate = new Date(selectedDates.checkout);
            
            if (dayDate > checkinDate && dayDate < checkoutDate) {
                day.classList.add('selected-range');
            }
        }
    });
}

// 날짜 선택 정보 업데이트
function updateDateSelectionInfo() {
    const checkinDisplay = document.querySelector('.selected-checkin-display');
    const checkoutDisplay = document.querySelector('.selected-checkout-display');
    
    if (checkinDisplay) {
        checkinDisplay.textContent = selectedDates.checkin ? 
            formatDate(new Date(selectedDates.checkin)) : '날짜 선택';
    }
    
    if (checkoutDisplay) {
        checkoutDisplay.textContent = selectedDates.checkout ? 
            formatDate(new Date(selectedDates.checkout)) : '날짜 선택';
    }
}

// ==========================================================================
// 기존 함수들 (간소화)
// ==========================================================================

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

function updateDateDisplay() {
    const dateInput = document.querySelector('.main-calendar-date-input');
    
    if (selectedDates.checkin && selectedDates.checkout) {
        const checkinDate = new Date(selectedDates.checkin);
        const checkoutDate = new Date(selectedDates.checkout);
        
        const checkinText = checkinDate.toLocaleDateString('ko-KR', {
            month: 'short',
            day: 'numeric'
        });
        const checkoutText = checkoutDate.toLocaleDateString('ko-KR', {
            month: 'short', 
            day: 'numeric'
        });
        
        if (dateInput) dateInput.value = `${checkinText} - ${checkoutText}`;
        
    } else if (selectedDates.checkin) {
        const checkinDate = new Date(selectedDates.checkin);
        const checkinText = checkinDate.toLocaleDateString('ko-KR', {
            month: 'short',
            day: 'numeric'
        });
        
        if (dateInput) dateInput.value = `${checkinText} - 체크아웃`;
    } else {
        if (dateInput) dateInput.value = '날짜를 선택해주세요';
    }
}

// ==========================================================================
// 달력 초기화 및 메인 기능
// ==========================================================================
document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM 로드 완료');
    
    // 달력 초기화
    const calendarEl = document.getElementById('calendar');
    
    if (!calendarEl) {
        console.error('달력 컨테이너를 찾을 수 없습니다.');
        return;
    }

    // 예약 데이터
    const reservationEvents = [
        {
            title: '제주도 여행',
            start: '2025-09-08',
            end: '2025-09-10',
            className: 'fc-event-confirmed'
        },
        {
            title: '부산 출장',
            start: '2025-09-15',
            className: 'fc-event-checkedin'
        }
    ];

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
        dayMaxEvents: 2,
        moreLinkClick: 'popover',
        displayEventTime: false,
        events: reservationEvents,
        dateClick: function(info) {
            console.log('메인 달력 날짜 클릭:', info.dateStr);
            handleMainCalendarDateSelection(info.dateStr);
        },
        eventClick: function(info) {
            console.log('이벤트 클릭:', info.event.title);
        },
        datesSet: function(info) {
            // 달력의 날짜가 변경될 때마다 하이라이트 다시 적용
            console.log('달력 날짜 변경됨:', info.start, info.end);
            setTimeout(() => {
                highlightMainCalendarDates();
            }, 50); // DOM 업데이트 후 하이라이트 적용
        }
    });

    // 달력 렌더링
    try {
        calendar.render();
        console.log('달력 렌더링 성공');
        
        setTimeout(() => {
            calendar.updateSize();
        }, 100);
        
    } catch (error) {
        console.error('달력 렌더링 실패:', error);
    }

    // ==========================================================================
    // 이벤트 리스너 설정
    // ==========================================================================

    // 날짜 입력 필드 클릭
    const dateInput = document.querySelector('.main-calendar-date-input');
    if (dateInput) {
        dateInput.addEventListener('click', function(e) {
            console.log('날짜 입력 필드 클릭');
            e.preventDefault();
            e.stopPropagation();
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
            console.log('검색 버튼 클릭');
            
            if (!selectedDates.checkin || !selectedDates.checkout) {
                alert('체크인/체크아웃 날짜를 선택해주세요.');
                return;
            }
            
            const adultCount = parseInt(document.querySelector('.guest-count[data-type="adult"]')?.textContent) || 2;
            const childCount = parseInt(document.querySelector('.guest-count[data-type="child"]')?.textContent) || 0;
            
            console.log('검색 조건:', {
                checkin: selectedDates.checkin,
                checkout: selectedDates.checkout,
                adults: adultCount,
                children: childCount
            });
            
            alert(`검색 조건:\n체크인: ${selectedDates.checkin}\n체크아웃: ${selectedDates.checkout}\n성인: ${adultCount}명\n어린이: ${childCount}명`);
        });
    }

    // 외부 클릭시 드롭다운 닫기
    document.addEventListener('click', function(e) {
        const clickedElement = e.target;
        const dateCard = clickedElement.closest('.search-card:has(.main-calendar-date-input)');
        const guestCard = clickedElement.closest('.search-card:has(.main-calendar-guest-input)');
        const dateDropdown = clickedElement.closest('.date-dropdown-container');
        const guestDropdown = clickedElement.closest('.guest-dropdown-container');
        
        // 날짜나 인원 관련 요소가 아닌 곳을 클릭하면 모든 드롭다운 닫기
        if (!dateCard && !guestCard && !dateDropdown && !guestDropdown) {
            // 개별 카드 스타일 복구
            const allDateCards = document.querySelectorAll('.search-card:has(.main-calendar-date-input)');
            const allGuestCards = document.querySelectorAll('.search-card:has(.main-calendar-guest-input)');
            
            allDateCards.forEach(card => {
                card.style.borderRadius = '16px';
                card.style.marginBottom = '1rem';
            });
            
            allGuestCards.forEach(card => {
                card.style.borderRadius = '16px';
                card.style.marginBottom = '1rem';
            });
            
            hideAllDropdowns();
        }
    });

    // ==========================================================================
    // 초기화
    // ==========================================================================
    console.log('달력 시스템 초기화 완료');
});