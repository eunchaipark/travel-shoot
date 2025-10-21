/**
 * 예약 상세 정보를 가져옵니다
 * @param {string|number} reservationId - 예약 ID
 * @returns {Promise<Object>} 예약 상세 데이터
 */
export const fetchReservationDetail = async (reservationId) => {
    const response = await fetch(
        `${window.API_BASE_URL}/api/reservations/detail/${reservationId}`
        ,{
            method: 'GET',
            credentials: 'include',
        }
    );

    if (!response.ok) {
        throw new Error('예약 정보를 불러오는데 실패했습니다.');
    }

    return await response.json();
};