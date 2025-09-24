/**
 * Trending Section 슬라이더 관리 스크립트
 * travel-now와 완전 분리된 네임스페이스로 충돌 방지
 */

const TrendingSlider = {
    // === 설정 및 상태 ===
    state: {
        currentSlideIndex: 0,
        currentTab: 'stay',
        cardsPerSlide: 4,
        totalSlides: 3,
        isDragging: false,
        touchStart: { x: 0, y: 0 },
        touchCurrent: { x: 0, y: 0 }
    },

    // === 데이터 ===
    data: {
        stay: [
            { id: 1, title: "부산 해운대 럭셔리 호텔", image: "/images/trending/stay1.jpg", rating: "4.8", reviews: "2,840", price: "180,000원", category: "호텔" },
            { id: 2, title: "서울 강남 부티크 호텔", image: "/images/trending/stay2.jpg", rating: "4.7", reviews: "1,920", price: "220,000원", category: "호텔" },
            { id: 3, title: "제주 감귤농장 펜션", image: "/images/trending/stay3.jpg", rating: "4.9", reviews: "850", price: "120,000원", category: "펜션" },
            { id: 4, title: "속초 해변 리조트", image: "/images/trending/stay4.jpg", rating: "4.6", reviews: "3,200", price: "250,000원", category: "리조트" },
            { id: 5, title: "경주 한옥 게스트하우스", image: "/images/trending/stay5.jpg", rating: "4.8", reviews: "1,150", price: "95,000원", category: "한옥" },
            { id: 6, title: "인천공항 캡슐호텔", image: "/images/trending/stay6.jpg", rating: "4.5", reviews: "2,400", price: "80,000원", category: "캡슐호텔" },
            { id: 7, title: "대전 비즈니스 호텔", image: "/images/trending/stay7.jpg", rating: "4.4", reviews: "980", price: "110,000원", category: "호텔" },
            { id: 8, title: "울산 온천 리조트", image: "/images/trending/stay8.jpg", rating: "4.7", reviews: "1,680", price: "190,000원", category: "리조트" },
            { id: 9, title: "강릉 바다뷰 펜션", image: "/images/trending/stay9.jpg", rating: "4.6", reviews: "720", price: "140,000원", category: "펜션" },
            { id: 10, title: "양평 힐링 스테이", image: "/images/trending/stay10.jpg", rating: "4.8", reviews: "950", price: "160,000원", category: "펜션" },
            { id: 11, title: "전주 한옥 호텔", image: "/images/trending/stay11.jpg", rating: "4.7", reviews: "1,300", price: "130,000원", category: "한옥" },
            { id: 12, title: "남해 글램핑장", image: "/images/trending/stay12.jpg", rating: "4.5", reviews: "680", price: "170,000원", category: "글램핑" }
        ],
        restaurants: [
            { id: 13, title: "강남 미슐랭 레스토랑", image: "/images/trending/restaurant1.jpg", rating: "4.9", reviews: "3,500", price: "150,000원", category: "파인다이닝" },
            { id: 14, title: "부산 해산물 전문점", image: "/images/trending/restaurant2.jpg", rating: "4.8", reviews: "2,100", price: "45,000원", category: "해산물" },
            { id: 15, title: "제주 흑돼지 맛집", image: "/images/trending/restaurant3.jpg", rating: "4.7", reviews: "1,800", price: "35,000원", category: "한식" },
            { id: 16, title: "명동 전통 한정식", image: "/images/trending/restaurant4.jpg", rating: "4.6", reviews: "2,800", price: "80,000원", category: "한정식" },
            { id: 17, title: "이태원 퓨전 요리", image: "/images/trending/restaurant5.jpg", rating: "4.5", reviews: "1,200", price: "65,000원", category: "퓨전" },
            { id: 18, title: "홍대 브런치 카페", image: "/images/trending/restaurant6.jpg", rating: "4.4", reviews: "950", price: "25,000원", category: "브런치" },
            { id: 19, title: "광주 전통 시장 맛집", image: "/images/trending/restaurant7.jpg", rating: "4.8", reviews: "1,500", price: "18,000원", category: "향토음식" },
            { id: 20, title: "대구 치킨 전문점", image: "/images/trending/restaurant8.jpg", rating: "4.6", reviews: "3,200", price: "28,000원", category: "치킨" },
            { id: 21, title: "인사동 전통차 카페", image: "/images/trending/restaurant9.jpg", rating: "4.5", reviews: "890", price: "15,000원", category: "카페" },
            { id: 22, title: "용산 스테이크 하우스", image: "/images/trending/restaurant10.jpg", rating: "4.7", reviews: "1,640", price: "120,000원", category: "스테이크" },
            { id: 23, title: "여의도 일식당", image: "/images/trending/restaurant11.jpg", rating: "4.6", reviews: "2,100", price: "90,000원", category: "일식" },
            { id: 24, title: "압구정 이탈리안", image: "/images/trending/restaurant12.jpg", rating: "4.8", reviews: "1,750", price: "85,000원", category: "이탈리안" }
        ],
        attractions: [
            { id: 25, title: "경복궁 야간 관람", image: "/images/trending/attraction1.jpg", rating: "4.9", reviews: "5,200", price: "20,000원", category: "문화재" },
            { id: 26, title: "롯데월드 자유이용권", image: "/images/trending/attraction2.jpg", rating: "4.7", reviews: "8,900", price: "62,000원", category: "테마파크" },
            { id: 27, title: "제주 성산일출봉", image: "/images/trending/attraction3.jpg", rating: "4.8", reviews: "4,100", price: "5,000원", category: "자연명소" },
            { id: 28, title: "부산 감천문화마을", image: "/images/trending/attraction4.jpg", rating: "4.6", reviews: "3,800", price: "무료", category: "문화마을" },
            { id: 29, title: "여수 밤바다 유람선", image: "/images/trending/attraction5.jpg", rating: "4.8", reviews: "2,400", price: "35,000원", category: "액티비티" },
            { id: 30, title: "속초 설악산 케이블카", image: "/images/trending/attraction6.jpg", rating: "4.5", reviews: "1,900", price: "15,000원", category: "자연명소" },
            { id: 31, title: "전주 한옥마을 투어", image: "/images/trending/attraction7.jpg", rating: "4.7", reviews: "2,600", price: "12,000원", category: "문화체험" },
            { id: 32, title: "안동 하회마을", image: "/images/trending/attraction8.jpg", rating: "4.6", reviews: "1,500", price: "8,000원", category: "문화재" },
            { id: 33, title: "경주 불국사", image: "/images/trending/attraction9.jpg", rating: "4.8", reviews: "3,300", price: "6,000원", category: "문화재" },
            { id: 34, title: "지리산 둘레길", image: "/images/trending/attraction10.jpg", rating: "4.7", reviews: "1,200", price: "무료", category: "트레킹" },
            { id: 35, title: "통영 케이블카", image: "/images/trending/attraction11.jpg", rating: "4.5", reviews: "980", price: "18,000원", category: "액티비티" },
            { id: 36, title: "담양 죽녹원", image: "/images/trending/attraction12.jpg", rating: "4.6", reviews: "1,850", price: "3,000원", category: "자연명소" }
        ]
    },

    // === DOM 요소 캐싱 ===
    elements: {
        slider: null,
        tabButtons: null,
        navButtons: { prev: null, next: null },
        sliderContainer: null,
        indicators: null
    },

    // === 초기화 ===
    init() {
        this.cacheElements();
        this.updateResponsiveSettings();
        this.bindEvents();
        this.render();
        this.renderIndicators();
        console.log('Trending Slider 초기화 완료');
    },

    // DOM 요소 캐싱
    cacheElements() {
        this.elements.slider = document.getElementById('trendingSlider');
        this.elements.tabButtons = document.querySelectorAll('.trending-section .tab-button');
        this.elements.navButtons.prev = document.querySelector('.trending-section .slider-nav-prev');
        this.elements.navButtons.next = document.querySelector('.trending-section .slider-nav-next');
        this.elements.sliderContainer = document.querySelector('.trending-section .slider-container');
        this.elements.indicators = document.getElementById('trendingIndicators');
    },

    // === 반응형 설정 ===
    updateResponsiveSettings() {
        const width = window.innerWidth;
        const prevCards = this.state.cardsPerSlide;
        
        // 모바일에서도 3개씩, 태블릿에서는 3개씩, 데스크톱에서는 4개씩
        if (width <= 768) this.state.cardsPerSlide = 3;      // 모바일: 3개씩
        else if (width <= 1200) this.state.cardsPerSlide = 3; // 태블릿: 3개씩
        else this.state.cardsPerSlide = 4;                    // 데스크톱: 4개씩
        
        this.state.totalSlides = Math.ceil(12 / this.state.cardsPerSlide);
        
        // 현재 슬라이드 인덱스 보정
        if (this.state.currentSlideIndex >= this.state.totalSlides) {
            this.state.currentSlideIndex = this.state.totalSlides - 1;
        }
        
        // 인디케이터 표시/숨김 (모바일에서만 표시)
        if (this.elements.indicators) {
            this.elements.indicators.style.display = width <= 768 ? 'flex' : 'none';
        }
        
        // 카드 개수가 변경되었으면 재렌더링
        if (prevCards !== this.state.cardsPerSlide) {
            this.render();
            this.renderIndicators();
        }
    },

    // === 이벤트 바인딩 ===
    bindEvents() {
        // 탭 버튼 이벤트
        this.elements.tabButtons.forEach(button => {
            button.addEventListener('click', (e) => {
                const tab = e.target.getAttribute('data-tab');
                if (tab !== this.state.currentTab) this.switchTab(tab);
            });
        });

        // 네비게이션 버튼 이벤트
        if (this.elements.navButtons.prev) {
            this.elements.navButtons.prev.addEventListener('click', () => this.prevSlide());
        }
        if (this.elements.navButtons.next) {
            this.elements.navButtons.next.addEventListener('click', () => this.nextSlide());
        }

        // 터치 이벤트
        this.bindTouchEvents();

        // 리사이즈 이벤트
        window.addEventListener('resize', () => this.updateResponsiveSettings());
    },

    // 터치 이벤트 바인딩
    bindTouchEvents() {
        if (!this.elements.sliderContainer) return;

        this.elements.sliderContainer.addEventListener('touchstart', (e) => {
            this.state.touchStart.x = e.touches[0].clientX;
            this.state.touchStart.y = e.touches[0].clientY;
            this.state.isDragging = true;
        }, { passive: true });

        this.elements.sliderContainer.addEventListener('touchmove', (e) => {
            if (!this.state.isDragging) return;
            
            this.state.touchCurrent.x = e.touches[0].clientX;
            this.state.touchCurrent.y = e.touches[0].clientY;
            
            const diffX = Math.abs(this.state.touchCurrent.x - this.state.touchStart.x);
            const diffY = Math.abs(this.state.touchCurrent.y - this.state.touchStart.y);
            
            if (diffX > diffY && diffX > 10) e.preventDefault();
        }, { passive: false });

        this.elements.sliderContainer.addEventListener('touchend', () => {
            if (!this.state.isDragging) return;
            this.state.isDragging = false;
            
            const diffX = this.state.touchStart.x - this.state.touchCurrent.x;
            const diffY = Math.abs(this.state.touchStart.y - this.state.touchCurrent.y);
            const threshold = 50;
            
            if (Math.abs(diffX) > threshold && Math.abs(diffX) > diffY) {
                diffX > 0 ? this.nextSlide() : this.prevSlide();
            }
        }, { passive: true });
    },

    // === 탭 전환 ===
    switchTab(newTab) {
        this.state.currentTab = newTab;
        this.state.currentSlideIndex = 0;
        
        // 탭 버튼 상태 업데이트
        this.elements.tabButtons.forEach(btn => {
            btn.classList.toggle('active', btn.getAttribute('data-tab') === newTab);
        });
        
        this.updateResponsiveSettings();
        this.render();
        this.renderIndicators();
    },

    // === 렌더링 ===
    render() {
        this.renderSlides();
        this.updateSliderPosition();
        this.updateIndicators();
        this.bindCardEvents();
    },

    renderSlides() {
        if (!this.elements.slider) return;
        
        const currentData = this.data[this.state.currentTab];
        let html = '';
        
        for (let i = 0; i < this.state.totalSlides; i++) {
            const start = i * this.state.cardsPerSlide;
            const end = Math.min(start + this.state.cardsPerSlide, currentData.length);
            const slideData = currentData.slice(start, end);
            
            html += `<div class="trending-grid">${slideData.map(item => this.createCard(item)).join('')}</div>`;
        }
        
        this.elements.slider.innerHTML = html;
    },

    createCard(item) {
        return `
            <div class="trending-card" data-id="${item.id}" data-type="${this.state.currentTab}">
                <div class="card-image-container">
                    <img src="${item.image}" alt="${item.title}" class="card-image">
                    <div class="category-badge">${item.category}</div>
                </div>
                <div class="card-info">
                    <h3 class="card-title">${item.title}</h3>
                    <div class="card-details">
                        <div class="rating-info">
                            <span class="rating">★ ${item.rating}</span>
                            <span class="reviews">(${item.reviews})</span>
                        </div>
                        <div class="price">${item.price}</div>
                    </div>
                </div>
            </div>
        `;
    },

    // === 슬라이드 제어 ===
    prevSlide() {
        if (this.state.currentSlideIndex > 0) {
            this.state.currentSlideIndex--;
            this.updateSliderPosition();
            this.updateIndicators();
        }
    },

    nextSlide() {
        if (this.state.currentSlideIndex < this.state.totalSlides - 1) {
            this.state.currentSlideIndex++;
            this.updateSliderPosition();
            this.updateIndicators();
        }
    },

    goToSlide(index) {
        if (index >= 0 && index < this.state.totalSlides) {
            this.state.currentSlideIndex = index;
            this.updateSliderPosition();
            this.updateIndicators();
        }
    },

    updateSliderPosition() {
        if (!this.elements.slider) return;
        
        const translateX = -(this.state.currentSlideIndex * (100 / this.state.totalSlides));
        this.elements.slider.style.transform = `translateX(${translateX}%)`;
        
        this.updateNavigationButtons();
    },

    updateNavigationButtons() {
        const { prev, next } = this.elements.navButtons;
        const { currentSlideIndex, totalSlides } = this.state;
        
        if (prev) {
            prev.style.opacity = currentSlideIndex === 0 ? '0.5' : '1';
            prev.disabled = currentSlideIndex === 0;
        }
        
        if (next) {
            next.style.opacity = currentSlideIndex === totalSlides - 1 ? '0.5' : '1';
            next.disabled = currentSlideIndex === totalSlides - 1;
        }
    },

    // === 인디케이터 렌더링 ===
    renderIndicators() {
        if (!this.elements.indicators) return;
        
        let html = '';
        for (let i = 0; i < this.state.totalSlides; i++) {
            html += `<div class="indicator ${i === this.state.currentSlideIndex ? 'active' : ''}" data-slide="${i}"></div>`;
        }
        
        this.elements.indicators.innerHTML = html;
        
        // 인디케이터 클릭 이벤트
        this.elements.indicators.querySelectorAll('.indicator').forEach(indicator => {
            indicator.addEventListener('click', () => {
                const slideIndex = parseInt(indicator.dataset.slide);
                this.goToSlide(slideIndex);
            });
        });
    },

    updateIndicators() {
        if (!this.elements.indicators) return;
        
        this.elements.indicators.querySelectorAll('.indicator').forEach((indicator, index) => {
            indicator.classList.toggle('active', index === this.state.currentSlideIndex);
        });
    },

    // === 카드 이벤트 ===
    bindCardEvents() {
        document.querySelectorAll('.trending-card').forEach(card => {
            card.addEventListener('click', function() {
                const cardId = this.getAttribute('data-id');
                const cardType = this.getAttribute('data-type');
                console.log('Trending 카드 클릭:', cardType, cardId);
                
                // 여기에 카드 클릭 시 동작 구현
                // 예: 상세 페이지 이동, 모달 표시 등
            });
        });
    }
};

// === 전역 API ===
window.TrendingSection = {
    init: () => TrendingSlider.init(),
    next: () => TrendingSlider.nextSlide(),
    prev: () => TrendingSlider.prevSlide(),
    goTo: (index) => TrendingSlider.goToSlide(index),
    switchTab: (tab) => TrendingSlider.switchTab(tab)
};

// === 자동 초기화 ===
document.addEventListener('DOMContentLoaded', () => {
    if (document.querySelector('.trending-section')) {
        TrendingSlider.init();
    }
});