import React from 'react';
import { useSurvey } from '@/hooks/survey/useSurvey';
import { SURVEY_DATA } from '@/utils/survey/surveyData';
import '@/assets/css/survey.css';
const ProgressSteps = ({ currentStep }) => {
  const steps = [
    { number: 1, label: '지역' },
    { number: 2, label: '숙소' },
    { number: 3, label: '음식' },
    { number: 4, label: '액티비티' }
  ];

  return (
    <div className="progress-container">
      <div className="progress-steps">
        {steps.map((step, index) => (
          <React.Fragment key={step.number}>
            <div 
              className={`step ${
                step.number === currentStep ? 'active' : 
                step.number < currentStep ? 'completed' : ''
              }`}
            >
              <div className="step-number">{step.number}</div>
              <div className="step-label">{step.label}</div>
            </div>
            {index < steps.length - 1 && (
              <div 
                className={`progress-line ${
                  step.number < currentStep ? 'completed' : ''
                }`}
              />
            )}
          </React.Fragment>
        ))}
      </div>
    </div>
  );
};

// ============================================================================
// Option Card 컴포넌트 (그리드 형태 옵션)
// ============================================================================
const OptionCard = ({ value, image, label, isSelected, onClick }) => {
  return (
    <div 
      className={`option-card ${isSelected ? 'selected' : ''}`}
      data-value={value}
      onClick={() => onClick(value)}
    >
      <div className="option-image">
        <img src={image} alt={label} />
      </div>
      <span className="option-label">{label}</span>
    </div>
  );
};

// ============================================================================
// Option Row 컴포넌트 (리스트 형태 옵션 - 숙소용)
// ============================================================================
const OptionRow = ({ value, title, description, icon, isSelected, onClick }) => {
  return (
    <div 
      className={`option-row ${isSelected ? 'selected' : ''}`}
      data-value={value}
      onClick={() => onClick(value)}
    >
      <div className="option-info">
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
      <div className="survey-option-icon">
        <img src={icon} alt={`${title} 아이콘`} />
      </div>
    </div>
  );
};

// ============================================================================
// Survey Step 컴포넌트 (각 설문 단계)
// ============================================================================
const SurveyStep = ({ step, data, selections, onSelect, isActive }) => {
  const { question, subtitle, options, type } = data;
  
  if (!isActive) return null;

  return (
    <section className="survey-step active" data-step={step}>
      <div className="question-container">
        <h2 className="question-title">{question}</h2>
        <p className="question-subtitle">{subtitle}</p>
      </div>

      {type === 'grid' ? (
        <div className="options-grid">
          {options.map((option) => (
            <OptionCard
              key={option.value}
              value={option.value}
              image={option.image}
              label={option.label}
              isSelected={selections.includes(option.value)}
              onClick={onSelect}
            />
          ))}
        </div>
      ) : (
        <div className="options-list">
          {options.map((option) => (
            <OptionRow
              key={option.value}
              value={option.value}
              title={option.title}
              description={option.description}
              icon={option.icon}
              isSelected={selections === option.value}
              onClick={onSelect}
            />
          ))}
        </div>
      )}
    </section>
  );
};

// ============================================================================
// Survey Navigation 컴포넌트 (하단 버튼)
// ============================================================================
const SurveyNavigation = ({ 
  currentStep, 
  totalSteps, 
  canGoNext, 
  onPrev, 
  onNext 
}) => {
  return (
    <footer className="button-container">
      <button 
        className="btn btn-prev" 
        onClick={onPrev}
        disabled={currentStep === 1}
      >
        이전
      </button>
      <button 
        className="btn btn-next" 
        onClick={onNext}
        disabled={!canGoNext}
      >
        {currentStep === totalSteps ? '완료' : '다음'}
      </button>
    </footer>
  );
};

// ============================================================================
// Survey Modal (메인 컴포넌트)
// ============================================================================
const SurveyModal = ({ onClose, onComplete }) => {
  const [isAnimating, setIsAnimating] = React.useState(false);

  const {
    currentStep,
    totalSteps,
    selections,
    canGoNext,
    handleOptionSelect,
    handlePrevStep,
    handleNextStep,
    handleComplete
  } = useSurvey(onComplete);

  // 마운트 시 애니메이션 시작
  React.useEffect(() => {
    // 약간의 딜레이 후 애니메이션 시작 (브라우저 렌더링 보장)
    const timer = setTimeout(() => {
      setIsAnimating(true);
    }, 10);
    
    return () => clearTimeout(timer);
  }, []);

  // 현재 스텝에 해당하는 데이터
  const currentStepData = SURVEY_DATA[currentStep - 1];

  // 현재 스텝의 선택 항목
  const getCurrentSelections = () => {
    switch (currentStep) {
      case 1: return selections.regions;
      case 2: return selections.stay;
      case 3: return selections.foods;
      case 4: return selections.activities;
      default: return [];
    }
  };

  // 닫기 버튼 클릭
  const handleClose = () => {
    if (window.confirm('설문조사를 종료하시겠습니까? 입력한 내용이 사라집니다.')) {
      onClose();
    }
  };

  // 다음/완료 버튼 클릭
  const handleNextClick = () => {
    if (currentStep === totalSteps) {
      handleComplete();
    } else {
      handleNextStep();
    }
  };

  return (
    <div 
      className="modal-overlay" 
      style={{ 
        display: 'flex',
        opacity: isAnimating ? 1 : 0,
        visibility: isAnimating ? 'visible' : 'hidden'
      }}
    >
      <div 
        className="modal-content survey-modal-container"
        style={{
          transform: isAnimating ? 'scale(1)' : 'scale(0.8)'
        }}
      >
        {/* 닫기 버튼 */}
        <button 
          className="close-button" 
          onClick={handleClose}
          aria-label="닫기"
        >
          ×
        </button>

        {/* 진행률 표시 */}
        <ProgressSteps 
          currentStep={currentStep}
        />

        {/* 설문 내용 */}
        <main className="survey-content">
          <SurveyStep
            step={currentStep}
            data={currentStepData}
            selections={getCurrentSelections()}
            onSelect={(value) => handleOptionSelect(currentStep, value)}
            isActive={true}
          />
        </main>

        {/* 버튼 영역 */}
        <SurveyNavigation
          currentStep={currentStep}
          totalSteps={totalSteps}
          canGoNext={canGoNext}
          onPrev={handlePrevStep}
          onNext={handleNextClick}
        />
      </div>
    </div>
  );
};

export default SurveyModal;