import { useQuery } from '@tanstack/react-query';
import { useEffect, useRef } from 'react';

export const useSession = () => {
    const prevDataRef = useRef(undefined);
    const isLoggingOutRef = useRef(false);

    console.log('====> useSession 훅 실행됨');

    const query = useQuery({
        queryKey: ['session'],
        queryFn: async () => {
            console.log('세션 체크 API 호출 시작');

            const response = await fetch('http://localhost:8080/api/auth/session', {
                credentials: 'include',
                cache: 'no-store'
            });

            console.log('응답 상태:', response.status);

            if (response.status === 401) {
                console.log('세션 만료 (401)');
                return null;
            }

            if (!response.ok) {
                console.error('세션 체크 실패:', response.status);
                throw new Error(`HTTP ${response.status}`);
            }

            const data = await response.json();
            console.log('세션 데이터:', data);
            return data;
        },

        staleTime: 25 * 60 * 1000,
        gcTime: 35 * 60 * 1000,
        retry: false,
        refetchOnWindowFocus: true,
        refetchOnMount: 'always',  // false → 'always' 변경 (새로고침 시 항상 체크)
        refetchInterval: 20 * 60 * 1000,
        initialData: null,
    });

    console.log('useSession 상태:', {
        data: query.data,
        isLoading: query.isLoading,
        isError: query.isError
    });

    // 세션 만료 감지
    useEffect(() => {
        const handleSessionExpiry = async () => {
            const prevData = prevDataRef.current;
            const currentData = query.data;

            if (
                prevData !== undefined &&
                prevData !== null &&
                currentData === null &&
                !isLoggingOutRef.current
            ) {
                isLoggingOutRef.current = true;
                console.log('세션 만료 감지 → 백엔드 cleanup');

                try {
                    await fetch('http://localhost:8080/api/auth/logout', {
                        method: 'POST',
                        credentials: 'include'
                    });
                    console.log('백엔드 세션 정리 완료');
                } catch (err) {
                    console.error('백엔드 logout 실패:', err);
                } finally {
                    isLoggingOutRef.current = false;
                }

                window.dispatchEvent(new CustomEvent('session-expired'));
            }

            prevDataRef.current = currentData;
        };

        handleSessionExpiry();
    }, [query.data]);

    return query;
};