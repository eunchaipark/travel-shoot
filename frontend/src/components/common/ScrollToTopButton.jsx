import { useState, useEffect } from 'react';
import '@/assets/css/scrolltop-button.css';

export default function ScrollToTopButton() {
    const [isVisible, setIsVisible] = useState(false);

    useEffect(() => {
        const toggleVisibility = () => {
            if (window.scrollY > 300) {
                setIsVisible(true);
            } else {
                setIsVisible(false);
            }
        };

        window.addEventListener('scroll', toggleVisibility);

        return () => {
            window.removeEventListener('scroll', toggleVisibility);
        };
    }, []);

    const scrollToTop = () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    };

    return (
        <>
            {isVisible && (
                <button
                    className="scroll-to-top-button"
                    onClick={scrollToTop}
                    aria-label="맨 위로 가기"
                >
                    <svg width="28" height="28" viewBox="0 0 24 24" fill="none">
                        <path
                            d="M12 19V5M5 12L12 5L19 12"
                            stroke="white"
                            strokeWidth="3"
                            strokeLinecap="round"
                            strokeLinejoin="round"
                        />
                    </svg>
                </button>
            )}
        </>
    );
}