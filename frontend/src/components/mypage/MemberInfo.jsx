import React, { useState, useEffect } from 'react';
import { useAuth } from '@/components/context/AuthContext';
import { useNavigate } from 'react-router-dom';
const MemberInfo = () => {
    const [showWithdrawalModal, setShowWithdrawalModal] = useState(false);
    const [password, setPassword] = useState('');
    const [userName, setUserName] = useState('');
    const [userEmail, setUserEmail] = useState('');
    const { logout, user, isAuthenticated } = useAuth();
    const navigate = useNavigate();

    const handleLogout = async () => {
        const result = await logout();
        if (result.success) {
            navigate('/');
        } else {
            console.error('로그아웃 실패:', result.error);
        }
    };

    const handleWithdrawal = async() => {
        try {
            // await withdrawal(password); // service 호출
            console.log('회원탈퇴:', password);
            setShowWithdrawalModal(false);
        } catch (error) {
            console.error('회원탈퇴 실패:', error);
        }
    };

    return (
        <>
            <div className="profile-form">
                <h2 className="form-title">내 정보</h2>

                <div className="form-group">
                    <label className="form-label">이름</label>
                    <div className="form-readonly">{user?.userName}</div>
                </div>

                <div className="form-group">
                    <div className="email-group">
                        <label className="mb-0 form-label">이메일</label>
                        <button className="verify-btn">인증완료</button>
                    </div>
                    <div className="form-readonly">{user?.email}</div>
                </div>

                <div className="form-actions">
                    <button className="btn-logout" onClick={handleLogout}>로그아웃</button>
                    <button
                        className="btn-withdraw"
                        onClick={() => setShowWithdrawalModal(true)}
                    >
                        회원탈퇴
                    </button>
                </div>
            </div>

            {/* 회원탈퇴 모달 */}
            {showWithdrawalModal && (
                <>
                    <input
                        type="checkbox"
                        id="withdrawal-modal"
                        className="modal-checkbox"
                        checked={showWithdrawalModal}
                        onChange={() => {}}
                    />
                    <div className="modal-overlay">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h3 className="modal-title">회원탈퇴</h3>
                                <button
                                    className="modal-close"
                                    onClick={() => setShowWithdrawalModal(false)}
                                >
                                    ×
                                </button>
                            </div>

                            <div className="modal-question">정말을 삭제하시겠습니까 ?</div>

                            <div className="warning-box">
                                <div className="warning-item">
                                    탈퇴 시 모든 정보가 삭제되며, 계정은 복구할 수 없습니다.
                                </div>
                                <div className="warning-item">
                                    회원 탈퇴 후에는 트래블쇼 서비스를 이용하실 수 없으며, 계정은 재가입을 통해서만 이용 가능합니다.
                                </div>
                            </div>

                            <div className="input-section">
                                <div className="input-label">보안을 위해 비밀번호를 입력해 주세요.</div>
                                <input
                                    type="password"
                                    className="form-control"
                                    placeholder="비밀번호를 입력해주세요."
                                    value={password}
                                    onChange={(e) => setPassword(e.target.value)}
                                />
                            </div>

                            <div className="modal-actions flex-row">
                                <button className="btn-withdraw" onClick={handleWithdrawal}>탈퇴하기</button>
                                <button
                                    className="btn-cancel"
                                    onClick={() => setShowWithdrawalModal(false)}
                                >
                                    닫기
                                </button>
                            </div>
                        </div>
                    </div>
                </>
            )}
        </>
    );
}

export default MemberInfo;