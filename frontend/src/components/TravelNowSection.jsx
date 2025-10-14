/**
 * Travel Now Section - 통합 컴포넌트
 * 경로: C:\ITStudy\dev\travel-shoot\frontend\src\components\TravelNowSection.jsx
 */

import React, { useEffect, useRef } from 'react';
import { useTravelNow } from '../hooks/useTravelNow';
import { 
  TRAVEL_NOW_DATA, 
  getSlideData, 
  formatCount 
} from '../utils/main/travelNowUtils';

// ============================================================================
// Travel Now Card 컴포넌트
// ============================================================================
const TravelNowCard = ({ destination, onClick }) => {
  const count = formatCount(destination.accommodationCount);

  const handleClick = () => {
    if (onClick) {
      onClick(destination);
    }
  };

  return (
    <div className="travel-now-card" data-id={destination.id} onClick={handleClick}>
      <div className="card-image-container">
        <img src={destination.image} alt={destination.name} className="card-image" />
      </div>
      <div className="card-info">
        <h3 className="card-title">{destination.name}</h3>
        <p className="card-location">{destination.location}</p>
        <div className="card-features">
          {destination.features.map((feature, index) => (
            <span key={index} className="feature-tag">{feature}</span>
          ))}
        </div>
        <div className="accommodation-count">숙소 {count}개</div>
      </div>
    </div>
  );
};

// ============================================================================
// Travel Now Slider 컴포넌트
// ============================================================================
const TravelNowSlider = ({ onCardClick }) => {
  const sliderWrapperRef = useRef(null);
  const containerRef = useRef(null);

  const {
    currentSlide,
    cardsPerSlide,
    totalSlides,
    goToSlide,
    prevSlide,
    nextSlide,
    handleTouchStart,
    handleTouchMove,
    handleTouchEnd,
    canGoPrev,
    canGoNext
  } = useTravelNow();

  // 슬라이더 위치 업데이트 (원본의 updateSliderPosition)
  useEffect(() => {
    if (sliderWrapperRef.current) {
      const translateX = -(currentSlide * (100 / totalSlides));
      sliderWrapperRef.current.style.transform = `translateX(${translateX}%)`;
    }
  }, [currentSlide, totalSlides]);

  // 터치 이벤트를 non-passive로 설정
  useEffect(() => {
    const container = containerRef.current;
    if (!container) return;

    const preventScroll = (e) => {
      const touchCurrent = {
        x: e.touches[0].clientX,
        y: e.touches[0].clientY
      };
      
      if (!container.dataset.touchStartX) return;
      
      const touchStart = {
        x: parseFloat(container.dataset.touchStartX),
        y: parseFloat(container.dataset.touchStartY)
      };
      
      const diffX = Math.abs(touchCurrent.x - touchStart.x);
      const diffY = Math.abs(touchCurrent.y - touchStart.y);
      
      // 가로 스크롤이 세로 스크롤보다 클 때만 기본 동작 방지 (원본과 동일)
      if (diffX > diffY && diffX > 10) {
        e.preventDefault();
      }
    };

    const saveTouchStart = (e) => {
      container.dataset.touchStartX = e.touches[0].clientX;
      container.dataset.touchStartY = e.touches[0].clientY;
    };

    container.addEventListener('touchstart', saveTouchStart, { passive: true });
    container.addEventListener('touchmove', preventScroll, { passive: false });

    return () => {
      container.removeEventListener('touchstart', saveTouchStart);
      container.removeEventListener('touchmove', preventScroll);
    };
  }, []);

  // 슬라이드 렌더링 (원본의 renderSlider)
  const renderSlides = () => {
    const slides = [];
    
    for (let i = 0; i < totalSlides; i++) {
      const slideData = getSlideData(TRAVEL_NOW_DATA, i, cardsPerSlide);
      
      // 원본의 console.log
      console.log(`슬라이드 ${i + 1}: ${i * cardsPerSlide + 1}번부터 ${Math.min((i + 1) * cardsPerSlide, TRAVEL_NOW_DATA.length)}번까지`, slideData.map(d => d.name));
      
      slides.push(
        <div key={i} className="travel-now-grid">
          {slideData.map(destination => (
            <TravelNowCard
              key={destination.id}
              destination={destination}
              onClick={onCardClick}
            />
          ))}
        </div>
      );
    }
    
    return slides;
  };

  // 인디케이터 렌더링 (원본의 renderIndicators)
  const renderIndicators = () => {
    return (
      <div className="slider-indicators" id="travelNowIndicators">
        {Array.from({ length: totalSlides }).map((_, index) => (
          <div
            key={index}
            className={`indicator ${index === currentSlide ? 'active' : ''}`}
            data-slide={index}
            onClick={() => goToSlide(index)}
          />
        ))}
      </div>
    );
  };

  return (
    <div className="content-wrapper">
      {/* 네비게이션 버튼 (원본과 동일) */}
      <button
        className="slider-nav slider-nav-prev"
        id="travelNowPrevBtn"
        onClick={prevSlide}
        disabled={!canGoPrev}
        style={{ opacity: canGoPrev ? 1 : 0.5 }}
      >
        <i className="fas fa-chevron-left"></i>
      </button>
      
      <button
        className="slider-nav slider-nav-next"
        id="travelNowNextBtn"
        onClick={nextSlide}
        disabled={!canGoNext}
        style={{ opacity: canGoNext ? 1 : 0.5 }}
      >
        <i className="fas fa-chevron-right"></i>
      </button>

      {/* 슬라이더 컨테이너 */}
      <div
        ref={containerRef}
        className="slider-container"
        onTouchStart={handleTouchStart}
        onTouchMove={handleTouchMove}
        onTouchEnd={handleTouchEnd}
      >
        <div
          ref={sliderWrapperRef}
          className="slider-wrapper"
          id="travelNowSliderWrapper"
          style={{
            display: 'flex',
            width: `${totalSlides * 100}%`,
            transition: 'transform 0.4s ease-in-out'
          }}
        >
          {renderSlides()}
        </div>
      </div>

      {/* 인디케이터 */}
      {renderIndicators()}
    </div>
  );
};

// ============================================================================
// Travel Now Section 컴포넌트 (메인)
// ============================================================================
const TravelNowSection = () => {
  const sliderRef = useRef(null);

  // 카드 클릭 핸들러 (원본의 addCardEvents)
  const handleCardClick = (destination) => {
    console.log('선택된 여행지:', destination);
    
    // 검색창에 지역명 입력 (원본과 동일)
    const input = document.querySelector('.main-calendar-location-input');
    if (input) {
      input.value = destination.name;
      input.focus();
    }
  };

  // 전역 API 제공 (원본의 window.TravelNowSection)
  useEffect(() => {
    window.TravelNowSection = {
      init: () => console.log('Travel Now Section 이미 초기화됨')
    };

    console.log('Travel Now Section 초기화 완료');

    return () => {
      delete window.TravelNowSection;
    };
  }, []);

  return (
    <section className="travel-now-section">
      <div className="travel-now-container">
        {/* 섹션 헤더 */}
        <div className="section-header">
          <h2 className="section-title">
            <span className="travel-now-highlight">지금 떠나기 좋은 곳</span>
          </h2>
        </div>

        {/* 슬라이더 */}
        <div ref={sliderRef}>
          <TravelNowSlider onCardClick={handleCardClick} />
        </div>
      </div>
    </section>
  );
};

export default TravelNowSection;