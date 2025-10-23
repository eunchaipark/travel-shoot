/**
 * AI 여행 추천 코스를 가져옵니다
 * @param {string|number} reservationId - 예약 ID
 * @returns {Promise<Object>} AI 코스 데이터
 */
export const fetchCourseData = async (reservationId) => {
    const response = await fetch(
        `${window.API_BASE_URL}/api/ai/course/${reservationId}?type=reservation`
        ,{
            method: 'GET',
            credentials: 'include',
        }
    );

    if (!response.ok) {
        return null;
    }

    return await response.json();
};