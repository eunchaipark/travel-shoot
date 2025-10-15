/**
 * Trending Section - 통합 컴포넌트 (API 연동)
 * 경로: C:\ITStudy\dev\travel-shoot\frontend\src\components\TrendingSection.jsx
 */

import React, { useEffect, useRef, useState } from "react";
import { useTrendingSlider } from "../hooks/useTrendingSlider";
import { fetchAllTrendingData } from "../services/trendingApiService";
import { TRENDING_DATA, getSlideData } from "../utils/main/trendingUtils";

// ============================================================================
// Trending Card 컴포넌트
// ============================================================================
const TrendingCard = ({ item, currentTab, onClick }) => {
  const handleClick = () => {
    if (onClick) {
      onClick(item, currentTab);
    }
  };

  return (
    <div
      className="trending-card"
      data-id={item.id}
      data-type={currentTab}
      onClick={handleClick}
    >
      <div className="card-image-container">
        <img src={item.image} alt={item.title} className="card-image" />
        <div className="category-badge">{item.category}</div>
      </div>
      <div className="card-info">
        <h3 className="card-title">{item.title}</h3>
        <div className="card-details">
          <div className="rating-info">
            <span className="rating">★ {item.rating}</span>
            <span className="reviews">({item.reviews})</span>
          </div>
          {currentTab === "stay" && <div className="price">₩{item.price}</div>}
        </div>
      </div>
    </div>
  );
};

