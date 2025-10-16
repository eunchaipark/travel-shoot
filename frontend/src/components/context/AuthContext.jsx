import React, { createContext, useContext } from 'react';
import { useAuth as useAuthHook } from '@/hooks/auth/useAuth';

const AuthContext = createContext(null);

export const AuthProvider = ({ children }) => {
    const auth = useAuthHook();

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