/**
 * 설문조사 모달 클래스
 * 4단계 설문조사 (지역, 숙소, 음식, 액티비티) 관리
 */
class SurveyModal {
    constructor() {
        this.currentStep = 1;
        this.totalSteps = 4;
        this.selections = {
            regions: [],
            stay: null,
            foods: [],
            activities: []
        };
        
        // 각 단계별 설정
        this.stepConfig = {
            1: { min: 1, max: 5, type: 'multiple', key: 'regions' },
            2: { min: 1, max: 1, type: 'single', key: 'stay' },
            3: { min: 2, max: 5, type: 'multiple', key: 'foods' },
            4: { min: 2, max: 4, type: 'multiple', key: 'activities' }
        };
        
        this.init();
    }

    /**
     * 초기화
     */
    init() {
        this.bindEvents();
        this.updateUI();
    }

    /**
     * 이벤트 바인딩
     */
    bindEvents() {
        // 닫기 버튼
        this.bindCloseButton();
        
        // 이전/다음 버튼
        this.bindNavigationButtons();
        
        // 옵션 선택 이벤트
        this.bindOptionEvents();
        
        // 키보드 이벤트
        this.bindKeyboardEvents();
    }

    /**
     * 닫기 버튼 이벤트
     */
    bindCloseButton() {
        const closeButton = document.querySelector('.close-button');
        if (closeButton) {
            closeButton.addEventListener('click', () => this.closeModal());
        }
    }

    /**
     * 네비게이션 버튼 이벤트
     */
    bindNavigationButtons() {
        const prevButton = document.querySelector('.btn-prev');
        const nextButton = document.querySelector('.btn-next');
        
        if (prevButton) {
            prevButton.addEventListener('click', () => this.goToPrevStep());
        }
        
        if (nextButton) {
            nextButton.addEventListener('click', () => this.goToNextStep());
        }
    }

    /**
     * 옵션 선택 이벤트 바인딩
     */
    bindOptionEvents() {
        // 옵션 카드 클릭 (지역, 음식, 액티비티)
        document.querySelectorAll('.option-card').forEach(card => {
            card.addEventListener('click', (e) => {
                this.handleOptionSelection(e, 'card');
            });
        });

        // 옵션 행 클릭 (숙소 유형)
        document.querySelectorAll('.option-row').forEach(row => {
            row.addEventListener('click', (e) => {
                this.handleOptionSelection(e, 'row');
            });
        });
    }

    /**
     * 키보드 이벤트 바인딩
     */
    bindKeyboardEvents() {
        document.addEventListener('keydown', (e) => {
            switch(e.key) {
                case 'Escape':
                    this.closeModal();
                    break;
                case 'Enter':
                    const nextButton = document.querySelector('.btn-next');
                    if (nextButton && !nextButton.disabled) {
                        nextButton.click();
                    }
                    break;
            }
        });
    }

    /**
     * 옵션 선택 처리
     */
    handleOptionSelection(event, type) {
        event.preventDefault();
        event.stopPropagation();
        
        const element = event.currentTarget;
        const surveyStep = element.closest('.survey-step');
        
        if (!surveyStep || !element.dataset.value) {
            console.error('설문 단계 또는 옵션 값을 찾을 수 없습니다.');
            return;
        }
        
        const step = parseInt(surveyStep.dataset.step);
        const value = element.dataset.value;
        
        this.selectOption(step, value, element, type);
    }

    /**
     * 옵션 선택 로직
     */
    selectOption(step, value, element, type) {
        const config = this.stepConfig[step];
        if (!config) {
            console.error('잘못된 단계:', step);
            return;
        }
        
        const key = config.key;

        if (config.type === 'single') {
            this.handleSingleSelection(key, value, element, type);
        } else if (config.type === 'multiple') {
            this.handleMultipleSelection(key, value, element, config);
        }

        this.updateButtons();
    }

