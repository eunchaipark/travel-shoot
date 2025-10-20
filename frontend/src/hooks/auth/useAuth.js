import { useState, useCallback, useEffect } from 'react';
import * as authApi from '@/services/auth/authApiService';

export const useAuth = () => {
    const [user, setUser] = useState(null);
    const [isAuthenticated, setIsAuthenticated] = useState(false);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    const [isLoginModalOpen, setIsLoginModalOpen] = useState(false);


        // 예약할때도 세션 확인할라고 외부에서도 호출 가능하게 수정
        const checkSession =  useCallback(async () => {
            try {
                const response = await fetch('http://localhost:8080/api/auth/session', {
                    credentials: 'include'  // 쿠키 포함해서 보내기
                });

                if (response.ok) {
                    const userData = await response.json();

                    // 서버에서 받은 유저 정보 저장
                    setUser({
                        userId: userData.userId,
                        email: userData.email,
                        userName: userData.userName
                    });
                    setIsAuthenticated(true);

                    console.log('로그인 상태 복원:', userData.email);
                    return true;
                } else {
                    setUser(null);
                    setIsAuthenticated(false);
                    // 세션 없음 (로그인 안됨)
                    console.log('세션 없음');
                    return false;
                }
            } catch (error) {
                console.log('세션 확인 실패:', error);
                setUser(null);
                setIsAuthenticated(false);
                return false;
            } finally {
                setLoading(false);
            }
        }, []);

    //페이지 로드 시 세션 확인
    useEffect(() => {
        checkSession();
    }, [checkSession]);

    // 로그인 모달 열기
    const openLoginModal = useCallback(() => {
        console.log('로그인 모달 열기');
        setIsLoginModalOpen(true);
    }, []);

    //로그인 모달 닫기
    const closeLoginModal = useCallback(async () => {
        console.log(' fh그인 모달 닫기');
        setIsLoginModalOpen(false);

        await checkSession(); // 모달 닫을때 또 확인
    }, [checkSession]);


    //이메일 인증코드 발송하기
    const sendVerificationCode = useCallback(async (email) => {
        setLoading(true);
        setError(null);

        try {
            const response = await authApi.sendVerificationCode(email);
            return { success: true, data: response };
        } catch (err) {
            const errorMessage = err.message || '인증번호 발송에 실패했습니다';
            setError(errorMessage);
            return { success: false, error: errorMessage };
        } finally {
            setLoading(false);
        }
    }, []);


     //이메일 인증 코드 확인
    const verifyCode = useCallback(async (email, code) => {
        setLoading(true);
        setError(null);

        try {
            const response = await authApi.verifyCode(email, code);
            return { success: true, data: response };
        } catch (err) {
            const errorMessage = err.message || '인증번호가 일치하지 않습니다';
            setError(errorMessage);
            return { success: false, error: errorMessage };
        } finally {
            setLoading(false);
        }
    }, []);


    //회원가입
    const signup = useCallback(async (signupData) => {
        setLoading(true);
        setError(null);

        try {
            const response = await authApi.signup(signupData);

            // 회원가입 성공 시 사용자 정보 저장
            setUser({
                userId: response.userId,
                email: response.email,
                userName: response.userName,
            });

            return {
                success: true,
                data: response,
                surveyRequired: response.surveyRequired,
                goSurvey: response.goSurvey
            };
        } catch (err) {
            const errorMessage = err.message || '회원가입에 실패했습니다';
            setError(errorMessage);
            return { success: false, error: errorMessage };
        } finally {
            setLoading(false);
        }
    }, []);


    //로그인
    const login = useCallback(async (loginData) => {
        setLoading(true);
        setError(null);
        try {
            const response = await authApi.login(loginData);

            await checkSession(); //세션 확인하고

            return {
                success: true,
                data: response,
                goMain: response.goMain,
                surveyCompleted: response.surveyCompleted
            };
        } catch (err) {
            const errorMessage = err.message || '로그인에 실패했습니다';
            setError(errorMessage);
            return { success: false, error: errorMessage };
        } finally {
            setLoading(false);
        }
    }, [checkSession]);

    // 비밀번호 재설정 요청하기
    const requestPasswordReset = useCallback(async (email) => {
        setLoading(true);
        setError(null);

        try {
            const response = await authApi.requestPasswordReset(email);
            return { success: true, data: response };
        } catch (err) {
            const errorMessage = err.message || '비밀번호 재설정 요청에 실패했습니다';
            setError(errorMessage);
            return { success: false, error: errorMessage };
        } finally {
            setLoading(false);
        }
    }, []);

    // 비밀번호 재설정 진행하기
    const resetPassword = useCallback(async (resetData) => {
        setLoading(true);
        setError(null);

        try {
            const response = await authApi.resetPassword(resetData);
            return { success: true, data: response };
        } catch (err) {
            const errorMessage = err.message || '비밀번호 재설정에 실패했습니다';
            setError(errorMessage);
            return { success: false, error: errorMessage };
        } finally {
            setLoading(false);
        }
    }, []);

    // 로그아웃
    const logout = useCallback(async () => {
        setLoading(true);
        setError(null);

        try {
            await authApi.logout();
            setUser(null);
            setIsAuthenticated(false);
            return { success: true };
        } catch (err) {
            const errorMessage = err.message || '로그아웃에 실패했습니다';
            setError(errorMessage);
            return { success: false, error: errorMessage };
        } finally {
            setLoading(false);
        }
    }, []);

    //에러 초기화
    const clearError = useCallback(() => {
        setError(null);
    }, []);

    return {
        // 상태
        user,
        isAuthenticated,
        loading,
        error,
        isLoginModalOpen,

        // 함수
        sendVerificationCode,
        verifyCode,
        signup,
        login,
        requestPasswordReset,
        resetPassword,
        logout,
        clearError,
        openLoginModal,
        closeLoginModal,
        checkSession,
    };
};