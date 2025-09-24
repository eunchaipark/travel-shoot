/* survey.js */
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
        
        this.stepConfig = {
            1: { min: 1, max: 5, type: 'multiple', key: 'regions' },
            2: { min: 1, max: 1, type: 'single', key: 'stay' },
            3: { min: 2, max: 5, type: 'multiple', key: 'foods' },
            4: { min: 2, max: 4, type: 'multiple', key: 'activities' }
        };
        
        this.init();
    }

    init() {
        this.bindEvents();
        this.updateUI();
    }

    bindEvents() {
        // 닫기 버튼
        const closeButton = document.querySelector('.close-button');
        if (closeButton) {
            closeButton.addEventListener('click', () => this.closeModal());
        }

        // 이전/다음 버튼
        const prevButton = document.querySelector('.btn-prev');
        const nextButton = document.querySelector('.btn-next');
        
        if (prevButton) {
            prevButton.addEventListener('click', () => this.goToPrevStep());
        }
        
        if (nextButton) {
            nextButton.addEventListener('click', () => this.goToNextStep());
        }

        // 옵션 선택 이벤트
        this.bindOptionEvents();
    }

    bindOptionEvents() {
        // 옵션 카드 클릭 이벤트 (지역, 음식, 액티비티)
        document.querySelectorAll('.option-card').forEach(card => {
            card.addEventListener('click', (e) => {
                e.preventDefault();
                e.stopPropagation();
                
                const clickedCard = e.currentTarget; // e.target 대신 e.currentTarget 사용
                const surveyStep = clickedCard.closest('.survey-step');
                
                if (!surveyStep || !clickedCard.dataset.value) {
                    console.error('설문 단계 또는 옵션 값을 찾을 수 없습니다.');
                    return;
                }
                
                const step = parseInt(surveyStep.dataset.step);
                const value = clickedCard.dataset.value;
                
                console.log('옵션 카드 클릭:', step, value);
                this.selectOption(step, value, clickedCard);
            });
        });

        // 옵션 행 클릭 이벤트 (숙소 유형)
        document.querySelectorAll('.option-row').forEach(row => {
            row.addEventListener('click', (e) => {
                e.preventDefault();
                e.stopPropagation();
                
                const clickedRow = e.currentTarget; // e.target 대신 e.currentTarget 사용
                const surveyStep = clickedRow.closest('.survey-step');
                
                if (!surveyStep || !clickedRow.dataset.value) {
                    console.error('설문 단계 또는 옵션 값을 찾을 수 없습니다.');
                    return;
                }
                
                const step = parseInt(surveyStep.dataset.step);
                const value = clickedRow.dataset.value;
                
                console.log('옵션 행 클릭:', step, value);
                this.selectOption(step, value, clickedRow);
            });
        });
    }

    selectOption(step, value, element) {
        console.log('selectOption 호출:', step, value, element);
        
        const config = this.stepConfig[step];
        if (!config) {
            console.error('잘못된 단계:', step);
            return;
        }
        
        const key = config.key;

        if (config.type === 'single') {
            // 단일 선택 (숙소 유형)
            this.selections[key] = value;
            console.log('단일 선택:', key, value);
            
            // 모든 옵션에서 selected 클래스 제거
            element.parentElement.querySelectorAll('.option-row').forEach(row => {
                row.classList.remove('selected');
            });
            
            // 선택한 옵션에 selected 클래스 추가
            element.classList.add('selected');
            
        } else if (config.type === 'multiple') {
            // 복수 선택 (지역, 음식, 액티비티)
            const currentSelections = this.selections[key];
            const index = currentSelections.indexOf(value);
            
            console.log('복수 선택 - 현재 선택:', currentSelections, '새 값:', value);
            
            if (index > -1) {
                // 이미 선택된 경우 제거
                currentSelections.splice(index, 1);
                element.classList.remove('selected');
                console.log('선택 제거:', value, '현재 선택:', currentSelections);
            } else {
                // 최대 선택 개수 확인
                if (currentSelections.length < config.max) {
                    currentSelections.push(value);
                    element.classList.add('selected');
                    console.log('선택 추가:', value, '현재 선택:', currentSelections);
                } else {
                    alert(`최대 ${config.max}개까지 선택 가능합니다.`);
                    return;
                }
            }
        }

        this.updateButtons();
        console.log('현재 모든 선택:', this.selections);
    }

    goToPrevStep() {
        if (this.currentStep > 1) {
            this.currentStep--;
            this.updateUI();
        }
    }

    goToNextStep() {
        if (this.isStepValid()) {
            if (this.currentStep < this.totalSteps) {
                this.currentStep++;
                this.updateUI();
            } else {
                // 마지막 단계에서 완료
                this.completeSurvey();
            }
        }
    }

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

    updateUI() {
        this.updateSteps();
        this.updateSurveyContent();
        this.updateButtons();
    }

    updateSteps() {
        // 진행률 표시 업데이트
        document.querySelectorAll('.step').forEach((step, index) => {
            const stepNumber = index + 1;
            if (stepNumber === this.currentStep) {
                step.classList.add('active');
            } else {
                step.classList.remove('active');
            }
        });
    }

    updateSurveyContent() {
        // 현재 단계의 설문 내용만 표시
        document.querySelectorAll('.survey-step').forEach(step => {
            const stepNumber = parseInt(step.dataset.step);
            if (stepNumber === this.currentStep) {
                step.classList.add('active');
            } else {
                step.classList.remove('active');
            }
        });
    }

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
            
            if (this.currentStep === this.totalSteps) {
                nextButton.textContent = '완료';
            } else {
                nextButton.textContent = '다음';
            }
        }
    }

    completeSurvey() {
        console.log('설문조사 완료:', this.selections);
        
        // 여기서 서버로 데이터 전송
        this.submitSurvey();
        
        // 성공 메시지 표시
        alert('설문조사가 완료되었습니다!');
        
        // 모달 닫기
        this.closeModal();
    }

    async submitSurvey() {
        try {
            // 설문 데이터를 서버 형식에 맞게 변환
            const surveyData = {
                preferred_regions: this.selections.regions.map((region, index) => ({
                    region: region,
                    weight: 5 - index // 선택 순서에 따른 가중치
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

            // 여기서 실제 API 호출
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

            const result = await response.json();
            console.log('설문조사 제출 성공:', result);
            */

            // 임시로 콘솔에 출력
            console.log('제출할 설문 데이터:', surveyData);
            
        } catch (error) {
            console.error('설문조사 제출 오류:', error);
            alert('설문조사 제출 중 오류가 발생했습니다. 다시 시도해주세요.');
        }
    }

    closeModal() {
        // 모달 닫기 로직
        if (confirm('설문조사를 종료하시겠습니까? 입력한 내용이 사라집니다.')) {
            // 부모 창으로 메시지 전송 또는 직접 닫기
            window.close();
            
            // 또는 부모 창에 메시지 전송
            if (window.parent !== window) {
                window.parent.postMessage({ type: 'CLOSE_SURVEY' }, '*');
            }
        }
    }

    // 외부에서 호출할 수 있는 메서드들
    getCurrentSelections() {
        return this.selections;
    }

    goToStep(stepNumber) {
        if (stepNumber >= 1 && stepNumber <= this.totalSteps) {
            this.currentStep = stepNumber;
            this.updateUI();
        }
    }

    resetSurvey() {
        this.currentStep = 1;
        this.selections = {
            regions: [],
            stay: null,
            foods: [],
            activities: []
        };
        
        // 모든 선택 상태 초기화
        document.querySelectorAll('.option-card.selected, .option-row.selected').forEach(element => {
            element.classList.remove('selected');
        });
        
        this.updateUI();
    }
}

// DOM 로드 완료 후 초기화
document.addEventListener('DOMContentLoaded', function() {
    const survey = new SurveyModal();
    
    // 전역에서 접근 가능하도록 설정 (디버깅용)
    window.survey = survey;
    
    console.log('설문조사 모달 초기화 완료');
});

// 키보드 이벤트 처리
document.addEventListener('keydown', function(e) {
    // ESC 키로 모달 닫기
    if (e.key === 'Escape') {
        if (window.survey) {
            window.survey.closeModal();
        }
    }
    
    // 엔터 키로 다음 단계
    if (e.key === 'Enter') {
        const nextButton = document.querySelector('.btn-next');
        if (nextButton && !nextButton.disabled) {
            nextButton.click();
        }
    }
});

// 외부에서 설문조사 결과를 가져올 수 있는 전역 함수
window.getSurveyData = function() {
    if (window.survey) {
        return window.survey.getCurrentSelections();
    }
    return null;
};

// 설문조사 초기화 함수 (외부에서 호출 가능)
window.resetSurvey = function() {
    if (window.survey) {
        window.survey.resetSurvey();
    }
};