/**
 * Recommend Stay Section - 통합 컴포넌트
 * 경로: C:\ITStudy\dev\travel-shoot\frontend\src\components\main\RecommendStaySection.jsx
 */

import React, { useEffect } from 'react';
import { useRecommendStay } from '@/hooks/useRecommendStay';
import {
  ACCOMMODATION_DATA,
  formatPrice,
  generateStarRating
} from '@/utils/main/recommendationUtils';

// ============================================================================
// Accommodation Card 컴포넌트 (개별 숙소 카드)
// ============================================================================
const AccommodationCard = ({ accommodation, onClick }) => {
  const formattedPrice = formatPrice(accommodation.price);
  const stars = generateStarRating(accommodation.rating);

  const handleClick = () => {
    if (onClick) {
      onClick(accommodation);
    }
  };

  const handleImageError = (e) => {
    e.target.src = 'https://via.placeholder.com/300x300/f0f0f0/666?text=No+Image';
  };

  return (
    <div
      className="accommodation-item"
      data-id={accommodation.id}
      data-lat={accommodation.latitude}
      data-lng={accommodation.longitude}
      onClick={handleClick}
    >
      {/* 이미지 영역 */}
      <div className="accommodation-image-container">
        {/* 배지 (원본과 동일 - 모바일에서는 이미지 위에 배치) */}
        {accommodation.badge && (
          <span className="accommodation-badge">{accommodation.badge}</span>
        )}
        <img
          src={accommodation.image}
          alt={accommodation.title}
          className="accommodation-image"
          onError={handleImageError}
        />
      </div>

      {/* 정보 영역 */}
      <div className="accommodation-info">
        <div className="accommodation-header">
          {/* 제목 */}
          <h3 className="accommodation-title">{accommodation.title}</h3>

          {/* 평점 (원본과 동일 - 5점 만점) */}
          <div className="accommodation-rating">
            <div className="star-rating">
              {stars.map((star) => {
                if (star.type === 'full') {
                  return <i key={star.key} className="fas fa-star star"></i>;
                } else if (star.type === 'half') {
                  return <i key={star.key} className="fas fa-star-half-alt star"></i>;
                } else {
                  return <i key={star.key} className="far fa-star star empty"></i>;
                }
              })}
            </div>
            <span className="rating-text">({accommodation.rating}/5)</span>
          </div>

          {/* 위치 */}
          <div className="accommodation-location">
            <i className="fas fa-map-marker-alt location-icon"></i>
            <span className="location-text">{accommodation.location}</span>
          </div>
        </div>

        {/* 가격 정보 */}
        <div className="accommodation-price">
          <span className="checkin-time">체크인 {accommodation.checkinTime}</span>
          <div className="price-info">
            <span className="price-text">₩ {formattedPrice}</span>
            <span className="price-unit"> (1박당 요금)</span>
          </div>
        </div>
      </div>
    </div>
  );
};

// ============================================================================
// Recommend Stay Section 컴포넌트 (메인)
// ============================================================================
const RecommendStaySection = ({ isLoggedIn = true }) => {
  const { handleAccommodationClick } = useRecommendStay();

  // 원본의 initializeRecommendStaySection 로직
  useEffect(() => {
    console.log('Recommend Stay Section 초기화 완료');
  }, []);

  // 비로그인 시 섹션 숨김 (원본의 hideRecommendStaySection)
  if (!isLoggedIn) {
    return null;
  }

  return (
    <section className="recommend-stay-section">
      <div className="recommend-stay-container">
        {/* 섹션 헤더 */}
        <div className="section-header">
          <h2 className="section-title">
            <span className="username">김여행</span>님 스타일의 숙소
          </h2>
          <p className="section-subtitle">
            <span className="location-name">부산</span>을 좋아하시는{' '}
            <span className="username-sub">○○○</span>님!
          </p>
        </div>

        {/* 콘텐츠 래퍼 */}
        <div className="content-wrapper">
          {/* 숙소 리스트 (원본의 renderAccommodationList) */}
          <div className="accommodation-list-container">
            {/* 원본: getElementById('accommodationList') */}
            <div className="accommodation-list" id="accommodationList">
              {ACCOMMODATION_DATA.map((accommodation) => (
                <AccommodationCard
                  key={accommodation.id}
                  accommodation={accommodation}
                  onClick={handleAccommodationClick}
                />
              ))}
            </div>
          </div>

          {/* 지도 영역 (원본과 동일) */}
          <div className="map-container">
            <div className="map-placeholder">
              <i className="fas fa-map-marker-alt map-icon"></i>
              <p className="map-text">카카오맵 영역</p>
              <small className="map-subtext">숙소 위치가 표시됩니다</small>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default RecommendStaySection;