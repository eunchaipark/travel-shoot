/**
 * 예약별 색상 풀 (5가지 색상으로 순차 할당)
 */
export const RESERVATION_COLOR_POOL = [
  '#6C3BED', 
  '#ED3B9A',
  '#d464dcff', 
  '#3B45ED',  
  '#C88CF0'  
];

/**
 * 일정 유형별 색상 설정
 */
export const SCHEDULE_COLORS = {
  stay: '#1E3A8A',
  restaurants: '#F05650',
  tourist_spots: '#75B611'
};

/**
 * 인원 선택 제한
 */
export const GUEST_LIMITS = {
  adult: {
    min: 1,
    max: 32
  },
  child: {
    min: 0,
    max: 4
  }
};

/**
 * FullCalendar 설정
 */
export const CALENDAR_CONFIG = {
  locale: 'ko',
  initialView: 'dayGridMonth',
  height: 'auto',
  expandRows: true,
  dayMaxEvents: 3,
  moreLinkClick: 'popover',
  displayEventTime: false,
  headerToolbar: {
    left: 'prev',
    center: 'title',
    right: 'next today'
  },
  buttonText: {
    today: '오늘'
  }
};

/**
 * 예약 상태
 */
export const RESERVATION_STATUS = {
  CONFIRMED: 'confirmed',
  CHECKEDIN: 'checkedin',
  COMPLETED: 'completed',
  CANCELLED: 'cancelled'
};