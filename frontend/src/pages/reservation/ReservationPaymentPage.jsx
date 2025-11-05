import React, { useState } from 'react';
import { useSearchParams, useNavigate } from 'react-router-dom';
import { useAuth } from '@/components/context/AuthContext';
import { useReservation } from '@/hooks/reservation/useReservation';
import { useReservationForm } from '@/hooks/reservation/useReservationForm';
import { reservationFormatters } from '@/utils/formatters/reservationFormatters';
import CompleteHeader from "@/components/layout/CompleteHeader";
import '@/assets/css/common.css';
import '@/assets/css/reservation-payment.css';
import PaymentLoading from "@/components/loading/PaymentLoading";

const ReservationPaymentPage = () => {
    const [searchParams] = useSearchParams();
    const navigate = useNavigate();
    const { isAuthenticated } = useAuth();


    const [showModal, setShowModal] = useState(false);
    const [modalContent, setModalContent] = useState({ title: '', content: '' });
    const [isPaymentLoading, setIsPaymentLoading] = useState(false); //결제로딩 추가

    // URL 파라미터
    const roomId = parseInt(searchParams.get('roomId') || '1');
    const checkInDate = searchParams.get('checkInDate') || '2025-10-20';
    const checkOutDate = searchParams.get('checkOutDate') || '2025-10-23';
    const guestCount = parseInt(searchParams.get('guestCount') || '2');

    const { initData, priceData, loading, error, createReservation } = useReservation(
        roomId,
        checkInDate,
        checkOutDate,
        guestCount,
        true // skipAuthCheck
    );

    const {
        formData,
        handleChange,
        handlePhoneChange,
        handleAllAgree,
        isAllAgreed
    } = useReservationForm();

    const handleSubmit = async () => {
        // 1. 이름 입력 확인
        if (!formData.guestName || formData.guestName.trim() === '') {
            alert('이용자 이름을 입력해주세요.');
            return;
        }

        // 2. 전화번호 입력 확인
        if (!formData.guestPhone || formData.guestPhone.trim() === '') {
            alert('전화번호를 입력해주세요.');
            return;
        }

        // 3. 전화번호 형식 확인 (010-0000-0000)
        const phonePattern = /^010-\d{4}-\d{4}$/;
        if (!phonePattern.test(formData.guestPhone)) {
            alert('전화번호 형식이 올바르지 않습니다. (예: 010-1234-5678)');
            return;
        }

        // 4. 필수 약관 동의 확인
        if (!formData.ageAgreed) {
            alert('만 18세 이상 동의는 필수입니다.');
            return;
        }

        if (!formData.termsAgreed) {
            alert('이용 약관 동의는 필수입니다.');
            return;
        }

        if (!formData.refundPolicyAgreed) {
            alert('취소 및 환불 규칙 동의는 필수입니다.');
            return;
        }

        // 5. 모든 검증 통과 시 예약 진행
        try {
            setIsPaymentLoading(true);

            const result = await createReservation(formData, setIsPaymentLoading);

            // 카카오페이는 result를 반환하지 않음 (postMessage로 처리)
            if (result) {
                // 카드결제, 네이버페이 등
                if (result.success) {
                    navigate(`/payment-complete?reservationId=${result.reservationId}`, { replace: true });
                } else {
                    alert("결제 처리 중 오류가 발생했습니다.");
                    setIsPaymentLoading(false);
                }
            }
        } catch (error) {
            console.error(error);
            alert("결제 처리 중 문제가 발생했습니다.");
            setIsPaymentLoading(false);
        }
    };

    const openModal = (type) => {
        let title = '';
        let content = '';

        if (type === 'terms') {
            title = '이용 약관';
            content = `
            <div>제1조 (목적)</div>
            <p>본 약관은 숙박업체(이하 "업체")와 이용 고객(이하 "고객") 간 숙박 서비스 이용에 관한 권리, 의무 및 책임 사항을 규정함을 목적으로 합니다.</p>
            
            <div>제2조 (계약의 성립)</div>
            <p>고객이 예약 신청을 하고 업체가 이를 승낙한 시점에 숙박 계약이 성립합니다. 온라인 예약 시 예약 확인서(또는 이메일/문자 통보)를 발송함으로써 계약이 성립됩니다.</p>
            
            <div>제3조 (요금 및 결제)</div>
            <p>숙박 요금은 업체가 고지한 기준에 따르며, 고객은 예약 시 선택한 결제 수단을 통해 요금을 지불해야 합니다.</p>
            
            <div>제4조 (체크인 및 체크아웃)</div>
            <ul>
                <li>체크인: 오후 15시 이후</li>
                <li>체크아웃: 오전 11시까지</li>
                <li>시간을 초과할 경우 추가 요금이 부과될 수 있습니다.</li>
            </ul>
        `;
        } else if (type === 'refund') {
            title = '취소 및 환불 규정';
            content = `
            <div>제1조 (고객에 의한 취소)</div>
            <ul>
                <li>숙박 예정일 7일 전까지 취소: 전액 환불</li>
                <li>숙박 예정일 6일 ~ 1일 전 취소: 결제 금액의 일부 위약금 공제 후 환불</li>
                <li>숙박 당일 취소 또는 No-Show: 환불 불가</li>
            </ul>
            
            <div>제2조 (업체에 의한 취소)</div>
            <p>업체 귀책 사유(시설 고장, 만실 등)로 숙박이 불가한 경우, 고객에게 전액 환불하며 필요 시 손해 배상을 진행합니다.</p>
        `;
        } else if (type === 'privacy') {
            title = '마케팅, 혜택 정보 수신을 위한 개인정보 수집 및 이용 동의';
            content = `
            <div>제1조 (수집하는 개인정보 항목)</div>
            <p>업체는 마케팅 및 혜택 정보 제공을 위해 다음의 개인정보를 수집합니다.</p>
            <ul>
                <li>필수 항목: 성명, 휴대전화번호, 이메일 주소</li>
                <li>선택 항목: 관심 지역, 선호 숙박, 여행 스타일</li>
            </ul>
            
            <div>제2조 (개인정보의 이용 목적)</div>
            <ul>
                <li>신규 서비스 및 이벤트, 할인 혜택 안내</li>
                <li>맞춤형 프로모션 및 광고성 정보 제공</li>
            </ul>
        `;
        }

        setModalContent({ title, content });
        setShowModal(true);
        document.body.style.overflow = 'hidden'; // 스크롤 방지
    };

    const closeModal = () => {
        setShowModal(false);
        document.body.style.overflow = 'auto'; // 스크롤 복원
    };

    // 비로그인 상태면 아무것도 렌더링 안 함
    if (!isAuthenticated) {
        return null;
    }

    if (loading && !initData) {
        return (
            <div className="container text-center" style={{ paddingTop: '100px' }}>
                <div className="spinner-border" role="status">
                    <span className="visually-hidden">로딩 중...</span>
                </div>
            </div>
        );
    }

    if (error && !initData) {
        return (
            <div className="container text-center" style={{ paddingTop: '100px' }}>
                <div className="alert alert-danger">{error}</div>
            </div>
        );
    }


    return (
        <>
            <CompleteHeader />

        <main className="payment-main">
            <div className="container payment-page">
                <div className="row">
                    {/* 왼쪽: 예약 정보 */}
                    <div className="col-lg-8">
                        {/* 숙소 정보 */}
                        <div className="section-card mb-4">
                            <div className="section-header">숙소</div>
                            <div>
                                <div className="stay-checkments">
                                    • 숙소와 날짜를 다시 한번 확인하세요
                                </div>
                                <div className="stay-content d-flex">
                                    <div className="stay-image-wrapper">
                                        <img
                                            className="stay-img"
                                            src={initData?.mainImageUrl || "/images/reservation/payment-hotel-imgae.jpg"}
                                            alt={initData?.stayName}
                                        />
                                    </div>
                                    <div className="stay-info flex-fill lodging-info">
                                        <div className="stay-name mb-1">{initData?.stayName}</div>
                                        <div className="stay-location text-muted small mb-3">
                                            <span className="location_icon me-1"></span>
                                            {initData?.address}
                                        </div>

                                        <div className="checkin-checkout mb-3">
                                            <div className="small-text d-flex mb-2">
                                                <div className="col-5">
                                                    <div className="mb-1">체크인</div>
                                                    <div className="fw-bold">{reservationFormatters.formatDate(checkInDate)}</div>
                                                    <div className="fw-bold">{initData?.checkInTime || '15:00'}</div>
                                                </div>
                                                <div className="col-2 reservation-detail-arrow-con">
                                                    <div className="reservation-detail-arrow"></div>
                                                </div>
                                                <div className="col-5">
                                                    <div className="mb-1">체크아웃</div>
                                                    <div className="fw-bold">{reservationFormatters.formatDate(checkOutDate)}</div>
                                                    <div className="fw-bold">{initData?.checkOutTime || '11:00'}</div>
                                                </div>
                                            </div>
                                        </div>

                                        {priceData && (
                                            <div className="price-highlight text-nowrap">
                                                <span className="small-text me-2 mb-1 standard">숙박/1박당</span>
                                                ₩ {reservationFormatters.formatPrice(
                                                (() => {
                                                    const weekdayPrice = priceData.dailyPrices?.find(d => d.dayType === '평일')?.price;
                                                    const weekendPrice = priceData.dailyPrices?.find(d => d.dayType === '주말')?.price;

                                                    // 둘 다 있으면 평균을 1000원 단위로 반올림
                                                    if (weekdayPrice && weekendPrice) {
                                                        const average = (weekdayPrice + weekendPrice) / 2;
                                                        return Math.round(average / 1000) * 1000;
                                                    }
                                                    return weekdayPrice || weekendPrice || 0;
                                                })()
                                            )}
                                            </div>
                                        )}
                                    </div>
                                </div>
                            </div>
                        </div>

                        {/* 방문 수단 */}
                        <div className="section-card mb-4">
                            <div className="section-header">방문 수단</div>
                            <div className="transport-options d-flex">
                                <label className="transport-option me-4">
                                    <input
                                        type="radio"
                                        name="transport"
                                        value="차량"
                                        checked={formData.transportationMethod === '차량'}
                                        onChange={(e) => handleChange('transportationMethod', e.target.value)}
                                    />
                                    <span className="radio-custom"></span>
                                    <span className="transport-text">차량</span>
                                </label>

                                <label className="transport-option">
                                    <input
                                        type="radio"
                                        name="transport"
                                        value="대중교통"
                                        checked={formData.transportationMethod === '대중교통'}
                                        onChange={(e) => handleChange('transportationMethod', e.target.value)}
                                    />
                                    <span className="radio-custom"></span>
                                    <span className="transport-text">대중교통</span>
                                </label>
                            </div>
                        </div>

                        {/* 이용자 정보 */}
                        <div className="section-card mb-4">
                            <div className="section-header">이용자 정보</div>
                            <div className="mb-3">
                                <label className="user-info mb-2">이름</label>
                                <input
                                    type="text"
                                    className="user-inputbox w-100"
                                    placeholder="이용자 이름을 입력하세요"
                                    value={formData.guestName}
                                    onChange={(e) => handleChange('guestName', e.target.value)}
                                />
                            </div>
                            <div className="mb-3">
                                <label className="user-info mb-2">전화번호</label>
                                <input
                                    type="tel"
                                    className="user-inputbox w-100"
                                    placeholder="010-0000-0000"
                                    value={formData.guestPhone}
                                    onChange={(e) => handlePhoneChange(e.target.value)}
                                    maxLength={13}
                                />
                            </div>
                        </div>

                        {/* 결제 방법 추가! */}
                        <div className="section-card mb-4">
                            <div className="section-header">결제 방법</div>
                            <div className="payment-options">
                                {/*<label className="payment-option d-flex align-items-center mb-3">*/}
                                {/*    <input*/}
                                {/*        type="radio"*/}
                                {/*        name="payment"*/}
                                {/*        value="카드결제"*/}
                                {/*        checked={formData.paymentMethod === '카드결제'}*/}
                                {/*        onChange={(e) => handleChange('paymentMethod', e.target.value)}*/}
                                {/*    />*/}
                                {/*    <span className="radio-custom"></span>*/}
                                {/*    <div className="payment-info d-flex align-items-center ms-3">*/}
                                {/*        <img className="payment_images" src="/images/reservation/payment-card.svg" alt="카드결제" />*/}
                                {/*        <span className="payment-text">일반 카드 결제</span>*/}
                                {/*    </div>*/}
                                {/*</label>*/}

                                <label className="payment-option d-flex align-items-center mb-3">
                                    <input
                                        type="radio"
                                        name="payment"
                                        value="카카오페이"
                                        checked={formData.paymentMethod === '카카오페이'}
                                        onChange={(e) => handleChange('paymentMethod', e.target.value)}
                                    />
                                    <span className="radio-custom"></span>
                                    <div className="payment-info d-flex align-items-center ms-3">
                                        <img className="payment_images" src="/images/reservation/payment-kakaopay.svg" alt="카카오페이" />
                                        <span className="payment-text">카카오페이 결제</span>
                                    </div>
                                </label>

                                <label className="payment-option d-flex align-items-center mb-0">
                                    <input
                                        type="radio"
                                        name="payment"
                                        value="네이버페이"
                                        checked={formData.paymentMethod === '네이버페이'}
                                        onChange={(e) => handleChange('paymentMethod', e.target.value)}
                                    />
                                    <span className="radio-custom"></span>
                                    <div className="payment-info d-flex align-items-center ms-3">
                                        <img className="payment_images" src="/images/reservation/payment-naverpay.svg" alt="네이버페이" />
                                        <span className="payment-text">네이버페이 결제</span>
                                    </div>
                                </label>
                            </div>
                        </div>

                        {/* 정책 알림 및 약관  */}
                        <div className="section-card">
                            <div className="agreement-section">
                                {/* 정책 알림 */}
                                <div className="policy-notice d-flex align-items-start mb-4">
                                    <div className="notice-content">
                                        <div className="notice-title fw-bold mb-1">
                                            <span className="notice-icon me-1"></span>
                                            미성년자 및 법정대리인 필수
                                        </div>
                                        <div className="notice-desc text-muted small">
                                            미성년자는 법정대리인 없이 투숙이 불가능 합니다.
                                        </div>
                                    </div>
                                </div>

                                {/* 전체 동의 */}
                                <label className="agreement-all d-flex align-items-center p-3 mb-3">
                                    <input
                                        type="checkbox"
                                        id="agreeAll"
                                        checked={isAllAgreed}
                                        onChange={(e) => handleAllAgree(e.target.checked)}
                                    />
                                    <span className="checkbox-custom"></span>
                                    <span className="agreement-text ms-2 fw-bold">전체 동의</span>
                                </label>

                                <div className="agreement-divider"></div>

                                {/* 개별 약관 */}
                                <label className="agreement-item d-flex align-items-start justify-content-between mb-3">
                                    <div className="d-flex align-items-start flex-fill">
                                        <input
                                            type="checkbox"
                                            className="individual-agree"
                                            checked={formData.ageAgreed}
                                            onChange={(e) => handleChange('ageAgreed', e.target.checked)}
                                        />
                                        <span className="checkbox-custom"></span>
                                        <span className="agreement-text ms-2 small">
                                            (필수) 만 18세 이상입니다
                                        </span>
                                    </div>
                                </label>

                                <label className="agreement-item d-flex align-items-start justify-content-between mb-3">
                                    <div className="d-flex align-items-start flex-fill">
                                        <input
                                            type="checkbox"
                                            className="individual-agree"
                                            checked={formData.termsAgreed}
                                            onChange={(e) => handleChange('termsAgreed', e.target.checked)}
                                        />
                                        <span className="checkbox-custom"></span>
                                        <span className="agreement-text ms-2 small">
                                            (필수) 이용 약관
                                        </span>
                                    </div>
                                    <a href="#" className="view-modal text-decoration-none ms-2" onClick={(e) => {e.preventDefault();openModal('terms');}}>
                                        보기
                                    </a>
                                </label>

                                <label className="agreement-item d-flex align-items-start justify-content-between mb-3">
                                    <div className="d-flex align-items-start flex-fill">
                                        <input
                                            type="checkbox"
                                            className="individual-agree"
                                            checked={formData.refundPolicyAgreed}
                                            onChange={(e) => handleChange('refundPolicyAgreed', e.target.checked)}
                                        />
                                        <span className="checkbox-custom"></span>
                                        <span className="agreement-text ms-2 small">
                                            (필수) 취소 및 환불 규칙
                                        </span>
                                    </div>
                                    <a href="#" className="view-modal text-decoration-none ms-2" onClick={(e) => {e.preventDefault();openModal('refund');}}>
                                        보기
                                    </a>
                                </label>

                                <label className="agreement-item d-flex align-items-start mb-3">
                                    <input
                                        type="checkbox"
                                        className="individual-agree"
                                        checked={formData.marketingAgreed}
                                        onChange={(e) => handleChange('marketingAgreed', e.target.checked)}
                                    />
                                    <span className="checkbox-custom"></span>
                                    <span className="agreement-text ms-2 small">
                                        (선택) 마케팅, 혜택 정보 수신 동의
                                    </span>
                                </label>

                                <label className="agreement-item d-flex align-items-start justify-content-between mb-0">
                                    <div className="d-flex align-items-start flex-fill">
                                        <input
                                            type="checkbox"
                                            className="individual-agree"
                                            checked={formData.privacyCollectionAgreed}
                                            onChange={(e) => handleChange('privacyCollectionAgreed', e.target.checked)}
                                        />
                                        <span className="checkbox-custom"></span>
                                        <span className="agreement-text ms-2 small">
                                            (선택) 개인정보 수집 및 이용 동의
                                        </span>
                                    </div>
                                    <a
                                        href="#"
                                        className="view-modal text-decoration-none ms-2"
                                        onClick={(e) => {
                                            e.preventDefault();
                                            openModal('privacy');
                                        }}
                                    >
                                        보기
                                    </a>
                                </label>
                            </div>
                        </div>
                    </div>

                    {/* 오른쪽: 결제 정보 요약 */}
                    <div className="col-lg-4">
                        <div className="section-card final-payment-section">
                            <div className="section-header mb-4">결제 금액</div>

                            {priceData ? (
                                <>
                                    <div className="final-payment-info mb-3 row">
                                        <div className="final-payment-detail final-payment-date-detail col-12 text-muted small mb-1">
                                            객실 1개 x {priceData.totalNights}박
                                        </div>

                                        <div className="col-12 d-flex">
                                            <div className="col-1 pt-2 pay-line-con">
                                                <div className="vr pay-line"></div>
                                            </div>
                                            <div className="col-11">
                                                {priceData.dailyPrices && (() => {
                                                    const weekdayDays = priceData.dailyPrices.filter(d => d.dayType === '평일');
                                                    const weekendDays = priceData.dailyPrices.filter(d => d.dayType === '주말');

                                                    return (
                                                        <>
                                                            {weekdayDays.length > 0 && (
                                                                <div className="final-payment-detail final-payment-detail-won text-muted small mb-1">
                                                                    평일 {reservationFormatters.formatPrice(weekdayDays[0].price)}원 × {weekdayDays.length}박
                                                                </div>
                                                            )}
                                                            {weekendDays.length > 0 && (
                                                                <div className="final-payment-detail final-payment-detail-won text-muted small mb-1">
                                                                    주말 {reservationFormatters.formatPrice(weekendDays[0].price)}원 × {weekendDays.length}박
                                                                </div>
                                                            )}
                                                        </>
                                                    );
                                                })()}
                                                <div className="final-payment-detail text-muted small">
                                                    이용 인원 : {guestCount}명
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div className="payment-info-dotted-line"></div>

                                    <div className="price-section d-flex justify-content-between align-items-center pt-3 mb-4">
                                        <div className="final-price-label fw-bold">최종 가격</div>
                                        <div className="final-price-won fw-bold">
                                            ₩ {reservationFormatters.formatPrice(priceData.totalPrice)}
                                        </div>
                                    </div>

                                    <button
                                        className="payment-btn w-100 btn"
                                        onClick={handleSubmit}
                                        disabled={loading}
                                    > 결제하기
                                    </button>
                                </>
                            ) : (
                                <div className="text-center py-5">
                                    <div className="spinner-border spinner-border-sm" role="status">
                                        {/*<span className="visually-hidden">가격 계산 중...</span>*/}
                                    </div>
                                </div>
                            )}
                        </div>
                    </div>
                </div>
            </div>
        </main>

            {/*{isPaymentLoading && <PaymentLoading message="결제 처리 중입니다..." />}*/}
            {isPaymentLoading && (
                <PaymentLoading message="결제 처리 중입니다..." mode="full" />
            )}

            {/*모달 모달 ~ */}
            {showModal && (
                <div
                    className="payment-modal"
                    style={{ display: 'flex' }}
                    onClick={(e) => {
                        if (e.target.className === 'payment-modal') {
                            closeModal();
                        }
                    }}
                >
                    <div className="modal-content">
                        <div className="modal-header">
                            {modalContent.title}
                            <span
                                style={{
                                    position: 'absolute',
                                    right: '20px',
                                    cursor: 'pointer',
                                    fontSize: '20px'
                                }}

                                onClick={closeModal}
                            >
                            ✕
                        </span>
                        </div>
                        <div
                            className="modal-body"
                            dangerouslySetInnerHTML={{ __html: modalContent.content }}
                        />
                        <div
                            className="modal-footer"
                            onClick={() => {
                                if (modalContent.title === '이용 약관') {
                                    handleChange('termsAgreed', true);
                                } else if (modalContent.title === '취소 및 환불 규정') {
                                    handleChange('refundPolicyAgreed', true);
                                } else if (modalContent.title.includes('개인정보')) {
                                    handleChange('marketingAgreed', true);
                                    handleChange('privacyCollectionAgreed', true);
                                }
                                closeModal();
                            }}
                            style={{ cursor: 'pointer' }}
                        >
                            {modalContent.title === '이용 약관' && '약관 동의하기'}
                            {modalContent.title === '취소 및 환불 규정' && '취소 및 환불 규정 동의하기'}
                            {modalContent.title.includes('개인정보') && '개인정보 수집 및 이용 동의하기'}
                        </div>
                    </div>
                </div>
            )}


        </>
    );
};

export default ReservationPaymentPage;