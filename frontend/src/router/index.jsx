import { BrowserRouter, Routes, Route } from 'react-router-dom';

import MainPage from '@/pages/MainPage';
import MapTestPage from '@/pages/MapTestPage';
import ReviewListPage from '../pages/review/ReviewListPage';
import ReviewWritePage from '../pages/review/ReviewWritePage';
import StayDetailPage from '../pages/stay-detail/StayDetailPage';

function Router() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<MainPage />} />
        <Route path="/map" element={<MapTestPage />} />

        <Route path='/stays/:stayId' element={<StayDetailPage />} />
        <Route path="/reviews/stays/:stayId" element={<ReviewListPage />} />
        <Route path="/reviews/reservations/:reservationId" element={<ReviewWritePage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default Router;
