import React, { useState, useEffect } from 'react';
import '@/assets/css/auth-modal.css';
// import { useAuth } from '@/hooks/auth/useAuth';
import { useAuth } from '@/components/context/AuthContext';
import { useNavigate } from 'react-router-dom';

const AuthModal = ({ isOpen, onClose }) => {
    const [currentStep, setCurrentStep] = useState(1);
    const [stepHistory, setStepHistory] = useState([1]);
    const [isAnimating, setIsAnimating] = useState(false);

    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [userName, setUserName] = useState('');
    const [verificationCode, setVerificationCode] = useState('');
    const [newPassword, setNewPassword] = useState('');
    const [confirmNewPassword, setConfirmNewPassword] = useState('');

    // 비밀번호 규칙 알림
    const [signupPasswordError, setSignupPasswordError] = useState('');
    const [signupConfirmError, setSignupConfirmError] = useState('');
    const [resetPasswordError, setResetPasswordError] = useState('');
    const [resetConfirmError, setResetConfirmError] = useState('');

    // 타이머 상태 (각 단계별로 분리)
    const [signupTimer, setSignupTimer] = useState(300);
    const [resetTimer, setResetTimer] = useState(300);
    const [isSignupTimerActive, setIsSignupTimerActive] = useState(false);
    const [isResetTimerActive, setIsResetTimerActive] = useState(false);

    // 인증 버튼 활성화 상태
    const [isSignupVerifyEnabled, setIsSignupVerifyEnabled] = useState(false);
    const [isResetVerifyEnabled, setIsResetVerifyEnabled] = useState(false);

    const auth = useAuth();
    const { isLoginModalOpen, closeLoginModal } = auth;
    const navigate = useNavigate();

    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$/;

    const validatePassword = (pwd) => {
        if (!pwd) return '';
        if (pwd.length < 8 || pwd.length > 20) {
            return '비밀번호는 8~20자여야 합니다';
        }
        if (!passwordRegex.test(pwd)) {
            return '비밀번호는 대소문자, 숫자, 특수문자를 모두 포함해야 합니다';
        }
        return '';
    };

    const validatePasswordMatch = (pwd1, pwd2) => {
        if (!pwd2) return '';
        if (pwd1 !== pwd2) {
            return '비밀번호가 일치하지 않습니다';
        }
        return '';
    };

    const handleSignupPasswordChange = (e) => {
        const pwd = e.target.value;
        setPassword(pwd);
        setSignupPasswordError(validatePassword(pwd));
        if (confirmNewPassword) {
            setSignupConfirmError(validatePasswordMatch(pwd, confirmNewPassword));
        }
    };

    const handleSignupConfirmChange = (e) => {
        const confirmPwd = e.target.value;
        setConfirmNewPassword(confirmPwd);
        setSignupConfirmError(validatePasswordMatch(password, confirmPwd));
    };

    const handleResetPasswordChange = (e) => {
        const pwd = e.target.value;
        setNewPassword(pwd);
        setResetPasswordError(validatePassword(pwd));
        if (confirmNewPassword) {
            setResetConfirmError(validatePasswordMatch(pwd, confirmNewPassword));
        }
    };

    const handleResetConfirmChange = (e) => {
        const confirmPwd = e.target.value;
        setConfirmNewPassword(confirmPwd);
        setResetConfirmError(validatePasswordMatch(newPassword, confirmPwd));
    };

    // 회원가입 타이머
    useEffect(() => {
        let interval;
        if (isSignupTimerActive && signupTimer > 0) {
            interval = setInterval(() => {
                setSignupTimer((prev) => prev - 1);
            }, 1000);
        } else if (signupTimer === 0) {
            setIsSignupTimerActive(false);
            setIsSignupVerifyEnabled(false);
        }
        return () => clearInterval(interval);
    }, [isSignupTimerActive, signupTimer]);

    // 비밀번호 재설정 타이머
    useEffect(() => {
        let interval;
        if (isResetTimerActive && resetTimer > 0) {
            interval = setInterval(() => {
                setResetTimer((prev) => prev - 1);
            }, 1000);
        } else if (resetTimer === 0) {
            setIsResetTimerActive(false);
            setIsResetVerifyEnabled(false);
        }
        return () => clearInterval(interval);
    }, [isResetTimerActive, resetTimer]);

    // 모달이 열릴 때 body 스크롤 방지
        useEffect(() => {
            if (isLoginModalOpen) {
                document.body.style.overflow = 'hidden';
            } else {
                document.body.style.overflow = '';
            }

            // 컴포넌트 언마운트 시 원래대로 복구
            return () => {
                document.body.style.overflow = '';
            };
        }, [isLoginModalOpen]);


    const formatTimer = (seconds) => {
        const mins = Math.floor(seconds / 60);
        const secs = seconds % 60;
        return `${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;
    };

    const navigateToStep = (toStep) => {
        if (isAnimating) return;
        setIsAnimating(true);
        setStepHistory([...stepHistory, toStep]);
        setTimeout(() => {
            setCurrentStep(toStep);
            setIsAnimating(false);
        }, 300);
    };

    const goBackStep = () => {
        if (stepHistory.length <= 1 || isAnimating) return;
        setIsAnimating(true);
        const newHistory = [...stepHistory];
        newHistory.pop();
        const prevStep = newHistory[newHistory.length - 1];
        setStepHistory(newHistory);
        setTimeout(() => {
            setCurrentStep(prevStep);
            setIsAnimating(false);
        }, 300);
    };

    const handleClose = () => {
        setCurrentStep(1);
        setStepHistory([1]);
        setEmail('');
        setPassword('');
        setUserName('');
        setVerificationCode('');
        setNewPassword('');
        setConfirmNewPassword('');
        setSignupPasswordError('');
        setSignupConfirmError('');
        setResetPasswordError('');
        setResetConfirmError('');
        setSignupTimer(300);
        setResetTimer(300);
        setIsSignupTimerActive(false);
        setIsResetTimerActive(false);
        setIsSignupVerifyEnabled(false);
        setIsResetVerifyEnabled(false);
        closeLoginModal();
    };

    // 회원가입 이메일 인증
    const sendSignupVerification = async () => {
        if (!email) {
            alert('이메일을 입력해주세요');
            return;
        }

        const result = await auth.sendVerificationCode(email);

        if (result.success) {
            setSignupTimer(300);
            setIsSignupTimerActive(true);
            setIsSignupVerifyEnabled(true);
            alert('인증번호가 발송되었습니다.');
        } else {
            console.error('인증번호 발송 실패:', result.error);

            if (result.error.includes('이미 사용')) {
                alert('이미 가입된 이메일입니다. 다른 이메일을 사용해주세요.');
            } else if (result.error.includes('형식')) {
                alert('이메일 형식이 올바르지 않습니다.');
            } else {
                alert(result.error || '인증번호 발송에 실패했습니다.');
            }
        }
    };

    // 비밀번호 재설정 이메일 인증
    const sendResetVerification = async () => {
        if (!email) {
            alert('이메일을 입력해주세요');
            return;
        }

        const result = await auth.requestPasswordReset(email);

        // TODO: API 호출
        if (result.success) {
            setResetTimer(300);
            setIsResetTimerActive(true);
            setIsResetVerifyEnabled(true);
            alert('인증번호가 발송되었습니다');
        }else{
            console.error('비밀번호 재설정 인증 코드 발송 실패:', result.error);
            alert(result.error || '인증번호 발송에 실패했습니다');
        }
    };

    // 회원가입 인증 확인
    const verifySignupCode = async () => {
        if (!verificationCode) {
            alert('인증번호를 입력해주세요');
            return;
        }

        const result = await auth.verifyCode(email, verificationCode);

         // TODO: API 호출
        if (result.success) {
            setIsSignupTimerActive(false);
            alert('인증번호가 확인되었습니다');
        }else{
            console.error('회원가입 인증 코드 확인 실패:', result.error);
            alert(result.error || '인증번호가 일치하지 않습니다');
        }
    };

    // 비밀번호 재설정 인증 확인
    const verifyResetCode = async () => {
        if (!verificationCode) {
            alert('인증번호를 입력해주세요');
            return;
        }

        const result = await auth.verifyCode(email, verificationCode);

        // TODO: API 호출
        if (result.success) {
            console.log('비밀번호 재설정 인증 코드 확인:', email, verificationCode);
            setIsResetTimerActive(false);
            alert('인증번호가 확인되었습니다');
        }else{
            console.error('비밀번호 재설정 인증 코드 확인 실패:', result.error);
            alert(result.error || '인증번호가 일치하지 않습니다');
        }
    };

    const handleLogin = async () => {
        if (!email.trim()) {
            alert('이메일을 입력해주세요.');
            return;
        }
        if (!password.trim()) {
            alert('비밀번호를 입력해주세요.');
            return;
        }

        try {
            const result = await auth.login({ email, password });

            if (result.success) {
                alert(`${result.data.userName}님, 환영합니다.`);

                const redirectUrl = sessionStorage.getItem('redirectUrl');

                handleClose();
                if (redirectUrl) {
                    sessionStorage.removeItem('redirectUrl');
                    navigate(redirectUrl);
                }else {
                    if (result.surveyCompleted) {
                        console.log('메인 페이지로 이동:', result.goMain);
                    } else {
                        // TODO: navigate('/survey')  설문조사 페이지로 이동해야함
                    }
                }
            } else {
                alert(result.error || '로그인에 실패했습니다.');
            }
        } catch (error) { // TODO :  서버 , 세션 문제 alert 띄우기 필요할까 ? 지워도 상관없을듯 근데 개발중에는 일단 둘거임 ~
            console.error('로그인 중 오류:', error);
            alert('서버와 통신 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
        }
    };

    const handleSignup = async () => {
        const pwdError = validatePassword(password);
        const confirmError = validatePasswordMatch(password, confirmNewPassword);

        if (pwdError) {
            setSignupPasswordError(pwdError);
            return;
        }
        if (confirmError) {
            setSignupConfirmError(confirmError);
            return;
        }
        if (!userName.trim()) {
            alert('이름을 입력해주세요.');
            return;
        }

        const signupResult = await auth.signup({
            email,
            password,
            userName
        });

        if (signupResult.success) {
            //회원가입 성공 후 자동 로그인
            const loginResult = await auth.login({
                email,
                password
            });

            if (loginResult.success) {
                alert('회원가입이 완료되었습니다.');
                handleClose();
                navigate('/signup-complete');
            } else {
                alert('회원가입은 완료되었습니다. 로그인 페이지에서 로그인해주세요.');
                handleClose();
            }
        } else {
            console.error('회원가입 실패:', signupResult.error);
            alert(signupResult.error || '회원가입에 실패했습니다');
        }
    };

    const handlePasswordReset = async () => {
        const pwdError = validatePassword(newPassword);
        const confirmError = validatePasswordMatch(newPassword, confirmNewPassword);

        if (pwdError) {
            setResetPasswordError(pwdError);
            return;
        }
        if (confirmError) {
            setResetConfirmError(confirmError);
            return;
        }

        const result = await auth.resetPassword({
            email,
            code: verificationCode,
            newPassword
        });

        if (result.success) {
            alert('비밀번호가 재설정되었습니다. 새 비밀번호로 로그인해주세요.');


            setPassword('');
            setVerificationCode('');
            setNewPassword('');
            setConfirmNewPassword('');
            setResetTimer(300);
            setIsResetTimerActive(false);
            setIsResetVerifyEnabled(false);

            navigateToStep(2);
        } else {
            console.error('비밀번호 재설정 실패:', result.error);
            alert(result.error || '비밀번호 재설정에 실패했습니다');
        }
    };

    if (!isLoginModalOpen) return null;

    return (
        <div className={`login-page ${isLoginModalOpen ? 'show' : ''}`}>
            <div className="login-box" onClick={(e) => e.stopPropagation()}>
                <button className="close-btn" onClick={handleClose}>
                    <img className="login-icons" src="/images/common/modal-close-icon.svg" alt="닫기" />
                </button>

                <button
                    className={`back-btn ${currentStep > 1 ? 'show' : ''}`}
                    onClick={goBackStep}
                >
                    <img className="login-icons" src="/images/common/modal-back-icon.svg" alt="뒤로가기" />
                </button>

                {/* Step 1: 시작 화면 */}
                <div className={`modal-step ${currentStep === 1 ? 'active' : ''}`}>
                    <div className="login-title">
                        <div className="login-title1">끊김 없는 여행,</div>
                        <div className="login-title2">Travel Shoot</div>
                    </div>
                    <div className="login-buttons">
                        <button className="login-btn btn-email" onClick={() => navigateToStep(2)}>
                            이메일로 시작하기
                        </button>
                        {/*<button className="login-btn btn-naver">*/}
                        {/*    네이버로 시작하기*/}
                        {/*</button>*/}
                        {/*<button className="login-btn btn-kakao">*/}
                        {/*    카카오로 시작하기*/}
                        {/*</button>*/}
                    </div>
                </div>

                {/* Step 2: 로그인 */}
                <div className={`modal-step ${currentStep === 2 ? 'active' : ''}`}>
                    <div className="email-form-title">로그인</div>
                    <div>
                        <div className="form-group">
                            <input
                                type="email"
                                placeholder="이메일 입력"
                                value={email}
                                onChange={(e) => setEmail(e.target.value)}
                            />
                        </div>
                        <div className="form-group">
                            <input
                                type="password"
                                placeholder="비밀번호 입력"
                                value={password}
                                onChange={(e) => setPassword(e.target.value)}
                            />
                        </div>
                        <button className="submit-btn" onClick={handleLogin}>
                            로그인
                        </button>
                        <button
                            className="submit-btn signup-btn secondary"
                            onClick={() => navigateToStep(3)}
                        >
                            회원가입
                        </button>
                    </div>
                    <div className="forgot-password">
                        <a href="#" onClick={(e) => { e.preventDefault(); navigateToStep(4); }}>
                            비밀번호를 잊어버렸나요 ?
                        </a>
                    </div>
                </div>

                {/* Step 3: 회원가입 */}
                <div className={`modal-step ${currentStep === 3 ? 'active' : ''}`}>
                    <div className="email-form-title">회원가입</div>
                    <div className="signup-form">
                        <div className="form-group">
                            <div className="email-verification">
                                <input
                                    type="email"
                                    placeholder="이메일 입력"
                                    value={email}
                                    onChange={(e) => setEmail(e.target.value)}
                                />
                                <button onClick={sendSignupVerification}>
                                    이메일 인증
                                </button>
                            </div>
                        </div>

                        <div className="form-group">
                            <div className="email-verification">
                                <input
                                    type="text"
                                    placeholder="인증번호 입력"
                                    value={verificationCode}
                                    onChange={(e) => setVerificationCode(e.target.value)}
                                />
                                <button
                                    className="verify-btn"
                                    onClick={verifySignupCode}
                                    disabled={!isSignupVerifyEnabled}
                                >
                                    확인
                                </button>
                            </div>
                            <div
                                className="timer-display"
                                style={{ display: isSignupTimerActive ? 'block' : 'none' }}
                            >
                                {formatTimer(signupTimer)}
                            </div>
                        </div>

                        <div className="form-group">
                            <input
                                type="password"
                                placeholder="비밀번호 입력"
                                value={password}
                                onChange={handleSignupPasswordChange}
                            />
                            {password && signupPasswordError && (
                                <div className="form-text-invalid">
                                    * {signupPasswordError}
                                </div>
                            )}
                        </div>

                        <div className="form-group">
                            <input
                                type="password"
                                placeholder="비밀번호 확인"
                                value={confirmNewPassword}
                                onChange={handleSignupConfirmChange}
                            />
                            {confirmNewPassword && signupConfirmError && (
                                <div className="form-text-invalid">
                                    * {signupConfirmError}
                                </div>
                            )}
                        </div>

                        <div className="form-group">
                            <input
                                type="text"
                                placeholder="이름 입력"
                                value={userName}
                                onChange={(e) => setUserName(e.target.value)}
                            />
                        </div>

                        <button className="submit-btn" onClick={handleSignup}>
                            확인
                        </button>
                    </div>
                </div>

                {/* Step 4: 비밀번호 재설정 */}
                <div className={`modal-step ${currentStep === 4 ? 'active' : ''}`}>
                    <div className="email-form-title">비밀번호 재설정</div>
                    <div className="signup-form">
                        <div className="form-group">
                            <div className="email-verification">
                                <input
                                    type="email"
                                    placeholder="이메일 입력"
                                    value={email}
                                    onChange={(e) => setEmail(e.target.value)}
                                />
                                <button onClick={sendResetVerification}>
                                    이메일 인증
                                </button>
                            </div>
                        </div>

                        <div className="form-group">
                            <div className="email-verification">
                                <input
                                    type="text"
                                    placeholder="인증번호 입력"
                                    value={verificationCode}
                                    onChange={(e) => setVerificationCode(e.target.value)}
                                />
                                <button
                                    className="verify-btn"
                                    onClick={verifyResetCode}
                                    disabled={!isResetVerifyEnabled}
                                >
                                    확인
                                </button>
                            </div>
                            <div
                                className="timer-display"
                                style={{ display: isResetTimerActive ? 'block' : 'none' }}
                            >
                                {formatTimer(resetTimer)}
                            </div>
                        </div>

                        <div className="form-group">
                            <input
                                type="password"
                                placeholder="새로운 비밀번호 입력"
                                value={newPassword}
                                onChange={handleResetPasswordChange}
                            />
                            {newPassword && resetPasswordError && (
                                <div className="form-text-invalid">
                                    * {resetPasswordError}
                                </div>
                            )}
                        </div>

                        <div className="form-group">
                            <input
                                type="password"
                                placeholder="비밀번호 확인"
                                value={confirmNewPassword}
                                onChange={handleResetConfirmChange}
                            />
                            {confirmNewPassword && resetConfirmError && (
                                <div className="form-text-invalid">
                                    * {resetConfirmError}
                                </div>
                            )}
                        </div>

                        <button className="submit-btn" onClick={handlePasswordReset} disabled={resetPasswordError || resetConfirmError || !newPassword || !confirmNewPassword}>
                            확인
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default AuthModal;