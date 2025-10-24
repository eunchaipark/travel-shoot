/**
 * 설문조사 데이터 및 유틸리티 함수
 * 경로: frontend/src/utils/survey/surveyData.js
 */

// ============================================================================
// 설문 단계별 설정
// ============================================================================
export const STEP_CONFIG = {
  1: { min: 1, max: 5, type: "multiple", key: "regions" },
  2: { min: 1, max: 1, type: "single", key: "stay" },
  3: { min: 2, max: 5, type: "multiple", key: "foods" },
  4: { min: 2, max: 4, type: "multiple", key: "activities" },
};

// ============================================================================
// 설문 질문 및 옵션 데이터
// ============================================================================
export const SURVEY_DATA = [
  // Step 1: 지역 선택
  {
    step: 1,
    question: "Question 1. 선호 지역을 알려주세요.",
    subtitle:
      "주로 어떤 지역으로 여행을 가시나요? (복수선택 가능 : 최소 1개 ~ 최대 5개)",
    type: "grid",
    options: [
      {
        value: "서울",
        label: "서울",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/14461f25-1c01-4f17-b7a6-421ff397d186_%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EC%84%9C%EC%9A%B8.jpg",
      },
      {
        value: "부산",
        label: "부산",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/6dda866a-03c2-48d8-a497-81be9839db99_%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EB%B6%80%EC%82%B0.jpg",
      },
      {
        value: "제주도",
        label: "제주도",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/57812d95-de56-4ff3-b1f0-570e18ee8b1c_%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EC%A0%9C%EC%A3%BC%EB%8F%84.jpg",
      },
      {
        value: "경상도",
        label: "경상도",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/24ee65af-9f60-4571-b729-03c0ca75ad51_%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EA%B2%BD%EC%83%81%EB%8F%84.jpg",
      },
      {
        value: "강원도",
        label: "강원도",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/f9b30cec-0aea-41cc-80c3-318c8a0a7a06_%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EA%B0%95%EC%9B%90%EB%8F%84.jpg",
      },
      {
        value: "전라도",
        label: "전라도",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/8052d282-6244-44e8-9060-4c0b7d7bde9a_%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EC%A0%84%EB%9D%BC%EB%8F%84.jpg",
      },
      {
        value: "충청도",
        label: "충청도",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/b6c02d1e-f2f6-48e3-a7af-57ec468a0bff_%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EC%B6%A9%EC%B2%AD%EB%8F%84.jpg",
      },
      { value: "기타", label: "기타", image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/326d264d-9fcc-400b-b760-330f84922ec7_%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EA%B8%B0%ED%83%80.jpg" },
    ],
  },

  // Step 2: 숙소 유형 선택
  {
    step: 2,
    question: "Question 2. 선호 숙박 유형을 알려주세요.",
    subtitle: "가장 선호하는 숙소유형 하나를 골라주세요.",
    type: "list",
    options: [
      {
        value: "펜션",
        title: "펜션 / 풀빌라",
        description: "숙소 전체를 프라이빗하게 즐길 수 있는 개별 숙소",
        icon: "/images/survey/survey-pension_icon.svg",
      },
      {
        value: "모텔",
        title: "모텔",
        description: "필요 설정에 편하게 이용할 수 있는 간편 숙소",
        icon: "/images/survey/survey-motel-icon.svg",
      },
      {
        value: "호텔",
        title: "호텔 / 리조트",
        description: "다양한 서비스와 편의시설을 갖춘 그룹 숙소",
        icon: "/images/survey/survey-hotel-icon.svg",
      },
    ],
  },

  // Step 3: 음식 선택
  {
    step: 3,
    question: "Question 3. 선호 음식을 알려주세요.",
    subtitle:
      "여행중 어떤 음식을 주로 찾으시나요? (복수선택 가능 : 최소 2개 ~ 최대 5개)",
    type: "grid",
    options: [
      {
        value: "한식",
        label: "한식",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%ED%95%9C%EC%8B%9D.jpg",
      },
      {
        value: "중식",
        label: "중식",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EC%A4%91%EC%8B%9D.jpg",
      },
      {
        value: "일식",
        label: "일식",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EC%9D%BC%EC%8B%9D.jpg",
      },
      {
        value: "양식",
        label: "양식",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EC%96%91%EC%8B%9D.jpg",
      },
      { value: "카페", label: "카페", image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EC%B9%B4%ED%8E%98.jpg" },
      {
        value: "해산물",
        label: "해산물",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%ED%95%B4%EC%82%B0%EB%AC%BC.jpg",
      },
      {
        value: "고기",
        label: "고기류",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EA%B3%A0%EA%B8%B0.jpg",
      },
      {
        value: "디저트",
        label: "디저트",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EB%94%94%EC%A0%80%ED%8A%B8.jpg",
      },
    ],
  },

  // Step 4: 액티비티 선택
  {
    step: 4,
    question: "Question 4. 선호 액티비티를 알려주세요.",
    subtitle:
      "여행중 주로 어떤 활동을 즐기시나요? (복수선택 가능 : 최소 2개 ~ 최대 4개)",
    type: "grid",
    options: [
      {
        value: "자연관광",
        label: "자연관광",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EC%9E%90%EC%97%B0%EA%B4%80%EA%B4%91.jpg",
      },
      {
        value: "문화체험",
        label: "문화체험",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EB%AC%B8%ED%99%94%EC%B2%B4%ED%97%98.jpg",
      },
      {
        value: "레포츠",
        label: "레저 스포츠",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EB%A0%88%EC%A0%80%EC%8A%A4%ED%8F%AC%EC%B8%A0.jpg",
      },
      {
        value: "쇼핑",
        label: "쇼핑",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EC%87%BC%ED%95%91.jpg",
      },
      {
        value: "맛집탐방",
        label: "맛집탐방",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EB%A7%9B%EC%A7%91.jpg",
      },
      {
        value: "사진",
        label: "사진",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EC%82%AC%EC%A7%84%EC%B4%AC%EC%98%81.jpg",
      },
      { value: "휴양", label: "휴식", image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%ED%9C%B4%EC%8B%9D.jpg" },
      {
        value: "축제",
        label: "축제/이벤트",
        image: "https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/survey/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC_%EC%B6%95%EC%A0%9C.jpg",
      },
    ],
  },
];

// ============================================================================
// 유효성 검사 함수
// ============================================================================

/**
 * 현재 단계의 선택이 유효한지 검사
 * @param {number} step - 현재 단계 (1~4)
 * @param {object} selections - 선택 데이터 { regions: [], stay: null, foods: [], activities: [] }
 * @returns {boolean} - 유효하면 true
 */
export const validateStep = (step, selections) => {
  const config = STEP_CONFIG[step];
  if (!config) return false;

  const key = config.key;
  const selected = selections[key];

  if (config.type === "single") {
    // 단일 선택: null이 아니어야 함
    return selected !== null && selected !== undefined && selected !== "";
  } else if (config.type === "multiple") {
    // 복수 선택: 최소/최대 개수 체크
    return (
      Array.isArray(selected) &&
      selected.length >= config.min &&
      selected.length <= config.max
    );
  }

  return false;
};

/**
 * 모든 단계가 유효한지 검사
 * @param {object} selections - 선택 데이터
 * @returns {boolean} - 모든 단계가 유효하면 true
 */
export const validateAllSteps = (selections) => {
  return [1, 2, 3, 4].every((step) => validateStep(step, selections));
};

// ============================================================================
// 데이터 포맷팅 함수
// ============================================================================

/**
 * 설문조사 데이터를 백엔드 API 형식으로 변환
 * @param {object} selections - { regions: [], stay: '', foods: [], activities: [] }
 * @returns {object} - 백엔드 API 요청 형식
 */
export const formatSurveyData = (selections) => {
  return {
    // 1. 선호 지역 (1~5개, 순서대로 가중치 부여)
    preferred_regions: selections.regions.map((region, index) => ({
      region: region,
      weight: parseFloat((1.0 - index * 0.2).toFixed(2)),
    })),

    // 2. 숙박 유형
    stay_type: {
      type: convertStayTypeToEnglish(selections.stay),
      weight: 1.0,
    },

    // 3. 음식 선호도 (2~5개, 순서와 가중치)
    food_preferences: selections.foods.map((food, index) => ({
      category: food,
      weight: parseFloat((1.0 - index * 0.2).toFixed(2)),
      order: index + 1,
    })),

    // 4. 액티비티 선호도 (2~4개, 순서와 가중치)
    activity_preferences: selections.activities.map((activity, index) => ({
      activity: activity,
      weight: parseFloat((1.0 - index * 0.2).toFixed(2)),
      order: index + 1,
    })),
  };
};

function convertStayTypeToEnglish(korean) {
  const map = {
    펜션: "PENSION",
    모텔: "MOTEL",
    호텔: "HOTEL",
  };
  return map[korean] || korean;
}

/**
 * 선택된 항목 개수 반환
 * @param {number} step - 단계
 * @param {object} selections - 선택 데이터
 * @returns {number} - 선택된 개수
 */
export const getSelectionCount = (step, selections) => {
  const config = STEP_CONFIG[step];
  if (!config) return 0;

  const key = config.key;
  const selected = selections[key];

  if (config.type === "single") {
    return selected ? 1 : 0;
  } else if (config.type === "multiple") {
    return Array.isArray(selected) ? selected.length : 0;
  }

  return 0;
};

/**
 * 진행률 계산 (완료된 단계 수 / 전체 단계 수)
 * @param {object} selections - 선택 데이터
 * @returns {number} - 진행률 (0~100)
 */
export const calculateProgress = (selections) => {
  const completedSteps = [1, 2, 3, 4].filter((step) =>
    validateStep(step, selections)
  ).length;

  return Math.round((completedSteps / 4) * 100);
};
