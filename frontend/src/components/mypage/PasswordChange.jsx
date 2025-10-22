import React from 'react';
import usePasswordValidation from '@/hooks/mypage/usePasswordValidation';

const PasswordChange = () => {
    const {
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
    } = usePasswordValidation();

    // 버튼 활성화 조건
    const isButtonEnabled = currentPassword && passwordValid && passwordsMatch;

    return (
        <div className="profile-form">
            <h2 className="form-title">비밀번호 변경</h2>

            <div className="form-group">
                <label className="form-label">현재 비밀번호</label>
                <div className="row">
                    <div>
                        <input
                            type="password"
                            className="form-control"
                            placeholder="현재 비밀번호를 입력하세요."
                            value={currentPassword}
                            onChange={(e) => setCurrentPassword(e.target.value)}
                            required
                        />
                    </div>
                </div>
            </div>

            <div className="form-group">
                <label className="form-label">새 비밀번호</label>
                <div className="row">
                    <div>
                        <input
                            type="password"
                            className={`form-control ${passwordValid === true ? 'valid' : passwordValid === false ? 'invalid' : ''}`}
                            placeholder="새로운 비밀번호를 입력하세요."
                            value={newPassword}
                            onChange={(e) => setNewPassword(e.target.value)}
                        />
                        <div className={`password-requirement-message ${passwordValid === true ? 'valid' : passwordValid === false ? 'invalid' : ''}`}>
                            {requirementMessage}
                        </div>
                        <input
                            type="password"
                            className={`form-control ${passwordsMatch === true ? 'valid' : passwordsMatch === false ? 'invalid' : ''}`}
                            placeholder="비밀번호를 한 번 더 입력하세요."
                            value={confirmPassword}
                            onChange={(e) => setConfirmPassword(e.target.value)}
                            required
                        />
                        <div className={`password-match-message ${passwordsMatch === true ? 'success' : passwordsMatch === false ? 'error' : ''}`}>
                            {matchMessage}
                        </div>
                    </div>
                </div>
            </div>

            <div className="form-actions">
                <button
                    type="button"
                    className="btn-form-submit"
                    onClick={handleSubmit}
                    disabled={!isButtonEnabled}
                >
                    비밀번호 변경
                </button>
            </div>
        </div>
    );
}

export default PasswordChange;