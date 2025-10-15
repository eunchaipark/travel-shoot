/**
 * Budget Friendly Section - API 연동 버전
 * 경로: frontend/src/components/BudgetFriendlySection.jsx
 */

import React, { useEffect, useRef, useState } from 'react';
import { useBudgetSlider } from '../hooks/useBudgetSlider';
import { 
  formatNumber,
  getSlideData, 
  getGridTemplateColumns, 
  getGridJustifyContent,
  getSliderWidth,
  getSlideWidth
} from '../utils/main/budgetUtils';
import { fetchBudgetFriendlyStays } from '../services/budgetApiService';

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
    e.target.src = '/images/main/main-example.svg';
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
        {item.discount > 0 && (
          <div className="budget-discount-badge">{item.discount}% 할인</div>
        )}
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
const BudgetSlider = ({ data, onCardClick, isLoading, error }) => {
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

  // 슬라이더 위치 업데이트
  useEffect(() => {
    if (sliderWrapperRef.current) {
      const translateX = -(currentSlide * (100 / totalSlides));
      sliderWrapperRef.current.style.transform = `translateX(${translateX}%)`;
    }
  }, [currentSlide, totalSlides]);

  // 로딩 상태
  if (isLoading) {
    return (
      <div className="content-wrapper">
        <div className="budget-slider-container" style={{ 
          minHeight: '400px', 
          display: 'flex', 
          alignItems: 'center', 
          justifyContent: 'center' 
        }}>
          <div style={{ textAlign: 'center', color: '#666' }}>
            <div style={{ fontSize: '24px', marginBottom: '10px' }}>⏳</div>
            <div>가격착한 숙소를 불러오는 중...</div>
          </div>
        </div>
      </div>
    );
  }

  // 에러 상태
  if (error) {
    return (
      <div className="content-wrapper">
        <div className="budget-slider-container" style={{ 
          minHeight: '400px', 
          display: 'flex', 
          alignItems: 'center', 
          justifyContent: 'center' 
        }}>
          <div style={{ textAlign: 'center', color: '#e74c3c' }}>
            <div style={{ fontSize: '24px', marginBottom: '10px' }}>⚠️</div>
            <div>데이터를 불러오는데 실패했습니다.</div>
            <div style={{ fontSize: '14px', marginTop: '5px', color: '#999' }}>
              {error}
            </div>
          </div>
        </div>
      </div>
    );
  }

  // 데이터 없음
  if (!data || data.length === 0) {
    return (
      <div className="content-wrapper">
        <div className="budget-slider-container" style={{ 
          minHeight: '400px', 
          display: 'flex', 
          alignItems: 'center', 
          justifyContent: 'center' 
        }}>
          <div style={{ textAlign: 'center', color: '#666' }}>
            <div style={{ fontSize: '24px', marginBottom: '10px' }}>🏨</div>
            <div>가격착한 숙소가 없습니다.</div>
          </div>
        </div>
      </div>
    );
  }

  // 슬라이드 렌더링
  const renderSlides = () => {
    const slides = [];
    const width = window.innerWidth;
    
    for (let i = 0; i < totalSlides; i++) {
      const slideData = getSlideData(data, i, itemsPerSlide);
      const itemsInThisSlide = slideData.length;
      
      const gridColumns = getGridTemplateColumns(itemsInThisSlide, itemsPerSlide, width);
      const justifyContent = getGridJustifyContent(itemsInThisSlide, itemsPerSlide);
      const slideWidth = getSlideWidth(totalSlides);
      
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
        onClick={prevSlide}
        disabled={!canGoPrev}
        style={{ opacity: canGoPrev ? 1 : 0.5 }}
      >
        <i className="fas fa-chevron-left"></i>
      </button>
      
      <button
        className="budget-slider-nav budget-slider-next"
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
          style={{ 
            width: getSliderWidth(totalSlides),
            display: 'flex',
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
// Budget Friendly Section 컴포넌트 (메인) - API 연동
// ============================================================================
const BudgetFriendlySection = () => {
  const sliderRef = useRef(null);
  const [budgetData, setBudgetData] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  // 데이터 로드
  useEffect(() => {
    const loadBudgetData = async () => {
      try {
        setIsLoading(true);
        setError(null);
        
        const data = await fetchBudgetFriendlyStays();
        console.log('변환된 데이터:', data); // 디버깅용
        
        setBudgetData(data);
      } catch (err) {
        console.error('데이터 로드 실패:', err);
        setError(err.message);
      } finally {
        setIsLoading(false);
      }
    };

    loadBudgetData();
  }, []);

  const handleCardClick = (item) => {
    console.log('Budget 카드 클릭:', item);
    // 상세 페이지로 이동
    // 예: window.location.href = `/stay/${item.stayId}`;
  };

  // 전역 API 제공
  useEffect(() => {
    window.BudgetSliderAPI = {
      getRef: () => sliderRef.current,
      getData: () => budgetData,
      reload: async () => {
        const data = await fetchBudgetFriendlyStays();
        setBudgetData(data);
      }
    };

    console.log('Budget Slider 초기화 완료');

    return () => {
      delete window.BudgetSliderAPI;
    };
  }, [budgetData]);

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
          <BudgetSlider 
            data={budgetData} 
            onCardClick={handleCardClick}
            isLoading={isLoading}
            error={error}
          />
        </div>
      </div>
    </section>
  );
};

export default BudgetFriendlySection;