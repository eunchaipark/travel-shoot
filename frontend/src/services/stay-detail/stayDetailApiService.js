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
        const response = await fetch(`${window.API_BASE_URL}/stays/${stayId}`, {
            method: 'GET',
        });
        return await handleResponse(response);
    } catch (error) {
        console.error('Error fetching stay detail:', error);
        throw error;
    }
};