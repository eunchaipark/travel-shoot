const API_BASE_URL = 'http://localhost:8080/api';

// API 클라이언트 생성
const createApiClient = () => {
    const getHeaders = () => {
        const headers = { 'Content-Type': 'application/json' };
        const token = localStorage.getItem('accessToken');
        if (token) {
            headers['Authorization'] = `Bearer ${token}`;
        }
        return headers;
    };

    return {
        get: async (url, params) => {
            const queryString = params ? '?' + new URLSearchParams(params).toString() : '';
            const response = await fetch(`${API_BASE_URL}${url}${queryString}`, {
                method: 'GET',
                headers: getHeaders(),
                credentials: 'include',
            });

            if (!response.ok) {
                const error = await response.json();
                throw new Error(error.message || 'API 요청 실패');
            }

            return response.json();
        },

        post: async (url, data) => {
            const response = await fetch(`${API_BASE_URL}${url}`, {
                method: 'POST',
                headers: getHeaders(),
                credentials: 'include',
                body: JSON.stringify(data),
            });

            if (!response.ok) {
                const error = await response.json();
                throw new Error(error.message || 'API 요청 실패');
            }

            return response.json();
        },
    };
};

//예약 API 서비스
const reservationApiService = {
    //예약 초기 데이터 조회
    getInitData: async (roomId, checkInDate, checkOutDate, guestCount) => {
        const api = createApiClient();
        return await api.get(`/reservations/init/${roomId}`, {
            checkInDate,
            checkOutDate,
            guestCount,
        });
    },

    //가격 계산
    calculatePrice: async (roomId, checkInDate, checkOutDate) => {
        const api = createApiClient();
        return await api.post('/reservations/calculate-price', {
            roomId,
            checkInDate,
            checkOutDate,
        });
    },

    //예약 가능 여부 확인
    validateAvailability: async (roomId, checkInDate, checkOutDate, guestCount) => {
        const api = createApiClient();
        return await api.post('/reservations/validate-availability', {
            roomId,
            checkInDate,
            checkOutDate,
            guestCount,
        });
    },

    //예약 생성
    createReservation: async (reservationData) => {
        const api = createApiClient();
        return await api.post('/reservations/create', reservationData);
    },

    //예약 초기화 (5 + 6 통합)
    initializeReservation: async (roomId, checkInDate, checkOutDate, guestCount) => {
        try {

            //TODO : 결제 금액 , 1박당 금액 데이터 .. 확인할라고 임시로 만들었음
            console.log('=== 예약 초기화 시작 ===');
            console.log('파라미터:', { roomId, checkInDate, checkOutDate, guestCount });

            // 5. 초기 데이터 조회
            const initData = await reservationApiService.getInitData(
                roomId,
                checkInDate,
                checkOutDate,
                guestCount
            );
            console.log('initData:', initData); //TODO


            // 6. 가격 계산
            const priceData = await reservationApiService.calculatePrice(
                roomId,
                checkInDate,
                checkOutDate
            );
            console.log('priceData:', priceData); //TODO

            return { initData, priceData };
        } catch (error) {
            console.error('예약 초기화 실패:', error);
            throw error;
        }
    },

    //예약 생성 프로세스 (7 + 8 통합)
    processReservation: async (reservationData) => {
        try {
            // 7. 예약 가능 여부 확인
            const availabilityCheck = await reservationApiService.validateAvailability(
                reservationData.roomId,
                reservationData.checkInDate,
                reservationData.checkOutDate,
                reservationData.guestCount
            );

            if (!availabilityCheck.available) {
                throw new Error('선택하신 날짜에는 예약이 불가능합니다.');
            }

            // 8. 예약 생성
            const result = await reservationApiService.createReservation(reservationData);

            return result;
        } catch (error) {
            console.error('예약 생성 실패:', error);
            throw error;
        }
    },
    //AI 여행 코스 생성 (비동기, 결과 기다리지 않음)
    generateAiCourse: (reservationId, totalDays) => {
        const api = createApiClient();
        // await 없이 호출하여 비동기로 실행
        api.post('/ai/course', {
            reservationId,
            totalDays: totalDays + 1
        }).catch(error => {
            console.error('AI 코스 생성 중 오류:', error);
        });
    },
};

export default reservationApiService;