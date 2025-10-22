import { useState, useCallback, useEffect } from 'react';
import { useQueryClient } from '@tanstack/react-query';
import { useSession } from './useSession';
import * as authApi from '@/services/auth/authApiService';

export const useAuth = () => {
    console.log('===> useAuth 훅 실행됨');

    const queryClient = useQueryClient();
    const { data: user, isLoading, refetch } = useSession();
    const [isLoginModalOpen, setIsLoginModalOpen] = useState(false);
    const [error, setError] = useState(null);

    const isAuthenticated = user !== null && user !== undefined;

    console.log('===> useAuth 상태:', {
        user,
        isAuthenticated,
        isLoading
    });

    // useEffect로 상태 변화 감지
    useEffect(() => {
        console.log('useAuth 상태 변경:', {
            user,
            isAuthenticated,
            isLoading
        });
    }, [user, isAuthenticated, isLoading]);

    // ... 나머지 코드는 동일 ...

    // 로그인
    const login = useCallback(async (loginData) => {
        setError(null);
        try {
            console.log('로그인 시도:', loginData.email);
            const response = await authApi.login(loginData);

            console.log('로그인 API 응답:', response);

            // React Query 캐시 업데이트
            queryClient.setQueryData(['session'], {
                userId: response.userId,
                email: response.email,
                userName: response.userName,
            });

            console.log('캐시 업데이트 완료');

            // 캐시 확인
            const cachedData = queryClient.getQueryData(['session']);
            console.log('캐시된 데이터 확인:', cachedData);

            return {
                success: true,
                data: response,
                surveyCompleted: response.surveyCompleted,
                redirectTo: response.redirectTo
            };
        } catch (err) {
            const errorMessage = err.message || '로그인에 실패했습니다';
            setError(errorMessage);
            return { success: false, error: errorMessage };
        }
    }, [queryClient]);

    // 나머지 함수들...
    const openLoginModal = useCallback(() => {
        console.log('로그인 모달 열기');
        setIsLoginModalOpen(true);
    }, []);

    const closeLoginModal = useCallback(() => {
        console.log('로그인 모달 닫기');
        setIsLoginModalOpen(false);
    }, []);

    const checkSession = useCallback(async () => {
        const result = await refetch();
        return result.data !== null;
    }, [refetch]);

    const sendVerificationCode = useCallback(async (email) => {
        setError(null);
        try {
            const response = await authApi.sendVerificationCode(email);
            return { success: true, data: response };
        } catch (err) {
            const errorMessage = err.message || '인증번호 발송에 실패했습니다';
            setError(errorMessage);
            return { success: false, error: errorMessage };
        }
    }, []);

    const verifyCode = useCallback(async (email, code) => {
        setError(null);
        try {
            const response = await authApi.verifyCode(email, code);
            return { success: true, data: response };
        } catch (err) {
            const errorMessage = err.message || '인증번호가 일치하지 않습니다';
            setError(errorMessage);
            return { success: false, error: errorMessage };
        }
    }, []);

    const signup = useCallback(async (signupData) => {
        setError(null);
        try {
            const response = await authApi.signup(signupData);

            queryClient.setQueryData(['session'], {
                userId: response.userId,
                email: response.email,
                userName: response.userName,
            });

            return {
                success: true,
                data: response,
                surveyRequired: response.surveyRequired,
                nextStep: response.nextStep
            };
        } catch (err) {
            const errorMessage = err.message || '회원가입에 실패했습니다';
            setError(errorMessage);
            return { success: false, error: errorMessage };
        }
    }, [queryClient]);

    const requestPasswordReset = useCallback(async (email) => {
        setError(null);
        try {
            const response = await authApi.requestPasswordReset(email);
            return { success: true, data: response };
        } catch (err) {
            const errorMessage = err.message || '비밀번호 재설정 요청에 실패했습니다';
            setError(errorMessage);
            return { success: false, error: errorMessage };
        }
    }, []);

    const resetPassword = useCallback(async (resetData) => {
        setError(null);
        try {
            const response = await authApi.resetPassword(resetData);
            return { success: true, data: response };
        } catch (err) {
            const errorMessage = err.message || '비밀번호 재설정에 실패했습니다';
            setError(errorMessage);
            return { success: false, error: errorMessage };
        }
    }, []);

    const logout = useCallback(async () => {
        setError(null);
        try {
            await fetch('http://localhost:8080/api/auth/logout', {
                method: 'POST',
                credentials: 'include'
            });
            console.log('백엔드 로그아웃 완료');
        } catch (error) {
            console.error('백엔드 로그아웃 실패:', error);
        }

        queryClient.setQueryData(['session'], null);

        return { success: true };
    }, [queryClient]);

    const clearError = useCallback(() => {
        setError(null);
    }, []);

    return {
        user,
        isAuthenticated,
        loading: isLoading,
        error,
        isLoginModalOpen,
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