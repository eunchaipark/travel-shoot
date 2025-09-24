/**
 * 숙소 추천 섹션 JavaScript (recommend-stay.js)
 * 모바일에서는 3개만 표시하고 스크롤로 나머지 확인 가능
 */

// 숙소 데이터 (예시) - 별점을 5점 만점으로 변경
const ACCOMMODATION_DATA = [
    {
        id: 1,
        title: "서울역 스카이가든 호텔",
        image: "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=300&h=300&fit=crop",
        rating: 4.5, // 5점 만점으로 변경
        location: "중구 • 서울역 도보 2분",
        price: 145000,
        checkinTime: "15:00",
        badge: "추천",
        latitude: 37.5547,
        longitude: 126.9706
    },
    {
        id: 2,
        title: "명동 프리미엄 부티크",
        image: "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=300&h=300&fit=crop",
        rating: 4.6, // 5점 만점으로 변경
        location: "중구 • 명동역 도보 1분",
        price: 195000,
        checkinTime: "16:00",
        badge: "베스트",
        latitude: 37.5637,
        longitude: 126.9834
    },
    {
        id: 3,
        title: "홍대 모던 스테이",
        image: "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=300&h=300&fit=crop",
        rating: 4.4, // 5점 만점으로 변경
        location: "마포구 • 홍익대입구역 도보 3분",
        price: 125000,
        checkinTime: "14:00",
        badge: "",
        latitude: 37.5563,
        longitude: 126.9216
    },
    {
        id: 4,
        title: "강남 럭셔리 레지던스",
        image: "https://images.unsplash.com/photo-1590490360182-c33d57733427?w=300&h=300&fit=crop",
        rating: 4.8, // 5점 만점으로 변경
        location: "강남구 • 강남역 도보 5분",
        price: 285000,
        checkinTime: "15:00",
        badge: "럭셔리",
        latitude: 37.4979,
        longitude: 127.0276
    },
    {
        id: 5,
        title: "이태원 글로벌 하우스",
        image: "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=300&h=300&fit=crop",
        rating: 4.2, // 5점 만점으로 변경
        location: "용산구 • 이태원역 도보 2분",
        price: 165000,
        checkinTime: "16:00",
        badge: "",
        latitude: 37.5345,
        longitude: 126.9945
    },
    {
        id: 6,
        title: "건대 유스 호스텔",
        image: "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=300&h=300&fit=crop",
        rating: 4.1, // 5점 만점으로 변경
        location: "광진구 • 건대입구역 도보 1분",
        price: 89000,
        checkinTime: "14:00",
        badge: "가성비",
        latitude: 37.5403,
        longitude: 127.0695
    }
];

/**
 * 페이지 로드 시 초기화
 */
document.addEventListener('DOMContentLoaded', function() {
    // main-calendar.js의 isLoggedIn 변수 확인
    if (typeof isLoggedIn !== 'undefined' && isLoggedIn) {
        initializeRecommendStaySection();
    } else {
        hideRecommendStaySection();
    }
    
    // 화면 크기 변경 감지
    window.addEventListener('resize', handleScreenResize);
});

/**
 * 숙소 추천 섹션 숨기기 (비로그인 상태)
 */
function hideRecommendStaySection() {
    const recommendSection = document.querySelector('.recommend-stay-section');
    if (recommendSection) {
        recommendSection.style.display = 'none';
    }
}

/**
 * 숙소 추천 섹션 초기화 함수
 */
