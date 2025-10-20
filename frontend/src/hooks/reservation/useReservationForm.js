import { useState } from 'react';
import { reservationFormatters } from '@/utils/formatters/reservationFormatters';


 //예약 폼 관리 훅
export const useReservationForm = () => {
    const [formData, setFormData] = useState({
        guestName: '',
        guestPhone: '',
        transportationMethod: '차량',
        paymentMethod: '카드결제',
        ageAgreed: false,
        termsAgreed: false,
        refundPolicyAgreed: false,
        marketingAgreed: false,
        privacyCollectionAgreed: false,
    });


     //폼 데이터 업데이트
    const handleChange = (field, value) => {
        setFormData(prev => ({ ...prev, [field]: value }));
    };


     //전화번호 입력 처리
    const handlePhoneChange = (value) => {
        const formatted = reservationFormatters.formatPhone(value);
        setFormData(prev => ({ ...prev, guestPhone: formatted }));
    };


     //전체 동의 처리
    const handleAllAgree = (checked) => {
        setFormData(prev => ({
            ...prev,
            ageAgreed: checked,
            termsAgreed: checked,
            refundPolicyAgreed: checked,
            marketingAgreed: checked,
            privacyCollectionAgreed: checked,
        }));
    };


     //전체 동의 여부
    const isAllAgreed =
        formData.ageAgreed &&
        formData.termsAgreed &&
        formData.refundPolicyAgreed &&
        formData.marketingAgreed &&
        formData.privacyCollectionAgreed;

    return {
        formData,
        handleChange,
        handlePhoneChange,
        handleAllAgree,
        isAllAgreed,
    };
};