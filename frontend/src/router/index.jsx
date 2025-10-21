import { BrowserRouter, Routes, Route } from 'react-router-dom';

import MainPage from '@/pages/MainPage';
import MapTestPage from '@/pages/MapTestPage';
import ReviewListPage from '../pages/review/ReviewListPage';
import ReviewWritePage from '../pages/review/ReviewWritePage';

function Router() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<MainPage />} />
        <Route path="/map" element={<MapTestPage />} />

        <Route path="reviews/stays/:stayId" element={<ReviewListPage />} />
        <Route path="reviews" element={<ReviewWritePage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default Router;
