/**
 * Travel Now 유틸리티 함수 (업데이트)
 * 경로: C:\ITStudy\dev\travel-shoot\frontend\src\utils\main\travelNowUtils.js
 */

// 숙소 개수 포맷팅
export const formatCount = (count) => {
  return count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};

// 반응형 설정 계산
export const calculateResponsiveConfig = (width) => {
  if (width <= 1200) {
    return { cardsPerSlide: 3 }; // 1200px 이하: 3개씩 → 4슬라이드
  } else {
    return { cardsPerSlide: 4 }; // 1200px 초과: 4개씩 → 3슬라이드
  }
};

// 총 슬라이드 수 계산
export const calculateTotalSlides = (cardsPerSlide) => {
  return Math.ceil(12 / cardsPerSlide);
};

// 슬라이드 데이터 분할
export const getSlideData = (data, slideIndex, cardsPerSlide) => {
  const start = slideIndex * cardsPerSlide;
  const end = Math.min(start + cardsPerSlide, data.length);
  return data.slice(start, end);
};

// 터치 제스처 처리
export const handleTouchGesture = (touchStart, touchEnd, threshold = 50) => {
  const diffX = touchStart.x - touchEnd.x;
  const diffY = Math.abs(touchStart.y - touchEnd.y);

  if (Math.abs(diffX) > threshold && Math.abs(diffX) > diffY) {
    return diffX > 0 ? "next" : "prev";
  }
  return null;
};

// ===== API에서 데이터 가져오기 =====
const API_BASE_URL =
  import.meta.env.VITE_API_URL || "http://localhost:8080/api";

export const fetchTravelNowData = async () => {
  try {
    const response = await fetch(`${window.API_BASE_URL}/api/travel-now/destinations`);
    if (!response.ok) {
      throw new Error("Failed to fetch destinations");
    }
    return await response.json();
  } catch (error) {
    console.error("API 데이터 조회 실패:", error);
    // 폴백: util 데이터 사용
    return TRAVEL_NOW_DATA;
  }
};

// Falling Back으로 사용한다
export const TRAVEL_NOW_DATA = [
  {
    id: 1,
    name: "서울",
    location: "수도권",
    image:
      "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/6cde004e-5a5d-4b8e-877d-46719c677341_Ex_seoul.jpg",
    features: ["벚꽃", "도심", "쇼핑"],
    accommodationCount: 5945,
  },
  {
    id: 2,
    name: "부산",
    location: "경상남도",
    image:
      "https://images.unsplash.com/photo-1586375300773-8384e3e4916f?w=500&h=400&fit=crop",
    features: ["해변", "온천", "맛집"],
    accommodationCount: 3287,
  },
  {
    id: 3,
    name: "제주도",
    location: "제주특별자치도",
    image:
      "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=500&h=400&fit=crop",
    features: ["자연", "힐링", "드라이브"],
    accommodationCount: 4156,
  },
  {
    id: 4,
    name: "강릉",
    location: "강원도",
    image:
      "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=500&h=400&fit=crop",
    features: ["해변", "커피", "산책"],
    accommodationCount: 1832,
  },
  {
    id: 5,
    name: "대구",
    location: "경상북도",
    image:
      "https://images.unsplash.com/photo-1590736969955-71cc94901144?w=500&h=400&fit=crop",
    features: ["문화", "야경", "전통"],
    accommodationCount: 2764,
  },
  {
    id: 6,
    name: "인천",
    location: "경기도",
    image:
      "https://images.unsplash.com/photo-1578895101408-1a36b834405b?w=500&h=400&fit=crop",
    features: ["공항", "항구", "차이나타운"],
    accommodationCount: 1456,
  },
  {
    id: 7,
    name: "전주",
    location: "전라북도",
    image:
      "https://images.unsplash.com/photo-1584464491033-06628f3a6b7b?w=500&h=400&fit=crop",
    features: ["한옥", "전통", "맛집"],
    accommodationCount: 892,
  },
  {
    id: 8,
    name: "경주",
    location: "경상북도",
    image:
      "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=500&h=400&fit=crop",
    features: ["역사", "문화", "유적"],
    accommodationCount: 756,
  },
  {
    id: 9,
    name: "여수",
    location: "전라남도",
    image:
      "https://images.unsplash.com/photo-1590736969955-71cc94901144?w=500&h=400&fit=crop",
    features: ["해상", "야경", "섬"],
    accommodationCount: 1234,
  },
  {
    id: 10,
    name: "춘천",
    location: "강원도",
    image:
      "https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=500&h=400&fit=crop",
    features: ["호수", "닭갈비", "자연"],
    accommodationCount: 645,
  },
  {
    id: 11,
    name: "통영",
    location: "경상남도",
    image:
      "https://images.unsplash.com/photo-1586375300773-8384e3e4916f?w=500&h=400&fit=crop",
    features: ["바다", "케이블카", "굴"],
    accommodationCount: 523,
  },
  {
    id: 12,
    name: "안동",
    location: "경상북도",
    image:
      "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=500&h=400&fit=crop",
    features: ["하회마을", "전통", "역사"],
    accommodationCount: 378,
  },
];
