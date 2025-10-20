import React, { useEffect, useRef  } from 'react';
import { useSearchParams, useNavigate } from 'react-router-dom';
import { useAuth } from '@/components/context/AuthContext';
import { useReservation } from '@/hooks/reservation/useReservation';
import { useReservationForm } from '@/hooks/reservation/useReservationForm';
import { reservationFormatters } from '@/utils/formatters/reservationFormatters';
import CompleteHeader from "@/components/layout/CompleteHeader";
import '@/assets/css/common.css';
import '@/assets/css/reservation-payment.css';

const ReservationPaymentPage = () => {
    const [searchParams] = useSearchParams();
    const navigate = useNavigate();
    const { isAuthenticated, openLoginModal, isLoginModalOpen } = useAuth();

    const hasCheckedAuth = useRef(false); // 로그인 체크 완료 여부
    const wasModalOpen = useRef(false);
    const userCancelled = useRef(false); // confirm 취소 선택

    // URL 파라미터
    const roomId = parseInt(searchParams.get('roomId') || '1');
    const checkInDate = searchParams.get('checkInDate') || '2025-10-20';
    const checkOutDate = searchParams.get('checkOutDate') || '2025-10-23';
    const guestCount = parseInt(searchParams.get('guestCount') || '2');

    useEffect(() => {
        // 이미 체크했으면 스킵
        if (hasCheckedAuth.current) {
            return;
        }

        hasCheckedAuth.current = true; // 체크 완료 표시

        // 로그인이 되어 있으면 아무것도 없이 그냥 예약 페이지로 넘어가고
        if (isAuthenticated) {
            return;
        }

        //로그인이 안되어 있으면 confirm 뜨게 하고
        const goToLogin = window.confirm(
            '로그인이 필요한 서비스입니다.\n로그인하시겠습니까?'
        );

        if (goToLogin) {
            console.log('로그인 모달 열기');
            const currentUrl = window.location.pathname + window.location.search;
            sessionStorage.setItem('redirectUrl', currentUrl);
            openLoginModal();
            wasModalOpen.current = true;
        } else {
            userCancelled.current = true; // confirm  취소 선택함
            navigate('/stay/1'); //TODO : 숙소 취소하면 이전 페이지로 윤하님
        }
    }, [isAuthenticated, openLoginModal, navigate]);

    useEffect(() => {
        if (userCancelled.current) { //confirm 에서 취소 선택함
            return;
        }

        // wasModalOpen이 false면 아예 체크 안 함
        if (!wasModalOpen.current) {
            return;
        }

        // 모달이 닫혔는지만 체크
        if (!isLoginModalOpen && !isAuthenticated) {
            console.log('모달 닫힘 + 비로그인 → 숙소 페이지로');
            navigate('/stay/1');
        }
    }, [isLoginModalOpen, isAuthenticated, navigate]);

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

    const handleSubmit = () => {
        createReservation(formData);
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

        <main>
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
                                            src={initData?.mainImageUrl || "/img/payment_hotel_imgae.jpg"}
                                            alt={initData?.stayName}
                                        />
                                    </div>
                                    <div className="stay-info flex-fill lodging-info">
                                        <div className="stay-name mb-1">{initData?.stayName}</div>
                                        <div className="stay-location text-muted small mb-3">
                                            <img className="location_icon me-1" src="/img/payment_location_icon.svg" alt="위치" />
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
                                                ₩ {reservationFormatters.formatPrice(priceData.nightlyPrice)}
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

                        {/* 예약자 정보 */}
                        <div className="section-card mb-4">
                            <div className="section-header">예약자 정보</div>
                            <div className="mb-3">
                                <label className="user-info mb-2">이름</label>
                                <input
                                    type="text"
                                    className="user-inputbox w-100"
                                    placeholder="예약자 이름을 입력하세요"
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
                                <label className="payment-option d-flex align-items-center mb-3">
                                    <input
                                        type="radio"
                                        name="payment"
                                        value="카드결제"
                                        checked={formData.paymentMethod === '카드결제'}
                                        onChange={(e) => handleChange('paymentMethod', e.target.value)}
                                    />
                                    <span className="radio-custom"></span>
                                    <div className="payment-info d-flex align-items-center ms-3">
                                        <img
                                            className="payment_images"
                                            src="/img/payment_card.svg"
                                            alt="카드결제"
                                        />
                                        <span className="payment-text">카드 결제</span>
                                    </div>
                                </label>

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
                                        <img
                                            className="payment_images"
                                            src="/img/payment_kakaopay.svg"
                                            alt="카카오페이"
                                        />
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
                                        <img
                                            className="payment_images"
                                            src="/img/payment_naverpay.svg"
                                            alt="네이버페이"
                                        />
                                        <span className="payment-text">네이버페이 결제</span>
                                    </div>
                                </label>
                            </div>
                        </div>

                        {/* ✅ 정책 알림 및 약관 (퍼블과 동일하게) */}
                        <div className="section-card">
                            <div className="agreement-section">
                                {/* 정책 알림 */}
                                <div className="policy-notice d-flex align-items-start mb-4">
                                    <div className="notice-content">
                                        <div className="notice-title fw-bold mb-1">
                                            <img
                                                className="notice-icon me-1"
                                                src="/img/payment_agree_icon.svg"
                                                alt=""
                                            />
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
                                    <a href="#" className="view-modal text-decoration-none ms-2">
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
                                    <a href="#" className="view-modal text-decoration-none ms-2">
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
                                    <a href="#" className="view-modal text-decoration-none ms-2">
                                        보기
                                    </a>
                                </label>
                            </div>
                        </div>
                    </div>

                    {/* 오른쪽: 결제 정보 요약 */}
                    <div className="col-lg-4">
                        <div className="section-card final-payment-section sticky-top" style={{ top: '20px' }}>
                            <div className="section-header mb-4">결제 금액</div>

                            {priceData ? (
                                <>
                                    <div className="final-payment-info mb-3 row">
                                        <div className="final-payment-detail final-payment-date-detail col-12 text-muted small mb-1">
                                            객실 1개 x {priceData.nights}박
                                        </div>

                                        <div className="col-1">
                                            <span>₩</span>
                                        </div>
                                        <div className="col-11 text-end">
                                            <span>{reservationFormatters.formatPrice(priceData.basePrice)}</span>
                                        </div>

                                        {priceData.weekendSurcharge > 0 && (
                                            <>
                                                <div className="final-payment-detail col-7 text-muted small">
                                                    주말 할증
                                                </div>
                                                <div className="col-1">
                                                    <span>₩</span>
                                                </div>
                                                <div className="col-4 text-end">
                                                    <span>{reservationFormatters.formatPrice(priceData.weekendSurcharge)}</span>
                                                </div>
                                            </>
                                        )}

                                        {priceData.discountAmount > 0 && (
                                            <>
                                                <div className="final-payment-detail col-7 text-danger small">
                                                    할인
                                                </div>
                                                <div className="col-1 text-danger">
                                                    <span>₩</span>
                                                </div>
                                                <div className="col-4 text-end text-danger">
                                                    <span>-{reservationFormatters.formatPrice(priceData.discountAmount)}</span>
                                                </div>
                                            </>
                                        )}
                                    </div>

                                    <div className="price-section d-flex justify-content-between align-items-center mb-4">
                                        <div className="final-price-label">총 결제 금액</div>
                                        <div className="final-price-won">
                                            ₩{reservationFormatters.formatPrice(priceData.totalPrice)}
                                        </div>
                                    </div>

                                    <button
                                        className="payment-btn w-100"
                                        onClick={handleSubmit}
                                        disabled={loading}
                                    >
                                        {loading ? (
                                            <>
                                                <span className="spinner-border spinner-border-sm me-2" role="status"></span>
                                                예약 처리 중...
                                            </>
                                        ) : (
                                            '결제하기'
                                        )}
                                    </button>
                                </>
                            ) : (
                                <div className="text-center py-5">
                                    <div className="spinner-border spinner-border-sm" role="status">
                                        <span className="visually-hidden">가격 계산 중...</span>
                                    </div>
                                </div>
                            )}
                        </div>
                    </div>
                </div>
            </div>
        </main>
        </>
    );
};

export default ReservationPaymentPage;