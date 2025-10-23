// API Base URL 설정
const API_BASE_URL = "http://localhost:8080/api";

// API 응답 타입 검사 및 에러 처리
const handleResponse = async (response) => {
    if (!response.ok) {
        const errorData = await response.json().catch(() => ({}));
        const error = new Error(errorData.message || `HTTP error! status: ${response.status}`);
        error.status = response.status;
        error.data = errorData;
        throw error;
    }
    return response.json();
};

/**
 * 숙소 상세 조회
 * @param {Long} stayId - 숙소 ID
 * @returns {Promise<StayDetailResponse>}
 */
export const getStayDetail = async (stayId) => {
    try {
        const response = await fetch(`${API_BASE_URL}/stays/${stayId}`, {
            method: 'GET',
        });
        return await handleResponse(response);
    } catch (error) {
        console.error('Error fetching stay detail:', error);
        throw error;
    }
};


/**
 * 숙소 리뷰 AI 요약 조회
 * @param {Long} stayId - 숙소 ID
 * @returns {Promise<String>} AI 요약 텍스트
 */
export const getReviewSummary = async (stayId) => {
    try {
        const response = await fetch(`${API_BASE_URL}/reviews/ai-summary/${stayId}`, {
            method: 'GET',
        });
        
        if (!response.ok) {
            const errorData = await response.text().catch(() => '');
            const error = new Error(errorData || `HTTP error! status: ${response.status}`);
            error.status = response.status;
            throw error;
        }
        
        // 백엔드에서 String을 반환하므로 text()로 받음
        return await response.text();
    } catch (error) {
        console.error('Error fetching review summary:', error);
        throw error;
    }
};

