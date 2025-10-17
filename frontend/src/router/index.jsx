import { BrowserRouter, Routes, Route } from 'react-router-dom';

import MainPage from '@/pages/MainPage';
import ReservationDetailPage from '@/pages/ReservationDetailPage';
import MapTestPage from '@/pages/MapTestPage';

function Router() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<MainPage />} />
        <Route path="/reservation/detail" element={<ReservationDetailPage />} />
        <Route path="/map" element={<MapTestPage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default Router;
