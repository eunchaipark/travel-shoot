// ========================================
// Import 상수
// ========================================
import {
  RESERVATION_COLOR_POOL,
  SCHEDULE_COLORS,
} from "@/utils/formatters/calendarConstants";

// ========================================
// 날짜 유틸리티 함수
// ========================================

/**
 * 안전한 날짜 문자열 생성 (타임존 문제 방지)
 * @param {number} year - 연도
 * @param {number} month - 월 (0-11)
 * @param {number} day - 일
 * @returns {string} YYYY-MM-DD 형식의 날짜 문자열
 */
export function createSafeDateString(year, month, day) {
  const date = new Date(year, month, day, 12, 0, 0, 0);
  const yyyy = date.getFullYear();
  const mm = String(date.getMonth() + 1).padStart(2, "0");
  const dd = String(date.getDate()).padStart(2, "0");
  return `${yyyy}-${mm}-${dd}`;
}

/**
 * 안전한 날짜 객체 생성
 * @param {string} dateStr - YYYY-MM-DD 형식의 날짜 문자열
 * @returns {Date|null} 날짜 객체 또는 null
 */
export function createSafeDate(dateStr) {
  if (!dateStr || typeof dateStr !== "string") return null;

  const [year, month, day] = dateStr.split("-").map(Number);
  if (!year || !month || !day) return null;

  return new Date(year, month - 1, day, 12, 0, 0, 0);
}

/**
 * 날짜 객체를 YYYY-MM-DD 문자열로 변환
 * @param {Date} date - 날짜 객체
 * @returns {string|null} YYYY-MM-DD 형식의 문자열 또는 null
 */
export function formatDateToString(date) {
  if (!date || !(date instanceof Date)) return null;

  const yyyy = date.getFullYear();
  const mm = String(date.getMonth() + 1).padStart(2, "0");
  const dd = String(date.getDate()).padStart(2, "0");
  return `${yyyy}-${mm}-${dd}`;
}

/**
 * 날짜 비교 함수 (시간 제외)
 * @param {string|Date} date1 - 첫 번째 날짜
 * @param {string|Date} date2 - 두 번째 날짜
 * @returns {boolean} 같은 날짜인지 여부
 */
export function compareDatesOnly(date1, date2) {
  if (!date1 || !date2) return false;

  const d1 = typeof date1 === "string" ? createSafeDate(date1) : date1;
  const d2 = typeof date2 === "string" ? createSafeDate(date2) : date2;

  if (!d1 || !d2) return false;

  return formatDateToString(d1) === formatDateToString(d2);
}

/**
 * 오늘 날짜 문자열 반환
 * @returns {string} 오늘 날짜 YYYY-MM-DD 형식
 */
export function getTodayString() {
  return formatDateToString(new Date());
}

/**
 * 한글 날짜 포맷팅
 * @param {string|Date} date - 날짜
 * @param {object} options - Intl.DateTimeFormat 옵션
 * @returns {string} 포맷된 날짜 문자열
 */
export function formatDateKorean(date, options = {}) {
  const dateObj = typeof date === "string" ? createSafeDate(date) : date;
  if (!dateObj) return "";

  return dateObj.toLocaleDateString("ko-KR", {
    month: "short",
    day: "numeric",
    ...options,
  });
}

// ========================================
// 예약 샘플 데이터
// ========================================

/**
 * 예약 원본 데이터 (테스트용)
 */
export const RAW_RESERVATION_DATA = [
  {
    id: "reservation_001",
    title: "제주도 여행",
    startDate: "2025-09-08",
    endDate: "2025-09-10",
    accommodationName: "제주 오션뷰 펜션",
    status: "confirmed",
    schedules: [
      { time: "10:30", title: "체크인", type: "stay" },
      { time: "12:00", title: "점심 (흑돼지)", type: "restaurant" },
      { time: "15:00", title: "한라산 등반", type: "activity" },
      { time: "11:00", title: "체크아웃", type: "stay", date: "2025-09-10" },
    ],
  },
  {
    id: "reservation_002",
    title: "부산 출장",
    startDate: "2025-09-15",
    endDate: "2025-09-17",
    accommodationName: "해운대 호텔",
    status: "confirmed",
    schedules: [
      { time: "14:00", title: "비즈니스 미팅", type: "stay" },
      { time: "19:00", title: "회식", type: "restaurant" },
    ],
  },
  {
    id: "reservation_003",
    title: "강릉 휴가",
    startDate: "2025-09-20",
    endDate: "2025-09-22",
    accommodationName: "강릉 바다뷰 펜션",
    status: "confirmed",
    schedules: [
      { time: "09:00", title: "정동진 일출", type: "activity" },
      { time: "11:30", title: "커피거리", type: "restaurant" },
      { time: "18:00", title: "해산물 저녁", type: "restaurant" },
    ],
  },
];

