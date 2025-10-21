import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { AuthProvider } from '@/components/context/AuthContext';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { ReactQueryDevtools } from '@tanstack/react-query-devtools';

import MainPage from '@/pages/MainPage';
import MapTestPage from '@/pages/MapTestPage';
import SignupCompletePage from '@/pages/SignupCompletePage';
import SearchResultPage from '@/pages/stay/SearchResultPage';
import ReservationPaymentPage from '@/pages/reservation/ReservationPaymentPage';
import StayDetailPage from '@/pages/stay/StayDetailPage'; //TODO : 일단 임시로 만들어둠 윤하님 코드 올리시면 거기로 연결하면 될듯
import AuthModal from '@/components/modals/AuthModal'; // 로그인 모달창 띄워야함...
import PaymentCompletePage from "@/pages/reservation/PaymentCompletePage.jsx";
import MyPage from '@/pages/MyPage';

//리액트쿼리 클라이언트 생성해야함
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

function Router() {
    return (
    <QueryClientProvider client={queryClient}>
    <AuthProvider>
    <BrowserRouter>
        <AuthModal/>
      <Routes>
        <Route path="/" element={<MainPage />} />
        <Route path="/map" element={<MapTestPage />} />
        <Route path="/survey" element={<SignupCompletePage />} />
        <Route path="/signup-complete" element={<SignupCompletePage />} />
        <Route path="/search" element={<SearchResultPage />} />
        <Route path="/stay/:stayId" element={<StayDetailPage/>} />
        <Route path="/reservation/payment" element={<ReservationPaymentPage />} />
        <Route path="/payment-complete" element={<PaymentCompletePage />} />
        <Route path="/mypage" element={<MyPage />} />
      </Routes>
    </BrowserRouter>
    </AuthProvider>
    <ReactQueryDevtools initialIsOpen={false} />
    </QueryClientProvider>
  );
}
export default Router;