    /**
     * 단일 선택 처리 (숙소 유형)
     */
    handleSingleSelection(key, value, element, type) {
        this.selections[key] = value;
        
        // 같은 그룹의 모든 선택 해제
        const selector = type === 'card' ? '.option-card' : '.option-row';
        element.parentElement.querySelectorAll(selector).forEach(item => {
            item.classList.remove('selected');
        });
        
        // 현재 선택 활성화
        element.classList.add('selected');
    }

    /**
     * 복수 선택 처리 (지역, 음식, 액티비티)
     */
    handleMultipleSelection(key, value, element, config) {
        const currentSelections = this.selections[key];
        const index = currentSelections.indexOf(value);
        
        if (index > -1) {
            // 선택 해제
            currentSelections.splice(index, 1);
            element.classList.remove('selected');
        } else {
            // 최대 선택 개수 확인
            if (currentSelections.length < config.max) {
                currentSelections.push(value);
                element.classList.add('selected');
            } else {
                this.showAlert(`최대 ${config.max}개까지 선택 가능합니다.`);
                return;
            }
        }
    }

    /**
     * 이전 단계로 이동
     */
    goToPrevStep() {
        if (this.currentStep > 1) {
            this.currentStep--;
            this.updateUI();
        }
    }

    /**
     * 다음 단계로 이동
     */
    goToNextStep() {
        if (this.isStepValid()) {
            if (this.currentStep < this.totalSteps) {
                this.currentStep++;
                this.updateUI();
            } else {
                this.completeSurvey();
            }
        }
    }

    /**
     * 현재 단계 유효성 검증
     */
    isStepValid() {
        const config = this.stepConfig[this.currentStep];
        const key = config.key;
        const selections = this.selections[key];

        if (config.type === 'single') {
            return selections !== null;
        } else if (config.type === 'multiple') {
            return selections.length >= config.min && selections.length <= config.max;
        }
        
        return false;
    }

    /**
     * UI 업데이트
     */
    updateUI() {
        this.updateProgressSteps();
        this.updateSurveyContent();
        this.updateButtons();
    }

    /**
     * 진행 단계 업데이트 - 프로그레스 라인 애니메이션 기능 추가
     */
    updateProgressSteps() {
        const steps = document.querySelectorAll('.step');
        const progressLines = document.querySelectorAll('.progress-line');

        steps.forEach((step, index) => {
            const stepNumber = index + 1;
            
            // 클래스 초기화
            step.classList.remove('active', 'completed');
            
            if (stepNumber === this.currentStep) {
                // 현재 단계
                step.classList.add('active');
            } else if (stepNumber < this.currentStep) {
                // 완료된 단계
                step.classList.add('completed');
            }
            // stepNumber > this.currentStep인 경우는 기본 상태 (회색)
        });

        // 프로그레스 라인 상태 업데이트
        progressLines.forEach((line, index) => {
            // 라인은 단계보다 하나씩 적음 (step1과 step2 사이의 라인이 첫 번째 라인)
            const lineStepNumber = index + 1;
            
            // 기존 클래스 제거
            line.classList.remove('completed');
            
            // 현재 단계보다 작은 라인들은 완료 상태로 표시
            if (lineStepNumber < this.currentStep) {
                line.classList.add('completed');
            }
        });
    }

    /**
     * 설문 내용 업데이트
     */
    updateSurveyContent() {
        document.querySelectorAll('.survey-step').forEach(step => {
            const stepNumber = parseInt(step.dataset.step);
            if (stepNumber === this.currentStep) {
                step.classList.add('active');
            } else {
                step.classList.remove('active');
            }
        });
    }

    /**
     * 버튼 상태 업데이트
     */
    updateButtons() {
        const prevButton = document.querySelector('.btn-prev');
        const nextButton = document.querySelector('.btn-next');

        // 이전 버튼
        if (prevButton) {
            prevButton.disabled = this.currentStep === 1;
        }

        // 다음 버튼
        if (nextButton) {
            const isValid = this.isStepValid();
            nextButton.disabled = !isValid;
            
            nextButton.textContent = this.currentStep === this.totalSteps ? '완료' : '다음';
        }
    }

