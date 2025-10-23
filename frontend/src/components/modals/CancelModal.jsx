import React from 'react';
import { calculateRefundPolicy, formatPrice } from '@/utils/reservation/refundCalculator';

const CancelModal = ({
                         show,
                         reservation,
                         cancelReason,
                         setCancelReason,
                         cancelDetail,
                         setCancelDetail,
                         onSubmit,
                         onClose,
                         isSubmitting
                     }) => {
    if (!show || !reservation) return null;

    const { refundAmount, cancelFee, refundDescription } = calculateRefundPolicy(
        reservation.checkInDate,
        reservation.totalPrice
    );

    return (
        <>
            <input
                type="checkbox"
                id="reserve-cancel-modal"
                className="modal-checkbox"
                checked={show}
                onChange={() => {}}
            />
            <div className="modal-overlay">
                <div className="modal-content">
                    <div className="modal-header">
                        <h3 className="modal-title">예약취소</h3>
                        <button
                            className="modal-close"
                            onClick={onClose}
                            disabled={isSubmitting}
                        >
                            ×
                        </button>
                    </div>

                    <div className="input-section">
                        <div className="input-label mb-2">
                            취소사유 <span className="required-star">*</span>
                        </div>
                        <input
                            type="text"
                            className="form-control"
                            placeholder="취소 사유를 입력해주세요."
                            value={cancelReason}
                            onChange={(e) => setCancelReason(e.target.value)}
                            disabled={isSubmitting}
                        />
                    </div>

                    <div className="input-section">
                        <div className="input-label mb-2">상세사유</div>
                        <textarea
                            rows="3"
                            className="form-control"
                            placeholder="취소 사유에 대해 자세히 적어주시면 향후 서비스 개선에 도움이 됩니다."
                            value={cancelDetail}
                            onChange={(e) => setCancelDetail(e.target.value)}
                            disabled={isSubmitting}
                        />
                    </div>

                    <div className="warning-box">
                        <div className="warning-title mb-1">⚠️ 취소 시 주의사항</div>
                        <div className="warning-item mb-0">체크인 3일 전까지: 100% 환불</div>
                        <div className="warning-item mb-0">체크인 1-2일 전: 50% 환불</div>
                        <div className="warning-item mb-0">체크인 당일: 환불 불가</div>
                        <div className="warning-item mb-0">환불은 결제 수단에 따라 3-7일 소요됩니다</div>
                        <div className="warning-item mb-0">취소 후에는 동일 조건으로 재예약이 어려울 수 있습니다</div>
                    </div>

                    <div className="notice-box">
                        <div className="notice-title mb-2">환불 예상 금액</div>
                        <div className="row">
                            <div className="col-12 d-flex mb-2 mt-2">
                                <div className="col-1 pay-line-con">
                                    <div className="vr pay-line"></div>
                                </div>
                                <div className="col-11 refund-info">
                                    <div className="row align-items-center mb-2">
                                        <div className="col">원래 결제 금액</div>
                                        <div className="col-auto pe-4">₩ {formatPrice(reservation.totalPrice)}</div>
                                    </div>
                                    <div className="row align-items-center mb-2">
                                        <div className="col">취소 수수료</div>
                                        <div className="col-auto pe-4">₩ -{formatPrice(cancelFee)}</div>
                                    </div>
                                </div>
                            </div>
                            <div className="payment-info-dotted-line col-12 mb-2"></div>
                            <div className="col-12">
                                <div className="refund-price">₩ {formatPrice(refundAmount)}</div>
                            </div>
                        </div>
                    </div>

                    <div className="modal-actions flex-row">
                        <button
                            className="btn-withdraw"
                            onClick={onSubmit}
                            disabled={isSubmitting || !cancelReason.trim()}
                        >
                            {isSubmitting ? '처리 중...' : '예약취소'}
                        </button>
                        <button
                            className="btn-cancel"
                            onClick={onClose}
                            disabled={isSubmitting}
                        >
                            닫기
                        </button>
                    </div>
                </div>
            </div>
        </>
    );
};

export default CancelModal;