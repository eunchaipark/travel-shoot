
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
 * 숙소 이미지 전체 조회
 * @param {Long} stayId - 숙소 ID
 * @returns {Promise<StayImageDto>} 
 */
export const getAllStayImages = async (stayId) => {
    try {
        const response = await fetch(`${window.API_BASE_URL}/api/stays/${stayId}/images`, {
            method: 'GET',
        });
        return await handleResponse(response);
    } catch (error) {
        console.error('Error fetching stay images:', error);
        throw error;
    }
};


/**
 * 숙소 상세 조회
 * @param {Long} stayId - 숙소 ID
 * @returns {Promise<StayDetailResponse>}
 */
export const getStayDetail = async (stayId) => {
    try {
        const response = await fetch(`${window.API_BASE_URL}/api/stays/${stayId}`, {
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
        const response = await fetch(`${window.API_BASE_URL}/api/reviews/ai-summary/${stayId}`, {
            method: 'GET',
        });
        
        if (!response.ok) {
            const errorData = await response.text().catch(() => '');
            const error = new Error(errorData || `HTTP error! status: ${response.status}`);
            error.status = response.status;
            throw error;
        }
        
        return await handleResponse(response);
    } catch (error) {
        console.error('Error fetching review summary:', error);
        throw error;
    }
};

