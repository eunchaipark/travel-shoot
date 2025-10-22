import { useEffect } from "react";
import { useLocation } from "react-router-dom";

const ScrollToTop = () => {
    const { pathname } = useLocation();

    useEffect(() => {
        // 라우트(pathname)가 변경될 때만 스크롤 맨 위로 이동
        window.scrollTo({ top: 0, behavior: "smooth" });
    }, [pathname]);

    return null;
};

export default ScrollToTop;
