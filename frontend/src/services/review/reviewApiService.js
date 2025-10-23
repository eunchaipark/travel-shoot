
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
 * 리뷰 생성
 * @param {FormData} formData - 리뷰 데이터 (reservationId, rating, content, images 등)
 * @returns {Promise<ReviewRegistResponse>}
 */
export const createReview = async (formData) => {
    try {
        const response = await fetch(`${WINDOW.API_BASE_URL}/api/reviews`, {
            method: 'POST',
            body: formData, // Content-Type은 자동으로 multipart/form-data로 설정
            credentials: 'include',
        });
        return await handleResponse(response);
    } catch (error) {
        console.error('Error creating review:', error);
        throw error;
    }
};

/**
 * 리뷰 수정
 * @param {Long} reviewId - 리뷰 ID
 * @param {FormData} formData - 수정할 리뷰 데이터
 * @returns {Promise<ReviewRegistResponse>}
 */
export const updateReview = async (reviewId, formData) => {
    try {
        const response = await fetch(`${window.API_BASE_URL}/api/reviews/${reviewId}`, {
            method: 'PUT',
            body: formData,
            credentials: 'include',
        });
        return await handleResponse(response);
    } catch (error) {
        console.error('Error updating review:', error);
        throw error;
    }
};

/**
 * 리뷰 삭제
 * @param {Long} reviewId - 리뷰 ID
 * @returns {Promise<void>}
 */
export const deleteReview = async (reviewId) => {
    try {
        const response = await fetch(`${window.API_BASE_URL}/api/reviews/${reviewId}`, {
            method: 'DELETE',
        });
        
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        // 204 No Content는 body가 없으므로 처리 안 함
    } catch (error) {
        console.error('Error deleting review:', error);
        throw error;
    }
};

/**
 * 리뷰 상세 조회 (수정할 때 사용)
 * @param {Long} reviewId - 리뷰 ID
 * @returns {Promise<ReviewDetailResponse>}
 */
export const getReviewDetail = async (reviewId) => {
    try {
        const response = await fetch(`${window.API_BASE_URL}/api/reviews/${reviewId}`, {
            method: 'GET',
            credentials: 'include',
        });
        return await handleResponse(response);
    } catch (error) {
        console.error('Error fetching review detail:', error);
        throw error;
    }
};

/**
 * 리뷰 목록 조회 (페이징 - 무한 스크롤링)
 * @param {Long} stayId - 숙박시설 ID
 * @param {Object} options - 조회 옵션
 * @param {Long} options.roomId - 객실 ID (선택사항)
 * @param {number} options.page - 페이지 번호 (기본값: 0)
 * @param {number} options.size - 페이지 크기 (기본값: 10)
 * @param {string} options.sortBy - 정렬 기준 (기본값: latest)
 * @returns {Promise<ReviewPageResponse>}
 */
export const getReviews = async (stayId, options = {}) => {
    const {
        roomId,
        page = 0,
        size = 10,
        sortBy = 'latest'
    } = options;

    try {
        const params = new URLSearchParams();
        params.append('page', page);
        params.append('size', size);
        params.append('sortBy', sortBy);
        
        if (roomId) {
            params.append('roomId', roomId);
        }

        const response = await fetch(
            `${window.API_BASE_URL}/api/reviews/stays/${stayId}/paging?${params.toString()}`,
            { method: 'GET' }
        );
        return await handleResponse(response);
    } catch (error) {
        console.error('Error fetching reviews:', error);
        throw error;
    }
};


/**
 * 숙박시설의 객실 필터 데이터 조회
 * @param {Long} stayId - 숙박시설 ID
 * @returns {Promise<RoomFilterResponse[]>}
 */
export const getRoomFilters = async (stayId) => {
    try {
        const response = await fetch(`${window.API_BASE_URL}/api/stays/${stayId}/rooms`, {
            method: 'GET',
        });
        return await handleResponse(response);
    } catch (error) {
        console.error('Error fetching room filters:', error);
        throw error;
    }
};


/**
 * 숙박시설 평균 평점 조회
 * @param {Long} stayId - 숙박시설 ID
 * @returns {Promise<number>}
 */
export const getStayRating = async (stayId) => {
    try {
        const response = await fetch(`${window.API_BASE_URL}/api/stays/${stayId}/average-rating`, {
            method: 'GET',
        });
        return await handleResponse(response);
    } catch (error) {
        console.error('Error fetching stay rating:', error);
        throw error;
    }
};

/**
 * 숙박시설 리뷰 이미지 조회
 * @param {Long} stayId - 숙박시설 ID
 * @returns {Promise<ReviewImage[]>}
 */
export const getReviewImages = async (stayId) => {
    try {
        const response = await fetch(`${window.API_BASE_URL}/api/reviews/${stayId}/review-images`, {
            method: 'GET',
        });
        return await handleResponse(response);
    } catch (error) {
        console.error('Error fetching review images:', error);
        throw error;
    }
}