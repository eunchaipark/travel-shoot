/**
 * 인기 급상승 섹션 JavaScript (trending-section.js)
 * 3개 탭(숙소/맛집/관광지) 슬라이더 기능
 */

// 현재 활성 탭과 슬라이더 인덱스
let currentTab = 'stay';
let currentSlideIndex = 0;

// 인기 급상승 데이터 (예시)
const TRENDING_DATA = {
    stay: [
        {
            id: 1,
            title: "제주 오션뷰 프리미엄 펜션",
            image: "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=300&fit=crop",
            rating: 4.8,
            location: "제주 서귀포시",
            price: 185000,
            badge: "+45%"
        },
        {
            id: 2,
            title: "부산 해운대 스카이 호텔",
            image: "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=400&h=300&fit=crop",
            rating: 4.6,
            location: "부산 해운대구",
            price: 145000,
            badge: "+38%"
        },
        {
            id: 3,
            title: "강릉 바다뷰 모던 펜션",
            image: "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=300&fit=crop",
            rating: 4.7,
            location: "강원 강릉시",
            price: 125000,
            badge: "+42%"
        },
        {
            id: 4,
            title: "서울 명동 프리미엄 호텔",
            image: "https://images.unsplash.com/photo-1590490360182-c33d57733427?w=400&h=300&fit=crop",
            rating: 4.5,
            location: "서울 중구",
            price: 195000,
            badge: "+33%"
        }
    ],
    restaurants: [
        {
            id: 1,
            title: "제주 흑돼지 맛집",
            image: "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400&h=300&fit=crop",
            rating: 4.7,
            location: "제주 제주시",
            category: "한식",
            badge: "+52%"
        },
        {
            id: 2,
            title: "부산 자갈치 해산물",
            image: "https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400&h=300&fit=crop",
            rating: 4.6,
            location: "부산 중구",
            category: "해산물",
            badge: "+48%"
        },
        {
            id: 3,
            title: "강릉 커피거리 명소",
            image: "https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?w=400&h=300&fit=crop",
            rating: 4.4,
            location: "강원 강릉시",
            category: "카페",
            badge: "+41%"
        },
        {
            id: 4,
            title: "서울 홍대 맛집거리",
            image: "https://images.unsplash.com/photo-1551218808-94e220e084d2?w=400&h=300&fit=crop",
            rating: 4.5,
            location: "서울 마포구",
            category: "분식",
            badge: "+37%"
        }
    ],
    attractions: [
        {
            id: 1,
            title: "제주 한라산 국립공원",
            image: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop",
            rating: 4.8,
            location: "제주 제주시",
            category: "자연관광",
            badge: "+56%"
        },
        {
            id: 2,
            title: "부산 감천문화마을",
            image: "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=300&fit=crop",
            rating: 4.5,
            location: "부산 사하구",
            category: "문화관광",
            badge: "+44%"
        },
        {
            id: 3,
            title: "강릉 정동진 해수욕장",
            image: "https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400&h=300&fit=crop",
            rating: 4.6,
            location: "강원 강릉시",
            category: "해수욕장",
            badge: "+39%"
        },
        {
            id: 4,
            title: "서울 경복궁",
            image: "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=300&fit=crop",
            rating: 4.7,
            location: "서울 종로구",
            category: "역사관광",
            badge: "+35%",
        }
    ]
};

/**
 * 페이지 로드 시 초기화
 */
document.addEventListener('DOMContentLoaded', function() {
    // main-calendar.js의 isLoggedIn 변수 확인
    if (typeof isLoggedIn !== 'undefined' && isLoggedIn) {
        initializeTrendingSection();
    } else {
        hideTrendingSection();
    }
});

/**
 * 인기 급상승 섹션 숨기기 (비로그인 상태)
 */
function hideTrendingSection() {
    const trendingSection = document.querySelector('.trending-section');
    if (trendingSection) {
        trendingSection.style.display = 'none';
    }
}

/**
 * 인기 급상승 섹션 초기화
 */
function initializeTrendingSection() {
    renderAllTabContent();
    setupTabNavigation();
    setupSliderNavigation();
    
    // 초기 슬라이더 위치 설정
    updateSliderPosition();
}

/**
 * 숫자를 천 단위 콤마로 포맷팅
 * @param {number} number - 포맷팅할 숫자
 * @returns {string} 포맷팅된 문자열
 */
