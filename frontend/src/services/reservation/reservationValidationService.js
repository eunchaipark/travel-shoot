//예약 유효성 검사 서비스


const reservationValidationService = {
    //로그인 여부 확인
    checkAuthentication: () => {
        const token = localStorage.getItem('accessToken');
        return !!token;
    },

    //필수 약관 동의 확인
    validateAgreements: (formData) => {
        if (!formData.ageAgreed || !formData.termsAgreed || !formData.refundPolicyAgreed) {
            throw new Error('필수 약관에 동의해주세요.');
        }
        return true;
    },

    //예약자 정보 확인

    validateGuestInfo: (formData) => {
        if (!formData.guestName || !formData.guestPhone) {
            throw new Error('예약자 정보를 입력해주세요.');
        }

        // 전화번호 형식 검사
        const phoneRegex = /^\d{3}-\d{4}-\d{4}$/;
        if (!phoneRegex.test(formData.guestPhone)) {
            throw new Error('올바른 전화번호 형식을 입력해주세요. (예: 010-1234-5678)');
        }

        return true;
    },

    //전체 폼 유효성 검사

    validateReservationForm: (formData) => {
        reservationValidationService.validateAgreements(formData);
        reservationValidationService.validateGuestInfo(formData);
        return true;
    },
};

export default reservationValidationService;