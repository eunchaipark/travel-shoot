import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { AuthProvider } from '@/components/context/AuthContext';

import MainPage from '@/pages/MainPage';
import MapTestPage from '@/pages/MapTestPage';
import SignupCompletePage from '@/pages/SignupCompletePage';
import MyPage from '@/pages/MyPage';

function Router() {
  return (
    <AuthProvider>
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<MainPage />} />
        <Route path="/map" element={<MapTestPage />} />
        <Route path="/signup-complete" element={<SignupCompletePage />} />
        <Route path="/mypage" element={<MyPage />} />
      </Routes>
    </BrowserRouter>
    </AuthProvider>
  );
}

export default Router;
