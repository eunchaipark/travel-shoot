import React from "react";
import "@/assets/css/payment-loading.css";

const PaymentLoading = ({ message = "로딩 중입니다...", mode = "full" }) => {
    return (
        <div className={`loading-overlay ${mode === "section" ? "section-mode" : ""}`}>
            <div className="loading-content">
                <div className="spinner"></div>
                <p className="loading-message">{message}</p>
            </div>
        </div>
    );
};

export default PaymentLoading;