    /**
     * 설문조사 완료 처리
     */
    completeSurvey() {
        console.log('설문조사 완료:', this.selections);
        
        this.submitSurvey()
            .then(() => {
                this.showAlert('설문조사가 완료되었습니다!');
                this.closeModal();
            })
            .catch((error) => {
                console.error('설문조사 제출 오류:', error);
                this.showAlert('설문조사 제출 중 오류가 발생했습니다. 다시 시도해주세요.');
            });
    }

    /**
     * 설문조사 데이터 제출
     */
    async submitSurvey() {
        try {
            const surveyData = this.formatSurveyData();
            
            // TODO: 실제 API 호출
            /*
            const response = await fetch('/api/survey', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${localStorage.getItem('token')}`
                },
                body: JSON.stringify(surveyData)
            });

            if (!response.ok) {
                throw new Error('설문조사 제출 실패');
            }

            return await response.json();
            */

            // 임시로 콘솔에 출력
            console.log('제출할 설문 데이터:', surveyData);
            return Promise.resolve(surveyData);
            
        } catch (error) {
            throw error;
        }
    }

    /**
     * 설문조사 데이터 포맷팅
     */
    formatSurveyData() {
        return {
            preferred_regions: this.selections.regions.map((region, index) => ({
                region: region,
                weight: 5 - index
            })),
            stay_type: {
                type: this.selections.stay,
                weight: 5
            },
            food_preferences: this.selections.foods.map((food, index) => ({
                category: food,
                weight: 5 - index,
                order: index + 1
            })),
            activity_preferences: this.selections.activities.map((activity, index) => ({
                activity: activity,
                weight: 5 - index,
                order: index + 1
            }))
        };
    }

    /**
     * 모달 닫기
     */
    closeModal() {
        if (this.showConfirm('설문조사를 종료하시겠습니까? 입력한 내용이 사라집니다.')) {
            // 부모 창으로 메시지 전송 또는 직접 닫기
            if (window.parent !== window) {
                window.parent.postMessage({ type: 'CLOSE_SURVEY' }, '*');
            } else {
                window.close();
            }
        }
    }

    /**
     * 특정 단계로 이동
     */
    goToStep(stepNumber) {
        if (stepNumber >= 1 && stepNumber <= this.totalSteps) {
            this.currentStep = stepNumber;
            this.updateUI();
        }
    }

    /**
     * 설문조사 초기화
     */
    resetSurvey() {
        this.currentStep = 1;
        this.selections = {
            regions: [],
            stay: null,
            foods: [],
            activities: []
        };
        
        // 모든 선택 상태 초기화
        document.querySelectorAll('.option-card.selected, .option-row.selected')
            .forEach(element => element.classList.remove('selected'));
        
        this.updateUI();
    }

    /**
     * 현재 선택사항 반환
     */
    getCurrentSelections() {
        return { ...this.selections };
    }

    /**
     * 알림 메시지 표시
     */
    showAlert(message) {
        alert(message);
    }

    /**
     * 확인 메시지 표시
     */
    showConfirm(message) {
        return confirm(message);
    }
}

/**
 * DOM 로드 완료 후 초기화
 */
document.addEventListener('DOMContentLoaded', function() {
    try {
        const survey = new SurveyModal();
        
        // 전역 접근 가능하도록 설정 (디버깅용)
        window.survey = survey;
        
        console.log('설문조사 모달 초기화 완료');
    } catch (error) {
        console.error('설문조사 모달 초기화 실패:', error);
    }
});

/**
 * 전역 유틸리티 함수들
 */

// 설문조사 결과 가져오기
window.getSurveyData = function() {
    return window.survey ? window.survey.getCurrentSelections() : null;
};

// 설문조사 초기화
window.resetSurvey = function() {
    if (window.survey) {
        window.survey.resetSurvey();
    }
};

// 특정 단계로 이동
window.goToSurveyStep = function(stepNumber) {
    if (window.survey) {
        window.survey.goToStep(stepNumber);
    }
};