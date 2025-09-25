/**
 * 가격착한 숙소 슬라이더 JavaScript (budget-friendly-slider.js)
 * 완전히 독립된 슬라이더 구조로 구현
 */

const BudgetSlider = {
    // === 상태 관리 ===
    config: {
        currentSlide: 0,
        itemsPerSlide: 3,
        totalSlides: 2,
        isDragging: false,
        touchStart: { x: 0, y: 0 },
        touchCurrent: { x: 0, y: 0 }
    },

    // === 데이터 ===
    budgetData: [
        {
            id: 'budget_1',
            name: "펜션 힐링스테이",
            location: "강원도 춘천시 • 춘천역 차량 15분",
            image: "../img/main-example.svg",
            rating: 4.2,
            price: 35000,
            discount: 22,
            reviews: "1,240"
        },
        {
            id: 'budget_2',
            name: "모텔 블루스카이",
            location: "부산 해운대구 • 해운대해수욕장 도보 5분",
            image: "../img/main-example.svg",
            rating: 4.0,
            price: 42000,
            discount: 24,
            reviews: "890"
        },
        {
            id: 'budget_3',
            name: "게스트하우스 서울역",
            location: "서울 중구 • 서울역 도보 3분",
            image: "../img/main-example.svg",
            rating: 3.8,
            price: 28000,
            discount: 26,
            reviews: "2,150"
        },
        {
            id: 'budget_4',
            name: "리조트 오션뷰",
            location: "제주시 • 제주공항 차량 20분",
            image: "../img/main-example.svg",
            rating: 4.5,
            price: 68000,
            discount: 24,
            reviews: "756"
        },
        {
            id: 'budget_5',
            name: "호텔 시티센터",
            location: "대구 중구 • 동대구역 도보 10분",
            image: "../img/main-example.svg",
            rating: 4.1,
            price: 52000,
            discount: 24,
            reviews: "1,456"
        },
        {
            id: 'budget_6',
            name: "펜션 바다전망",
            location: "강원도 속초시 • 속초해수욕장 도보 3분",
            image: "../img/main-example.svg",
            rating: 4.3,
            price: 75000,
            discount: 21,
            reviews: "623"
        }
    ],

    // === DOM 요소 ===
    elements: {
        container: null,
        sliderWrapper: null,
        prevButton: null,
        nextButton: null,
        indicators: null
    },

    // === 초기화 ===
    initialize() {
        this.createSliderStructure();
        this.cacheElements();
        this.updateResponsiveConfig();
        this.bindEvents();
        this.renderSlides();
        this.renderIndicators();
        this.updateSliderPosition();
        console.log('Budget Slider 초기화 완료');
    },

    // 슬라이더 구조 생성
    createSliderStructure() {
        const budgetSection = document.querySelector('.budget-friendly-section .content-wrapper');
        if (!budgetSection) return;

        // 기존 내용 제거
        budgetSection.innerHTML = '';

        // 새로운 슬라이더 구조 생성
        budgetSection.innerHTML = `
            <!-- 네비게이션 버튼 -->
            <button class="budget-slider-nav budget-slider-prev" id="budgetPrevBtn">
                <i class="fas fa-chevron-left"></i>
            </button>
            <button class="budget-slider-nav budget-slider-next" id="budgetNextBtn">
                <i class="fas fa-chevron-right"></i>
            </button>
            
            <!-- 슬라이더 컨테이너 -->
            <div class="budget-slider-container">
                <div class="budget-slider-wrapper" id="budgetSliderWrapper">
                    <!-- 슬라이드들이 여기에 동적으로 생성됩니다 -->
                </div>
            </div>
            
            <!-- 인디케이터 (모바일용) -->
            <div class="slider-indicators" id="budgetIndicators" style="display: none;">
                <!-- 인디케이터들이 JavaScript로 동적 생성됩니다 -->
            </div>
        `;
    },

    // DOM 요소 캐싱
    cacheElements() {
        this.elements.container = document.querySelector('.budget-slider-container');
        this.elements.sliderWrapper = document.getElementById('budgetSliderWrapper');
        this.elements.prevButton = document.getElementById('budgetPrevBtn');
        this.elements.nextButton = document.getElementById('budgetNextBtn');
        this.elements.indicators = document.getElementById('budgetIndicators');
    },

    // === 반응형 설정 ===
    updateResponsiveConfig() {
        const width = window.innerWidth;
        const prevItems = this.config.itemsPerSlide;
        
        if (width <= 768) this.config.itemsPerSlide = 2;     // 모바일: 2개씩
        else if (width <= 1024) this.config.itemsPerSlide = 2; // 태블릿: 2개씩
        else this.config.itemsPerSlide = 3;                   // 데스크톱: 3개씩
        
        this.config.totalSlides = Math.ceil(6 / this.config.itemsPerSlide);
        
        if (this.config.currentSlide >= this.config.totalSlides) {
            this.config.currentSlide = this.config.totalSlides - 1;
        }
        
        // 인디케이터 표시/숨김 (모바일에서만 표시)
        if (this.elements.indicators) {
            this.elements.indicators.style.display = width <= 768 ? 'flex' : 'none';
        }
        
        if (prevItems !== this.config.itemsPerSlide) {
            this.renderSlides();
            this.renderIndicators();
        }
    },

    // === 이벤트 바인딩 ===
    bindEvents() {
        // 네비게이션 버튼
        if (this.elements.prevButton) {
            this.elements.prevButton.addEventListener('click', () => this.previousSlide());
        }
        if (this.elements.nextButton) {
            this.elements.nextButton.addEventListener('click', () => this.nextSlide());
        }

        // 터치 이벤트
        this.bindTouchEvents();

        // 리사이즈 이벤트
        window.addEventListener('resize', () => this.updateResponsiveConfig());
    },

    // 터치 이벤트
    bindTouchEvents() {
        if (!this.elements.container) return;

        this.elements.container.addEventListener('touchstart', (e) => {
            this.config.touchStart.x = e.touches[0].clientX;
            this.config.touchStart.y = e.touches[0].clientY;
            this.config.isDragging = true;
        }, { passive: true });

        this.elements.container.addEventListener('touchmove', (e) => {
            if (!this.config.isDragging) return;
            
            this.config.touchCurrent.x = e.touches[0].clientX;
            this.config.touchCurrent.y = e.touches[0].clientY;
            
            const diffX = Math.abs(this.config.touchCurrent.x - this.config.touchStart.x);
            const diffY = Math.abs(this.config.touchCurrent.y - this.config.touchStart.y);
            
            if (diffX > diffY && diffX > 10) e.preventDefault();
        }, { passive: false });

        this.elements.container.addEventListener('touchend', () => {
            if (!this.config.isDragging) return;
            this.config.isDragging = false;
            
            const diffX = this.config.touchStart.x - this.config.touchCurrent.x;
            const diffY = Math.abs(this.config.touchStart.y - this.config.touchCurrent.y);
            const threshold = 50;
            
            if (Math.abs(diffX) > threshold && Math.abs(diffX) > diffY) {
                diffX > 0 ? this.nextSlide() : this.previousSlide();
            }
        }, { passive: true });
    },

    // === 렌더링 ===
    renderSlides() {
        if (!this.elements.sliderWrapper) return;
        
        let html = '';
        
        for (let i = 0; i < this.config.totalSlides; i++) {
            const start = i * this.config.itemsPerSlide;
            const end = Math.min(start + this.config.itemsPerSlide, this.budgetData.length);
            const slideData = this.budgetData.slice(start, end);
            
            // 실제 카드 개수에 맞춰 그리드 클래스 동적 생성
            const itemCount = slideData.length;
            const gridClass = itemCount < this.config.itemsPerSlide ? 
                `budget-slide-grid budget-partial-grid budget-grid-${itemCount}` : 
                'budget-slide-grid';
            
            html += `<div class="${gridClass}">${slideData.map(item => this.createBudgetCard(item)).join('')}</div>`;
        }
        
        this.elements.sliderWrapper.innerHTML = html;
        this.elements.sliderWrapper.style.width = `${this.config.totalSlides * 100}%`;
        
        // 초기 그리드 조정
        this.adjustGridColumns();
        this.bindCardEvents();
    },

    createBudgetCard(item) {
        const formattedPrice = this.formatNumber(item.price);
        
        return `
            <div class="budget-item-card" data-id="${item.id}">
                <div class="budget-card-image">
                    <img src="${item.image}" alt="${item.name}" class="budget-img" 
                         onerror="this.src='https://via.placeholder.com/500x350/f0f0f0/666?text=No+Image'">
                    <div class="budget-discount-badge">${item.discount}% 할인</div>
                </div>
                <div class="budget-card-content">
                    <h3 class="budget-title">${item.name}</h3>
                    <p class="budget-location">${item.location}</p>
                    <div class="budget-rating">
                        <span class="budget-stars">★ ${item.rating}</span>
                        <span class="budget-reviews">(${item.reviews})</span>
                    </div>
                    <div class="budget-pricing">
                        <div class="budget-main-price">₩${formattedPrice}</div>
                    </div>
                </div>
            </div>
        `;
    },

    // === 인디케이터 렌더링 ===
    renderIndicators() {
        if (!this.elements.indicators) return;
        
        let html = '';
        for (let i = 0; i < this.config.totalSlides; i++) {
            html += `<div class="indicator ${i === this.config.currentSlide ? 'active' : ''}" data-slide="${i}"></div>`;
        }
        
        this.elements.indicators.innerHTML = html;
        
        // 인디케이터 클릭 이벤트
        this.elements.indicators.querySelectorAll('.indicator').forEach(indicator => {
            indicator.addEventListener('click', () => {
                const slideIndex = parseInt(indicator.dataset.slide);
                this.goToSlideIndex(slideIndex);
            });
        });
    },

    updateIndicators() {
        if (!this.elements.indicators) return;
        
        this.elements.indicators.querySelectorAll('.indicator').forEach((indicator, index) => {
            indicator.classList.toggle('active', index === this.config.currentSlide);
        });
    },

    // === 슬라이드 제어 ===
    previousSlide() {
        if (this.config.currentSlide > 0) {
            this.config.currentSlide--;
            this.updateSliderPosition();
            this.updateIndicators();
        }
    },

    nextSlide() {
        if (this.config.currentSlide < this.config.totalSlides - 1) {
            this.config.currentSlide++;
            this.updateSliderPosition();
            this.updateIndicators();
        }
    },

    goToSlideIndex(index) {
        if (index >= 0 && index < this.config.totalSlides) {
            this.config.currentSlide = index;
            this.updateSliderPosition();
            this.updateIndicators();
        }
    },

    updateSliderPosition() {
        if (!this.elements.sliderWrapper) return;
        
        const translateX = -(this.config.currentSlide * (100 / this.config.totalSlides));
        this.elements.sliderWrapper.style.transform = `translateX(${translateX}%)`;
        
        // 그리드 열 개수 동적 조정
        this.adjustGridColumns();
        this.updateButtonStates();
    },

    // 그리드 열 개수 동적 조정 (빈 칸 방지)
    adjustGridColumns() {
        const grids = document.querySelectorAll('.budget-slide-grid');
        grids.forEach((grid, index) => {
            const start = index * this.config.itemsPerSlide;
            const end = Math.min(start + this.config.itemsPerSlide, this.budgetData.length);
            const itemsInThisSlide = end - start;
            
            // 실제 카드 개수에 맞춰 그리드 열 조정
            if (itemsInThisSlide < this.config.itemsPerSlide) {
                grid.style.gridTemplateColumns = `repeat(${itemsInThisSlide}, 1fr)`;
                grid.style.justifyContent = 'flex-start';
            } else {
                // 원래 설정 복원
                const width = window.innerWidth;
                if (width <= 1024) {
                    grid.style.gridTemplateColumns = 'repeat(2, 1fr)';
                } else {
                    grid.style.gridTemplateColumns = 'repeat(3, 1fr)';
                }
                grid.style.justifyContent = 'normal';
            }
        });
    },

    updateButtonStates() {
        if (this.elements.prevButton) {
            this.elements.prevButton.style.opacity = this.config.currentSlide === 0 ? '0.5' : '1';
            this.elements.prevButton.disabled = this.config.currentSlide === 0;
        }
        
        if (this.elements.nextButton) {
            this.elements.nextButton.style.opacity = this.config.currentSlide === this.config.totalSlides - 1 ? '0.5' : '1';
            this.elements.nextButton.disabled = this.config.currentSlide === this.config.totalSlides - 1;
        }
    },

    // === 유틸리티 ===
    formatNumber(num) {
        return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },

    // === 카드 이벤트 ===
    bindCardEvents() {
        document.querySelectorAll('.budget-item-card').forEach(card => {
            card.addEventListener('click', function() {
                const cardId = this.getAttribute('data-id');
                console.log('Budget 카드 클릭:', cardId);
                
                // 카드 클릭 시 동작
                // 예: 상세 페이지 이동, 모달 표시 등
            });
        });
    }
};

// === 전역 API ===
window.BudgetSliderAPI = {
    init: () => BudgetSlider.initialize(),
    next: () => BudgetSlider.nextSlide(),
    prev: () => BudgetSlider.previousSlide(),
    goTo: (index) => BudgetSlider.goToSlideIndex(index)
};

// === 자동 초기화 ===
document.addEventListener('DOMContentLoaded', () => {
    // 기존 스크립트와 완전히 분리하여 실행
    setTimeout(() => {
        if (document.querySelector('.budget-friendly-section')) {
            BudgetSlider.initialize();
        }
    }, 200);
});