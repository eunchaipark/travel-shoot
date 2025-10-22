/**
 * Recommend Stay Section - AI 추천 숙소 컴포넌트
 * 경로: frontend/src/components/main/RecommendStaySection.jsx
 */

import React, { useEffect, useState } from 'react';
import { useRecommendStay } from '@/hooks/main/useRecommendStay';
import { useAuth } from '@/components/context/AuthContext';
import { fetchAIRecommendedStays } from '@/services/main/recommendationApiService';
import CommonLoading from '@/components/loading/CommonLoading';
import SurveyModal from "@/components/survey/SurveyModal";
import {
  formatPrice,
  generateStarRating
} from '@/utils/main/recommendationUtils';

// ============================================================================
// Accommodation Card 컴포넌트 (개별 숙소 카드)
// ============================================================================
const AccommodationCard = ({ accommodation, onClick }) => {
  const formattedPrice = formatPrice(accommodation.price);
  const stars = generateStarRating(accommodation.rating);

  // location에서 뒷부분 추출 ("제주시 • 제주특별자치도..." → "제주특별자치도...")
  const getDetailAddress = (location) => {
    if (!location) return '';
    const parts = location.split('•');
    return parts[1] ? parts[1].trim() : location;
  };

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
        {/* 배지 - AI 추천 점수 표시 */}
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

          {/* 평점 (5점 만점) */}
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

          {/* ✅ 상세 주소 표시 (뒷부분) */}
          <div className="accommodation-location">
            <i className="fas fa-map-marker-alt location-icon"></i>
            <span className="location-text">{getDetailAddress(accommodation.location)}</span>
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
const RecommendStaySection = () => {
  const { handleAccommodationClick } = useRecommendStay();
  const { user, isAuthenticated } = useAuth();
  const [modalOpen, setModalOpen] = useState(false);
  // 상태 관리
  const [accommodations, setAccommodations] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [preferredProvince, setPreferredProvince] = useState('제주특별자치도');

  // 도/시 단위 추출 함수
  const extractProvince = (location) => {
    if (!location) return '제주특별자치도';
    
    // "제주시 • 제주특별자치도 제주시 노연로 12" → "제주특별자치도 제주시 노연로 12"
    const detailPart = location.split('•')[1]?.trim() || location;
    
    // "제주특별자치도", "강원특별자치도", "서울특별시" 등 추출
    const provinceMatch = detailPart.match(/(.*?특별자치도|.*?특별시|.*?광역시|.*?도)/);
    return provinceMatch ? provinceMatch[1] : detailPart.split(' ')[0];
  };

  // AI 추천 숙소 로드
  useEffect(() => {
    const loadAIRecommendations = async () => {
      try {
        setLoading(true);
        setError(null);
        
        // ✅ user 객체에서 userId 가져오기
        if (!user || !user.userId) {
          console.error('로그인이 필요합니다');
          setError('로그인이 필요합니다');
          return;
        }

        console.log('AI 추천 숙소 로딩 시작 - userId:', user.userId);
        console.log('사용자 정보:', user);

        // ✅ user.userId 직접 전달
        const stays = await fetchAIRecommendedStays(user.userId);
        
        console.log('AI 추천 숙소 로딩 완료:', stays);
        setAccommodations(stays);
        
        // ✅ 첫 번째 숙소에서 도/시 단위 추출
        if (stays.length > 0) {
          const province = extractProvince(stays[0].location);
          setPreferredProvince(province);
          console.log('추출된 도/시:', province);
        }
        
      } catch (err) {
        console.error('AI 추천 로딩 실패:', err);
        setError(err.message || '추천 숙소를 불러오는데 실패했습니다');
      } finally {
        setLoading(false);
      }
    };

    // ✅ isAuthenticated와 user 확인 후 실행
    if (isAuthenticated && user) {
      loadAIRecommendations();
    }
  }, [isAuthenticated, user]);

  // 비로그인 시 섹션 숨김
  if (!isAuthenticated) {
    return null;
  }

  //  로딩 상태
  if (loading) {
    return (
      <section className="recommend-stay-section">
        <div className="recommend-stay-container">
          <CommonLoading
            title="사용자에게 맞는 숙소 추천중..."
            description={
              <>
                AI가 장소 정보를 분석하고 있습니다.<br />
                최대 20초 정도 소요됩니다.
              </>
            }
            isModal={false}
          />
        </div>
      </section>
    );
  }


  //  로그인은 했는데 설문조사는 안함
  if (error)
  return (
      <section className="recommend-stay-section">
        <div className="recommend-stay-container">
          <div className="recommend-survey-container">
            
            <p className='recommend-survey-title'>추천 숙소가 없습니다</p>
            <p className='recommmend-survey-write'>설문조사를 완료하시면 맞춤 숙소를 추천해드립니다</p>
            <button
              className="recommend-survey-button"
              onClick={() => setModalOpen(true)} // 버튼 클릭 시 모달 열기
            >
              설문조사 참여하기
            </button>
          </div>
        </div>

        {modalOpen && (
          <SurveyModal
            onClose={() => setModalOpen(false)} // 모달 닫기
            onComplete={() => setModalOpen(false)} // 완료 후 모달 닫기
          />
        )}
      </section>
    );



  //  데이터 없음
  if (!accommodations || accommodations.length === 0) {
    return (
      <section className="recommend-stay-section">
        <div className="recommend-stay-container">
          <div className="empty-container">
            <i className="fas fa-home"></i>
            <p>추천 숙소가 없습니다</p>
            <small>설문조사를 완료하시면 맞춤 숙소를 추천해드립니다</small>
          </div>
        </div>
      </section>
    );
  }

  return (
    <section className="recommend-stay-section">
      <div className="recommend-stay-container">
        {/* 섹션 헤더 */}
        <div className="section-header">
          <p className="section-subtitle">
            {/* ✅ 도/시 단위만 표시 */}
            <span className="location-name">{preferredProvince}</span>를 좋아하시는
            {/* <span className="username-sub">{user?.userName || '김여행'}</span>님! */}
          </p>
          <h2 className="section-title">
            <span className="username">{user?.userName || '김여행'}</span>님 스타일의 숙소
          </h2>
          
        </div>

        {/* 콘텐츠 래퍼 */}
        <div className="content-wrapper">
          {/* 숙소 리스트 */}
          <div className="accommodation-list-container">
            <div className="accommodation-list" id="accommodationList">
              {accommodations.map((accommodation) => (
                <AccommodationCard
                  key={accommodation.id}
                  accommodation={accommodation}
                  onClick={handleAccommodationClick}
                />
              ))}
            </div>
          </div>

          {/* 지도 영역 */}
          <div className="map-container">
            <div className="map-placeholder">
              <i className="fas fa-map-marker-alt map-icon"></i>
              <p className="map-text">카카오맵 영역</p>
              <small className="map-subtext">
                {accommodations.length}개의 추천 숙소 위치가 표시됩니다
              </small>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default RecommendStaySection;