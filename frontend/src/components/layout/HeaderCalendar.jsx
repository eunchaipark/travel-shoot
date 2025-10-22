import React, { useState, useEffect } from "react";
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import { ko } from "date-fns/locale";

export default function HeaderCalendar({ selectedDates, onDateSelect }) {
    const [startDate, setStartDate] = useState(null);
    const [endDate, setEndDate] = useState(null);

    //selectedDates가 변경되면 반영
    useEffect(() => {
        if (selectedDates.checkin) {
            setStartDate(new Date(selectedDates.checkin));
        }
        if (selectedDates.checkout) {
            setEndDate(new Date(selectedDates.checkout));
        }
    }, [selectedDates]);

    const handleChange = (dates) => {
        const [start, end] = dates;
        setStartDate(start);
        setEndDate(end);

        // 둘 다 선택되면 부모로 전달
        if (start && end) {
            onDateSelect({
                checkin: start.toISOString().split("T")[0],
                checkout: end.toISOString().split("T")[0],
            });
        }
    };

    return (
        <div
            className="header-calendar-wrapper"
            style={{
                background: "#fff",
                padding: "16px",
                borderRadius: "12px",
                boxShadow: "0 4px 16px rgba(0,0,0,0.12)",
                zIndex: 9999,
            }}
            onClick={(e) => e.stopPropagation()} // 클릭 이벤트 전파 차단
        >
            <DatePicker
                selected={startDate}
                onChange={handleChange}
                startDate={startDate}
                endDate={endDate}
                selectsRange
                inline
                locale={ko}
                dateFormat="yyyy-MM-dd"
                minDate={new Date()} // 오늘 이전 날짜 선택 불가
                monthsShown={2} // 2개월 표시
            />
        </div>
    );
}