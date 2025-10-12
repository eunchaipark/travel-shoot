import { useState, useCallback, useEffect, useRef } from 'react';
import { 
  createSafeDate, 
  getTodayString, 
  formatDateToString,
  GUEST_LIMITS  // 상수 import 추가
} from '../utils/main/calendarUtils';

/**
 * 달력 날짜 선택 훅
 */
export const useCalendar = () => {
  const [selectedDates, setSelectedDates] = useState({
    checkin: null,
    checkout: null
  });
  const [dateSelectionMode, setDateSelectionMode] = useState(true);

  // 메인 달력 날짜 선택
  const handleMainCalendarDateSelection = useCallback((dateStr) => {
    const selectedDate = createSafeDate(dateStr);
    const today = createSafeDate(getTodayString());

    if (selectedDate < today) {
      alert('과거 날짜는 선택할 수 없습니다.');
      return;
    }

    setSelectedDates(prev => {
      if (!prev.checkin) {
        return { checkin: dateStr, checkout: null };
      } else if (!prev.checkout) {
        const checkinDate = createSafeDate(prev.checkin);
        
        if (selectedDate.getTime() <= checkinDate.getTime()) {
          alert('체크아웃 날짜는 체크인 날짜보다 늦어야 합니다.');
          return prev;
        }
        
        return { ...prev, checkout: dateStr };
      } else {
        return { checkin: dateStr, checkout: null };
      }
    });
  }, []);

  // 미니 달력 날짜 선택 (로직 다름!)
  const handleMiniCalendarDateSelection = useCallback((dateStr) => {
    const selectedDate = createSafeDate(dateStr);
    const today = createSafeDate(getTodayString());

    if (selectedDate < today) {
      return;
    }

    setSelectedDates(prev => {
      if (!prev.checkin) {
        return { checkin: dateStr, checkout: null };
      } else if (!prev.checkout) {
        const checkinDate = createSafeDate(prev.checkin);
        
        if (selectedDate.getTime() <= checkinDate.getTime()) {
          return { checkin: dateStr, checkout: null };
        } else {
          return { ...prev, checkout: dateStr };
        }
      } else {
        return { checkin: dateStr, checkout: null };
      }
    });
  }, []);

  const activateSelectionMode = useCallback(() => {
    setDateSelectionMode(true);
  }, []);

  const deactivateSelectionMode = useCallback(() => {
    setDateSelectionMode(false);
  }, []);

  const calculateNights = useCallback(() => {
    if (selectedDates.checkin && selectedDates.checkout) {
      const checkinDate = createSafeDate(selectedDates.checkin);
      const checkoutDate = createSafeDate(selectedDates.checkout);
      const timeDiff = checkoutDate.getTime() - checkinDate.getTime();
      return Math.floor(timeDiff / (1000 * 60 * 60 * 24));
    }
    return 0;
  }, [selectedDates]);

  // 메인 달력 하이라이트
  useEffect(() => {
    // 기존 하이라이트 제거
    document.querySelectorAll('.fc-day-selected-checkin, .fc-day-selected-checkout, .fc-day-selected-range')
      .forEach(el => {
        el.classList.remove('fc-day-selected-checkin', 'fc-day-selected-checkout', 'fc-day-selected-range');
      });

    if (selectedDates.checkin) {
      const checkinEl = document.querySelector(`[data-date="${selectedDates.checkin}"]`) || 
                       document.querySelector(`.fc-daygrid-day[data-date="${selectedDates.checkin}"]`);
      if (checkinEl) checkinEl.classList.add('fc-day-selected-checkin');
    }

    if (selectedDates.checkout) {
      const checkoutEl = document.querySelector(`[data-date="${selectedDates.checkout}"]`) ||
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
                       document.querySelector(`.fc-daygrid-day[data-date="${dateStr}"]`);
          if (dayEl) dayEl.classList.add('fc-day-selected-range');
          currentDate.setDate(currentDate.getDate() + 1);
        }
      }
    }
  }, [selectedDates]);

  return {
    selectedDates,
    dateSelectionMode,
    handleMainCalendarDateSelection,
    handleMiniCalendarDateSelection,
    activateSelectionMode,
    deactivateSelectionMode,
    calculateNights
  };
};

