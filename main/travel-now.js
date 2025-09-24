/**
 * 지금 떠나기 좋은 곳 섹션 JavaScript (travel-now.js)
 * 슬라이더 형태로 12개 여행지를 4개씩 보여주는 간단한 스크립트
 */

/**
 * 여행지 데이터 (12개)
 */
const travelNowData = [
    { id: 1, name: "서울", location: "수도권", image: "https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=500&h=400&fit=crop", features: ["벚꽃", "도심", "쇼핑"], accommodationCount: 5945 },
    { id: 2, name: "부산", location: "경상남도", image: "https://images.unsplash.com/photo-1586375300773-8384e3e4916f?w=500&h=400&fit=crop", features: ["해변", "온천", "맛집"], accommodationCount: 3287 },
    { id: 3, name: "제주도", location: "제주특별자치도", image: "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=500&h=400&fit=crop", features: ["자연", "힐링", "드라이브"], accommodationCount: 4156 },
    { id: 4, name: "강릉", location: "강원도", image: "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=500&h=400&fit=crop", features: ["해변", "커피", "산책"], accommodationCount: 1832 },
    { id: 5, name: "대구", location: "경상북도", image: "https://images.unsplash.com/photo-1590736969955-71cc94901144?w=500&h=400&fit=crop", features: ["문화", "야경", "전통"], accommodationCount: 2764 },
    { id: 6, name: "인천", location: "경기도", image: "https://images.unsplash.com/photo-1578895101408-1a36b834405b?w=500&h=400&fit=crop", features: ["공항", "항구", "차이나타운"], accommodationCount: 1456 },
    { id: 7, name: "전주", location: "전라북도", image: "https://images.unsplash.com/photo-1584464491033-06628f3a6b7b?w=500&h=400&fit=crop", features: ["한옥", "전통", "맛집"], accommodationCount: 892 },
    { id: 8, name: "경주", location: "경상북도", image: "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=500&h=400&fit=crop", features: ["역사", "문화", "유적"], accommodationCount: 756 },
    { id: 9, name: "여수", location: "전라남도", image: "https://images.unsplash.com/photo-1590736969955-71cc94901144?w=500&h=400&fit=crop", features: ["해상", "야경", "섬"], accommodationCount: 1234 },
    { id: 10, name: "춘천", location: "강원도", image: "https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=500&h=400&fit=crop", features: ["호수", "닭갈비", "자연"], accommodationCount: 645 },
    { id: 11, name: "통영", location: "경상남도", image: "https://images.unsplash.com/photo-1586375300773-8384e3e4916f?w=500&h=400&fit=crop", features: ["바다", "케이블카", "굴"], accommodationCount: 523 },
    { id: 12, name: "안동", location: "경상북도", image: "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=500&h=400&fit=crop", features: ["하회마을", "전통", "역사"], accommodationCount: 378 }
];

/**
 * 슬라이더 변수
 */
let currentSlide = 0;
let cardsPerSlide = 4;
let totalSlides = Math.ceil(travelNowData.length / cardsPerSlide);

/**
 * 초기화
 */
document.addEventListener('DOMContentLoaded', function() {
    initSlider();
    setupButtons();
    setupTouchEvents();
    window.addEventListener('resize', handleResize);
});

/**
 * 숙소 개수 포맷팅
 */
