/**
 * Trending Slider 커스텀 훅
 * 경로: C:\ITStudy\dev\travel-shoot\frontend\src\hooks\useTrendingSlider.js
 */

import { useState, useEffect, useCallback, useRef } from 'react';
import {
  calculateResponsiveConfig,
  calculateTotalSlides,
  handleTouchGesture
} from '@/utils/main/trendingUtils';

export const useTrendingSlider = () => {
  // 원본의 state와 동일
  const [currentSlideIndex, setCurrentSlideIndex] = useState(0);
  const [currentTab, setCurrentTab] = useState('stay');
  const [cardsPerSlide, setCardsPerSlide] = useState(4);
  const [showIndicators, setShowIndicators] = useState(false);
  const [isDragging, setIsDragging] = useState(false);
  
  const touchStartRef = useRef({ x: 0, y: 0 });
  const touchCurrentRef = useRef({ x: 0, y: 0 });
  const hasMoved = useRef(false);

  const totalSlides = calculateTotalSlides(cardsPerSlide);

  // 반응형 설정 업데이트 (원본의 updateResponsiveSettings)
  const updateResponsiveSettings = useCallback(() => {
    const width = window.innerWidth;
    const prevCards = cardsPerSlide;
    const config = calculateResponsiveConfig(width);
    
    setCardsPerSlide(config.cardsPerSlide);
    setShowIndicators(config.showIndicators);
    
    const newTotalSlides = calculateTotalSlides(config.cardsPerSlide);
    
    // 현재 슬라이드 인덱스 보정
    if (currentSlideIndex >= newTotalSlides) {
      setCurrentSlideIndex(Math.max(0, newTotalSlides - 1));
    }
    
    // 카드 개수가 변경되었으면 재렌더링 트리거
    return prevCards !== config.cardsPerSlide;
  }, [cardsPerSlide, currentSlideIndex]);

  // 탭 전환 (원본의 switchTab)
  const switchTab = useCallback((newTab) => {
    setCurrentTab(newTab);
    setCurrentSlideIndex(0); // 원본: 탭 전환 시 슬라이드 인덱스 0으로 리셋
  }, []);

  // 슬라이드 제어
  const prevSlide = useCallback(() => {
    if (currentSlideIndex > 0) {
      setCurrentSlideIndex(prev => prev - 1);
    }
  }, [currentSlideIndex]);

  const nextSlide = useCallback(() => {
    if (currentSlideIndex < totalSlides - 1) {
      setCurrentSlideIndex(prev => prev + 1);
    }
  }, [currentSlideIndex, totalSlides]);

  const goToSlide = useCallback((index) => {
    if (index >= 0 && index < totalSlides) {
      setCurrentSlideIndex(index);
    }
  }, [totalSlides]);

  // 터치 이벤트 핸들러 (원본과 동일)
  const handleTouchStart = useCallback((e) => {
    touchStartRef.current = {
      x: e.touches[0].clientX,
      y: e.touches[0].clientY
    };
    touchCurrentRef.current = {
      x: e.touches[0].clientX,
      y: e.touches[0].clientY
    };
    hasMoved.current = false;
    setIsDragging(true);
  }, []);

  const handleTouchMove = useCallback((e) => {
    if (!isDragging) return;
    
    touchCurrentRef.current = {
      x: e.touches[0].clientX,
      y: e.touches[0].clientY
    };
    
    const diffX = Math.abs(touchCurrentRef.current.x - touchStartRef.current.x);
    const diffY = Math.abs(touchCurrentRef.current.y - touchStartRef.current.y);
    
    // 10px 이상 움직였으면 드래그로 인식
    if (diffX > 10 || diffY > 10) {
      hasMoved.current = true;
    }
    
    // 가로 스와이프가 세로 스크롤보다 크면 스크롤 방지
    if (diffX > diffY && diffX > 10) {
      hasMoved.current = true;
    }
  }, [isDragging]);

  const handleTouchEnd = useCallback(() => {
    if (!isDragging) return;
    
    const wasDragging = hasMoved.current;
    setIsDragging(false);
    
    // 실제로 드래그했을 때만 슬라이드 이동
    if (wasDragging) {
      const gesture = handleTouchGesture(touchStartRef.current, touchCurrentRef.current);
      
      if (gesture === 'next') {
        nextSlide();
      } else if (gesture === 'prev') {
        prevSlide();
      }
    }
    
    hasMoved.current = false;
  }, [isDragging, nextSlide, prevSlide]);

  // 윈도우 리사이즈 이벤트
  useEffect(() => {
    updateResponsiveSettings();
    window.addEventListener('resize', updateResponsiveSettings);
    
    return () => {
      window.removeEventListener('resize', updateResponsiveSettings);
    };
  }, [updateResponsiveSettings]);

  return {
    currentSlideIndex,
    currentTab,
    cardsPerSlide,
    totalSlides,
    showIndicators,
    switchTab,
    prevSlide,
    nextSlide,
    goToSlide,
    handleTouchStart,
    handleTouchMove,
    handleTouchEnd,
    canGoPrev: currentSlideIndex > 0,
    canGoNext: currentSlideIndex < totalSlides - 1
  };
};