function initializeRecommendStaySection() {
    renderAccommodationList();
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
 * 개별 숙소 아이템 HTML 생성
 * @param {Object} accommodation - 숙소 정보 객체
 * @returns {string} 숙소 아이템 HTML
 */
function createAccommodationItem(accommodation) {
    const formattedPrice = formatPrice(accommodation.price);
    const starsHTML = generateStarRating(accommodation.rating);
    const badgeHTML = accommodation.badge ? 
        '<span class="accommodation-badge">' + accommodation.badge + '</span>' : '';
    
    return '<div class="accommodation-item" data-id="' + accommodation.id + '" data-lat="' + accommodation.latitude + '" data-lng="' + accommodation.longitude + '">' +
               '<div class="accommodation-image-container">' +
                   badgeHTML + // 모바일에서는 이미지 위에 배치
                   '<img src="' + accommodation.image + '" ' +
                        'alt="' + accommodation.title + '" ' +
                        'class="accommodation-image" ' +
                        'onerror="this.src=\'https://via.placeholder.com/300x300/f0f0f0/666?text=No+Image\'">' +
               '</div>' +
               '<div class="accommodation-info">' +
                   '<div class="accommodation-header">' +
                       '<h3 class="accommodation-title">' + accommodation.title + '</h3>' +
                       '<div class="accommodation-rating">' +
                           '<div class="star-rating">' +
                               starsHTML +
                           '</div>' +
                           '<span class="rating-text">(' + accommodation.rating + '/5)</span>' +
                       '</div>' +
                       '<div class="accommodation-location">' +
                           '<i class="fas fa-map-marker-alt location-icon"></i>' +
                           '<span class="location-text">' + accommodation.location + '</span>' +
                       '</div>' +
                   '</div>' +
                   '<div class="accommodation-price">' +
                       '<span class="checkin-time">체크인 ' + accommodation.checkinTime + '</span>' +
                       '<div class="price-info">' +
                           '<span class="price-text">₩ ' + formattedPrice + '</span>' +
                           '<span class="price-unit"> (1박당 요금)</span>' +
                       '</div>' +
                   '</div>' +
               '</div>' +
           '</div>';
}

/**
 * 모바일 화면 체크 함수
 * @returns {boolean} 모바일 화면 여부
 */
function isMobileScreen() {
    return window.innerWidth <= 768;
}

/**
 * 숙소 리스트 렌더링 함수
 */
function renderAccommodationList() {
    const listContainer = document.getElementById('accommodationList');
    
    if (!listContainer) {
        console.error('숙소 리스트 컨테이너를 찾을 수 없습니다.');
        return;
    }
    
    let listHTML = '';
    // 모든 데이터를 렌더링 (스크롤로 볼 수 있음)
    const displayData = ACCOMMODATION_DATA;
    
    displayData.forEach(function(accommodation) {
        listHTML += createAccommodationItem(accommodation);
    });
    
    listContainer.innerHTML = listHTML;
    
    // 숙소 아이템 클릭 이벤트 추가
    addAccommodationClickEvents();
}

/**
 * 숙소 아이템 클릭 이벤트 추가
 */
function addAccommodationClickEvents() {
    const accommodationItems = document.querySelectorAll('.accommodation-item');
    
    accommodationItems.forEach(function(item) {
        item.addEventListener('click', function() {
            const accommodationId = this.getAttribute('data-id');
            const lat = this.getAttribute('data-lat');
            const lng = this.getAttribute('data-lng');
            
            // 숙소 상세 페이지로 이동하거나 지도에서 해당 위치 표시
            console.log('숙소 클릭:', accommodationId, lat, lng);
            
            // 실제 구현에서는 다음과 같은 동작을 수행:
            // 1. 숙소 상세 페이지로 이동
            // 2. 지도에서 해당 위치 하이라이트
            // 3. 모달창으로 상세 정보 표시
            
            // 예시: 간단한 알림
            const accommodationData = ACCOMMODATION_DATA.find(acc => acc.id == accommodationId);
            if (accommodationData) {
                alert('선택한 숙소: ' + accommodationData.title);
            }
        });
    });
}

/**
 * 화면 크기 변경 감지 및 대응
 */
function handleScreenResize() {
    // 필요시 화면 크기 변경에 따른 처리 로직 추가
}

// 화면 크기 변경 이벤트 리스너
window.addEventListener('resize', function() {
    clearTimeout(window.resizeTimeout);
    window.resizeTimeout = setTimeout(handleScreenResize, 250);
});