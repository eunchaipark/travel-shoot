/**
 * 설문조사 데이터 및 유틸리티 함수
 * 경로: frontend/src/utils/survey/surveyData.js
 */

// ============================================================================
// 설문 단계별 설정
// ============================================================================
export const STEP_CONFIG = {
  1: { min: 1, max: 5, type: 'multiple', key: 'regions' },
  2: { min: 1, max: 1, type: 'single', key: 'stay' },
  3: { min: 2, max: 5, type: 'multiple', key: 'foods' },
  4: { min: 2, max: 4, type: 'multiple', key: 'activities' }
};

// ============================================================================
// 설문 질문 및 옵션 데이터
// ============================================================================
export const SURVEY_DATA = [
  // Step 1: 지역 선택
  {
    step: 1,
    question: 'Question 1. 선호 지역을 알려주세요.',
    subtitle: '주로 어떤 지역으로 여행을 가시나요? (복수선택 가능 : 최소 1개 ~ 최대 5개)',
    type: 'grid',
    options: [
      { value: '서울', label: '서울', image: '/images/survey/survey-seoul.svg' },
      { value: '부산', label: '부산', image: '/images/survey/survey-busan.svg' },
      { value: '제주도', label: '제주도', image: '/images/survey/survey-jeju.svg' },
      { value: '경상도', label: '경상도', image: '/images/survey/survey-Gyeongsang-do.svg' },
      { value: '강원도', label: '강원도', image: '/images/survey/survey-Gangwon-do.svg' },
      { value: '전라도', label: '전라도', image: '/images/survey/survey-jeollado.svg' },
      { value: '충청도', label: '충청도', image: '/images/survey/survey-chungcheong-do.svg' },
      { value: '기타', label: '기타', image: '/images/survey/survey-etc.svg' }
    ]
  },
  
  // Step 2: 숙소 유형 선택
  {
    step: 2,
    question: 'Question 2. 선호 숙박 유형을 알려주세요.',
    subtitle: '가장 선호하는 숙소유형 하나를 골라주세요.',
    type: 'list',
    options: [
      {
        value: '펜션',
        title: '펜션 / 풀빌라',
        description: '숙소 전체를 프라이빗하게 즐길 수 있는 개별 숙소',
        icon: '/images/survey/survey-pension_icon.svg'
      },
      {
        value: '모텔',
        title: '모텔',
        description: '필요 설정에 편하게 이용할 수 있는 간편 숙소',
        icon: '/images/survey/survey-motel-icon.svg'
      },
      {
        value: '호텔',
        title: '호텔 / 리조트',
        description: '다양한 서비스와 편의시설을 갖춘 그룹 숙소',
        icon: '/images/survey/survey-hotel-icon.svg'
      }
    ]
  },
  
  // Step 3: 음식 선택
  {
    step: 3,
    question: 'Question 3. 선호 음식을 알려주세요.',
    subtitle: '여행중 어떤 음식을 주로 찾으시나요? (복수선택 가능 : 최소 2개 ~ 최대 5개)',
    type: 'grid',
    options: [
      { value: '한식', label: '한식', image: '/images/survey/survey-koreanfood.svg' },
      { value: '중식', label: '중식', image: '/images/survey/survey-chinesefood.svg' },
      { value: '일식', label: '일식', image: '/images/survey/survey-japanesefood.svg' },
      { value: '양식', label: '양식', image: '/images/survey/survey-westernfood.svg' },
      { value: '카페', label: '카페', image: '/images/survey/survey-cafe.svg' },
      { value: '해산물', label: '해산물', image: '/images/survey/survey-seafood.svg' },
      { value: '고기류', label: '고기류', image: '/images/survey/survey-meat.svg' },
      { value: '디저트', label: '디저트', image: '/images/survey/survey-dessert.svg' }
    ]
  },
  
  // Step 4: 액티비티 선택
  {
    step: 4,
    question: 'Question 4. 선호 액티비티를 알려주세요.',
    subtitle: '여행중 주로 어떤 활동을 즐기시나요? (복수선택 가능 : 최소 2개 ~ 최대 4개)',
    type: 'grid',
    options: [
      { value: '자연관광', label: '자연관광', image: '/images/survey/survey-naturaltourism.svg' },
      { value: '문화체험', label: '문화체험', image: '/images/survey/survey-culturalexperience.svg' },
      { value: '레저 스포츠', label: '레저 스포츠', image: '/images/survey/survey-leisuresports.svg' },
      { value: '쇼핑', label: '쇼핑', image: '/images/survey/survey-shoping.svg' },
      { value: '맛집탐방', label: '맛집탐방', image: '/images/survey/survey-restauranttour.svg' },
      { value: '사진', label: '사진', image: '/images/survey/survey-phototour.svg' },
      { value: '휴식', label: '휴식', image: '/images/survey/survey-rest.svg' },
      { value: '축제/이벤트', label: '축제/이벤트', image: '/images/survey/survey-festival.svg' }
    ]
  }
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

  if (config.type === 'single') {
    // 단일 선택: null이 아니어야 함
    return selected !== null && selected !== undefined && selected !== '';
  } else if (config.type === 'multiple') {
    // 복수 선택: 최소/최대 개수 체크
    return Array.isArray(selected) && 
           selected.length >= config.min && 
           selected.length <= config.max;
  }

  return false;
};

/**
 * 모든 단계가 유효한지 검사
 * @param {object} selections - 선택 데이터
 * @returns {boolean} - 모든 단계가 유효하면 true
 */
export const validateAllSteps = (selections) => {
  return [1, 2, 3, 4].every(step => validateStep(step, selections));
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
      weight: 5 - index  // 첫 번째: 5, 두 번째: 4, ...
    })),

    // 2. 숙박 유형 (1개, 고정 가중치 5)
    stay_type: {
      type: selections.stay,
      weight: 5
    },

    // 3. 음식 선호도 (2~5개, 순서와 가중치)
    food_preferences: selections.foods.map((food, index) => ({
      category: food,
      weight: 5 - index,
      order: index + 1
    })),

    // 4. 액티비티 선호도 (2~4개, 순서와 가중치)
    activity_preferences: selections.activities.map((activity, index) => ({
      activity: activity,
      weight: 5 - index,
      order: index + 1
    }))
  };
};

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

  if (config.type === 'single') {
    return selected ? 1 : 0;
  } else if (config.type === 'multiple') {
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
  const completedSteps = [1, 2, 3, 4].filter(step => 
    validateStep(step, selections)
  ).length;
  
  return Math.round((completedSteps / 4) * 100);
};