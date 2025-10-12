/**
 * Trending Section 유틸리티 함수
 * 경로: C:\ITStudy\dev\travel-shoot\frontend\src\utils\main\trendingUtils.js
 */

// 반응형 설정 계산 (원본과 동일)
export const calculateResponsiveConfig = (width) => {
  // 모바일: 3개, 태블릿: 3개, 데스크톱: 4개
  if (width <= 768) {
    return { cardsPerSlide: 3, showIndicators: true };
  } else if (width <= 1200) {
    return { cardsPerSlide: 3, showIndicators: false };
  } else {
    return { cardsPerSlide: 4, showIndicators: false };
  }
};

// 총 슬라이드 수 계산 (원본: 항상 12개 아이템 기준)
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
    return diffX > 0 ? 'next' : 'prev';
  }
  return null;
};

// Trending 데이터 (원본과 완전히 동일)
export const TRENDING_DATA = {
  stay: [
    { id: 1, title: "부산 해운대 럭셔리 호텔", image: "/images/main/main-example.svg", rating: "4.8", reviews: "2,840", price: "180,000", category: "호텔" },
    { id: 2, title: "서울 강남 부티크 호텔", image: "/images/main/main-example.svg", rating: "4.7", reviews: "1,920", price: "220,000", category: "호텔" },
    { id: 3, title: "제주 감귤농장 펜션", image: "/images/main/main-example.svg", rating: "4.9", reviews: "850", price: "120,000", category: "펜션" },
    { id: 4, title: "속초 해변 리조트", image: "/images/main/main-example.svg", rating: "4.6", reviews: "3,200", price: "250,000", category: "모텔" },
    { id: 5, title: "경주 한옥 게스트하우스", image: "/images/main/main-example.svg", rating: "4.8", reviews: "1,150", price: "95,000", category: "한옥" },
    { id: 6, title: "인천공항 캡슐호텔", image: "/images/main/main-example.svg", rating: "4.5", reviews: "2,400", price: "80,000", category: "호텔" },
    { id: 7, title: "대전 비즈니스 호텔", image: "/images/main/main-example.svg", rating: "4.4", reviews: "980", price: "110,000", category: "호텔" },
    { id: 8, title: "울산 온천 리조트", image: "/images/main/main-example.svg", rating: "4.7", reviews: "1,680", price: "190,000", category: "모텔" },
    { id: 9, title: "강릉 바다뷰 펜션", image: "/images/main/main-example.svg", rating: "4.6", reviews: "720", price: "140,000", category: "펜션" },
    { id: 10, title: "양평 힐링 스테이", image: "/images/main/main-example.svg", rating: "4.8", reviews: "950", price: "160,000", category: "펜션" },
    { id: 11, title: "전주 한옥 호텔", image: "/images/main/main-example.svg", rating: "4.7", reviews: "1,300", price: "130,000", category: "모텔" },
    { id: 12, title: "남해 글램핑장", image: "/images/main/main-example.svg", rating: "4.5", reviews: "680", price: "170,000", category: "모텔" }
  ],
  restaurants: [
    { id: 13, title: "강남 미슐랭 레스토랑", image: "/images/main/main-example.svg", rating: "4.9", reviews: "3,500", price: "150,000", category: "한식" },
    { id: 14, title: "부산 해산물 전문점", image: "/images/main/main-example.svg", rating: "4.8", reviews: "2,100", price: "45,000", category: "일식" },
    { id: 15, title: "제주 흑돼지 맛집", image: "/images/main/main-example.svg", rating: "4.7", reviews: "1,800", price: "35,000", category: "한식" },
    { id: 16, title: "명동 전통 한정식", image: "/images/main/main-example.svg", rating: "4.6", reviews: "2,800", price: "80,000", category: "중식" },
    { id: 17, title: "이태원 퓨전 요리", image: "/images/main/main-example.svg", rating: "4.5", reviews: "1,200", price: "65,000", category: "양식" },
    { id: 18, title: "홍대 브런치 카페", image: "/images/main/main-example.svg", rating: "4.4", reviews: "950", price: "25,000", category: "디저트" },
    { id: 19, title: "광주 전통 시장 맛집", image: "/images/main/main-example.svg", rating: "4.8", reviews: "1,500", price: "18,000", category: "디저트" },
    { id: 20, title: "대구 치킨 전문점", image: "/images/main/main-example.svg", rating: "4.6", reviews: "3,200", price: "28,000", category: "한식" },
    { id: 21, title: "인사동 전통차 카페", image: "/images/main/main-example.svg", rating: "4.5", reviews: "890", price: "15,000", category: "중식" },
    { id: 22, title: "용산 스테이크 하우스", image: "/images/main/main-example.svg", rating: "4.7", reviews: "1,640", price: "120,000", category: "일식" },
    { id: 23, title: "여의도 일식당", image: "/images/main/main-example.svg", rating: "4.6", reviews: "2,100", price: "90,000", category: "양식" },
    { id: 24, title: "압구정 이탈리안", image: "/images/main/main-example.svg", rating: "4.8", reviews: "1,750", price: "85,000", category: "디저트" }
  ],
  attractions: [
    { id: 25, title: "경복궁 야간 관람", image: "/images/main/main-example.svg", rating: "4.9", reviews: "5,200", price: "20,000", category: "자연관광" },
    { id: 26, title: "롯데월드 자유이용권", image: "/images/main/main-example.svg", rating: "4.7", reviews: "8,900", price: "62,000", category: "사진" },
    { id: 27, title: "제주 성산일출봉", image: "/images/main/main-example.svg", rating: "4.8", reviews: "4,100", price: "5,000", category: "유원지" },
    { id: 28, title: "부산 감천문화마을", image: "/images/main/main-example.svg", rating: "4.6", reviews: "3,800", price: "3,000", category: "문화마을" },
    { id: 29, title: "여수 밤바다 유람선", image: "/images/main/main-example.svg", rating: "4.8", reviews: "2,400", price: "35,000", category: "액티비티" },
    { id: 30, title: "속초 설악산 케이블카", image: "/images/main/main-example.svg", rating: "4.5", reviews: "1,900", price: "15,000", category: "자연명소" },
    { id: 31, title: "전주 한옥마을 투어", image: "/images/main/main-example.svg", rating: "4.7", reviews: "2,600", price: "12,000", category: "문화체험" },
    { id: 32, title: "안동 하회마을", image: "/images/main/main-example.svg", rating: "4.6", reviews: "1,500", price: "8,000", category: "문화재" },
    { id: 33, title: "경주 불국사", image: "/images/main/main-example.svg", rating: "4.8", reviews: "3,300", price: "6,000", category: "문화재" },
    { id: 34, title: "지리산 둘레길", image: "/images/main/main-example.svg", rating: "4.7", reviews: "1,200", price: "8,000", category: "트레킹" },
    { id: 35, title: "통영 케이블카", image: "/images/main/main-example.svg", rating: "4.5", reviews: "980", price: "18,000", category: "액티비티" },
    { id: 36, title: "담양 죽녹원", image: "/images/main/main-example.svg", rating: "4.6", reviews: "1,850", price: "3,000", category: "자연명소" }
  ]
};