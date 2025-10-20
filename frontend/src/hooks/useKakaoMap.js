import { useState, useEffect, useRef } from 'react';

const KAKAO_JS_KEY = '3868e95750c9e60a60b89ae4b9455d38';

export const useKakaoMap = (isOpen, locationData = [], stayData = null) => {
    const [kakaoLoaded, setKakaoLoaded] = useState(false);
    const [selectedLocation, setSelectedLocation] = useState(null);
    const [activeIndex, setActiveIndex] = useState(null);
    const mapRef = useRef(null);
    const kakaoMapRef = useRef(null);
    const overlaysRef = useRef([]); // 오버레이 관리
    const clickHandlerRef = useRef(null); // 이벤트 핸들러 관리

    // Kakao Maps SDK 동적 로드
    useEffect(() => {
        if (!isOpen) return;

        const initKakaoMaps = () => {
            if (window.kakao?.maps?.LatLng) {
                setKakaoLoaded(true);
                return;
            }

            if (window.kakao?.maps?.load) {
                window.kakao.maps.load(() => {
                    setKakaoLoaded(true);
                });
                return;
            }

            setTimeout(initKakaoMaps, 100);
        };

        // 스크립트가 없으면 추가
        if (!document.querySelector('script[src*="dapi.kakao.com"]')) {
            const script = document.createElement('script');
            script.src = `//dapi.kakao.com/v2/maps/sdk.js?appkey=${KAKAO_JS_KEY}&autoload=false&libraries=services`;
            script.async = true;
            script.onload = initKakaoMaps;
            document.head.appendChild(script);
        } else {
            initKakaoMaps();
        }
    }, [isOpen]);

    // 지도 초기화
    useEffect(() => {
        if (!kakaoLoaded || !isOpen || !mapRef.current || locationData.length === 0) return;
        if (!window.kakao?.maps?.LatLng) return;

        // 기존 지도와 오버레이 정리
        cleanup();

        initializeMap();

        // cleanup 함수 반환
        return () => {
            cleanup();
        };
    }, [kakaoLoaded, isOpen, locationData, stayData]);

    const cleanup = () => {
        // 기존 오버레이 제거
        overlaysRef.current.forEach(overlay => {
            if (overlay && overlay.setMap) {
                overlay.setMap(null);
            }
        });
        overlaysRef.current = [];

        // 기존 이벤트 리스너 제거
        if (clickHandlerRef.current && mapRef.current) {
            mapRef.current.removeEventListener('click', clickHandlerRef.current);
            clickHandlerRef.current = null;
        }

        if (kakaoMapRef.current) {
            kakaoMapRef.current = null;
        }

        // 지도 컨테이너 DOM 완전히 비우기
        if (mapRef.current) {
            mapRef.current.innerHTML = '';
        }

        // 선택 상태 초기화
        setSelectedLocation(null);
        setActiveIndex(null);
    };

    const initializeMap = () => {
        const kakao = window.kakao;
        const firstLocation = locationData[0];
        // 지도 생성
        const mapOption = {
            center: new kakao.maps.LatLng(firstLocation.latitude, firstLocation.longitude),
            level: 3
        };

        kakaoMapRef.current = new kakao.maps.Map(mapRef.current, mapOption);

        // 숙소 마커 먼저 생성 (있으면)
        if (stayData && stayData.latitude && stayData.longitude) {
            const stayOverlayContent = document.createElement('div');
            stayData.placeType = 'stay';
            stayOverlayContent.innerHTML = setContent(stayData, -1); // index -1로 숙소 표시
            stayOverlayContent.style.cursor = 'pointer';
            stayOverlayContent.dataset.locationIndex = -1;
            stayOverlayContent.dataset.isStay = 'true';

            const stayOverlay = new kakao.maps.CustomOverlay({
                position: new kakao.maps.LatLng(
                    stayData.latitude,
                    stayData.longitude
                ),
                content: stayOverlayContent,
            });
            stayOverlay.setMap(kakaoMapRef.current);
            overlaysRef.current.push(stayOverlay);
        }

        // 각 위치에 마커 생성 (spots)
        locationData.forEach((location, index) => {
            const overlayContent = document.createElement('div');
            overlayContent.innerHTML = setContent(location, index);
            overlayContent.style.cursor = 'pointer';
            overlayContent.dataset.locationIndex = index;

            const customOverlay = new kakao.maps.CustomOverlay({
                position: new kakao.maps.LatLng(
                    location.latitude || location.lat,
                    location.longitude || location.lng
                ),
                content: overlayContent,
            });
            customOverlay.setMap(kakaoMapRef.current);
            overlaysRef.current.push(customOverlay);
        });

        if (stayData && stayData.latitude && stayData.longitude && locationData.length > 0) {
            // 숙소 → 첫번째 spot → 두번째 spot → ... → 마지막 spot → 숙소
            const linePath = [];

            // 중간: 모든 spots 순서대로
            locationData.forEach(location => {
                linePath.push(new kakao.maps.LatLng(
                    location.latitude || location.lat,
                    location.longitude || location.lng
                ));
            });

            // 선 그리기
            const polyline = new kakao.maps.Polyline({
                path: linePath,
                strokeWeight: 3,        // 선 두께
                strokeColor: '#4A90E2', // 선 색상 (파란색)
                strokeOpacity: 0.8,     // 선 투명도
                strokeStyle: 'dashed'   // 점선 스타일
            });

            polyline.setMap(kakaoMapRef.current);
            overlaysRef.current.push(polyline); // cleanup 시 함께 제거되도록
        }
        // 클릭 이벤트 등록 (한 번만)
        clickHandlerRef.current = handleMarkerClick;
        mapRef.current.addEventListener('click', clickHandlerRef.current);
    };

    const handleMarkerClick = (e) => {
        const tagContent = e.target.closest('.tag-content');
        if (!tagContent) return;

        const overlay = e.target.closest('[data-location-index]');
        if (!overlay) return;

        const index = parseInt(overlay.dataset.locationIndex);
        const isStay = overlay.dataset.isStay === 'true';

        let location;
        if (isStay) {
            location = stayData;
        } else {
            location = locationData[index];
        }

        // 모든 active 제거
        document.querySelectorAll('.tag-content').forEach(el =>
            el.classList.remove('active')
        );

        // 클릭된 요소에만 active 추가
        tagContent.classList.add('active');

        setActiveIndex(index);
        setSelectedLocation(location);

        const moveLatLon = new window.kakao.maps.LatLng(
            location.latitude || location.lat,
            location.longitude || location.lng
        );
        kakaoMapRef.current.panTo(moveLatLon);
    };

    const setContent = (location, index) => {
        // 여행 코스용 마커 (spotType: 관광지/맛집)
        if (location.spotType) {
            const markerClass = location.spotType === '맛집' ? 'restaurant' : 'activity';
            return `
                <div class="map-tag ${markerClass}">
                    <div class="tag-content d-flex align-items-stretch" data-index="${index}">
                        <div class="icon-con d-flex align-items-center">
                            <div class="icon"></div>
                        </div>
                        <div class="d-flex align-items-center">${location.order}. ${location.spotName}</div>
                    </div>
                    <div class="tag-arrow"></div>
                </div>
            `;
        }

        // 숙소용 마커 (기존)
        return `
            <div class="map-tag ${location.placeType}">
                <div class="tag-content d-flex align-items-stretch" data-index="${index}">
                    <div class="icon-con d-flex align-items-center">
                        <div class="icon"></div>
                    </div>
                    <div class="d-flex align-items-center">
                        ${location.placeType === 'stay' && location.lowestPrice ? location.lowestPrice.toLocaleString() : location.name}
                    </div>
                </div>
                <div class="tag-arrow"></div>
            </div>
        `;
    };

    return {
        mapRef,
        kakaoLoaded,
        selectedLocation,
        activeIndex,
        setSelectedLocation
    };
};