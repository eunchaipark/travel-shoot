/**
 * Budget Friendly Section - 통합 컴포넌트
 * 섹션, 슬라이더, 카드 컴포넌트를 하나의 파일로 통합
 * 경로: C:\ITStudy\dev\travel-shoot\frontend\src\components\main\BudgetFriendlySection.jsx
 */

import React, { useEffect, useRef } from 'react';
import { useBudgetSlider } from '@/hooks/useBudgetSlider';
import { 
  BUDGET_DATA,
  formatNumber,
  getSlideData, 
  getGridTemplateColumns, 
  getGridJustifyContent,
  getSliderWidth,
  getSlideWidth
} from '@/utils/main/budgetUtils';

// ============================================================================
// Budget Card 컴포넌트
// ============================================================================
const BudgetCard = ({ item, onClick }) => {
  const formattedPrice = formatNumber(item.price);

  const handleClick = () => {
    if (onClick) {
      onClick(item);
    }
  };

  const handleImageError = (e) => {
    e.target.src = 'https://via.placeholder.com/500x350/f0f0f0/666?text=No+Image';
  };

  return (
    <div 
      className="budget-item-card" 
      data-id={item.id} 
      onClick={handleClick}
      style={{ cursor: 'pointer' }}
    >
      <div className="budget-card-image">
        <img
          src={item.image}
          alt={item.name}
          className="budget-img"
          onError={handleImageError}
        />
        <div className="budget-discount-badge">{item.discount}% 할인</div>
      </div>
      <div className="budget-card-content">
        <h3 className="budget-title">{item.name}</h3>
        <p className="budget-location">{item.location}</p>
        <div className="budget-rating">
          <span className="budget-stars">★ {item.rating}</span>
          <span className="budget-reviews">({item.reviews})</span>
        </div>
        <div className="budget-pricing">
          <div className="budget-main-price">₩{formattedPrice}</div>
        </div>
      </div>
    </div>
  );
};

// ============================================================================
// Budget Slider 컴포넌트
// ============================================================================
const BudgetSlider = ({ data, onCardClick }) => {
  const sliderWrapperRef = useRef(null);
  
  const {
    currentSlide,
    itemsPerSlide,
    totalSlides,
    showIndicators,
    goToSlide,
    nextSlide,
    prevSlide,
    handleTouchStart,
    handleTouchMove,
    handleTouchEnd,
    canGoPrev,
    canGoNext
  } = useBudgetSlider(data);

  // 슬라이더 위치 업데이트 (원본의 updateSliderPosition)
  useEffect(() => {
    if (sliderWrapperRef.current) {
      const translateX = -(currentSlide * (100 / totalSlides));
      sliderWrapperRef.current.style.transform = `translateX(${translateX}%)`;
    }
  }, [currentSlide, totalSlides]);

  // 각 슬라이드 렌더링
  const renderSlides = () => {
    const slides = [];
    const width = window.innerWidth;
    
    for (let i = 0; i < totalSlides; i++) {
      const slideData = getSlideData(data, i, itemsPerSlide);
      const itemsInThisSlide = slideData.length;
      
      // 그리드 설정 계산
      const gridColumns = getGridTemplateColumns(itemsInThisSlide, itemsPerSlide, width);
      const justifyContent = getGridJustifyContent(itemsInThisSlide, itemsPerSlide);
      const slideWidth = getSlideWidth(totalSlides);
      
      // 그리드 클래스 동적 생성 (원본과 동일)
      const gridClass = itemsInThisSlide < itemsPerSlide
        ? `budget-slide-grid budget-partial-grid budget-grid-${itemsInThisSlide}`
        : 'budget-slide-grid';
      
      slides.push(
        <div
          key={i}
          className={gridClass}
          style={{
            gridTemplateColumns: gridColumns,
            justifyContent: justifyContent,
            width: slideWidth,
            flexShrink: 0
          }}
        >
          {slideData.map(item => (
            <BudgetCard key={item.id} item={item} onClick={onCardClick} />
          ))}
        </div>
      );
    }
    
    return slides;
  };

  // 인디케이터 렌더링
  const renderIndicators = () => {
    if (!showIndicators) return null;
    
    return (
      <div className="slider-indicators" id="budgetIndicators">
        {Array.from({ length: totalSlides }).map((_, index) => (
          <div
            key={index}
            className={`indicator ${index === currentSlide ? 'active' : ''}`}
            onClick={() => goToSlide(index)}
            data-slide={index}
          />
        ))}
      </div>
    );
  };

  return (
    <div className="content-wrapper">
      {/* 네비게이션 버튼 */}
      <button
        className="budget-slider-nav budget-slider-prev"
        id="budgetPrevBtn"
        onClick={prevSlide}
        disabled={!canGoPrev}
        style={{ opacity: canGoPrev ? 1 : 0.5 }}
      >
        <i className="fas fa-chevron-left"></i>
      </button>
      
      <button
        className="budget-slider-nav budget-slider-next"
        id="budgetNextBtn"
        onClick={nextSlide}
        disabled={!canGoNext}
        style={{ opacity: canGoNext ? 1 : 0.5 }}
      >
        <i className="fas fa-chevron-right"></i>
      </button>

      {/* 슬라이더 컨테이너 */}
      <div
        className="budget-slider-container"
        onTouchStart={handleTouchStart}
        onTouchMove={handleTouchMove}
        onTouchEnd={handleTouchEnd}
      >
        <div
          ref={sliderWrapperRef}
          className="budget-slider-wrapper"
          id="budgetSliderWrapper"
          style={{ 
            width: getSliderWidth(totalSlides),
            display: 'flex',
            transition: 'transform 0.4s ease-in-out'
          }}
        >
          {renderSlides()}
        </div>
      </div>

      {/* 인디케이터 (모바일용) */}
      {renderIndicators()}
    </div>
  );
};

// ============================================================================
// Budget Friendly Section 컴포넌트 (메인)
// ============================================================================
const BudgetFriendlySection = () => {
  const sliderRef = useRef(null);

  const handleCardClick = (item) => {
    console.log('Budget 카드 클릭:', item.id);
    // 카드 클릭 시 동작 추가
    // 예: 상세 페이지 이동, 모달 표시 등
  };

  // 전역 API 제공 (원본의 window.BudgetSliderAPI)
  useEffect(() => {
    window.BudgetSliderAPI = {
      getRef: () => sliderRef.current
    };

    console.log('Budget Slider 초기화 완료');

    return () => {
      delete window.BudgetSliderAPI;
    };
  }, []);

  return (
    <section className="budget-friendly-section">
      <div className="budget-friendly-container">
        {/* 섹션 헤더 */}
        <div className="section-header">
          <h2 className="section-title">
            <span className="budget-highlight">가격착한</span> 숙소
          </h2>
          <p className="section-subtitle">합리적인 가격의 인기 숙소</p>
        </div>

        {/* 슬라이더 */}
        <div ref={sliderRef}>
          <BudgetSlider data={BUDGET_DATA} onCardClick={handleCardClick} />
        </div>
      </div>
    </section>
  );
};

export default BudgetFriendlySection;