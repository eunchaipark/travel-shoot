import { BrowserRouter, Routes, Route } from 'react-router-dom';

import MainPage from '@/pages/MainPage';
import MapTestPage from '@/pages/MapTestPage';
import SignupCompletePage from '../pages/SignupCompletePage';

function Router() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<MainPage />} />
        <Route path="/map" element={<MapTestPage />} />
        <Route path="/survey" element={<SignupCompletePage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default Router;
