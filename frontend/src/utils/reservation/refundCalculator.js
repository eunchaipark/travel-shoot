/**
 * 체크인 날짜 기준으로 환불 정책 계산
 * @param {string} checkInDate - 체크인 날짜 (YYYY-MM-DD 형식)
 * @param {number} totalPrice - 총 결제 금액
 * @returns {Object} - { refundRate, refundAmount, cancelFee, refundDescription }
 */
export const calculateRefundPolicy = (checkInDate, totalPrice) => {
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    const checkIn = new Date(checkInDate);
    checkIn.setHours(0, 0, 0, 0);

    const daysUntilCheckIn = Math.ceil((checkIn - today) / (1000 * 60 * 60 * 24));

    let refundRate = 0;
    let refundDescription = '';

    if (daysUntilCheckIn >= 3) {
        refundRate = 1.0;
        refundDescription = '체크인 3일 전 - 100% 환불';
    } else if (daysUntilCheckIn >= 1) {
        refundRate = 0.5;
        refundDescription = '체크인 1-2일 전 - 50% 환불';
    } else {
        refundRate = 0;
        refundDescription = '체크인 당일 - 환불 불가';
    }

    const refundAmount = Math.floor(totalPrice * refundRate);
    const cancelFee = totalPrice - refundAmount;

    return {
        refundRate,
        refundAmount,
        cancelFee,
        refundDescription,
        daysUntilCheckIn
    };
};

export const formatPrice = (price) => {
    return price.toLocaleString('ko-KR');
};