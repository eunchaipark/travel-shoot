// API 호출 함수
export const fetchReservationList = async () => {
    const response = await fetch(
        `${window.API_BASE_URL}/api/reservations/list`,
        {
            method: 'GET',
            credentials: 'include',
        }
    );
    if (!response.ok) {
        throw new Error('예약 정보를 불러오는데 실패했습니다.');
    }
    return await response.json();
};

// 예약 목록 (리뷰 없는 것들)
export const getReservations = async () => {
    return await fetchReservationList();
};

// 리뷰 목록 (리뷰 있는 것들)
export const getReviews = async () => {
    const data = await fetchReservationList();
    // reviewId가 있는 것들만 필터링
    return data.filter(item => item.reviewId !== null && item.reviewId !== undefined);
};

// 예약 취소 API
export const cancelReservation = async (reservationId, cancelReason, cancelDetail) => {
    const response = await fetch(
        `${window.API_BASE_URL}/api/reservations/cancel`,
        {
            method: 'PUT',
            credentials: 'include',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                reservationId: reservationId,
                cancelReason: cancelReason,
                cancelDetail: cancelDetail
            })
        }
    );

    if (!response.ok) {
        throw new Error('예약 취소에 실패했습니다.');
    }

    return response;
};