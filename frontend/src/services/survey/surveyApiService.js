
export const submitSurveyApi = async (surveyData) => {
  try {
    const response = await fetch(`${window.API_BASE_URL}/api/survey/submit`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        // TODO: 인증 토큰 추가 필요
        // 'Authorization': `Bearer ${localStorage.getItem('token')}`
      },
      body: JSON.stringify(surveyData)
    });

    // 응답 확인
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(errorData.message || '설문조사 제출에 실패했습니다.');
    }

    const result = await response.json();
    return result.data; // ApiResponse<T> 구조에서 data 추출
    
  } catch (error) {
    console.error('설문조사 제출 API 오류:', error);
    throw error;
  }
};

/**
 * 설문조사 완료 여부 확인 API
 * GET /api/survey/status
 * 
 * @param {number} userId - 사용자 ID
 * @returns {Promise<boolean>} - 완료 여부
 */
export const checkSurveyStatusApi = async (userId) => {
  try {
    const response = await fetch(
      `${window.API_BASE_URL}/api/survey/status?userId=${userId}`,
      {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          // TODO: 인증 토큰 추가 필요
          // 'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      }
    );

    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(errorData.message || '설문조사 상태 확인에 실패했습니다.');
    }

    const result = await response.json();
    return result.data; // boolean 값 반환
    
  } catch (error) {
    console.error('설문조사 상태 확인 API 오류:', error);
    throw error;
  }
};