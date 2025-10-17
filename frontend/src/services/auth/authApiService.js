// 환경 변수에서 API URL 가져오기 (없으면 기본값)
const API_BASE_URL = import.meta.env.VITE_API_URL || 'http://localhost:8080/api';

//이메일 인증 코드 발송
/**
 * @param {string} email - 사용자 이메일
 * @returns {Promise<Object>} 응답 데이터
 */
export const sendVerificationCode = async (email) => {
    try {
        const response = await fetch(
            `${API_BASE_URL}/auth/email/send-code?email=${encodeURIComponent(email)}`,
            {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                credentials: "include",
            }
        );

        // 서버 에러 시 message 추출
        if (!response.ok) {
            let errorMessage = `HTTP error! status: ${response.status}`;

            try {
                const errorData = await response.json();
                if (errorData.message) {
                    errorMessage = errorData.message;
                }
            } catch {
                const text = await response.text();
                if (text) errorMessage = text;
            }

            return { success: false, error: errorMessage };
        }

        // 성공 시
        const data = await response.json();
        console.log("이메일 인증 코드 발송 성공:", data);
        return { success: true, data };
    } catch (error) {
        console.error("이메일 인증 코드 발송 실패:", error);
        return { success: false, error: "서버와 통신 중 오류가 발생했습니다." };
    }
};

//이메일 인증 코드 확인
/**
 * @param {string} email - 사용자 이메일
 * @param {string} code - 인증 코드
 * @returns {Promise<Object>} 응답 데이터
 */
export const verifyCode = async (email, code) => {
    try {
        const response = await fetch(`${API_BASE_URL}/auth/email/verify-code`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            credentials: 'include',
            body: JSON.stringify({ email, code }),
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const data = await response.json();
        console.log("이메일 인증 확인 성공:", data);
        return data;
    } catch (error) {
        console.error("이메일 인증 확인 실패:", error);
        throw error;
    }
};

//회원가입
/**
 * @param {Object} signupData - { email, password, userName }
 * @returns {Promise<Object>} 응답 데이터
 */
export const signup = async (signupData) => {
    try {
        const response = await fetch(`${API_BASE_URL}/auth/signup`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            credentials: 'include',
            body: JSON.stringify(signupData),
        });

        if (!response.ok) {
            const errorData = await response.json();
            throw new Error(errorData.message || `HTTP error! status: ${response.status}`);
        }

        const data = await response.json();
        console.log("회원가입 성공:", data);
        return transformSignupResponse(data);
    } catch (error) {
        console.error("회원가입 실패:", error);
        throw error;
    }
};

//로그인
/**
 * @param {Object} loginData - { email, password }
 * @returns {Promise<Object>} 응답 데이터
 */
export const login = async (loginData) => {
    try {
        const response = await fetch(`${API_BASE_URL}/auth/login`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            credentials: 'include', // 세션 쿠키 저장
            body: JSON.stringify(loginData),
        });

        if (!response.ok) {
            const errorData = await response.json();
            throw new Error(errorData.message || `HTTP error! status: ${response.status}`);
        }

        const data = await response.json();
        console.log("로그인 성공:", data);
        return transformLoginResponse(data);
    } catch (error) {
        console.error("로그인 실패:", error);
        throw error;
    }
};

//비밀번호 재설정 요청
/**
 * @param {string} email - 사용자 이메일
 * @returns {Promise<Object>} 응답 데이터
 */
export const requestPasswordReset = async (email) => {
    try {
        const response = await fetch(`${API_BASE_URL}/auth/password/reset-request?email=${encodeURIComponent(email)}`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            credentials: 'include',
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const data = await response.json();
        console.log("비밀번호 재설정 요청 성공:", data);
        return data;
    } catch (error) {
        console.error("비밀번호 재설정 요청 실패:", error);
        throw error;
    }
};

// 비밀번호 재설정
/**
 * @param {Object} resetData - { email, code, newPassword }
 * @returns {Promise<Object>} 응답 데이터
 */
export const resetPassword = async (resetData) => {
    try {
        const response = await fetch(`${API_BASE_URL}/auth/password/reset`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            credentials: 'include',
            body: JSON.stringify(resetData),
        });

        if (!response.ok) {
            const errorData = await response.json();
            throw new Error(errorData.message || `HTTP error! status: ${response.status}`);
        }

        const data = await response.json();
        console.log("비밀번호 재설정 성공:", data);
        return data;
    } catch (error) {
        console.error("비밀번호 재설정 실패:", error);
        throw error;
    }
};

//로그아웃
// @returns {Promise<Object>} 응답 데이터

export const logout = async () => {
    try {
        const response = await fetch(`${API_BASE_URL}/auth/logout`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            credentials: 'include',
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const data = await response.json();
        console.log("로그아웃 성공:", data);
        return data;
    } catch (error) {
        console.error("로그아웃 실패:", error);
        throw error;
    }
};

//데이터 변환 함수

//회원가입 응답 데이터 변환
const transformSignupResponse = (backendData) => {
    return {
        userId: backendData.userId,
        email: backendData.email,
        userName: backendData.userName,
        surveyRequired: backendData.surveyRequired || true,
        surveyCompleted: backendData.surveyCompleted || false,
        nextStep: backendData.nextStep || 'SURVEY',
        message: backendData.message,
    };
};

//로그인 응답 데이터 변환

const transformLoginResponse = (backendData) => {
    return {
        userId: backendData.userId,
        email: backendData.email,
        userName: backendData.userName,
        surveyCompleted: backendData.surveyCompleted || false,
        redirectTo: backendData.redirectTo || 'MAIN',
        message: backendData.message,
    };
};