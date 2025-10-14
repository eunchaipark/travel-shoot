/**
 * Recommend Stay 유틸리티 함수
 * 경로: C:\ITStudy\dev\travel-shoot\frontend\src\utils\main\recommendationUtils.js
 */

// 숙소 데이터 (원본과 동일 - 5점 만점)
export const ACCOMMODATION_DATA = [
  {
    id: 1,
    title: "서울역 스카이가든 호텔",
    image: "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=300&h=300&fit=crop",
    rating: 4.5,
    location: "중구 • 서울역 도보 2분",
    price: 145000,
    checkinTime: "15:00",
    badge: "추천",
    latitude: 37.5547,
    longitude: 126.9706
  },
  {
    id: 2,
    title: "명동 프리미엄 부티크",
    image: "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=300&h=300&fit=crop",
    rating: 4.6,
    location: "중구 • 명동역 도보 1분",
    price: 195000,
    checkinTime: "16:00",
    badge: "베스트",
    latitude: 37.5637,
    longitude: 126.9834
  },
  {
    id: 3,
    title: "홍대 모던 스테이",
    image: "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=300&h=300&fit=crop",
    rating: 4.4,
    location: "마포구 • 홍익대입구역 도보 3분",
    price: 125000,
    checkinTime: "14:00",
    badge: "",
    latitude: 37.5563,
    longitude: 126.9216
  },
  {
    id: 4,
    title: "강남 럭셔리 레지던스",
    image: "https://images.unsplash.com/photo-1590490360182-c33d57733427?w=300&h=300&fit=crop",
    rating: 4.8,
    location: "강남구 • 강남역 도보 5분",
    price: 285000,
    checkinTime: "15:00",
    badge: "럭셔리",
    latitude: 37.4979,
    longitude: 127.0276
  },
  {
    id: 5,
    title: "이태원 글로벌 하우스",
    image: "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=300&h=300&fit=crop",
    rating: 4.2,
    location: "용산구 • 이태원역 도보 2분",
    price: 165000,
    checkinTime: "16:00",
    badge: "",
    latitude: 37.5345,
    longitude: 126.9945
  },
  {
    id: 6,
    title: "건대 유스 호스텔",
    image: "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=300&h=300&fit=crop",
    rating: 4.1,
    location: "광진구 • 건대입구역 도보 1분",
    price: 89000,
    checkinTime: "14:00",
    badge: "가성비",
    latitude: 37.5403,
    longitude: 127.0695
  }
];

/**
 * 숫자를 천 단위 콤마로 포맷팅 (원본과 동일)
 * @param {number} number - 포맷팅할 숫자
 * @returns {string} 포맷팅된 문자열
 */
export const formatPrice = (number) => {
  return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};

/**
 * 별점 생성 함수 (원본과 동일 - 5점 만점, 반별 지원)
 * @param {number} rating - 평점 (0-5)
 * @returns {Array} 별 아이콘 배열
 */
export const generateStarRating = (rating) => {
  const maxStars = 5;
  const stars = [];
  
  for (let i = 1; i <= maxStars; i++) {
    if (i <= Math.floor(rating)) {
      stars.push({ type: 'full', key: i });
    } else if (i === Math.ceil(rating) && rating % 1 !== 0) {
      stars.push({ type: 'half', key: i });
    } else {
      stars.push({ type: 'empty', key: i });
    }
  }
  
  return stars;
};

/**
 * 모바일 화면 체크 함수 (원본과 동일)
 * @returns {boolean} 모바일 화면 여부
 */
export const isMobileScreen = () => {
  return window.innerWidth <= 768;
};