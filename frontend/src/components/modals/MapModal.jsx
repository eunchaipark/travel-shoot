import React, {useState, useEffect, useRef} from 'react';
import '@/assets/css/map.css';
import { getStayType } from '@/utils/formatters';

const MapModal = ({isOpen, onClose, locationData = [], filterParams = {}}) => {
    const [kakaoLoaded, setKakaoLoaded] = useState(false);
    const mapRef = useRef(null);
    const [selectedLocation, setSelectedLocation] = useState(null);
    const kakaoMapRef = useRef(null);
    const [activeIndex, setActiveIndex] = useState(null);
    const KAKAO_JS_KEY = '3868e95750c9e60a60b89ae4b9455d38';

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
            script.src = `//dapi.kakao.com/v2/maps/sdk.js?appkey=${KAKAO_JS_KEY}&autoload=false`;
            script.async = true;
            script.onload = initKakaoMaps;
            document.head.appendChild(script);
        } else {
            initKakaoMaps();
        }
    }, [isOpen]);

    // 지도 초기화 및 인포윈도우 표시
    useEffect(() => {
        if (!kakaoLoaded || !isOpen || !mapRef.current || locationData.length === 0) return;

        if (!window.kakao?.maps?.LatLng) {
            return;
        }

        initializeMap();
    }, [kakaoLoaded, isOpen, locationData]);

    const initializeMap = () => {
        const kakao = window.kakao;
        const firstLocation = locationData[0];

        // 지도 생성
        const mapOption = {
            center: new kakao.maps.LatLng(firstLocation.latitude, firstLocation.longitude),
            level: 3
        };

        kakaoMapRef.current = new kakao.maps.Map(mapRef.current, mapOption);

        // 각 위치에 인포윈도우 생성 및 표시
        locationData.forEach((location, index) => {
            const overlayContent = document.createElement('div');
            overlayContent.innerHTML = setContent(location, index);
            overlayContent.style.cursor = 'pointer';
            overlayContent.dataset.locationIndex = index;

            const customOverlay = new kakao.maps.CustomOverlay({
                position: new kakao.maps.LatLng(location.latitude, location.longitude),
                content: overlayContent,
            });
            customOverlay.setMap(kakaoMapRef.current);
        });

        mapRef.current.addEventListener('click', (e) => {
            const tagContent = e.target.closest('.tag-content');
            if (!tagContent) return;

            const overlay = e.target.closest('[data-location-index]');
            if (!overlay) return;

            const index = parseInt(overlay.dataset.locationIndex);
            const location = locationData[index];

            // 모든 active 제거
            document.querySelectorAll('.tag-content').forEach(el =>
                el.classList.remove('active')
            );

            // 클릭된 요소에만 active 추가
            tagContent.classList.add('active');

            setActiveIndex(index);
            setSelectedLocation(location);

            const moveLatLon = new window.kakao.maps.LatLng(location.latitude, location.longitude);
            kakaoMapRef.current.panTo(moveLatLon);
        });
    };

    const setContent = (location, index) => {
        return (
            `<div class="map-tag ${location.placeType}">
                <div class="tag-content d-flex align-items-stretch" data-index="${index}">
                  <div class="icon-con d-flex align-items-center">
                    <div class="icon"></div>
                  </div>
                  <div class="d-flex align-items-center">${location.placeType === 'stay' ? location.lowestPrice.toLocaleString() : location.name}</div>
                </div>
                 <div class="tag-arrow"></div>
              </div>`
        );
    }

    if (!isOpen) return null;

    return (
        <>
            <input type="checkbox" id="map-modal" className="modal-checkbox" checked={isOpen} onChange={() => {
            }}/>

            <div className="modal-overlay">
                <div className="map-page modal-content map-modal-content">
                    <div className="modal-header">
                        <h3 className="modal-title">지도</h3>
                        <button onClick={onClose} className="mt-3 modal-close">×</button>
                    </div>

                    <div className="flex-1 relative">
                        <div ref={mapRef} className="w-full h-full" style={{minHeight: '400px'}}/>

                        {/* 선택된 위치 카드 */}
                        {selectedLocation && (
                            <div className="map-card-overlay">
                                <div className={`${selectedLocation.placeType}-card card card-custom`}>
                                    <div className="d-flex align-items-center h-100">
                                        {selectedLocation.placeType === "stay" ? (
                                                <>
                                                    <div className="col-4 h-100">
                                                        <img
                                                            src={selectedLocation.image || "https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=400&h=300&fit=crop"}
                                                            alt={selectedLocation.name}
                                                            className="stay-image"
                                                        />
                                                    </div>
                                                    <div className="col-8 ps-3">
                                                        <div className="d-flex align-items-center">
                                                            <div
                                                                className={`title-icon ${getStayType(selectedLocation.stayType)}-icon`}></div>
                                                            <span className="mb-0 title-text">{selectedLocation.name}</span>
                                                        </div>
                                                        <div className="d-flex align-items-center mb-4">
                                                            <span className="star-rating me-1">★</span>
                                                            <span
                                                                className="star-rating-text">({selectedLocation.rating || '4.5'}/5)</span>
                                                        </div>
                                                        <div className="text-end pe-1">
                                                            <span
                                                                className="price-text pe-1">₩ {selectedLocation.lowestPrice?.toLocaleString()}</span>
                                                            <span className="standard-text">(1박당 요금)</span>
                                                        </div>
                                                    </div>
                                                </>
                                            ) :
                                            (
                                                <>
                                                    <div className="col-12">
                                                        <div
                                                            className={`d-flex align-items-center ${selectedLocation.placeType === 'activity' ? 'mb-2' : 'mb-1'}`}>
                                                            <div
                                                                className={`title-icon ${selectedLocation.placeType}-icon ${selectedLocation.placeType === 'stay' ? 'mb-1' : ''}`}></div>
                                                            <h4 className="mb-0 title-text">{selectedLocation.name}</h4>
                                                        </div>


                                                        {selectedLocation.placeType === "restaurant" ? (
                                                                <>
                                                                    <div className="d-flex align-items-center mb-3">
                                                                        <span className="star-rating me-1">★</span>
                                                                        <span
                                                                            className="star-rating-text">({selectedLocation.rating || '4.5'}/5)</span>
                                                                    </div>
                                                                </>) :
                                                            (
                                                                <>
                                                                    <div
                                                                        className="d-flex align-items-center text-muted">
                                                                        <span className="location-icon me-1"></span>
                                                                        <span className="location-text"
                                                                        >강원 강릉시 사천면 송암골길 197-13<br/>{selectedLocation.name}</span
                                                                        >
                                                                    </div>
                                                                </>
                                                            )}

                                                        <div className="text-end">
                                                            <button className="btn btn-search">검색</button>
                                                        </div>
                                                    </div>
                                                </>
                                            )}
                                    </div>
                                </div>
                            </div>
                        )}


                        {!kakaoLoaded && (
                            <div className="absolute inset-0 flex items-center justify-center bg-gray-100">
                                <div className="text-center">
                                    <div
                                        className="animate-spin rounded-full h-12 w-12 border-4 border-blue-600 border-t-transparent mx-auto mb-4"></div>
                                    <p className="text-gray-600 font-medium">지도를 불러오는 중...</p>
                                </div>
                            </div>
                        )}
                    </div>
                </div>
            </div>
        </>
    );
};

export default MapModal;