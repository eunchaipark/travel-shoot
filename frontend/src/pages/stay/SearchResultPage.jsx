import React, { useEffect, useRef, useCallback, useState } from 'react'
import { useSearchParams, useNavigate } from 'react-router-dom'
import { useInfiniteQuery } from '@tanstack/react-query'
import Header from '@/components/layout/Header';
import PaymentLoading from "@/components/loading/PaymentLoading";
import MapModal from '@/components/modals/MapModal';

import '@/assets/css/stay-search.css'
import '@/assets/css/payment-loading.css'
import '@/assets/css/header-calendar.css'
import '@/assets/css/common.css'

// StayCard 컴포넌트
function StayCard({ stay, searchParams  }) {
    const navigate = useNavigate();
    const likeButtonRef = useRef(null);
    const [isLiked, setIsLiked] = useState(false);

    // 검색 조건 url에 가지고 있도록
    const handleCardClick = () => { //TODO : 윤하님 숙소 상세 페이지로 이동할 URL
        const params = new URLSearchParams({
            checkIn: searchParams.checkIn,
            checkOut: searchParams.checkOut,
            adults: searchParams.adults,
            children: searchParams.children
        });
        navigate(`/stays/${stay.stayId}?${params.toString()}`);
    }
    //
    // const handleCardClick = () => {
    //     navigate(`/stays/${stay.stayId}`) //TODO : 윤하님 숙소 상세 페이지로 이동할 주소 임시로 넣었음
    // }

    useEffect(() => {
        const likeBtn = likeButtonRef.current
        if (!likeBtn || typeof mojs === 'undefined' || typeof gsap === 'undefined') return

        const burst = new mojs.Burst({
            parent: likeBtn,
            radius: { 20: 60 },
            count: 15,
            angle: { 0: 30 },
            children: {
                delay: 250,
                duration: 700,
                radius: { 10: 0 },
                fill: ['#ff6b6b'],
                easing: mojs.easing.bezier(.08, .69, .39, .97)
            }
        })

        const handleClick = (e) => {
            e.stopPropagation()
            const heartIcon = likeBtn.querySelector('.heart-icon')

            if (!isLiked) {
                likeBtn.classList.add('btn-favorite-active')
                setIsLiked(true)
                gsap.set(likeBtn, { scale: 0 })
                gsap.set(heartIcon, { scale: 0 })
                gsap.to(likeBtn, { duration: 0.6, scale: 1, ease: "expo.out" })
                gsap.to(heartIcon, { duration: 0.3, scale: 1, ease: "elastic.out(1, 0.3)" })
                burst.replay()
            } else {
                likeBtn.classList.remove('btn-favorite-active')
                setIsLiked(false)
                gsap.to(likeBtn, { duration: 0.14, ease: "power4.out" })
            }
        }

        likeBtn.addEventListener('click', handleClick)
        return () => likeBtn.removeEventListener('click', handleClick)
    }, [isLiked])

    const renderStars = (rating) => {
        const score = rating || 0
        const stars = []
        for (let i = 1; i <= 5; i++) {
            stars.push(<span key={i} className={i <= Math.floor(score) ? 'active' : 'inactive'}>★</span>)
        }
        return stars
    }

    return (
        <div className="hotel-card" onClick={handleCardClick} style={{ cursor: 'pointer' }}>
            <div className="hotel-stay_image">
                <img src={stay.thumbnailImage || '/images/stay/hotel-imgae.jpg'} alt={stay.name} />
                <button ref={likeButtonRef} className="btn-favorite">
                    <svg className="heart-icon" viewBox="0 0 24 24" fill="none">
                        <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                    </svg>
                </button>
            </div>
            <div className="stay_content">
                <div className="stay_info">
                    <div className="stay_name">{stay.name}</div>
                    <div className="stay-location-wrapper">
                        <div className="stay-score-wrapper">
                            <span className="score-star">{renderStars(stay.rating)}</span>
                            <span className="stay-score">({stay.rating ? stay.rating.toFixed(1) : '0.0'} / 5)</span>
                        </div>
                        <div className="stay_location">
                            <img className="location_icon" src="/images/common/gray-location-icon.svg" alt="위치" />
                            {stay.region}
                        </div>
                    </div>
                    <div className="card_options">이용가능한 서비스 / 옵션</div>
                    <div className="card_tags">
                        {stay.amenities?.slice(0, 3).map((amenity, idx) => (
                            <span key={idx} className="tag">{amenity}</span>
                        ))}
                    </div>
                </div>
                <div className="card_bottom">
                    <div className="check-in-time">체크인 {stay.checkInTime || '16:00'} ~</div>
                    <div className="stay_price">
                        <div className="price-amount">₩ {stay.lowestPrice ? stay.lowestPrice.toLocaleString() : '0'}</div>
                        <div className="price-period">(1박당 요금)</div>
                    </div>
                </div>
            </div>
        </div>
    )
}

