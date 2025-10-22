export const changePassword = async (oldPassword, newPassword) => {
    const response = await fetch(
        `${window.API_BASE_URL}/api/user/password?oldPassword=${encodeURIComponent(oldPassword)}&newPassword=${encodeURIComponent(newPassword)}`,
        {
            method: 'PUT',
            credentials: 'include',
        }
    );

    if (!response.ok) {
        const errorData = await response.json().catch(() => ({}));
        throw new Error(errorData.error.message || '비밀번호 변경에 실패했습니다.');
    }

    return response;
};