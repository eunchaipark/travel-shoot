import { useState, useCallback, useMemo } from 'react';
import { STEP_CONFIG, validateStep, formatSurveyData } from '@/utils/survey/surveyData';
import { submitSurveyApi } from '@/services/survey/surveyApiService';

export const useSurvey = (onComplete) => {
  // ============================================================================
  // 상태 관리
  // ============================================================================
  const [currentStep, setCurrentStep] = useState(1);
  const [selections, setSelections] = useState({
    regions: [],      // 1단계: 지역 (1~5개)
    stay: null,       // 2단계: 숙소 (1개)
    foods: [],        // 3단계: 음식 (2~5개)
    activities: []    // 4단계: 액티비티 (2~4개)
  });

  const totalSteps = 4;

  // ============================================================================
  // 현재 단계 유효성 검사
  // ============================================================================
  const canGoNext = useMemo(() => {
    return validateStep(currentStep, selections);
  }, [currentStep, selections]);

  // ============================================================================
  // 옵션 선택/해제 핸들러
  // ============================================================================
  const handleOptionSelect = useCallback((step, value) => {
    const config = STEP_CONFIG[step];
    if (!config) return;

    const key = config.key;

    setSelections(prev => {
      if (config.type === 'single') {
        // 단일 선택 (숙소)
        return {
          ...prev,
          [key]: value
        };
      } else if (config.type === 'multiple') {
        // 복수 선택 (지역, 음식, 액티비티)
        const currentSelections = prev[key];
        const index = currentSelections.indexOf(value);

        if (index > -1) {
          // 이미 선택된 경우 - 선택 해제
          return {
            ...prev,
            [key]: currentSelections.filter(item => item !== value)
          };
        } else {
          // 선택되지 않은 경우 - 최대 개수 체크 후 추가
          if (currentSelections.length >= config.max) {
            alert(`최대 ${config.max}개까지 선택 가능합니다.`);
            return prev;
          }
          return {
            ...prev,
            [key]: [...currentSelections, value]
          };
        }
      }

      return prev;
    });
  }, []);

  // ============================================================================
  // 이전 단계로 이동
  // ============================================================================
  const handlePrevStep = useCallback(() => {
    if (currentStep > 1) {
      setCurrentStep(prev => prev - 1);
    }
  }, [currentStep]);

  // ============================================================================
  // 다음 단계로 이동
  // ============================================================================
  const handleNextStep = useCallback(() => {
    if (!validateStep(currentStep, selections)) {
      const config = STEP_CONFIG[currentStep];
      alert(`${config.min}개 이상 ${config.max}개 이하로 선택해주세요.`);
      return;
    }

    if (currentStep < totalSteps) {
      setCurrentStep(prev => prev + 1);
    }
  }, [currentStep, selections]);

  // ============================================================================
  // 설문조사 완료 처리
  // ============================================================================
  const handleComplete = useCallback(async () => {
    if (!validateStep(currentStep, selections)) {
      const config = STEP_CONFIG[currentStep];
      alert(`${config.min}개 이상 ${config.max}개 이하로 선택해주세요.`);
      return;
    }

    try {
      // 데이터 포맷팅
      const formattedData = formatSurveyData(selections);
      
      console.log('설문조사 제출 데이터:', formattedData);

      // API 호출 (성공/실패 상관없이 메인으로 이동)
      await submitSurveyApi(formattedData);
      
      console.log('설문조사 제출 성공');

    } catch (error) {
      console.error('설문조사 제출 실패:', error);
      // 에러 발생해도 계속 진행
    } finally {
      // 완료 콜백 실행
      if (onComplete) {
        onComplete();
      }

      // API 성공/실패 상관없이 메인 페이지로 이동
      window.location.href = '/';
    }
  }, [currentStep, selections, onComplete]);

  // ============================================================================
  // 설문조사 초기화 (필요시 사용)
  // ============================================================================
  const resetSurvey = useCallback(() => {
    setCurrentStep(1);
    setSelections({
      regions: [],
      stay: null,
      foods: [],
      activities: []
    });
  }, []);

  // ============================================================================
  // Return
  // ============================================================================
  return {
    // 상태
    currentStep,
    totalSteps,
    selections,
    canGoNext,

    // 함수
    handleOptionSelect,
    handlePrevStep,
    handleNextStep,
    handleComplete,
    resetSurvey
  };
};