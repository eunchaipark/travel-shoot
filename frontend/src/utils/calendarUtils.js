/* ==========================================================================
   날짜 처리 유틸리티 함수들
   ========================================================================== */

/**
 * 안전한 날짜 문자열 생성 (시간대 문제 해결)
 */
export function createSafeDateString(year, month, day) {
    const date = new Date(year, month, day, 12, 0, 0, 0);
    const yyyy = date.getFullYear();
    const mm = String(date.getMonth() + 1).padStart(2, '0');
    const dd = String(date.getDate()).padStart(2, '0');
    return `${yyyy}-${mm}-${dd}`;
}

/**
 * 안전한 날짜 객체 생성
 */
export function createSafeDate(dateStr) {
    if (!dateStr || typeof dateStr !== 'string') return null;
    
    const [year, month, day] = dateStr.split('-').map(Number);
    if (!year || !month || !day) return null;
    
    return new Date(year, month - 1, day, 12, 0, 0, 0);
}

/**
 * 날짜 객체를 YYYY-MM-DD 문자열로 변환
 */
export function formatDateToString(date) {
    if (!date || !(date instanceof Date)) return null;
    
    const yyyy = date.getFullYear();
    const mm = String(date.getMonth() + 1).padStart(2, '0');
    const dd = String(date.getDate()).padStart(2, '0');
    return `${yyyy}-${mm}-${dd}`;
}

/**
 * 날짜 비교 함수 (시간 제거)
 */
export function compareDatesOnly(date1, date2) {
    if (!date1 || !date2) return false;
    
    const d1 = typeof date1 === 'string' ? createSafeDate(date1) : date1;
    const d2 = typeof date2 === 'string' ? createSafeDate(date2) : date2;
    
    if (!d1 || !d2) return false;
    
    return formatDateToString(d1) === formatDateToString(d2);
}

/**
 * 오늘 날짜 문자열 반환
 */
export function getTodayString() {
    return formatDateToString(new Date());
}

/* ==========================================================================
   예약 데이터 및 색상 관리
   ========================================================================== */

// 예약별 색상 풀
export const RESERVATION_COLOR_POOL = [
    '#6C3BED', 
    '#ED3B9A',
    '#d464dcff', 
    '#3B45ED',  
    '#C88CF0'  
];

// 일정 유형별 색상 설정
export const SCHEDULE_COLORS = {
    stay: '#1E3A8A',
    restaurants: '#F05650',
    tourist_spots: '#75B611'
};

// 예약 ID별 색상 매핑 저장
let reservationColorMap = {};

/**
 * 예약에 색상 할당
 */
export function assignReservationColor(reservationId) {
    if (!reservationColorMap[reservationId]) {
        const assignedCount = Object.keys(reservationColorMap).length;
        const colorIndex = assignedCount % RESERVATION_COLOR_POOL.length;
        reservationColorMap[reservationId] = RESERVATION_COLOR_POOL[colorIndex];
    }
    return reservationColorMap[reservationId];
}

/**
 * 시간 포맷팅 (24시간 → 12시간 형식)
 */
export function formatScheduleTime(time) {
    const [hours, minutes] = time.split(':');
    const hour = parseInt(hours);
    const period = hour >= 12 ? 'p' : 'am';
    const displayHour = hour > 12 ? hour - 12 : (hour === 0 ? 12 : hour);
    const displayMinutes = minutes === '00' ? '' : `:${minutes}`;
    return `${displayHour}${displayMinutes}${period}`;
}

/**
 * 텍스트 길이 제한
 */
export function truncateText(text, maxLength = 12) {
    if (!text || text.length <= maxLength) return text;
    return text.substring(0, maxLength - 3) + '...';
}

/* ==========================================================================
   예약 원본 데이터
   ========================================================================== */

export const RAW_RESERVATION_DATA = [
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
 */
export function convertToCalendarEvents(reservationData) {
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

/**
 * 미니 달력 생성
 */
export function createMiniCalendar(year, month, selectedDates) {
    const firstDate = new Date(year, month, 1, 12, 0, 0, 0);
    const lastDate = new Date(year, month + 1, 0, 12, 0, 0, 0);
    
    const firstDay = firstDate.getDay();
    const daysInMonth = lastDate.getDate();
    
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
        
        const isToday = compareDatesOnly(dateStr, todayStr);
        const isPast = currentDate < todayDate;
        
        const isCheckin = selectedDates.checkin === dateStr;
        const isCheckout = selectedDates.checkout === dateStr;
        
        let classes = 'mini-calendar-day';
        if (isToday) classes += ' today';
        if (isPast) classes += ' disabled';
        if (isCheckin) classes += ' selected-checkin';
        if (isCheckout) classes += ' selected-checkout';
        
        // 체크인과 체크아웃 사이 날짜 범위
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
 * 숙박 일수 계산
 */
export function calculateNights(checkinDate, checkoutDate) {
    const checkin = createSafeDate(checkinDate);
    const checkout = createSafeDate(checkoutDate);
    
    if (!checkin || !checkout) return 0;
    
    const timeDiff = checkout.getTime() - checkin.getTime();
    return Math.floor(timeDiff / (1000 * 60 * 60 * 24));
}