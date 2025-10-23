import React, { createContext, useContext } from 'react';
import { useAuth as useAuthHook } from '@/hooks/auth/useAuth';

const AuthContext = createContext(null);

export const AuthProvider = ({ children }) => {
    console.log('AuthProvider 렌더링 시작');

    const auth = useAuthHook();

    console.log('AuthProvider - auth 객체:', {
        isAuthenticated: auth.isAuthenticated,
        user: auth.user,
        loading: auth.loading
    });

    return (
        <AuthContext.Provider value={auth}>
            {children}
        </AuthContext.Provider>
    );
};

export const useAuth = () => {
    const context = useContext(AuthContext);
    if (!context) {
        throw new Error('useAuth must be used within AuthProvider');
    }
    return context;
};