// 메인 SearchResultPage
export default function SearchResultPage() {
    const [searchParams] = useSearchParams()

    const observerTarget = useRef(null)

    const [isReady, setIsReady] = useState(false);

    const [isMobileFilterOpen, setIsMobileFilterOpen] = useState(false);

    const [showMapModal, setShowMapModal] = useState(false);

    const openMobileFilter = () => setIsMobileFilterOpen(true);
    const closeMobileFilter = () => setIsMobileFilterOpen(false);

    // maptest랑 동일하게 맞추고
    const convertToLocationData = (stays) => {
        return stays.map(stay => ({
            id: stay.stayId,
            latitude: stay.latitude,
            longitude: stay.longitude,
            name: stay.name,
            lowestPrice: stay.lowestPrice,
            stayType: stay.stayType,
            placeType: stay.placeType?.toLowerCase() || "stay",
            image: stay.thumbnailImage || ""
        }));
    };

    // mo.js, gsap 로드
    useEffect(() => {
        // eslint-disable-next-line no-undef
        if (typeof mojs === 'undefined') {
            const mojsScript = document.createElement('script')
            mojsScript.src = 'https://cdnjs.cloudflare.com/ajax/libs/mo-js/0.288.2/mo.min.js'
            mojsScript.async = true
            document.head.appendChild(mojsScript)
        }
        // eslint-disable-next-line no-undef
        if (typeof gsap === 'undefined') {
            const gsapScript = document.createElement('script')
            gsapScript.src = 'https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js'
            gsapScript.async = true
            document.head.appendChild(gsapScript)
        }
    }, [])

    useEffect(() => {
        const timer = setTimeout(() => setIsReady(true), 0); //검색이 여러번 진행되서 디버깅중..1021
        return () => clearTimeout(timer);
    }, []);

    // URL에서 기본 검색 조건 가져오기
    const baseSearchParams = {
        region: searchParams.get('region') || null,
        stayName: searchParams.get('stayName') || null,
        checkIn: searchParams.get('checkIn') || (() => {
            const tomorrow = new Date()
            tomorrow.setDate(tomorrow.getDate() + 1)
            return tomorrow.toISOString().split('T')[0]
        })(),
        checkOut: searchParams.get('checkOut') || (() => {
            const dayAfter = new Date()
            dayAfter.setDate(dayAfter.getDate() + 3)
            return dayAfter.toISOString().split('T')[0]
        })(),
        adults: searchParams.get('adults') ? Number(searchParams.get('adults')) : 2,
        children: searchParams.get('children') ? Number(searchParams.get('children')) : 0,
    }

    // 필터 상태 관리
    const [filters, setFilters] = useState({
        minPrice: '',
        maxPrice: '',
        stayTypes: [],
        bedroomCount: null,
        bathroomCount: null,
        minGuests: '',
        maxGuests: '',
        ratings: [],
        amenities: []
    })

    // 필터가 활성화되었는지 체크
    const hasActiveFilters = () => {
        return filters.minPrice || filters.maxPrice ||
            filters.stayTypes.length > 0 ||
            filters.bedroomCount !== null ||
            filters.bathroomCount !== null ||
            filters.minGuests || filters.maxGuests ||
            filters.ratings.length > 0 ||
            filters.amenities.length > 0
    }

    // 무한스크롤 쿼리 ( 리액트 쿼리 )
    const {
        data,
        fetchNextPage,
        hasNextPage,
        isFetchingNextPage,
        isLoading,
        isError,
        error,
        refetch
    } = useInfiniteQuery({
        queryKey: ['stays', baseSearchParams, filters],
        queryFn: async ({ pageParam = 0 }) => {
            // 필터가 있으면 POST 요청
            if (hasActiveFilters()) {
                console.log('POST 필터 검색 실행', {
                    page: pageParam,
                    body: {
                        ...baseSearchParams,
                        ...(filters.minPrice && { minPrice: Number(filters.minPrice) }),
                        ...(filters.maxPrice && { maxPrice: Number(filters.maxPrice) }),
                        ...(filters.stayTypes.length > 0 && { stayTypes: filters.stayTypes }),
                        ...(filters.bedroomCount && { bedroomCount: filters.bedroomCount }),
                        ...(filters.bathroomCount && { bathroomCount: filters.bathroomCount }),
                        ...(filters.minGuests && { minGuests: Number(filters.minGuests) }),
                        ...(filters.maxGuests && { maxGuests: Number(filters.maxGuests) }),
                        ...(filters.ratings.length > 0 && { ratings: filters.ratings }),
                        ...(filters.amenities.length > 0 && { amenities: filters.amenities })
                    }
                })

                const response = await fetch(
                    `http://localhost:8080/api/stays/filter?page=${pageParam}&size=10`,
                    {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify({
                            ...baseSearchParams,
                            ...(filters.minPrice && { minPrice: Number(filters.minPrice) }),
                            ...(filters.maxPrice && { maxPrice: Number(filters.maxPrice) }),
                            ...(filters.stayTypes.length > 0 && { stayTypes: filters.stayTypes }),
                            ...(filters.bedroomCount && { bedroomCount: filters.bedroomCount }),
                            ...(filters.bathroomCount && { bathroomCount: filters.bathroomCount }),
                            ...(filters.minGuests && { minGuests: Number(filters.minGuests) }),
                            ...(filters.maxGuests && { maxGuests: Number(filters.maxGuests) }),
                            ...(filters.ratings.length > 0 && { ratings: filters.ratings }),
                            ...(filters.amenities.length > 0 && { amenities: filters.amenities })
                        })
                    }
                )

                if (!response.ok) {
                    throw new Error('필터 검색 실패')
                }

                return await response.json()
            }

            //  필터가 없으면 GET 요청
            console.log('GET 기본 검색 실행', {
                params: { ...baseSearchParams, page: pageParam, size: 10 }
            })

            // 숙소가 있으면 지역 제거, 지역 있으면 숙소 제거
            const queryParams = { ...baseSearchParams }
            if (queryParams.stayName) {
                delete queryParams.region
            } else {
                delete queryParams.stayName
            }

            const params = new URLSearchParams({
                ...queryParams,
                page: pageParam,
                size: 10
            })

            const response = await fetch(
                `http://localhost:8080/api/stays/search?${params.toString()}`
            )

            if (!response.ok) {
                throw new Error('검색 실패')
            }

            return await response.json()
        },
        getNextPageParam: (lastPage) => {
            return lastPage.hasNext ? lastPage.currentPage + 1 : undefined
        },
        staleTime: 1000 * 60 * 5,
        enabled: isReady,
    })

    // 필터 변경 핸들러들
    const handlePriceChange = (type, value) => {
        setFilters(prev => ({ ...prev, [type]: value }))
    }

    const handleStayTypeToggle = (type) => {
        setFilters(prev => ({
            ...prev,
            stayTypes: prev.stayTypes.includes(type)
                ? prev.stayTypes.filter(t => t !== type)
                : [...prev.stayTypes, type]
        }))
    }

    const handleBedroomSelect = (count) => {
        setFilters(prev => ({
            ...prev,
            bedroomCount: prev.bedroomCount === count ? null : count
        }))
    }

    const handleBathroomSelect = (count) => {
        setFilters(prev => ({
            ...prev,
            bathroomCount: prev.bathroomCount === count ? null : count
        }))
    }

    const handleGuestChange = (type, value) => {
        setFilters(prev => ({ ...prev, [type]: value }))
    }

    const handleRatingToggle = (rating) => {
        setFilters(prev => ({
            ...prev,
            ratings: prev.ratings.includes(rating)
                ? prev.ratings.filter(r => r !== rating)
                : [...prev.ratings, rating]
        }))
    }

    const handleAmenityToggle = (amenity) => {
        setFilters(prev => ({
            ...prev,
            amenities: prev.amenities.includes(amenity)
                ? prev.amenities.filter(a => a !== amenity)
                : [...prev.amenities, amenity]
        }))
    }

    // Intersection Observer
    const handleObserver = useCallback(
        (entries) => {
            const [target] = entries
            if (target.isIntersecting && hasNextPage && !isFetchingNextPage) {
                fetchNextPage()
            }
        },
        [fetchNextPage, hasNextPage, isFetchingNextPage]
    )

    useEffect(() => {
        const element = observerTarget.current
        if (!element) return
        const observer = new IntersectionObserver(handleObserver, { threshold: 0.5 })
        observer.observe(element)
        return () => observer.disconnect()
    }, [handleObserver])

    const allStays = data?.pages.flatMap((page) => page.stays) || []
    // totalCount는 나중에 사용할 예정 (페이지네이션 정보 표시 등)
    // eslint-disable-next-line no-unused-vars
    const totalCount = data?.pages[0]?.totalCount || 0

    if (isError) {
        return (
            <div style={{ padding: '50px', textAlign: 'center', color: 'red' }}>
                <h3>검색 실패</h3>
                <p>{error.message}</p>
            </div>
        )
    }

    return (
        <>
            <Header />
        <div className="container staylist-page">
            <div className="staylist-layout">
                {/* ========== 왼쪽 필터 사이드바 ========== */}
                <div className="filter-sidebar">
                    {/* 지도 */}
                    <div className="filter-section">
                        <div className="map-finder" onClick={() => setShowMapModal(true)} style={{ cursor: 'pointer' }}>
                            <img className="map-finder_image" src="/images/stay/stays-map-modal.svg" alt="지도" />
                            <div className="map-finder_overlay">
                                <img className="map-icon" src="/images/stay/stayslist-map-icon.svg" alt="지도" />
                                <span className="map-finder_text">지도에서 숙소보기</span>
                            </div>
                        </div>
                    </div>

                    {/* 1박당 요금 */}
                    <div className="filter-section">
                        <div className="filter-section_title">1박당 요금</div>
                        <div className="form-price-range">
                            <span className="won-icon">₩</span>
                            <input
                                type="number"
                                className="form-input form-input-price"
                                placeholder="최소금액"
                                min="0"
                                value={filters.minPrice}
                                onChange={(e) => handlePriceChange('minPrice', e.target.value)}
                            />
                            <span className="form-guest-range_separator">
                                <img src="/images/stay/stayslist-line.svg" alt="-" />
                            </span>
                            <span className="won-icon">₩</span>
                            <input
                                type="number"
                                className="form-input form-input-price"
                                placeholder="최대금액"
                                min="0"
                                value={filters.maxPrice}
                                onChange={(e) => handlePriceChange('maxPrice', e.target.value)}
                            />
                        </div>
                    </div>

                    {/* 숙소 유형 */}
                    <div className="filter-section">
                        <div className="filter-section_title">숙소 유형</div>
                        <div className="filter-checkbox-group">
                            {['호텔', '모텔', '펜션'].map((type) => (
                                <label key={type} className="form-checkbox">
                                    <input
                                        type="checkbox"
                                        className="form-checkbox_input"
                                        checked={filters.stayTypes.includes(type)}
                                        onChange={() => handleStayTypeToggle(type)}
                                    />
                                    <span className="form-checkbox__text">
                                        <img className="stays_image" src={`/images/common/${type === '호텔' ? 'hotel' : type === '모텔' ? 'motel' : 'pension'}-icon.svg`} alt={type} />
                                        {type}
                                    </span>
                                </label>
                            ))}
                        </div>
                    </div>

                    {/* 숙소 특성 */}
                    <div className="filter-section">
                        <div className="filter-section_title">숙소 특성</div>

                        {/* 침실 수 */}
                        <div className="filter-subsection">
                            <div className="filter-subsection_title">침실 수</div>
                            <div className="filter-bed-btn">
                                <button
                                    className="filter-cnt-btn"
                                    onClick={() => handleBedroomSelect(1)}
                                    style={filters.bedroomCount === 1 ? {
                                        borderColor: '#ff6b6b',
                                        backgroundColor: '#FFF4EC',
                                        fontWeight: 600
                                    } : {}}
                                >
                                    1개
                                </button>
                                <button
                                    className="filter-cnt-btn"
                                    onClick={() => handleBedroomSelect(2)}
                                    style={filters.bedroomCount === 2 ? {
                                        borderColor: '#ff6b6b',
                                        backgroundColor: '#FFF4EC',
                                        fontWeight: 600
                                    } : {}}
                                >
                                    2개
                                </button>
                                <button
                                    className="filter-cnt-btn"
                                    onClick={() => handleBedroomSelect(3)}
                                    style={filters.bedroomCount === 3 ? {
                                        borderColor: '#ff6b6b',
                                        backgroundColor: '#FFF4EC',
                                        fontWeight: 600
                                    } : {}}
                                >
                                    3개 이상
                                </button>
                            </div>
                        </div>

                        {/* 욕실 수 */}
                        <div className="filter-subsection">
                            <div className="filter-subsection_title">욕실 수</div>
                            <div className="filter-bath-btn">
                                <button
                                    className="filter-cnt-btn"
                                    onClick={() => handleBathroomSelect(1)}
                                    style={filters.bathroomCount === 1 ? {
                                        borderColor: '#ff6b6b',
                                        backgroundColor: '#FFF4EC',
                                        fontWeight: 600
                                    } : {}}
                                >
                                    1개
                                </button>
                                <button
                                    className="filter-cnt-btn"
                                    onClick={() => handleBathroomSelect(2)}
                                    style={filters.bathroomCount === 2 ? {
                                        borderColor: '#ff6b6b',
                                        backgroundColor: '#FFF4EC',
                                        fontWeight: 600
                                    } : {}}
                                >
                                    2개 이상
                                </button>
                            </div>
                        </div>

                        {/* 수용 인원 */}
                        <div className="filter-subsection">
                            <div className="filter-subsection_title">수용 인원</div>
                            <div className="form-guest-range">
                                <img className="filter-person-icon" src="/images/stay/filter-person-icon.svg" alt="인원" />
                                <input
                                    type="number"
                                    className="form-input form-input-guest"
                                    placeholder="최소인원"
                                    min="1"
                                    max="20"
                                    value={filters.minGuests}
                                    onChange={(e) => handleGuestChange('minGuests', e.target.value)}
                                />
                                <span className="form-guest-range_separator">
                                    <img src="/images/stay/stayslist-line.svg" alt="-" />
                                </span>
                                <img className="filter-person-icon" src="/images/stay/filter-person-icon.svg" alt="인원" />
                                <input
                                    type="number"
                                    className="form-input form-input-guest"
                                    placeholder="최대인원"
                                    min="1"
                                    max="30"
                                    value={filters.maxGuests}
                                    onChange={(e) => handleGuestChange('maxGuests', e.target.value)}
                                />
                            </div>
                        </div>
                    </div>

                    {/* 숙소 평점 */}
                    <div className="filter-section">
                        <div className="filter-section_title">숙소 평점</div>
                        <div className="filter-stars-group">
                            {[5, 4, 3, 2, 1].map((rating) => (
                                <label key={rating} className="form-stars">
                                    <input
                                        type="checkbox"
                                        className="form-stars_input"
                                        checked={filters.ratings.includes(rating)}
                                        onChange={() => handleRatingToggle(rating)}
                                    />
                                    <div className="star-display">
                                        {[...Array(rating)].map((_, idx) => (
                                            <img key={idx} src="/images/stay/stayfilter-star.svg" alt="★" />
                                        ))}
                                    </div>
                                </label>
                            ))}
                        </div>
                    </div>

                    {/* 이용가능한 서비스/옵션 */}
                    <div className="filter-section">
                        <div className="filter-section_title">이용가능한 서비스 / 옵션</div>
                        <div className="filter-checkbox-group">
                            {['조식 포함', '무료 취소일', '수영장', 'OTT 이용가능', '주차장', '금연',
                                '피트니스 센터', '반려동물 동반 가능', '장애인용 편의시설', '공항 이동 교통편 서비스'].map((option) => (
                                <label key={option} className="form-checkbox">
                                    <input
                                        type="checkbox"
                                        className="form-checkbox_input"
                                        checked={filters.amenities.includes(option)}
                                        onChange={() => handleAmenityToggle(option)}
                                    />
                                    <span className="form-checkbox__text">{option}</span>
                                </label>
                            ))}
                        </div>
                    </div>
                </div>

                {/*오른쪽 검색 결과*/}
                <div className="search-results-section" style={{ position: 'relative', overflow: 'hidden' }}>
                    {isLoading && (
                        <PaymentLoading message="숙소 리스트 검색 중..." mode="section" />
                    )}

                    {!isLoading && allStays.length === 0 ? (
                        <div style={{ padding: '40px', textAlign: 'center', background: '#f8f9fa', borderRadius: '8px' }}>
                            검색 조건에 맞는 숙소가 없습니다.
                        </div>
                    ) : (
                        <>
                            {allStays.map((stay) => (
                                <StayCard key={stay.stayId} stay={stay} searchParams={baseSearchParams} />
                            ))}
                        </>
                    )}


                    <div ref={observerTarget} style={{ padding: '40px', textAlign: 'center' }}>
                        {isFetchingNextPage && (
                            <div>
                                <div>숙소 검색결과</div>
                                <p>더 불러오는 중...</p>
                            </div>
                        )}
                        {!hasNextPage && allStays.length > 0 && (
                            <p style={{ color: '#999' }}>END</p>
                        )}
                    </div>
                </div>
            </div>

            {/* 모바일 플로팅 버튼 */}
            <div className="mobile-floating-buttons">
                <button className="floating-btn">
                <span onClick={() => setShowMapModal(true)} style={{ cursor: 'pointer' }}>
                    <img className="mfloating-icon" src="/images/stay/map-modal-icon.svg" alt="지도" /> 지도
                </span>
            <div className="floating-btn-divider"></div>
                <span onClick={openMobileFilter}>
                    <img className="mfloating-icon" src="/images/stay/filter-icon.svg" alt="필터" /> 조건검색
                </span>
                </button>
            </div>

            {/* 모바일 필터 모달 */}
            <div className={`mobile-filter-modal ${isMobileFilterOpen ? 'show' : ''}`}>
                <div className="mobile-filter-header">
                    <button className="mobile-filter-close" onClick={closeMobileFilter}>×</button>
                    <h3 className="mobile-filter-title">필터 검색</h3>
                </div>

                <div className="mobile-filter-content">
                    {/* ===== 요금 ===== */}
                    <div className="filter-section">
                        <div className="filter-section_title">1박당 요금</div>
                        <div className="form-price-range">
                            <span className="won-icon">₩</span>
                            <input
                                type="number"
                                className="form-input form-input-price"
                                placeholder="최소금액"
                                min="0"
                                value={filters.minPrice}
                                onChange={(e) => handlePriceChange('minPrice', e.target.value)}
                            />
                            <span className="form-guest-range_separator">
          <img src="/images/stay/stayslist-line.svg" alt="-" />
        </span>
                            <span className="won-icon">₩</span>
                            <input
                                type="number"
                                className="form-input form-input-price"
                                placeholder="최대금액"
                                min="0"
                                value={filters.maxPrice}
                                onChange={(e) => handlePriceChange('maxPrice', e.target.value)}
                            />
                        </div>
                    </div>

                    {/* 숙소 유형*/}
                    <div className="filter-section">
                        <div className="filter-section_title">숙소 유형</div>
                        <div className="filter-checkbox-group">
                            {['호텔', '모텔', '펜션'].map((type) => (
                                <label key={type} className="form-checkbox">
                                    <input
                                        type="checkbox"
                                        className="form-checkbox_input"
                                        checked={filters.stayTypes.includes(type)}
                                        onChange={() => handleStayTypeToggle(type)}
                                    />
                                    <span className="form-checkbox__text">
                                          <img className="stays_image" src={`/images/common/${type === '호텔' ? 'hotel' : type === '모텔' ? 'motel' : 'pension'}-icon.svg`} alt={type}/>
                                            {type}
                                    </span>
                                </label>
                            ))}
                        </div>
                    </div>

                    {/*숙소 특성*/}
                    <div className="filter-section">
                        <div className="filter-section_title">숙소 특성</div>

                        {/* 침실 수 */}
                        <div className="filter-subsection">
                            <div className="filter-subsection_title">침실 수</div>
                            <div className="filter-bed-btn">
                                {[1, 2, 3].map((count) => (
                                    <button
                                        key={count}
                                        className="filter-cnt-btn"
                                        onClick={() => handleBedroomSelect(count)}
                                        style={filters.bedroomCount === count ? {
                                            borderColor: '#ff6b6b',
                                            backgroundColor: '#FFF4EC',
                                            fontWeight: 600
                                        } : {}}
                                    >
                                        {count === 3 ? '3개 이상' : `${count}개`}
                                    </button>
                                ))}
                            </div>
                        </div>

                        {/* 욕실 수 */}
                        <div className="filter-subsection">
                            <div className="filter-subsection_title">욕실 수</div>
                            <div className="filter-bath-btn">
                                {[1, 2].map((count) => (
                                    <button
                                        key={count}
                                        className="filter-cnt-btn"
                                        onClick={() => handleBathroomSelect(count)}
                                        style={filters.bathroomCount === count ? {
                                            borderColor: '#ff6b6b',
                                            backgroundColor: '#FFF4EC',
                                            fontWeight: 600
                                        } : {}}
                                    >
                                        {count === 2 ? '2개 이상' : `${count}개`}
                                    </button>
                                ))}
                            </div>
                        </div>

                        {/* 수용 인원 */}
                        <div className="filter-subsection">
                            <div className="filter-subsection_title">수용 인원</div>
                            <div className="form-guest-range">
                                <img className="filter-person-icon" src="/images/stay/filter-person-icon.svg" alt="인원" />
                                <input
                                    type="number"
                                    className="form-input form-input-guest"
                                    placeholder="최소인원"
                                    min="1"
                                    max="20"
                                    value={filters.minGuests}
                                    onChange={(e) => handleGuestChange('minGuests', e.target.value)}
                                />
                                <span className="form-guest-range_separator">
                                    <img src="/images/stay/stayslist-line.svg" alt="-" />
                                </span>
                                <img className="filter-person-icon" src="/images/stay/filter-person-icon.svg" alt="인원" />
                                <input
                                    type="number"
                                    className="form-input form-input-guest"
                                    placeholder="최대인원"
                                    min="1"
                                    max="30"
                                    value={filters.maxGuests}
                                    onChange={(e) => handleGuestChange('maxGuests', e.target.value)}
                                />
                            </div>
                        </div>
                    </div>

                    {/* 숙소 평점 */}
                    <div className="filter-section">
                        <div className="filter-section_title">숙소 평점</div>
                        <div className="filter-stars-group">
                            {[5, 4, 3, 2, 1].map((rating) => (
                                <label key={rating} className="form-stars">
                                    <input
                                        type="checkbox"
                                        className="form-stars_input"
                                        checked={filters.ratings.includes(rating)}
                                        onChange={() => handleRatingToggle(rating)}
                                    />
                                    <div className="star-display">
                                        {[...Array(rating)].map((_, idx) => (
                                            <img key={idx} src="/images/stay/stayfilter-star.svg" alt="★" />
                                        ))}
                                    </div>
                                </label>
                            ))}
                        </div>
                    </div>

                    {/* 이용 가능한 옵션*/}
                    <div className="filter-section">
                        <div className="filter-section_title">이용가능한 서비스 / 옵션</div>
                        <div className="filter-checkbox-group">
                            {['조식 포함', '무료 취소일', '수영장', 'OTT 이용가능', '주차장', '금연',
                                '피트니스 센터', '반려동물 동반 가능', '장애인용 편의시설', '공항 이동 교통편 서비스'].map((option) => (
                                <label key={option} className="form-checkbox">
                                    <input
                                        type="checkbox"
                                        className="form-checkbox_input"
                                        checked={filters.amenities.includes(option)}
                                        onChange={() => handleAmenityToggle(option)}
                                    />
                                    <span className="form-checkbox__text">{option}</span>
                                </label>
                            ))}
                        </div>
                    </div>
                </div>

                <div className="mobile-filter-bottom">
                    <button className="mobile-apply-btn" onClick={closeMobileFilter}>
                        적용하기
                    </button>
                </div>
        </div>
        </div>


        {/* 지도 모달 */}
        <MapModal
            isOpen={showMapModal}
            onClose={() => setShowMapModal(false)}
            locationData={convertToLocationData(allStays)}
            filterParams={{
                region: baseSearchParams.region,
                checkIn: baseSearchParams.checkIn,
                checkOut: baseSearchParams.checkOut,
                adults: baseSearchParams.adults,
                children: baseSearchParams.children
            }}
        />

        </>
    )
}