function formatPrice(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/**
 * 별점 HTML 생성 함수 (5점 만점)
 * @param {number} rating - 평점 (0-5)
 * @returns {string} 별점 HTML
 */
function generateStarRating(rating) {
    const maxStars = 5;
    let starsHTML = '';
    
    for (let i = 1; i <= maxStars; i++) {
        if (i <= Math.floor(rating)) {
            starsHTML += '<i class="fas fa-star star"></i>';
        } else if (i === Math.ceil(rating) && rating % 1 !== 0) {
            starsHTML += '<i class="fas fa-star-half-alt star"></i>';
        } else {
            starsHTML += '<i class="far fa-star star empty"></i>';
        }
    }
    
    return starsHTML;
}

/**
 * 숙소 카드 HTML 생성
 * @param {Object} item - 숙소 정보 객체
 * @returns {string} 카드 HTML
 */
function createAccommodationCard(item) {
    const formattedPrice = formatPrice(item.price);
    const starsHTML = generateStarRating(item.rating);
    
    return `
        <div class="trending-card" data-id="${item.id}" data-type="accommodation">
            <div class="card-image-container">
                <div class="trending-badge">${item.badge}</div>
                <img src="${item.image}" 
                     alt="${item.title}" 
                     class="card-image"
                     onerror="this.src='https://via.placeholder.com/400x300/f0f0f0/666?text=No+Image'">
            </div>
            <div class="card-info">
                <h3 class="card-title">${item.title}</h3>
                <div class="card-location">
                    <i class="fas fa-map-marker-alt location-icon"></i>
                    <span class="location-text">${item.location}</span>
                </div>
                <div class="card-rating">
                    <div class="star-rating">
                        ${starsHTML}
                    </div>
                    <span class="rating-text">(${item.rating}/5)</span>
                </div>
                <div class="card-price">
                    <span class="price-text">₩ ${formattedPrice}</span>
                    <span class="price-unit">1박당 요금</span>
                </div>
            </div>
        </div>
    `;
}

/**
 * 맛집 카드 HTML 생성
 * @param {Object} item - 맛집 정보 객체
 * @returns {string} 카드 HTML
 */
function createRestaurantCard(item) {
    const starsHTML = generateStarRating(item.rating);
    
    return `
        <div class="trending-card" data-id="${item.id}" data-type="restaurant">
            <div class="card-image-container">
                <div class="trending-badge">${item.badge}</div>
                <img src="${item.image}" 
                     alt="${item.title}" 
                     class="card-image"
                     onerror="this.src='https://via.placeholder.com/400x300/f0f0f0/666?text=No+Image'">
            </div>
            <div class="card-info">
                <h3 class="card-title">${item.title}</h3>
                <div class="card-location">
                    <i class="fas fa-utensils location-icon"></i>
                    <span class="location-text">${item.category} • ${item.location}</span>
                </div>
                <div class="card-rating">
                    <div class="star-rating">
                        ${starsHTML}
                    </div>
                    <span class="rating-text">(${item.rating}/5)</span>
                </div>
            </div>
        </div>
    `;
}

/**
 * 관광지 카드 HTML 생성
 * @param {Object} item - 관광지 정보 객체
 * @returns {string} 카드 HTML
 */
function createAttractionCard(item) {
    const starsHTML = generateStarRating(item.rating);
    
    return `
        <div class="trending-card" data-id="${item.id}" data-type="attraction">
            <div class="card-image-container">
                <div class="trending-badge">${item.badge}</div>
                <img src="${item.image}" 
                     alt="${item.title}" 
                     class="card-image"
                     onerror="this.src='https://via.placeholder.com/400x300/f0f0f0/666?text=No+Image'">
            </div>
            <div class="card-info">
                <h3 class="card-title">${item.title}</h3>
                <div class="card-location">
                    <i class="fas fa-camera location-icon"></i>
                    <span class="location-text">${item.category} • ${item.location}</span>
                </div>
                <div class="card-rating">
                    <div class="star-rating">
                        ${starsHTML}
                    </div>
                    <span class="rating-text">(${item.rating}/5)</span>
                </div>
            </div>
        </div>
    `;
}

/**
 * 모든 탭 콘텐츠 렌더링
 */
function renderAllTabContent() {
    // 숙소 탭
    const stayGrid = document.getElementById('stayGrid');
    if (stayGrid) {
        let stayHTML = '';
        TRENDING_DATA.stay.forEach(item => {
            stayHTML += createAccommodationCard(item);
        });
        stayGrid.innerHTML = stayHTML;
    }
    
    // 맛집 탭
    const restaurantsGrid = document.getElementById('restaurantsGrid');
    if (restaurantsGrid) {
        let restaurantsHTML = '';
        TRENDING_DATA.restaurants.forEach(item => {
            restaurantsHTML += createRestaurantCard(item);
        });
        restaurantsGrid.innerHTML = restaurantsHTML;
    }
    
    // 관광지 탭
    const attractionsGrid = document.getElementById('attractionsGrid');
    if (attractionsGrid) {
        let attractionsHTML = '';
        TRENDING_DATA.attractions.forEach(item => {
            attractionsHTML += createAttractionCard(item);
        });
        attractionsGrid.innerHTML = attractionsHTML;
    }
    
    // 카드 클릭 이벤트 추가
    addCardClickEvents();
}

/**
 * 탭 네비게이션 설정
 */
function setupTabNavigation() {
    const tabButtons = document.querySelectorAll('.tab-button');
    
    tabButtons.forEach(button => {
        button.addEventListener('click', function() {
            const selectedTab = this.getAttribute('data-tab');
            
            if (selectedTab !== currentTab) {
                // 탭 버튼 상태 변경
                tabButtons.forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');
                
                // 현재 탭 업데이트
                currentTab = selectedTab;
                
                // 슬라이더 인덱스 업데이트
                const tabOrder = ['stay', 'restaurants', 'attractions'];
                currentSlideIndex = tabOrder.indexOf(selectedTab);
                
                // 슬라이더 이동
                updateSliderPosition();
                
                console.log('탭 변경:', selectedTab);
            }
        });
    });
}

/**
 * 슬라이더 네비게이션 설정
 */
function setupSliderNavigation() {
    const prevButton = document.querySelector('.slider-nav-prev');
    const nextButton = document.querySelector('.slider-nav-next');
    
    if (prevButton) {
        prevButton.addEventListener('click', function() {
            if (currentSlideIndex > 0) {
                currentSlideIndex--;
                updateSliderPosition();
                updateActiveTab();
            }
        });
    }
    
    if (nextButton) {
        nextButton.addEventListener('click', function() {
            if (currentSlideIndex < 2) { // 3개 탭이므로 인덱스는 0-2
                currentSlideIndex++;
                updateSliderPosition();
                updateActiveTab();
            }
        });
    }
    
    // 초기 버튼 상태 업데이트
    updateNavigationButtons();
}

/**
 * 슬라이더 위치 업데이트
 */
function updateSliderPosition() {
    const sliderWrapper = document.getElementById('trendingSlider');
    if (sliderWrapper) {
        const translateX = -(currentSlideIndex * 100);
        sliderWrapper.style.transform = `translateX(${translateX}%)`;
    }
    
    updateNavigationButtons();
}

/**
 * 활성 탭 업데이트 (슬라이더 네비게이션 사용 시)
 */
function updateActiveTab() {
    const tabOrder = ['stay', 'restaurants', 'attractions'];
    const newTab = tabOrder[currentSlideIndex];
    
    if (newTab !== currentTab) {
        currentTab = newTab;
        
        // 탭 버튼 상태 업데이트
        const tabButtons = document.querySelectorAll('.tab-button');
        tabButtons.forEach(btn => {
            btn.classList.remove('active');
            if (btn.getAttribute('data-tab') === currentTab) {
                btn.classList.add('active');
            }
        });
    }
}

/**
 * 네비게이션 버튼 상태 업데이트
 */
function updateNavigationButtons() {
    const prevButton = document.querySelector('.slider-nav-prev');
    const nextButton = document.querySelector('.slider-nav-next');
    
    if (prevButton) {
        prevButton.disabled = currentSlideIndex === 0;
    }
    
    if (nextButton) {
        nextButton.disabled = currentSlideIndex === 2;
    }
}

/**
 * 카드 클릭 이벤트 추가
 */
function addCardClickEvents() {
    const trendingCards = document.querySelectorAll('.trending-card');
    
    trendingCards.forEach(card => {
        card.addEventListener('click', function() {
            const cardId = this.getAttribute('data-id');
            const cardType = this.getAttribute('data-type');
            
            console.log('카드 클릭:', cardType, cardId);
            
            // 실제 구현에서는 다음과 같은 동작을 수행:
            // 1. 상세 페이지로 이동
            // 2. 모달창으로 상세 정보 표시
            // 3. 관련 정보 표시
            
            // 예시: 간단한 알림
            let selectedItem;
            switch(cardType) {
                case 'accommodation':
                    selectedItem = TRENDING_DATA.stay.find(item => item.id == cardId);
                    break;
                case 'restaurant':
                    selectedItem = TRENDING_DATA.restaurants.find(item => item.id == cardId);
                    break;
                case 'attraction':
                    selectedItem = TRENDING_DATA.attractions.find(item => item.id == cardId);
                    break;
            }
            
            if (selectedItem) {
                alert(`선택한 ${getTypeKorean(cardType)}: ${selectedItem.title}\n급상승률: ${selectedItem.trendingRate}`);
            }
        });
    });
}

/**
 * 영문 타입을 한글로 변환
 * @param {string} type - 영문 타입
 * @returns {string} 한글 타입
 */
function getTypeKorean(type) {
    const typeMap = {
        'accommodation': '숙소',
        'restaurant': '맛집',
        'attraction': '관광지'
    };
    return typeMap[type] || type;
}

/**
 * 화면 크기 변경 감지 및 대응
 */
function handleScreenResize() {
    // 모바일에서는 슬라이더 네비게이션 숨김
    const isMobile = window.innerWidth <= 992;
    const sliderNavs = document.querySelectorAll('.slider-nav');
    
    sliderNavs.forEach(nav => {
        nav.style.display = isMobile ? 'none' : 'flex';
    });
}

// 화면 크기 변경 이벤트 리스너
window.addEventListener('resize', function() {
    clearTimeout(window.resizeTimeout);
    window.resizeTimeout = setTimeout(handleScreenResize, 250);
});

// 초기 화면 크기 체크
document.addEventListener('DOMContentLoaded', function() {
    setTimeout(handleScreenResize, 100);
});