/**
 * 인원 선택 훅
 */
export const useGuest = () => {
  const [guestCounts, setGuestCounts] = useState({
    adult: 2,
    child: 0
  });

  const handleGuestChange = useCallback((type, action) => {
    setGuestCounts(prev => {
      const currentCount = prev[type];
      const { min, max } = GUEST_LIMITS[type];  // 상수에서 가져오기

      if (action === 'plus') {
        return {
          ...prev,
          [type]: currentCount < max ? currentCount + 1 : currentCount
        };
      } else {
        return {
          ...prev,
          [type]: currentCount > min ? currentCount - 1 : currentCount
        };
      }
    });
  }, []);

  const getGuestText = useCallback(() => {
    const { adult, child } = guestCounts;
    let text = `성인 ${adult}명`;
    if (child > 0) {
      text += `, 어린이 ${child}명`;
    }
    return text;
  }, [guestCounts]);

  return {
    guestCounts,
    handleGuestChange,
    getGuestText
  };
};

/**
 * 미니 달력 훅
 */
export const useMiniCalendar = () => {
  const today = new Date();
  const [currentYear, setCurrentYear] = useState(today.getFullYear());
  const [currentMonth, setCurrentMonth] = useState(today.getMonth());

  const handlePrevMonth = useCallback(() => {
    if (currentMonth === 0) {
      setCurrentMonth(11);
      setCurrentYear(prev => prev - 1);
    } else {
      setCurrentMonth(prev => prev - 1);
    }
  }, [currentMonth]);

  const handleNextMonth = useCallback(() => {
    if (currentMonth === 11) {
      setCurrentMonth(0);
      setCurrentYear(prev => prev + 1);
    } else {
      setCurrentMonth(prev => prev + 1);
    }
  }, [currentMonth]);

  return {
    currentYear,
    currentMonth,
    handlePrevMonth,
    handleNextMonth
  };
};

/**
 * 드롭다운 위치 및 스타일 관리 훅
 */
export const useDropdownPosition = (isOpen, type) => {
  const cardRef = useRef(null);

  useEffect(() => {
    if (!cardRef.current) return;

    if (isOpen) {
      if (type === 'date' || type === 'guest') {
        // borderRadius 변경
        cardRef.current.style.borderBottomLeftRadius = '0';
        cardRef.current.style.borderBottomRightRadius = '0';
        cardRef.current.style.marginBottom = '0';
      } else if (type === 'location') {
        // 다음 카드에 margin 추가
        const nextCard = cardRef.current.nextElementSibling;
        if (nextCard && nextCard.classList.contains('search-card')) {
          setTimeout(() => {
            const dropdown = cardRef.current.querySelector('.dropdown-suggestions');
            if (dropdown) {
              const dropdownHeight = dropdown.offsetHeight;
              nextCard.style.marginTop = `${dropdownHeight + 16}px`;
              nextCard.style.transition = 'margin-top 0.3s ease';
            }
          }, 10);
        }
      }
    } else {
      if (type === 'date' || type === 'guest') {
        // borderRadius 복원
        cardRef.current.style.borderBottomLeftRadius = '16px';
        cardRef.current.style.borderBottomRightRadius = '16px';
        cardRef.current.style.marginBottom = '1rem';
      } else if (type === 'location') {
        // margin 제거
        const nextCard = cardRef.current.nextElementSibling;
        if (nextCard && nextCard.classList.contains('search-card')) {
          nextCard.style.marginTop = '';
        }
      }
    }
  }, [isOpen, type]);

  return cardRef;
};