/**
 * 가격착한 숙소 섹션 JavaScript (budget-friendly.js)
 * main.html의 가격착한 숙소 섹션을 관리하는 스크립트
 */

/**
 * 가격착한 숙소 데이터 (샘플 데이터)
 */
const budgetFriendlyData = [
    {
        id: 1,
        name: "펜션 힐링스테이",
        location: "강원도 춘천시 • 춘천역 차량 15분",
        image: "https://images.unsplash.com/photo-1586375300773-8384e3e4916f?w=400&h=300&fit=crop",
        rating: 4.2,
        price: 35000,
        originalPrice: 45000,
        discount: 22,
        badge: "가성비"
    },
    {
        id: 2,
        name: "모텔 블루스카이",
        location: "부산 해운대구 • 해운대해수욕장 도보 5분",
        image: "https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&h=300&fit=crop",
        rating: 4.0,
        price: 42000,
        originalPrice: 55000,
        discount: 24,
        badge: "특가"
    },
    {
        id: 3,
        name: "게스트하우스 서울역",
        location: "서울 중구 • 서울역 도보 3분",
        image: "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=400&h=300&fit=crop",
        rating: 3.8,
        price: 28000,
        originalPrice: 38000,
        discount: 26,
        badge: "최저가"
    }
];

/**
 * 페이지 로드 시 초기화
 */
document.addEventListener('DOMContentLoaded', function() {
    initializeBudgetFriendlySection();
    
    // 화면 크기 변경 감지
    window.addEventListener('resize', handleBudgetScreenResize);
});

/**
 * 가격착한 숙소 섹션 초기화 함수
 */
function initializeBudgetFriendlySection() {
    renderBudgetFriendlyGrid();
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
 * 개별 가격착한 숙소 카드 HTML 생성
 * @param {Object} accommodation - 숙소 정보 객체
 * @returns {string} 숙소 카드 HTML
 */
function createBudgetCard(accommodation) {
    const formattedPrice = formatPrice(accommodation.price);
    const formattedOriginalPrice = formatPrice(accommodation.originalPrice);
    const starsHTML = generateStarRating(accommodation.rating);
    
    return `
        <div class="budget-card" data-id="${accommodation.id}">
            <div class="card-image-container">
                <img src="${accommodation.image}" alt="${accommodation.name}" class="card-image">
                <div class="budget-badge">${accommodation.badge}</div>
                <div class="price-badge">₩${formattedPrice}</div>
            </div>
            <div class="card-info">
                <h3 class="card-title">${accommodation.name}</h3>
                <p class="card-location">${accommodation.location}</p>
                <div class="card-rating">
                    <div class="stars">
                        ${starsHTML}
                    </div>
                    <span class="rating-score">${accommodation.rating}</span>
                </div>
                <div class="card-price">
                    <div class="price-info">
                        <span class="price-main">₩${formattedPrice}</span>
                        <span class="price-unit">/박</span>
                    </div>
                    <div class="discount-info">
                        <span class="original-price">₩${formattedOriginalPrice}</span>
                        <span class="discount-rate">${accommodation.discount}% 할인</span>
                    </div>
                </div>
            </div>
        </div>
    `;
}

/**
 * 가격착한 숙소 그리드 렌더링
 */
function renderBudgetFriendlyGrid() {
    const budgetGrid = document.getElementById('budgetGrid');
    if (!budgetGrid) {
        console.warn('budgetGrid 요소를 찾을 수 없습니다.');
        return;
    }

    // 카드들을 생성하여 그리드에 추가
    const cardsHTML = budgetFriendlyData.map(accommodation => 
        createBudgetCard(accommodation)
    ).join('');
    
    budgetGrid.innerHTML = cardsHTML;
    
    // 카드 클릭 이벤트 추가
    addBudgetCardClickEvents();
    
    console.log('가격착한 숙소 그리드가 성공적으로 렌더링되었습니다.');
}

/**
 * 가격착한 숙소 카드 클릭 이벤트 추가
 */
function addBudgetCardClickEvents() {
    const budgetCards = document.querySelectorAll('.budget-card');
    
    budgetCards.forEach(card => {
        card.addEventListener('click', function() {
            const accommodationId = this.getAttribute('data-id');
            handleBudgetCardClick(accommodationId);
        });
        
        // 호버 효과 개선
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-4px)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
        });
    });
}