// ============================================================================
// Trending Slider 컴포넌트
// ============================================================================
const TrendingSlider = ({ currentTab, trendingData, onCardClick }) => {
  const sliderRef = useRef(null);
  const containerRef = useRef(null);

  const {
    currentSlideIndex,
    cardsPerSlide,
    totalSlides,
    showIndicators,
    prevSlide,
    nextSlide,
    goToSlide,
    handleTouchStart,
    handleTouchMove,
    handleTouchEnd,
    canGoPrev,
    canGoNext,
  } = useTrendingSlider();

  // 슬라이더 위치 업데이트
  useEffect(() => {
    if (sliderRef.current) {
      const translateX = -(currentSlideIndex * (100 / totalSlides));
      sliderRef.current.style.transform = `translateX(${translateX}%)`;
    }
  }, [currentSlideIndex, totalSlides]);

  // 터치 이벤트를 non-passive로 설정
  useEffect(() => {
    const container = containerRef.current;
    if (!container) return;

    const preventScroll = (e) => {
      const touchCurrent = {
        x: e.touches[0].clientX,
        y: e.touches[0].clientY,
      };

      if (!container.dataset.touchStartX) return;

      const touchStart = {
        x: parseFloat(container.dataset.touchStartX),
        y: parseFloat(container.dataset.touchStartY),
      };

      const diffX = Math.abs(touchCurrent.x - touchStart.x);
      const diffY = Math.abs(touchCurrent.y - touchStart.y);

      if (diffX > diffY && diffX > 10) {
        e.preventDefault();
      }
    };

    const saveTouchStart = (e) => {
      container.dataset.touchStartX = e.touches[0].clientX;
      container.dataset.touchStartY = e.touches[0].clientY;
    };

    container.addEventListener("touchstart", saveTouchStart, { passive: true });
    container.addEventListener("touchmove", preventScroll, { passive: false });

    return () => {
      container.removeEventListener("touchstart", saveTouchStart);
      container.removeEventListener("touchmove", preventScroll);
    };
  }, []);

  // 각 슬라이드 렌더링 (API 데이터 사용)
  const renderSlides = () => {
    const currentData = trendingData[currentTab] || [];
    const slides = [];

    // 데이터가 없으면 빈 메시지 표시
    if (currentData.length === 0) {
      return (
        <div className="trending-grid">
          <div className="no-data-message">데이터를 불러오는 중입니다...</div>
        </div>
      );
    }

    for (let i = 0; i < totalSlides; i++) {
      const slideData = getSlideData(currentData, i, cardsPerSlide);

      slides.push(
        <div key={i} className="trending-grid">
          {slideData.map((item) => (
            <TrendingCard
              key={item.id}
              item={item}
              currentTab={currentTab}
              onClick={onCardClick}
            />
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
      <div
        className="slider-indicators"
        id="trendingIndicators"
        style={{ display: showIndicators ? "flex" : "none" }}
      >
        {Array.from({ length: totalSlides }).map((_, index) => (
          <div
            key={index}
            className={`indicator ${
              index === currentSlideIndex ? "active" : ""
            }`}
            data-slide={index}
            onClick={() => goToSlide(index)}
          />
        ))}
      </div>
    );
  };

  return (
    <div className="content-wrapper">
      {/* 네비게이션 버튼 */}
      <button
        className="slider-nav slider-nav-prev"
        onClick={prevSlide}
        disabled={!canGoPrev}
        style={{ opacity: canGoPrev ? 1 : 0.5 }}
      >
        <i className="fas fa-chevron-left"></i>
      </button>

      <button
        className="slider-nav slider-nav-next"
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
          ref={sliderRef}
          className="slider-wrapper"
          id="trendingSlider"
          style={{
            display: "flex",
            width: `${totalSlides * 100}%`,
            transition: "transform 0.4s ease-in-out",
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
// Trending Section 컴포넌트 (메인)
// ============================================================================
const TrendingSection = () => {
  const sliderRef = useRef(null);
  const [trendingData, setTrendingData] = useState(TRENDING_DATA); // 기본값 설정
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const { currentTab, switchTab } = useTrendingSlider();

  // API에서 Trending 데이터 가져오기
  useEffect(() => {
    const loadTrendingData = async () => {
      try {
        setLoading(true);
        setError(null);

        console.log("Trending 데이터 로딩 시작...");
        const data = await fetchAllTrendingData();
        console.log("Trending 데이터 로딩 완료:", data);

        setTrendingData(data);
      } catch (err) {
        console.error("Trending 데이터 로딩 실패:", err);
        setError(err.message);
        // 에러 시 기본 데이터 유지 (TRENDING_DATA)
        console.log("기본 데이터 사용");
      } finally {
        setLoading(false);
      }
    };

    loadTrendingData();
  }, []); // 컴포넌트 마운트 시 한번만 실행

  // 카드 클릭 핸들러
  const handleCardClick = (item, tabType) => {
    console.log("Trending 카드 클릭:", tabType, item.id);
    // 여기에 카드 클릭 시 동작 구현
    // 예: 상세 페이지 이동, 모달 표시 등

    // 예시: 상세 페이지로 이동
    // if (tabType === 'stay') {
    //   window.location.href = `/stays/${item.id}`;
    // } else if (tabType === 'restaurants') {
    //   window.location.href = `/restaurants/${item.id}`;
    // } else if (tabType === 'attractions') {
    //   window.location.href = `/activities/${item.id}`;
    // }
  };

  // 전역 API 제공
  useEffect(() => {
    window.TrendingSection = {
      init: () => console.log("Trending Slider 이미 초기화됨"),
      switchTab: (tab) => switchTab(tab),
      reload: async () => {
        console.log("Trending 데이터 재로딩...");
        try {
          const data = await fetchAllTrendingData();
          setTrendingData(data);
          console.log("Trending 데이터 재로딩 완료");
        } catch (err) {
          console.error("Trending 데이터 재로딩 실패:", err);
        }
      },
    };

    console.log("Trending Slider 초기화 완료");

    return () => {
      delete window.TrendingSection;
    };
  }, [switchTab]);

  // 로딩 상태 표시
  if (loading) {
    return (
      <section className="trending-section">
        <div className="trending-container">
          <div className="section-header">
            <h2 className="section-title">
              <span className="trending-highlight">인기 급상승</span>
            </h2>
            <p className="section-subtitle">(최근 7일 예약률 급상승)</p>
          </div>
          <div className="loading-message">
            <p>인기 급상승 데이터를 불러오는 중입니다...</p>
          </div>
        </div>
      </section>
    );
  }

  // 에러 상태 표시 (기본 데이터는 계속 표시)
  if (error) {
    console.warn("API 에러 발생, 기본 데이터 사용:", error);
  }

  return (
    <section className="trending-section">
      <div className="trending-container">
        {/* 섹션 헤더 */}
        <div className="section-header">
          <h2 className="section-title">
            <span className="trending-highlight">인기 급상승</span>
          </h2>
          <p className="section-subtitle">(최근 7일 예약률 급상승)</p>
          {error && (
            <p
              className="error-message"
              style={{ color: "#ff6b6b", fontSize: "12px" }}
            >
              ⚠️ 실시간 데이터를 불러올 수 없어 샘플 데이터를 표시합니다.
            </p>
          )}
        </div>

        {/* 탭 네비게이션 */}
        <div className="tab-navigation">
          <button
            className={`tab-button ${currentTab === "stay" ? "active" : ""}`}
            data-tab="stay"
            onClick={() => switchTab("stay")}
          >
            숙소
          </button>
          <button
            className={`tab-button ${
              currentTab === "restaurants" ? "active" : ""
            }`}
            data-tab="restaurants"
            onClick={() => switchTab("restaurants")}
          >
            맛집
          </button>
          <button
            className={`tab-button ${
              currentTab === "attractions" ? "active" : ""
            }`}
            data-tab="attractions"
            onClick={() => switchTab("attractions")}
          >
            관광지
          </button>
        </div>

        {/* 슬라이더 */}
        <div ref={sliderRef}>
          <TrendingSlider
            currentTab={currentTab}
            trendingData={trendingData}
            onCardClick={handleCardClick}
          />
        </div>
      </div>
    </section>
  );
};

export default TrendingSection;
