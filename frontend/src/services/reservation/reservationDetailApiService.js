/**
 * 예약 상세 정보를 가져옵니다
 * @param {string|number} reservationId - 예약 ID
 * @returns {Promise<Object>} 예약 상세 데이터
 */
export const fetchReservationDetail = async (reservationId) => {
    // const response = await fetch(
    //     `${window.API_BASE_URL}/api/reservations/detail/${reservationId}`,
    //     { credentials: 'include' }
    // );
    //
    // if (!response.ok) {
    //     throw new Error('예약 정보를 불러오는데 실패했습니다.');
    // }

    // TODO: API 완성 후 실제 응답으로 교체
    // return await response.json();

    // 임시 데이터 (API 완성 전)
    return {
        reservationNumber: '250603002946000110',
        courseId: 19,  // 👈 이게 중요!
        lodgingName: '강릉 레이블류 스파 펜션',
        lodgingImage: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
        checkIn: {
            date: '2025.09.09(화)',
            time: '15:00'
        },
        checkOut: {
            date: '2025.09.13(토)',
            time: '11:00'
        },
        pricePerNight: 31000,
        numberOfNights: 3,
        numberOfRooms: 1,
        paymentMethod: '카카오페이 결제',
        totalPrice: 93000
    };

};