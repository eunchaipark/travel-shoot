/**
 * 날짜 문자열을 받아 요일을 반환
 * @param {string} dateString - 'YYYY-MM-DD' 형식의 날짜 문자열
 * @returns {string} 요일 (예: '월', '화', '수'...)
 */
export const getDayOfWeek = (dateString) => {
    const date = new Date(dateString);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    return days[date.getDay()];
};

export const formatDate = (dateString) => {
    if (!dateString) return '';
    return dateString.split('T')[0].replaceAll('-', '.');
};

// 날짜와 요일을 함께 반환 (예: "2025.10.13 (일)")
export const formatDateWithDay = (dateString) => {
    if (!dateString) return '';
    const formattedDate = formatDate(dateString);
    const dayOfWeek = getDayOfWeek(dateString);
    return `${formattedDate} (${dayOfWeek})`;
};

export const formatTime = (timeString) => {
    return timeString.split(':').slice(0, 2).join(':');
};