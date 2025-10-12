/**
 * Recommend Stay 커스텀 훅
 * 경로: C:\ITStudy\dev\travel-shoot\frontend\src\hooks\useRecommendStay.js
 */

import { useState, useEffect, useCallback } from 'react';
import { isMobileScreen, ACCOMMODATION_DATA } from '../utils/main/recommendationUtils';

export const useRecommendStay = () => {
  const [isMobile, setIsMobile] = useState(false);

  // 화면 크기 체크 및 업데이트 (원본의 handleScreenResize)
  const handleScreenResize = useCallback(() => {
    setIsMobile(isMobileScreen());
    // 원본: 필요시 화면 크기 변경에 따른 처리 로직 추가
  }, []);

  // 초기화 및 리사이즈 이벤트 (원본과 완전히 동일)
  useEffect(() => {
    // 초기 화면 크기 체크
    handleScreenResize();

    // 원본의 window.addEventListener('resize') 로직
    const handleResize = () => {
      clearTimeout(window.resizeTimeout);
      window.resizeTimeout = setTimeout(handleScreenResize, 250);
    };

    window.addEventListener('resize', handleResize);
    
    return () => {
      window.removeEventListener('resize', handleResize);
      clearTimeout(window.resizeTimeout);
    };
  }, [handleScreenResize]);

  // 숙소 클릭 핸들러 (원본의 addAccommodationClickEvents 로직과 완전히 동일)
  const handleAccommodationClick = useCallback((accommodation) => {
    const accommodationId = accommodation.id;
    const lat = accommodation.latitude;
    const lng = accommodation.longitude;
    
    // 숙소 상세 페이지로 이동하거나 지도에서 해당 위치 표시
    console.log('숙소 클릭:', accommodationId, lat, lng);
    
    // 실제 구현에서는 다음과 같은 동작을 수행:
    // 1. 숙소 상세 페이지로 이동
    // 2. 지도에서 해당 위치 하이라이트
    // 3. 모달창으로 상세 정보 표시
    
    // 예시: 간단한 알림 (원본과 동일)
    const accommodationData = ACCOMMODATION_DATA.find(acc => acc.id === accommodationId);
    if (accommodationData) {
      alert('선택한 숙소: ' + accommodationData.title);
    }
  }, []);

  return {
    isMobile,
    handleAccommodationClick
  };
};