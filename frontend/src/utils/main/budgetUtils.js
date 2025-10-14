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