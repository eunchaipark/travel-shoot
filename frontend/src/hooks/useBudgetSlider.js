/**
 * Budget Slider 커스텀 훅
 * 경로: C:\ITStudy\dev\travel-shoot\frontend\src\hooks\useBudgetSlider.js
 */

import { useState, useEffect, useCallback, useRef } from 'react';
import {
  calculateResponsiveConfig,
  calculateTotalSlides,
  handleTouchGesture
} from '../utils/main/budgetUtils';

export const useBudgetSlider = (data) => {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [itemsPerSlide, setItemsPerSlide] = useState(3);
  const [showIndicators, setShowIndicators] = useState(false);
  const [isDragging, setIsDragging] = useState(false);
  
  const touchStartRef = useRef({ x: 0, y: 0 });
  const touchCurrentRef = useRef({ x: 0, y: 0 });
  const hasMoved = useRef(false); // 실제로 움직였는지 추적

  const totalSlides = calculateTotalSlides(data.length, itemsPerSlide);

  // 반응형 설정 업데이트
  const updateResponsiveConfig = useCallback(() => {
    const width = window.innerWidth;
    const prevItems = itemsPerSlide;
    const config = calculateResponsiveConfig(width);
    
    setItemsPerSlide(config.itemsPerSlide);
    setShowIndicators(config.showIndicators);
    
    const newTotalSlides = calculateTotalSlides(data.length, config.itemsPerSlide);
    
    // 현재 슬라이드가 범위를 벗어나면 조정
    if (currentSlide >= newTotalSlides) {
      setCurrentSlide(Math.max(0, newTotalSlides - 1));
    }
    
    // itemsPerSlide가 변경되었을 때만 재렌더링 트리거
    return prevItems !== config.itemsPerSlide;
  }, [data.length, itemsPerSlide, currentSlide]);

  // 슬라이드 이동
  const goToSlide = useCallback((index) => {
    if (index >= 0 && index < totalSlides) {
      setCurrentSlide(index);
    }
  }, [totalSlides]);

  const nextSlide = useCallback(() => {
    if (currentSlide < totalSlides - 1) {
      setCurrentSlide(prev => prev + 1);
    }
  }, [currentSlide, totalSlides]);

  const prevSlide = useCallback(() => {
    if (currentSlide > 0) {
      setCurrentSlide(prev => prev - 1);
    }
  }, [currentSlide]);

  // 터치 이벤트 핸들러
  const handleTouchStart = useCallback((e) => {
    touchStartRef.current = {
      x: e.touches[0].clientX,
      y: e.touches[0].clientY
    };
    touchCurrentRef.current = {
      x: e.touches[0].clientX,
      y: e.touches[0].clientY
    };
    hasMoved.current = false; // 리셋
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
    // passive 경고를 피하기 위해 조건 체크만 수행
    if (diffX > diffY && diffX > 10) {
      // preventDefault는 컴포넌트에서 non-passive로 설정 필요
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
    updateResponsiveConfig();
    window.addEventListener('resize', updateResponsiveConfig);
    
    return () => {
      window.removeEventListener('resize', updateResponsiveConfig);
    };
  }, [updateResponsiveConfig]);

  return {
    currentSlide,
    itemsPerSlide,
    totalSlides,
    showIndicators,
    isDragging,
    goToSlide,
    nextSlide,
    prevSlide,
    handleTouchStart,
    handleTouchMove,
    handleTouchEnd,
    canGoPrev: currentSlide > 0,
    canGoNext: currentSlide < totalSlides - 1,
    hasMoved: hasMoved.current // 카드 클릭 판단용
  };
};