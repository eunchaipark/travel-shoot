import React, { useState } from 'react';
import Header from '@/components/layout/Header';
import SurveyModal from '@/components/survey/SurveyModal';
import '@/assets/css/common.css';
import '@/assets/css/survey.css';

/**
 * 회원가입 완료 페이지
 * 경로: frontend/src/pages/SignupCompletePage.jsx
 */
const SignupCompletePage = () => {
  const [showSurveyModal, setShowSurveyModal] = useState(false);

  // 설문조사 모달 열기
  const handleOpenSurvey = () => {
    setShowSurveyModal(true);
  };

  // 설문조사 모달 닫기
  const handleCloseSurvey = () => {
    const isConfirmed = window.confirm(
      '설문조사를 종료하시겠습니까? 입력한 내용이 사라집니다.'
    );
    if (isConfirmed) {
      setShowSurveyModal(false);
    }
  };

  // 홈으로 이동
  const handleGoHome = () => {
    window.location.href = '/';
    // 또는 React Router 사용 시:
    // navigate('/');
  };

  // 설문조사 완료 처리
  const handleSurveyComplete = (surveyData) => {
    console.log('설문조사 완료 데이터:', surveyData);
    setShowSurveyModal(false);
    
    // 완료 후 홈으로 이동하거나 다른 처리
    // handleGoHome();
  };

  return (
    <>
      {/* 헤더 컴포넌트 사용 */}
      <Header />

      {/* Main Content */} 
      <main>
        <div className="complete-page">
          <div className="complete-card">
            <div className="complete-text">
              <div className="complete-title">회원가입이 완료되었습니다.</div>
              <div className="complete-subtitle">
                Travel Shoot에서 끊김 없는 여행을 경험해보세요.
              </div>
            </div>

            <div className="complete-page-btn">
              <button 
                className="btn1" 
                onClick={handleOpenSurvey}
              >
                설문조사
              </button>
              <button 
                className="btn2" 
                onClick={handleGoHome}
              >
                홈으로
              </button>
            </div>
          </div>
        </div>
      </main>

      {/* Survey Modal */}
      {showSurveyModal && (
        <SurveyModal
          onClose={handleCloseSurvey}
          onComplete={handleSurveyComplete}
        />
      )}
    </>
  );
};

export default SignupCompletePage;