function formatCount(count) {
    return count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/**
 * 카드 HTML 생성
 */
function createCard(destination) {
    const features = destination.features.map(f => `<span class="feature-tag">${f}</span>`).join('');
    const count = formatCount(destination.accommodationCount);
    
    return `
        <div class="travel-now-card" data-id="${destination.id}">
            <div class="card-image-container">
                <img src="${destination.image}" alt="${destination.name}" class="card-image">
            </div>
            <div class="card-info">
                <h3 class="card-title">${destination.name}</h3>
                <p class="card-location">${destination.location}</p>
                <div class="card-features">${features}</div>
                <div class="accommodation-count">숙소 ${count}개</div>
            </div>
        </div>
    `;
}

/**
 * 슬라이더 초기화
 */
function initSlider() {
    updateCardsPerSlide();
    renderSlider();
    renderIndicators();
    updateSliderPosition();
}

/**
 * 화면 크기별 카드 개수 설정
 */
function updateCardsPerSlide() {
    const width = window.innerWidth;
    if (width <= 768) cardsPerSlide = 4;        // 모바일: 3개씩 (4슬라이드)
    else if (width <= 1024) cardsPerSlide = 3;  // 태블릿: 3개씩 (4슬라이드)  
    else if (width <= 1200) cardsPerSlide = 3;  // 대형 태블릿: 3개씩 (4슬라이드)
    else cardsPerSlide = 4;                     // 데스크톱: 4개씩 (3슬라이드)
    
    totalSlides = Math.ceil(travelNowData.length / cardsPerSlide);
    if (currentSlide >= totalSlides) currentSlide = totalSlides - 1;
    
    console.log(`화면 크기: ${width}px, 카드 개수: ${cardsPerSlide}개, 총 슬라이드: ${totalSlides}개`);
}

/**
 * 슬라이더 렌더링
 */
function renderSlider() {
    const wrapper = document.getElementById('travelNowSliderWrapper');
    if (!wrapper) return;
    
    let html = '';
    for (let i = 0; i < totalSlides; i++) {
        const start = i * cardsPerSlide;
        const end = Math.min(start + cardsPerSlide, travelNowData.length);
        const slideData = travelNowData.slice(start, end);
        
        console.log(`슬라이드 ${i + 1}: ${start + 1}번부터 ${end}번까지`, slideData.map(d => d.name));
        
        html += `<div class="travel-now-grid">${slideData.map(createCard).join('')}</div>`;
    }
    
    wrapper.innerHTML = html;
    addCardEvents();
}

/**
 * 인디케이터 렌더링
 */
function renderIndicators() {
    const container = document.getElementById('travelNowIndicators');
    if (!container) return;
    
    let html = '';
    for (let i = 0; i < totalSlides; i++) {
        html += `<div class="indicator ${i === currentSlide ? 'active' : ''}" data-slide="${i}"></div>`;
    }
    
    container.innerHTML = html;
    
    // 인디케이터 클릭 이벤트
    container.querySelectorAll('.indicator').forEach(indicator => {
        indicator.addEventListener('click', function() {
            goToSlide(parseInt(this.dataset.slide));
        });
    });
}

/**
 * 슬라이드 위치 업데이트
 */
function updateSliderPosition() {
    const wrapper = document.getElementById('travelNowSliderWrapper');
    if (!wrapper) return;
    
    const translateX = -(currentSlide * (100 / totalSlides));
    wrapper.style.transform = `translateX(${translateX}%)`;
    
    // 인디케이터 업데이트
    document.querySelectorAll('#travelNowIndicators .indicator').forEach((indicator, index) => {
        indicator.classList.toggle('active', index === currentSlide);
    });
    
    // 버튼 상태 업데이트
    const prevBtn = document.getElementById('travelNowPrevBtn');
    const nextBtn = document.getElementById('travelNowNextBtn');
    
    if (prevBtn) {
        prevBtn.style.opacity = currentSlide === 0 ? '0.5' : '1';
        prevBtn.disabled = currentSlide === 0;
    }
    
    if (nextBtn) {
        nextBtn.style.opacity = currentSlide === totalSlides - 1 ? '0.5' : '1';
        nextBtn.disabled = currentSlide === totalSlides - 1;
    }
}

/**
 * 특정 슬라이드로 이동
 */
function goToSlide(index) {
    if (index < 0 || index >= totalSlides) return;
    currentSlide = index;
    updateSliderPosition();
}

/**
 * 이전/다음 슬라이드
 */
function prevSlide() {
    if (currentSlide > 0) goToSlide(currentSlide - 1);
}

function nextSlide() {
    if (currentSlide < totalSlides - 1) goToSlide(currentSlide + 1);
}

/**
 * 버튼 이벤트 설정
 */
function setupButtons() {
    const prevBtn = document.getElementById('travelNowPrevBtn');
    const nextBtn = document.getElementById('travelNowNextBtn');
    
    if (prevBtn) prevBtn.addEventListener('click', prevSlide);
    if (nextBtn) nextBtn.addEventListener('click', nextSlide);
}

/**
 * 터치/스와이프 이벤트 설정
 */
function setupTouchEvents() {
    const sliderContainer = document.querySelector('.travel-now-section .slider-container');
    if (!sliderContainer) return;
    
    let startX = 0;
    let startY = 0;
    let currentX = 0;
    let currentY = 0;
    let isDragging = false;
    
    // 터치 시작
    sliderContainer.addEventListener('touchstart', function(e) {
        startX = e.touches[0].clientX;
        startY = e.touches[0].clientY;
        isDragging = true;
    }, { passive: true });
    
    // 터치 이동
    sliderContainer.addEventListener('touchmove', function(e) {
        if (!isDragging) return;
        
        currentX = e.touches[0].clientX;
        currentY = e.touches[0].clientY;
        
        // 가로 스크롤이 세로 스크롤보다 클 때만 기본 동작 방지
        const diffX = Math.abs(currentX - startX);
        const diffY = Math.abs(currentY - startY);
        
        if (diffX > diffY && diffX > 10) {
            e.preventDefault(); // 세로 스크롤 방지
        }
    }, { passive: false });
    
    // 터치 종료
    sliderContainer.addEventListener('touchend', function() {
        if (!isDragging) return;
        isDragging = false;
        
        const diffX = startX - currentX;
        const diffY = Math.abs(startY - currentY);
        const threshold = 50; // 스와이프 최소 거리
        
        // 가로 스와이프가 세로 스와이프보다 큰 경우에만 슬라이드 이동
        if (Math.abs(diffX) > threshold && Math.abs(diffX) > diffY) {
            if (diffX > 0) {
                nextSlide(); // 왼쪽으로 스와이프 = 다음 슬라이드
            } else {
                prevSlide(); // 오른쪽으로 스와이프 = 이전 슬라이드
            }
        }
    }, { passive: true });
}

/**
 * 카드 클릭 이벤트
 */
function addCardEvents() {
    document.querySelectorAll('.travel-now-card').forEach(card => {
        card.addEventListener('click', function() {
            const id = this.dataset.id;
            const destination = travelNowData.find(d => d.id.toString() === id);
            
            if (destination) {
                console.log('선택된 여행지:', destination);
                
                // 검색창에 지역명 입력
                const input = document.querySelector('.main-calendar-location-input');
                if (input) {
                    input.value = destination.name;
                    input.focus();
                }
            }
        });
    });
}

/**
 * 화면 크기 변경 처리
 */
function handleResize() {
    const prevCards = cardsPerSlide;
    updateCardsPerSlide();
    
    if (prevCards !== cardsPerSlide) {
        renderSlider();
        renderIndicators();
        updateSliderPosition();
    }
}

/**
 * 공개 함수들
 */
window.TravelNowSection = {
    init: initSlider,
    next: nextSlide,
    prev: prevSlide,
    goTo: goToSlide
};