// ========================================
// 이벤트 변환 유틸리티
// ========================================

// 예약 ID별 색상 매핑 저장소
const reservationColorMap = {};

/**
 * 예약에 색상 할당 (순차적으로)
 * @param {string} reservationId - 예약 ID
 * @returns {string} 할당된 색상 코드
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
 * @param {string} time - HH:MM 형식 시간
 * @returns {string} 포맷된 시간 (예: 3:30p, 9am)
 */
export function formatScheduleTime(time) {
  const [hours, minutes] = time.split(":");
  const hour = parseInt(hours);
  const period = hour >= 12 ? "p" : "am";
  const displayHour = hour > 12 ? hour - 12 : hour === 0 ? 12 : hour;
  const displayMinutes = minutes === "00" ? "" : `:${minutes}`;
  return `${displayHour}${displayMinutes}${period}`;
}

/**
 * 텍스트 길이 제한
 * @param {string} text - 원본 텍스트
 * @param {number} maxLength - 최대 길이 (기본값: 12)
 * @returns {string} 잘린 텍스트
 */
export function truncateText(text, maxLength = 12) {
  if (!text || text.length <= maxLength) return text;
  return text.substring(0, maxLength - 3) + "...";
}

/**
 * 예약 데이터를 FullCalendar 이벤트로 변환
 * @param {Array} reservationData - 예약 데이터 배열
 * @returns {Array} FullCalendar 이벤트 배열
 */
export function convertToCalendarEvents(reservationData) {
  const events = [];

  reservationData.forEach((reservation) => {
    const reservationColor = assignReservationColor(reservation.id);

    // FullCalendar는 end를 exclusive로 처리하므로 +1일 필요
    const endDate = new Date(reservation.endDate);
    endDate.setDate(endDate.getDate() + 1);
    const formattedEndDate = formatDateToString(endDate);

    // 1. 메인 예약 이벤트 추가 (숙박 기간 전체 블록)
    events.push({
      id: reservation.id,
      title: reservation.title,
      start: reservation.startDate,
      end: formattedEndDate,
      allDay: true,
      className: `fc-event-reservation fc-event-${reservation.status}`,
      backgroundColor: reservationColor,
      borderColor: reservationColor,
      extendedProps: {
        reservationId: reservation.id,
        accommodationName: reservation.accommodationName,
        status: reservation.status,
        type: "accommodation",
        isMainReservation: true,
        originalTitle: reservation.title,
      },
    });

    // 2. 일정(schedules)을 날짜별로 그룹화
    const schedulesByDate = {};
    reservation.schedules?.forEach((schedule) => {
      const scheduleDate = schedule.date || reservation.startDate;
      if (!schedulesByDate[scheduleDate]) {
        schedulesByDate[scheduleDate] = [];
      }
      schedulesByDate[scheduleDate].push(schedule);
    });

    // 3. 날짜별로 일정 이벤트 추가
    Object.keys(schedulesByDate).forEach((date) => {
      const daySchedules = schedulesByDate[date];

      daySchedules.forEach((schedule, index) => {
        const formattedTime = formatScheduleTime(schedule.time);
        const color = SCHEDULE_COLORS[schedule.type] || "#6c757d";
        const fullTitle = `${formattedTime} ${schedule.title}`;
        const truncatedTitle = truncateText(fullTitle, 14);

        events.push({
          id: `${reservation.id}_schedule_${date}_${index}`,
          title: truncatedTitle,
          start: date,
          allDay: true,
          className: "fc-event-schedule",
          backgroundColor: "transparent",
          borderColor: "transparent",
          textColor: "#333333",
          extendedProps: {
            parentReservationId: reservation.id,
            parentTitle: reservation.title,
            type: schedule.type,
            time: schedule.time,
            scheduleTitle: schedule.title,
            dotColor: color,
            isSchedule: true,
            originalScheduleTitle: schedule.title,
            originalFullTitle: fullTitle,
          },
        });
      });
    });
  });

  return events;
}

// ========================================
// Re-export 상수 (다른 파일에서 편리하게 사용)
// ========================================
export {
  RESERVATION_COLOR_POOL,
  SCHEDULE_COLORS,
  GUEST_LIMITS,
  CALENDAR_CONFIG,
  RESERVATION_STATUS,
} from "@/utils/formatters/calendarConstants";
