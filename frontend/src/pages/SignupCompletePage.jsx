import React from "react";
import { useNavigate } from "react-router-dom";
import CompleteHeader from '@/components/layout/CompleteHeader';
import '@/assets/css/common.css';

function SignupCompletePage() {

    const navigate = useNavigate();

    return(
        <>
            <CompleteHeader />
            <div>
                <div className="complete-page">
                    <div className="complete-card">
                        <div className="complete-text">
                            <div className="complete-title">회원가입이 완료되었습니다.</div>
                            <div className="complete-subtitle">
                                Travel Shoot에서 끊김 없는 여행을 경험해보세요.
                            </div>
                        </div>

                        <div className="complete-page-btn">
                            <label htmlFor="survey-modal" className="btn1">
                                설문조사
                            </label>
                            <button className="btn2" onClick={() => navigate("/")}>홈으로</button>
                        </div>
                    </div>
                </div>
            </div>

        </>
    );
};
export default SignupCompletePage;