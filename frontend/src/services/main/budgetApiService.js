/**
 * Budget Friendly API 서비스
 * 경로: frontend/src/services/budgetApiService.js
 */

/**
 * 가격착한 숙소 데이터 가져오기
 */
export const fetchBudgetFriendlyStays = async () => {
  try {
    const response = await fetch(`${window.API_BASE_URL}/api/stays/budget-friendly`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
    });
    
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    
    const data = await response.json();
    // console.log('백엔드 원본 데이터:', data); // 디버깅용
    
    const transformed = transformBudgetData(data);
    // console.log('변환된 데이터:', transformed); // 디버깅용
    
    return transformed;
  } catch (error) {
    // console.error('가격착한 숙소 조회 실패:', error);
    throw error;
  }
};

/**
 * 백엔드 데이터를 프론트엔드 형식으로 변환
 */
const transformBudgetData = (backendData) => {
  return backendData.map(item => ({
    id: `budget_${item.stayId}`,
    name: item.stayName,
    location: formatLocation(item.regionName, item.address),
    image: item.thumbnailUrl || '/images/main/main-example.svg',
    rating: Number(item.averageRating),
    price: Number(item.averagePrice),
    discount: item.discountRate || 0,
    reviews: formatReviewCount(item.reviewCount),
    // 추가 정보
    stayId: item.stayId,
    stayType: item.stayType,
    amenities: item.amenities || [],
    checkInTime: item.checkInTime,
    checkOutTime: item.checkOutTime
  }));
};

/**
 * 지역 정보 포맷팅
 * "제주특별자치도 제주시" + "제주특별자치도 제주시 애월읍 하광로 518" 
 * -> "제주특별자치도 제주시 • 애월읍 하광로 518"
 */
const formatLocation = (regionName, address) => {
  if (!regionName || !address) return regionName || address || '';
  
  // address에서 regionName 부분을 제거
  let detailAddress = address.replace(regionName, '').trim();
  
  // 공백으로 시작하면 제거
  if (detailAddress.startsWith(' ')) {
    detailAddress = detailAddress.trim();
  }
  
  // 상세 주소가 있으면 합치기
  if (detailAddress) {
    return `${regionName} • ${detailAddress}`;
  }
  
  return regionName;
};

/**
 * 리뷰 수 포맷팅
 * 1000 이상이면 "1,234" 형태로
 */
const formatReviewCount = (count) => {
  if (!count) return '0';
  return count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
};