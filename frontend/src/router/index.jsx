import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { AuthProvider } from '@/components/context/AuthContext';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { ReactQueryDevtools } from '@tanstack/react-query-devtools';
import { useEffect } from 'react';
import { useAuth } from '@/components/context/AuthContext';
import ScrollToTop from "@/components/common/ScrollToTop";

import MainPage from '@/pages/MainPage';
import ReservationDetailPage from '@/pages/ReservationDetailPage';
import MapTestPage from '@/pages/MapTestPage';
import ReviewListPage from '@/pages/review/ReviewListPage';
import ReviewWritePage from '@/pages/review/ReviewWritePage';
import StayDetailPage from '@/pages/stay-detail/StayDetailPage';
import SignupCompletePage from '@/pages/SignupCompletePage';
import SearchResultPage from '@/pages/stay/SearchResultPage';
import ReservationPaymentPage from '@/pages/reservation/ReservationPaymentPage';
import AuthModal from '@/components/modals/AuthModal';
import PaymentCompletePage from "@/pages/reservation/PaymentCompletePage.jsx";
import MyPage from '@/pages/MyPage';

//리액트쿼리 클라이언트 생성해야함 (무한스크롤)
const queryClient = new QueryClient({
    defaultOptions: {
        queries: {
            staleTime: 60 * 1000,
            gcTime: 5 * 60 * 1000,
            retry: 1,
            refetchOnWindowFocus: false,
        },
    },
});

function SessionExpiredHandler() {
    const { openLoginModal } = useAuth();

    useEffect(() => {
        const handleSessionExpired = () => {
            console.log('세션 만료 이벤트 수신');
            alert('세션이 만료되었습니다. 다시 로그인해주세요.');
            openLoginModal();
        };

        window.addEventListener('session-expired', handleSessionExpired);

        return () => {
            window.removeEventListener('session-expired', handleSessionExpired);
        };
    }, [openLoginModal]);

    return null;
}

function Router() {
    return (
    <QueryClientProvider client={queryClient}>
    <AuthProvider>
    <BrowserRouter>
        <ScrollToTop />
        <AuthModal/>
      <Routes>
        <Route path="/" element={<MainPage />} />
        <Route path="/reservation/detail" element={<ReservationDetailPage />} />
        <Route path="/map" element={<MapTestPage />} />

        <Route path='/stays/:stayId' element={<StayDetailPage />} />
        <Route path="/reviews/stays/:stayId" element={<ReviewListPage />} />
        <Route path="/reviews/reservations/:reservationId" element={<ReviewWritePage />} />
        <Route path="/survey" element={<SignupCompletePage />} />
        <Route path="/signup-complete" element={<SignupCompletePage />} />
        <Route path="/search" element={<SearchResultPage />} />
        <Route path="/reservation/payment" element={<ReservationPaymentPage />} />
        <Route path="/payment-complete" element={<PaymentCompletePage />} />
        <Route path="/mypage" element={<MyPage />} />
      </Routes>
    </BrowserRouter>
    </AuthProvider>
    {/*<ReactQueryDevtools initialIsOpen={false} />*/}
    </QueryClientProvider>
  );
}
export default Router;
