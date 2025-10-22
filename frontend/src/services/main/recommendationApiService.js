/**
 * AI 추천 숙소 API 서비스
 */

/**
 * AI 추천 숙소 데이터 가져오기
 * @param {number} userId - 사용자 ID
 */
export const fetchAIRecommendedStays = async (userId) => {
  try {
    if (!userId) {
      throw new Error('사용자 ID가 필요합니다');
    }

    console.log('AI 추천 요청 - userId:', userId);

    const response = await fetch(`${window.API_BASE_URL}/api/stays/ai-recommendation?userId=${userId}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
    });
    
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    
    const data = await response.json();
    console.log('AI 추천 백엔드 원본 데이터:', data);
    
    const transformed = transformAIRecommendationData(data);
    console.log('AI 추천 변환된 데이터:', transformed);
    
    return transformed;
  } catch (error) {
    console.error('AI 추천 숙소 조회 실패:', error);
    throw error;
  }
};

/**
 * 백엔드 데이터를 프론트엔드 형식으로 변환
 */
const transformAIRecommendationData = (backendData) => {
  if (!backendData || !backendData.stays) {
    console.warn('AI 추천 데이터가 비어있습니다');
    return [];
  }

  return backendData.stays.map(item => ({
    id: item.id,
    title: item.title,
    image: item.image || '/images/main/main-example.svg',
    rating: Number(item.rating) || 0,
    location: item.location,
    price: Number(item.price) || 0,
    checkinTime: item.checkinTime || '15:00',
    badge: item.badge || '',
    latitude: Number(item.latitude) || 0,
    longitude: Number(item.longitude) || 0,
    stayType: item.stayType,
    reviewCount: item.reviewCount || 0
  }));
};

/**
 * ✅ sessionStorage에서 userId 가져오기 (간단 버전)
 */
export const getUserIdFromSession = () => {
  const userId = sessionStorage.getItem('userId');
  return userId ? Number(userId) : null;
};