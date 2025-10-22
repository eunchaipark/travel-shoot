import React, { useEffect, useRef } from "react";
import "@/assets/css/payment-loading.css";

const PaymentLoading = ({ message = "로딩 중입니다...", mode = "full" }) => {


    const overlayRef = useRef(null);

    useEffect(() => {
        if (mode !== "viewport-section") return;

        const overlay = overlayRef.current;
        const section = overlay?.closest(".search-results-section");
        if (!overlay || !section) return;

        const updatePosition = () => {
            const rect = section.getBoundingClientRect();
            const viewportCenter = window.innerHeight / 2;
            if (rect.bottom > 0 && rect.top < window.innerHeight) {
                const top = Math.min(
                    Math.max(viewportCenter, rect.top + 50),
                    rect.bottom - 50
                );
                overlay.style.top = `${top}px`;
            }
        };

        updatePosition();
        window.addEventListener("scroll", updatePosition);
        window.addEventListener("resize", updatePosition);
        return () => {
            window.removeEventListener("scroll", updatePosition);
            window.removeEventListener("resize", updatePosition);
        };
    }, [mode]);

 
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