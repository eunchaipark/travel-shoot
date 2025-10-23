import { useState, useEffect } from 'react';
import { changePassword } from '@/services/mypage/userService';

function usePasswordValidation() {
    const [currentPassword, setCurrentPassword] = useState('');
    const [newPassword, setNewPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const [passwordValid, setPasswordValid] = useState(null);
    const [passwordsMatch, setPasswordsMatch] = useState(null);
    const [requirementMessage, setRequirementMessage] = useState('8-20자 이내 영문, 숫자, 특수문자를 포함해야 합니다.');
    const [matchMessage, setMatchMessage] = useState('');

    useEffect(() => {
        if (newPassword === '') {
            setPasswordValid(null);
            setRequirementMessage('8-20자 이내 영문, 숫자, 특수문자를 포함해야 합니다.');
            return;
        }

        const hasLength = newPassword.length >= 8 && newPassword.length <= 20;
        const hasAlpha = /[a-zA-Z]/.test(newPassword);
        const hasNumber = /[0-9]/.test(newPassword);
        const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(newPassword);

        const isValid = hasLength && hasAlpha && hasNumber && hasSpecial;

        if (isValid) {
            setPasswordValid(true);
            setRequirementMessage('사용 가능한 비밀번호입니다.');
        } else {
            setPasswordValid(false);
            setRequirementMessage('8-20자 이내 영문, 숫자, 특수문자를 포함해야 합니다.');
        }
    }, [newPassword]);

    useEffect(() => {
        if (confirmPassword === '') {
            setPasswordsMatch(null);
            setMatchMessage('');
            return;
        }

        if (newPassword === confirmPassword) {
            setPasswordsMatch(true);
            setMatchMessage('비밀번호가 일치합니다.');
        } else {
            setPasswordsMatch(false);
            setMatchMessage('새 비밀번호 입력이 다릅니다.');
        }
    }, [newPassword, confirmPassword]);

    const handleSubmit = async () => {
        if (passwordValid && passwordsMatch) {
            try {
                console.log('비밀번호 변경 시도:', { currentPassword, newPassword });

                await changePassword(currentPassword, newPassword);

                alert('비밀번호가 변경되었습니다.');

                // 입력 필드 초기화
                setCurrentPassword('');
                setNewPassword('');
                setConfirmPassword('');

            } catch (error) {
                console.error('비밀번호 변경 실패:', error);
                alert(error.message || '비밀번호 변경에 실패했습니다.');
            }
        }
    };

    return {
        currentPassword,
        setCurrentPassword,
        newPassword,
        setNewPassword,
        confirmPassword,
        setConfirmPassword,
        passwordValid,
        passwordsMatch,
        requirementMessage,
        matchMessage,
        handleSubmit
    };
}

export default usePasswordValidation;