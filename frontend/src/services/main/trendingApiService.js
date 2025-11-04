//Trending 숙소 데이터 가져오기
export const fetchTrendingStays = async () => {
  try {
    const response = await fetch(`${window.API_BASE_URL}/api/stays/trending`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();
    //console.log("Trending 숙소 백엔드 원본 데이터:", data); // 디버깅용

    const transformed = transformStayData(data);
    //console.log("Trending 숙소 변환된 데이터:", transformed); // 디버깅용

    return transformed;
  } catch (error) {
    //console.error("Trending 숙소 조회 실패:", error);
    throw error;
  }
};

// Trending 맛집 데이터 가져오기

export const fetchTrendingRestaurants = async () => {
  try {
    const response = await fetch(`${window.API_BASE_URL}/api/restaurants/trending`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();
    //console.log("Trending 맛집 백엔드 원본 데이터:", data); // 디버깅용

    const transformed = transformRestaurantData(data);
    //console.log("Trending 맛집 변환된 데이터:", transformed); // 디버깅용

    return transformed;
  } catch (error) {
    //console.error("Trending 맛집 조회 실패:", error);
    throw error;
  }
};

// Trending 관광지 데이터 가져오기

export const fetchTrendingActivities = async () => {
  try {
    const response = await fetch(`${window.API_BASE_URL}/api/activities/trending`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();
    //console.log("Trending 관광지 백엔드 원본 데이터:", data); // 디버깅용

    const transformed = transformActivityData(data);
    //console.log("Trending 관광지 변환된 데이터:", transformed); // 디버깅용

    return transformed;
  } catch (error) {
    //console.error("Trending 관광지 조회 실패:", error);
    throw error;
  }
};

// 모든 Trending 데이터 한번에 가져오기
export const fetchAllTrendingData = async () => {
  try {
    const [stays, restaurants, activities] = await Promise.all([
      fetchTrendingStays(),
      fetchTrendingRestaurants(),
      fetchTrendingActivities(),
    ]);

    return {
      stay: stays,
      restaurants: restaurants,
      attractions: activities,
    };
  } catch (error) {
    //console.error("전체 Trending 데이터 조회 실패:", error);
    throw error;
  }
};

// 숙소 데이터 변환
const transformStayData = (backendData) => {
  return backendData.map((item) => ({
    id: item.stayId,
    title: item.stayName,
    image: item.thumbnailImage || "/images/main/main-example.svg",
    rating: item.averageRating ? item.averageRating.toFixed(1) : "0.0",
    reviews: formatViewCount(item.recent7DaysViews), // 조회수를 리뷰처럼 표시
    price: formatPrice(item.price),
    category: item.stayType,

    // 추가 정보
    address: item.address,
    latitude: item.latitude,
    longitude: item.longitude,
    checkInTime: item.checkInTime,
    checkOutTime: item.checkOutTime,

    // Trending 정보
    trendingScore: item.trendingScore,
    viewGrowthRate: item.viewGrowthRate,
  }));
};

// 맛집 데이터 변환
const transformRestaurantData = (backendData) => {
  return backendData.map((item) => ({
    id: item.restaurantId,
    title: item.restaurantName,
    image: item.thumbnailImage || "/images/main/main-example.svg",
    rating: item.rating ? item.rating.toFixed(1) : "0.0",
    reviews: formatViewCount(item.reviewCount),
    price: "0", // 가격 정보 없음 (임시)
    category: item.foodType,

    // 추가 정보
    address: item.address,
    latitude: item.latitude,
    longitude: item.longitude,

    // Trending 정보
    trendingScore: item.trendingScore,
    viewGrowthRate: item.viewGrowthRate,
  }));
};

/**
 * 관광지 데이터 변환
 */
const transformActivityData = (backendData) => {
  return backendData.map((item) => ({
    id: item.activityId,
    title: item.activityName,
    image: item.thumbnailImage || "/images/main/main-example.svg",
    rating: item.rating ? item.rating.toFixed(1) : "0.0",
    reviews: formatViewCount(item.recent7DaysViews), // 조회수를 리뷰처럼 표시
    price: "0", // 가격 정보 없음 (임시)
    category: item.activityType,

    // 추가 정보
    address: item.address,
    latitude: item.latitude,
    longitude: item.longitude,

    // Trending 정보
    trendingScore: item.trendingScore,
    viewGrowthRate: item.viewGrowthRate,
  }));
};

// 가격 포맷팅  120000 -> "120,000"

const formatPrice = (price) => {
  if (!price) return "0";
  return Math.floor(price).toLocaleString("ko-KR");
};

// 조회수 포맷팅 (리뷰 수처럼 표시)  1000 이상이면 "1,234" 형태로

const formatViewCount = (count) => {
  if (!count) return "0";
  return count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};
