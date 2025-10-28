import {useState, useEffect, useRef} from 'react';

const KAKAO_JS_KEY = '3868e95750c9e60a60b89ae4b9455d38';

export const useKakaoMap = (isOpen, locationData = [], stayData = null, isStayDetailPage = false) => {
    const [kakaoLoaded, setKakaoLoaded] = useState(false);
    const [selectedLocation, setSelectedLocation] = useState(null);
    const [activeIndex, setActiveIndex] = useState(null);
    const mapRef = useRef(null);
    const kakaoMapRef = useRef(null);
    const overlaysRef = useRef([]); // 오버레이 관리
    const clickHandlerRef = useRef(null); // 이벤트 핸들러 관리
    const activeIndexRef = useRef(null);
    const zoomListenerRef = useRef(null); // zoom 이벤트 리스너 관리
    const dragEndListenerRef = useRef(null);
    const centerChangedListenerRef = useRef(null);
    useEffect(() => {
        activeIndexRef.current = activeIndex;
    }, [activeIndex]);

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

    useEffect(() => {
        if (!kakaoLoaded) return;
        updateActiveMarker();
    }, [activeIndex, kakaoLoaded]);

    // active 마커 업데이트 함수 (중복 제거)
    const updateActiveMarker = () => {
        // 모든 active 제거
        document.querySelectorAll('.tag-content').forEach(el => {
            el.classList.remove('active');
        });

        // activeIndexRef.current에 해당하는 마커만 active 추가
        if (activeIndexRef.current !== null) {
            const markerContainer = document.querySelector(`[data-location-index="${activeIndexRef.current}"]`);
            if (markerContainer) {
                const targetMarker = markerContainer.querySelector('.tag-content');
                if (targetMarker) {
                    targetMarker.classList.add('active');
                }
            }
        }
    };

    const cleanup = () => {
        // Kakao zoom 이벤트 리스너 제거
        if (zoomListenerRef.current && kakaoMapRef.current) {
            window.kakao.maps.event.removeListener(kakaoMapRef.current, 'zoom_changed', zoomListenerRef.current);
            zoomListenerRef.current = null;
        }

        if (dragEndListenerRef.current) {
            window.kakao.maps.event.removeListener(kakaoMapRef.current, 'dragend', dragEndListenerRef.current);
            dragEndListenerRef.current = null;
        }

        if (centerChangedListenerRef.current) {
            window.kakao.maps.event.removeListener(kakaoMapRef.current, 'center_changed', centerChangedListenerRef.current);
            centerChangedListenerRef.current = null;
        }

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

        // zoom 이벤트 리스너 등록
        zoomListenerRef.current = updateActiveMarker;
        kakao.maps.event.addListener(kakaoMapRef.current, 'zoom_changed', zoomListenerRef.current);
        // 드래그 종료 이벤트 (지도 이동 후)
        dragEndListenerRef.current = updateActiveMarker;
        kakao.maps.event.addListener(kakaoMapRef.current, 'dragend', dragEndListenerRef.current);
        // 중심 좌표 변경 이벤트 (모든 이동 감지)
        centerChangedListenerRef.current = updateActiveMarker;
        kakao.maps.event.addListener(kakaoMapRef.current, 'center_changed', centerChangedListenerRef.current);

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
        if (isStayDetailPage === false) {
            clickHandlerRef.current = handleMarkerClick;
            mapRef.current.addEventListener('click', clickHandlerRef.current);
        }
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

        setActiveIndex(index);
        setSelectedLocation(location);

        const moveLatLon = new window.kakao.maps.LatLng(
            location.latitude || location.lat,
            location.longitude || location.lng
        );
        kakaoMapRef.current.panTo(moveLatLon);
    };

    const focusMarker = (stayId) => {
        if (!kakaoMapRef.current) return;

        console.log('focusMarker 호출 - stayId:', stayId);

        const targetLocation = locationData.find(loc => loc.placeType === 'stay' && loc.id === stayId);
        if (!targetLocation) {
            console.error('targetLocation을 못 찾음!');
            return;
        }

        const index = locationData.findIndex(loc => loc.id === stayId);

        const moveLatLon = new window.kakao.maps.LatLng(
            targetLocation.latitude,
            targetLocation.longitude
        );
        kakaoMapRef.current.panTo(moveLatLon);

        setActiveIndex(index);
        setSelectedLocation(targetLocation);
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
        setSelectedLocation,
        focusMarker
    };
};