/**
 * 가격착한 숙소 카드 클릭 처리
 * @param {string} accommodationId - 선택된 숙소 ID
 */
function handleBudgetCardClick(accommodationId) {
    console.log(`가격착한 숙소 카드 클릭: ${accommodationId}`);
    
    // 실제 구현에서는 여기서 상세 페이지로 이동하거나 모달을 표시
    const selectedAccommodation = budgetFriendlyData.find(item => 
        item.id.toString() === accommodationId
    );
    
    if (selectedAccommodation) {
        // 임시: 콘솔에 선택된 숙소 정보 출력
        console.log('선택된 가격착한 숙소:', selectedAccommodation);
        
        // 예시: 상세 페이지로 이동
        // window.location.href = `/accommodation/${accommodationId}`;
        
        // 예시: 모달 표시
        // showAccommodationModal(selectedAccommodation);
    }
}

/**
 * 화면 크기 변경 처리
 */
function handleBudgetScreenResize() {
    // 반응형 처리가 필요한 경우 여기에 로직 추가
    console.log('가격착한 숙소 섹션 화면 크기 변경 감지');
}

/**
 * 가격착한 숙소 데이터 새로고침 (API 호출 시뮬레이션)
 * @param {Array} newData - 새로운 숙소 데이터
 */
function refreshBudgetFriendlyData(newData) {
    if (Array.isArray(newData) && newData.length > 0) {
        // 데이터 업데이트
        budgetFriendlyData.length = 0;
        budgetFriendlyData.push(...newData);
        
        // 그리드 다시 렌더링
        renderBudgetFriendlyGrid();
        
        console.log('가격착한 숙소 데이터가 새로고침되었습니다.');
    } else {
        console.warn('올바르지 않은 가격착한 숙소 데이터입니다.');
    }
}

/**
 * 로딩 상태 표시
 */
function showBudgetLoadingState() {
    const budgetGrid = document.getElementById('budgetGrid');
    if (budgetGrid) {
        budgetGrid.innerHTML = `
            <div class="loading-container" style="grid-column: 1 / -1; text-align: center; padding: 60px 0;">
                <div class="spinner-border text-primary" role="status">
                    <span class="visually-hidden">로딩 중...</span>
                </div>
                <p class="mt-3 text-muted">가격착한 숙소를 불러오는 중...</p>
            </div>
        `;
    }
}

/**
 * 에러 상태 표시
 * @param {string} errorMessage - 에러 메시지
 */
function showBudgetErrorState(errorMessage = '가격착한 숙소를 불러오는데 실패했습니다.') {
    const budgetGrid = document.getElementById('budgetGrid');
    if (budgetGrid) {
        budgetGrid.innerHTML = `
            <div class="error-container" style="grid-column: 1 / -1; text-align: center; padding: 60px 0;">
                <i class="fas fa-exclamation-triangle text-warning" style="font-size: 48px; margin-bottom: 16px;"></i>
                <p class="text-muted">${errorMessage}</p>
                <button class="btn btn-primary mt-3" onclick="initializeBudgetFriendlySection()">
                    다시 시도
                </button>
            </div>
        `;
    }
}

/**
 * 외부에서 호출 가능한 공개 함수들
 */
window.BudgetFriendlySection = {
    refresh: refreshBudgetFriendlyData,
    showLoading: showBudgetLoadingState,
    showError: showBudgetErrorState,
    initialize: initializeBudgetFriendlySection
};