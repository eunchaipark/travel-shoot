/**
 * Travel Now 커스텀 훅
 * 경로: C:\ITStudy\dev\travel-shoot\frontend\src\hooks\useTravelNow.js
 */

import { useState, useEffect, useCallback, useRef } from 'react';
import {
  calculateResponsiveConfig,
  calculateTotalSlides,
  handleTouchGesture
} from '../utils/main/travelNowUtils';

export const useTravelNow = () => {
  // 원본의 전역 변수와 동일
  const [currentSlide, setCurrentSlide] = useState(0);
  const [cardsPerSlide, setCardsPerSlide] = useState(4);
  const [isDragging, setIsDragging] = useState(false);
  
  const touchStartRef = useRef({ x: 0, y: 0 });
  const touchCurrentRef = useRef({ x: 0, y: 0 });
  const hasMoved = useRef(false);

  const totalSlides = calculateTotalSlides(cardsPerSlide);

  // 화면 크기별 카드 개수 설정 (원본의 updateCardsPerSlide)
  const updateCardsPerSlide = useCallback(() => {
    const width = window.innerWidth;
    const prevCards = cardsPerSlide;
    const config = calculateResponsiveConfig(width);
    
    setCardsPerSlide(config.cardsPerSlide);
    
    const newTotalSlides = calculateTotalSlides(config.cardsPerSlide);
    
    // 현재 슬라이드가 범위를 벗어나면 조정
    if (currentSlide >= newTotalSlides) {
      setCurrentSlide(Math.max(0, newTotalSlides - 1));
    }
    
    // 원본의 console.log
    console.log(`화면 크기: ${width}px, 카드 개수: ${config.cardsPerSlide}개, 총 슬라이드: ${newTotalSlides}개`);
    
    // 카드 개수가 변경되었으면 재렌더링 트리거
    return prevCards !== config.cardsPerSlide;
  }, [cardsPerSlide, currentSlide]);

  // 슬라이드 제어 (원본의 goToSlide, prevSlide, nextSlide)
  const goToSlide = useCallback((index) => {
    if (index < 0 || index >= totalSlides) return;
    setCurrentSlide(index);
  }, [totalSlides]);

  const prevSlide = useCallback(() => {
    if (currentSlide > 0) {
      goToSlide(currentSlide - 1);
    }
  }, [currentSlide, goToSlide]);

  const nextSlide = useCallback(() => {
    if (currentSlide < totalSlides - 1) {
      goToSlide(currentSlide + 1);
    }
  }, [currentSlide, totalSlides, goToSlide]);

  // 터치 이벤트 핸들러 (원본의 setupTouchEvents)
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

  // 초기화 및 리사이즈 이벤트 (원본의 handleResize)
  useEffect(() => {
    updateCardsPerSlide();
    
    const handleResize = () => {
      updateCardsPerSlide();
    };
    
    window.addEventListener('resize', handleResize);
    
    return () => {
      window.removeEventListener('resize', handleResize);
    };
  }, [updateCardsPerSlide]);

  return {
    currentSlide,
    cardsPerSlide,
    totalSlides,
    goToSlide,
    prevSlide,
    nextSlide,
    handleTouchStart,
    handleTouchMove,
    handleTouchEnd,
    canGoPrev: currentSlide > 0,
    canGoNext: currentSlide < totalSlides - 1
  };
};