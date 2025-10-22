export const fetchTravelNow = async () => {
  try {
    const response = await fetch(`${window.API_BASE_URL}/api/stays/travel-now`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();
    console.log("TravelNow 백엔드 원본 데이터:", data); // 디버깅용

    const transformed = transformTravelNowData(data);
    console.log("TravelNow 변환된 데이터:", transformed); // 디버깅용

    return transformed;
  } catch (error) {
    console.error("TravelNow 조회 실패:", error);
    throw error;
  }
};


const transformTravelNowData = (backendData) => {
  return backendData.map((item) => ({
    id: item.id,
    name: item.name,
    image: item.image || "/images/main/main-example.svg",
    location: item.location,
    features: item.features, 
    accommodationCount: formatReviewCount(item.accommodationCount),
  }));
};


// 숙소개수 포멧팅 1000이상이면 "1,234"형태로
const formatReviewCount = (count) => {
  if (!count) return '0';
  return count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
};