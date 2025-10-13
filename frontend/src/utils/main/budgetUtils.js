/**
 * Budget Slider 유틸리티 함수
 * 경로: C:\ITStudy\dev\travel-shoot\frontend\src\utils\main\budgetUtils.js
 */

// 숫자 포맷팅 (천 단위 콤마)
export const formatNumber = (num) => {
  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};

// 반응형 설정 계산
export const calculateResponsiveConfig = (width) => {
  if (width <= 768) {
    return { itemsPerSlide: 2, showIndicators: true };
  } else if (width <= 1024) {
    return { itemsPerSlide: 2, showIndicators: false };
  } else {
    return { itemsPerSlide: 3, showIndicators: false };
  }
};

// 총 슬라이드 수 계산
export const calculateTotalSlides = (totalItems, itemsPerSlide) => {
  return Math.ceil(totalItems / itemsPerSlide);
};

// 슬라이드 데이터 분할
export const getSlideData = (data, slideIndex, itemsPerSlide) => {
  const start = slideIndex * itemsPerSlide;
  const end = Math.min(start + itemsPerSlide, data.length);
  return data.slice(start, end);
};

// 터치 이벤트 처리
export const handleTouchGesture = (touchStart, touchEnd, threshold = 50) => {
  const diffX = touchStart.x - touchEnd.x;
  const diffY = Math.abs(touchStart.y - touchEnd.y);
  
  if (Math.abs(diffX) > threshold && Math.abs(diffX) > diffY) {
    return diffX > 0 ? 'next' : 'prev';
  }
  return null;
};

// 그리드 템플릿 컬럼 계산 (빈 칸 방지 로직 포함)
export const getGridTemplateColumns = (itemCount, itemsPerSlide, width) => {
  // 실제 카드 개수가 설정보다 적으면 해당 개수만큼만 열 생성
  if (itemCount < itemsPerSlide) {
    return `repeat(${itemCount}, 1fr)`;
  }
  
  // 정상적인 경우 반응형 설정 적용
  if (width <= 1024) {
    return 'repeat(2, 1fr)';
  }
  
  return 'repeat(3, 1fr)';
};

// 그리드 정렬 방식 계산
export const getGridJustifyContent = (itemCount, itemsPerSlide) => {
  return itemCount < itemsPerSlide ? 'flex-start' : 'normal';
};

// 슬라이더 너비 계산
export const getSliderWidth = (totalSlides) => {
  return `${totalSlides * 100}%`;
};

// 슬라이드 너비 계산 (각 슬라이드)
export const getSlideWidth = (totalSlides) => {
  return `${100 / totalSlides}%`;
};

// Budget 데이터
export const BUDGET_DATA = [
  {
    id: 'budget_1',
    name: "펜션 힐링스테이",
    location: "강원도 춘천시 • 춘천역 차량 15분",
    image: "/images/main/main-example.svg",
    rating: 4.2,
    price: 35000,
    discount: 22,
    reviews: "1,240"
  },
  {
    id: 'budget_2',
    name: "모텔 블루스카이",
    location: "부산 해운대구 • 해운대해수욕장 도보 5분",
    image: "/images/main/main-example.svg",
    rating: 4.0,
    price: 42000,
    discount: 24,
    reviews: "890"
  },
  {
    id: 'budget_3',
    name: "게스트하우스 서울역",
    location: "서울 중구 • 서울역 도보 3분",
    image: "/images/main/main-example.svg",
    rating: 3.8,
    price: 28000,
    discount: 26,
    reviews: "2,150"
  },
  {
    id: 'budget_4',
    name: "리조트 오션뷰",
    location: "제주시 • 제주공항 차량 20분",
    image: "/images/main/main-example.svg",
    rating: 4.5,
    price: 68000,
    discount: 24,
    reviews: "756"
  },
  {
    id: 'budget_5',
    name: "호텔 시티센터",
    location: "대구 중구 • 동대구역 도보 10분",
    image: "/images/main/main-example.svg",
    rating: 4.1,
    price: 52000,
    discount: 24,
    reviews: "1,456"
  },
  {
    id: 'budget_6',
    name: "펜션 바다전망",
    location: "강원도 속초시 • 속초해수욕장 도보 3분",
    image: "/images/main/main-example.svg",
    rating: 4.3,
    price: 75000,
    discount: 21,
    reviews: "623"
  }
];