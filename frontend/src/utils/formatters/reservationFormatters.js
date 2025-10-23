/**
 * 예약 관련 포맷팅 유틸리티
 */
export const reservationFormatters = {


    //전화번호 포맷팅

    /**
     * @param {string} value - 입력된 전화번호
     * @returns {string} 포맷된 전화번호 (010-1234-5678)
     */
    formatPhone: (value) => {
        const numbers = value.replace(/[^\d]/g, '');
        if (numbers.length <= 3) return numbers;
        if (numbers.length <= 7) return `${numbers.slice(0, 3)}-${numbers.slice(3)}`;
        return `${numbers.slice(0, 3)}-${numbers.slice(3, 7)}-${numbers.slice(7, 11)}`;
    },



    // 날짜 포맷팅

    /**
     * @param {string} dateString - 날짜 문자열 (YYYY-MM-DD)
     * @returns {string} 포맷된 날짜 (2025.10.20(월))
     */
    formatDate: (dateString) => {
        const date = new Date(dateString);
        const days = ['일', '월', '화', '수', '목', '금', '토'];
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        return `2025.${month}.${day}(${days[date.getDay()]})`;
    },

    //가격 포맷팅

    /**
     * @param {number} price - 가격
     * @returns {string} 포맷된 가격 (1,000,000)
     */
    formatPrice: (price) => {
        return price?.toLocaleString() || '0';
    },
};