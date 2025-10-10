import { useState, useEffect, useRef, useCallback } from 'react';
import {
    createSafeDate,
    formatDateToString,
    getTodayString,
    convertToCalendarEvents,
    RAW_RESERVATION_DATA,
    createMiniCalendar,
    calculateNights
} from '@/utils/calendarUtils';

export function useMainCalendar() {
    // ========== 상태 관리 ==========
    const [isLoggedIn, setIsLoggedIn] = useState(true);
    const [dateSelectionMode, setDateSelectionMode] = useState(true);
    const [selectedDates, setSelectedDates] = useState({
        checkin: null,
        checkout: null
    });
    
    // UI 상태
    const [showLocationSuggestions, setShowLocationSuggestions] = useState(false);
    const [showDateDropdown, setShowDateDropdown] = useState(false);
    const [showGuestDropdown, setShowGuestDropdown] = useState(false);
    
    // 검색 폼 상태
    const [location, setLocation] = useState('');
    const [adults, setAdults] = useState(2);
    const [children, setChildren] = useState(0);
    
    // 미니 달력 상태
    const [miniCalendarMonth, setMiniCalendarMonth] = useState(new Date().getMonth());
    const [miniCalendarYear, setMiniCalendarYear] = useState(new Date().getFullYear());
    
    const calendarRef = useRef(null);
    const calendarInstanceRef = useRef(null);

    // ========== FullCalendar 초기화 ==========
    useEffect(() => {
        if (calendarRef.current && window.FullCalendar && !calendarInstanceRef.current) {
            const reservationEvents = convertToCalendarEvents(RAW_RESERVATION_DATA);
            
            const calendar = new window.FullCalendar.Calendar(calendarRef.current, {
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
                events: isLoggedIn ? reservationEvents : [],
                
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
                    }
                    
                    return { html: event.title };
                },
                
                dateClick: function(info) {
                    if (dateSelectionMode) {
                        handleMainCalendarDateSelection(info.dateStr);
                    }
                },
                
                eventClick: function(info) {
                    info.jsEvent.preventDefault();
                    info.jsEvent.stopPropagation();
                    
                    const props = info.event.extendedProps;
                    
                    if (props.isMainReservation) {
                        alert(`"${props.originalTitle || info.event.title}" 예약 상세 페이지로 이동합니다.\n숙소: ${props.accommodationName}\n상태: ${props.status}\n예약 ID: ${props.reservationId}`);
                    } else if (props.isSchedule) {
                        alert(`"${props.originalScheduleTitle}" 일정에서 예약 상세 페이지로 이동합니다.\n소속 여행: ${props.parentTitle}\n시간: ${props.time}\n예약 ID: ${props.parentReservationId}`);
                    }
                },
                
                datesSet: function() {
                    setTimeout(() => {
                        highlightMainCalendarDates();
                    }, 50);
                }
            });
            
            calendar.render();
            calendarInstanceRef.current = calendar;
            
            setTimeout(() => {
                calendar.updateSize();
            }, 100);
        }
    }, [isLoggedIn, dateSelectionMode]);

    // ========== 날짜 선택 처리 ==========
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
                
                setTimeout(() => {
                    setDateSelectionMode(false);
                    hideAllDropdowns();
                }, 500);
                
                return { checkin: prev.checkin, checkout: dateStr };
            } else {
                return { checkin: dateStr, checkout: null };
            }
        });
    }, []);

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
                    setTimeout(() => {
                        hideAllDropdowns();
                    }, 500);
                    return { checkin: prev.checkin, checkout: dateStr };
                }
            } else {
                return { checkin: dateStr, checkout: null };
            }
        });
    }, []);

    // ========== 달력 하이라이트 ==========
    const highlightMainCalendarDates = useCallback(() => {
        document.querySelectorAll('.fc-day-selected-checkin, .fc-day-selected-checkout, .fc-day-selected-range')
            .forEach(el => {
                el.classList.remove('fc-day-selected-checkin', 'fc-day-selected-checkout', 'fc-day-selected-range');
            });

        if (selectedDates.checkin) {
            const checkinEl = document.querySelector(`[data-date="${selectedDates.checkin}"]`);
            if (checkinEl) checkinEl.classList.add('fc-day-selected-checkin');
        }

        if (selectedDates.checkout) {
            const checkoutEl = document.querySelector(`[data-date="${selectedDates.checkout}"]`);
            if (checkoutEl) checkoutEl.classList.add('fc-day-selected-checkout');

            if (selectedDates.checkin && selectedDates.checkout) {
                const checkinDate = createSafeDate(selectedDates.checkin);
                const checkoutDate = createSafeDate(selectedDates.checkout);
                const currentDate = new Date(checkinDate);
                currentDate.setDate(currentDate.getDate() + 1);

                while (currentDate < checkoutDate) {
                    const dateStr = formatDateToString(currentDate);
                    const dayEl = document.querySelector(`[data-date="${dateStr}"]`);
                    if (dayEl) dayEl.classList.add('fc-day-selected-range');
                    currentDate.setDate(currentDate.getDate() + 1);
                }
            }
        }
    }, [selectedDates]);

    // 날짜 선택시 자동 하이라이트
    useEffect(() => {
        highlightMainCalendarDates();
    }, [selectedDates, highlightMainCalendarDates]);

    // ========== 드롭다운 관리 ==========
    const hideAllDropdowns = useCallback(() => {
        setShowLocationSuggestions(false);
        setShowDateDropdown(false);
        setShowGuestDropdown(false);
    }, []);

    const toggleDateDropdown = useCallback(() => {
        setShowDateDropdown(prev => !prev);
        setShowGuestDropdown(false);
        setShowLocationSuggestions(false);
    }, []);

    const toggleGuestDropdown = useCallback(() => {
        setShowGuestDropdown(prev => !prev);
        setShowDateDropdown(false);
        setShowLocationSuggestions(false);
    }, []);

    // ========== 검색 처리 ==========
    const handleSearch = useCallback(() => {
        if (!selectedDates.checkin || !selectedDates.checkout) {
            alert('체크인/체크아웃 날짜를 선택해주세요.');
            return;
        }
        
        const nights = calculateNights(selectedDates.checkin, selectedDates.checkout);
        
        alert(`검색 실행:\n체크인: ${selectedDates.checkin}\n체크아웃: ${selectedDates.checkout}\n성인: ${adults}명\n어린이: ${children}명\n숙박: ${nights}박`);
        
        console.log('검색 조건:', {
            location,
            checkin: selectedDates.checkin,
            checkout: selectedDates.checkout,
            adults,
            children,
            nights
        });
    }, [selectedDates, adults, children, location]);

    // ========== 날짜 표시 텍스트 ==========
    const getDateDisplayText = useCallback(() => {
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
            
            return `${checkinText} - ${checkoutText}`;
        } else if (selectedDates.checkin) {
            const checkinDate = createSafeDate(selectedDates.checkin);
            const checkinText = checkinDate.toLocaleDateString('ko-KR', {
                month: 'short',
                day: 'numeric'
            });
            return `${checkinText} - 체크아웃`;
        } else if (dateSelectionMode) {
            return '달력에서 날짜를 선택해주세요';
        } else {
            return '날짜를 선택해주세요';
        }
    }, [selectedDates, dateSelectionMode]);

    // ========== 인원 표시 텍스트 ==========
    const getGuestDisplayText = useCallback(() => {
        let text = `성인 ${adults}명`;
        if (children > 0) {
            text += `, 어린이 ${children}명`;
        }
        return text;
    }, [adults, children]);

    // ========== 미니 달력 HTML 생성 ==========
    const getMiniCalendarHTML = useCallback(() => {
        return createMiniCalendar(miniCalendarYear, miniCalendarMonth, selectedDates);
    }, [miniCalendarYear, miniCalendarMonth, selectedDates]);

    // ========== 반환값 ==========
    return {
        // Refs
        calendarRef,
        
        // 상태
        isLoggedIn,
        dateSelectionMode,
        selectedDates,
        location,
        adults,
        children,
        
        // UI 상태
        showLocationSuggestions,
        showDateDropdown,
        showGuestDropdown,
        
        // Setters
        setIsLoggedIn,
        setDateSelectionMode,
        setLocation,
        setAdults,
        setChildren,
        setShowLocationSuggestions,
        setMiniCalendarYear,
        setMiniCalendarMonth,
        
        // 핸들러
        handleMainCalendarDateSelection,
        handleMiniCalendarDateSelection,
        handleSearch,
        toggleDateDropdown,
        toggleGuestDropdown,
        hideAllDropdowns,
        
        // 계산된 값
        dateDisplayText: getDateDisplayText(),
        guestDisplayText: getGuestDisplayText(),
        miniCalendarHTML: getMiniCalendarHTML()
    };
}