import React from "react";
import "@/assets/css/payment-loading.css";

const PaymentLoading = ({ message = "결제 처리 중입니다..." }) => {
    return (
        <div className="loading-overlay">
            <div className="loading-content">
                <div className="spinner"></div>
                <p className="loading-message">{message}</p>
            </div>
        </div>
    );
};

export default PaymentLoading;