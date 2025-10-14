import React from 'react';
import { 
  createSafeDateString, 
  createSafeDate, 
  getTodayString, 
  compareDatesOnly 
} from '../utils/main/calendarUtils';
import { useMiniCalendar } from '../hooks/useCalendarHooks';

// ========================================
// 미니 달력 컴포넌트
// ========================================
export const MiniCalendar = ({ selectedDates, onDateSelect }) => {
  const { currentYear, currentMonth, handlePrevMonth, handleNextMonth } = useMiniCalendar();

  const firstDate = new Date(currentYear, currentMonth, 1, 12, 0, 0, 0);
  const lastDate = new Date(currentYear, currentMonth + 1, 0, 12, 0, 0, 0);
  
  const firstDay = firstDate.getDay();
  const daysInMonth = lastDate.getDate();
  const todayStr = getTodayString();

  const handleDayClick = (dateStr) => {
    const selectedDate = createSafeDate(dateStr);
    const todayDate = createSafeDate(todayStr);
    
    if (selectedDate < todayDate) {
      return;
    }
    
    onDateSelect(dateStr);
  };

  const getDayClasses = (dateStr) => {
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
    
    if (selectedDates.checkin && selectedDates.checkout) {
      const checkinDate = createSafeDate(selectedDates.checkin);
      const checkoutDate = createSafeDate(selectedDates.checkout);
      
      if (currentDate.getTime() > checkinDate.getTime() && 
          currentDate.getTime() < checkoutDate.getTime()) {
        classes += ' selected-range';
      }
    }
    
    return classes;
  };

  const renderDays = () => {
    const days = [];
    
    for (let i = 0; i < firstDay; i++) {
      days.push(
        <div key={`empty-${i}`} className="mini-calendar-day other-month"></div>
      );
    }
    
    for (let day = 1; day <= daysInMonth; day++) {
      const dateStr = createSafeDateString(currentYear, currentMonth, day);
      const classes = getDayClasses(dateStr);
      const isPast = classes.includes('disabled');
      
      days.push(
        <div
          key={dateStr}
          className={classes}
          data-date={dateStr}
          onClick={() => !isPast && handleDayClick(dateStr)}
          style={{ cursor: isPast ? 'not-allowed' : 'pointer' }}
        >
          {day}
        </div>
      );
    }
    
    return days;
  };

  return (
    <div className="mini-calendar">
      <div className="mini-calendar-header">
        <button type="button" className="mini-cal-prev" onClick={handlePrevMonth}>
          ‹
        </button>
        <span>{currentYear}년 {currentMonth + 1}월</span>
        <button type="button" className="mini-cal-next" onClick={handleNextMonth}>
          ›
        </button>
      </div>
      <div className="mini-calendar-grid">
        <div className="mini-calendar-day-header">일</div>
        <div className="mini-calendar-day-header">월</div>
        <div className="mini-calendar-day-header">화</div>
        <div className="mini-calendar-day-header">수</div>
        <div className="mini-calendar-day-header">목</div>
        <div className="mini-calendar-day-header">금</div>
        <div className="mini-calendar-day-header">토</div>
        {renderDays()}
      </div>
    </div>
  );
};