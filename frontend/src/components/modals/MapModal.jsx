import React, { useState, useEffect, useRef } from 'react';

const MapModal = ({ isOpen, onClose, locationData = [], filterParams = {} }) => {
    const [searchInput, setSearchInput] = useState('');
    const [kakaoLoaded, setKakaoLoaded] = useState(false);
    const mapRef = useRef(null);
    const kakaoMapRef = useRef(null);
    const currentOverlayRef = useRef(null);
    const markersRef = useRef([]);
    const clustererRef = useRef(null);

    const KAKAO_JS_KEY = '3868e95750c9e60a60b89ae4b9455d38';

    // Kakao Maps SDK 동적 로드
    useEffect(() => {
        if (!isOpen) return;

        // 이미 완전히 로드된 경우
        if (window.kakao && window.kakao.maps && window.kakao.maps.LatLng) {
            setKakaoLoaded(true);
            return;
        }

        // SDK는 있지만 maps API가 없는 경우
        if (window.kakao && window.kakao.maps && window.kakao.maps.load) {
            window.kakao.maps.load(() => {
                setTimeout(() => {
                    if (window.kakao.maps.LatLng) {
                        setKakaoLoaded(true);
                    } else {
                        console.error('LatLng이 아직 없음');
                    }
                }, 100);
            });
            return;
        }

        // 이미 스크립트 태그가 있는지 확인
        const existingScript = document.querySelector(
            'script[src*="dapi.kakao.com"]'
        );

        if (existingScript) {
            console.log('⏳ SDK 대기 중...');
            const checkInterval = setInterval(() => {
                if (window.kakao && window.kakao.maps && window.kakao.maps.load) {
                    console.log('📦 SDK 준비됨, Maps API 로딩...');
                    clearInterval(checkInterval);
                    window.kakao.maps.load(() => {
                        setTimeout(() => {
                            if (window.kakao.maps.LatLng) {
                                setKakaoLoaded(true);
                            } else {
                                console.error('LatLng이 아직 없음');
                            }
                        }, 100);
                    });
                }
            }, 100);

            setTimeout(() => clearInterval(checkInterval), 10000);
            return () => clearInterval(checkInterval);
        }

        // 새로 스크립트 추가
        console.log('📦 Kakao Maps SDK 다운로드 시작');
        const script = document.createElement('script');
        script.type = 'text/javascript';
        script.src = `//dapi.kakao.com/v2/maps/sdk.js?appkey=${KAKAO_JS_KEY}&libraries=clusterer&autoload=false`;
        script.async = false;

        script.onload = () => {
            console.log('✅ SDK 다운로드 완료');
            if (window.kakao && window.kakao.maps && window.kakao.maps.load) {
                console.log('📦 Maps API 로딩...');
                window.kakao.maps.load(() => {
                    console.log('✅ Maps API 로드 완료');
                    // 약간의 지연 후 상태 업데이트
                    setTimeout(() => {
                        if (window.kakao.maps.LatLng) {
                            console.log('✅ LatLng 확인됨');
                            setKakaoLoaded(true);
                        } else {
                            console.error('❌ LatLng이 아직 없음');
                        }
                    }, 100);
                });
            }
        };

        script.onerror = (error) => {
            console.error('❌ SDK 로드 실패:', error);
        };

        document.head.appendChild(script);

    }, [isOpen]);

    // 지도 초기화 및 마커 표시
    useEffect(() => {
        console.log('🔍 useEffect 체크:', {
            kakaoLoaded,
            isOpen,
            hasMapRef: !!mapRef.current,
            dataLength: locationData.length
        });

        if (!kakaoLoaded || !isOpen || !mapRef.current || locationData.length === 0) return;

        // 한 번 더 체크
        if (!window.kakao || !window.kakao.maps || !window.kakao.maps.LatLng) {
            console.error('❌ Kakao Maps API가 준비되지 않았습니다');
            console.log('window.kakao.maps:', Object.keys(window.kakao?.maps || {}));
            return;
        }

        console.log('🗺️ 지도 초기화 시작');
        initializeMap();
    }, [kakaoLoaded, isOpen, locationData]);

    const getMarkerImageSrc = (status) => {
        const baseUrl = '/app_tubesystem/webadm/content/program/common/inc/img';
        switch (status) {
            case 0: return `${baseUrl}/icon_marker0.png`;
            case 2: return `${baseUrl}/icon_marker2.png`;
            case 3: return `${baseUrl}/icon_marker3.png`;
            case 4: return `${baseUrl}/icon_marker4.png`;
            default: return `${baseUrl}/icon_marker1.png`;
        }
    };

    const initializeMap = () => {
        const kakao = window.kakao;
        const firstLocation = locationData[0];

        // 지도 생성
        const mapOption = {
            center: new kakao.maps.LatLng(firstLocation.location_y, firstLocation.location_x),
            level: 3
        };

        kakaoMapRef.current = new kakao.maps.Map(mapRef.current, mapOption);

        // 마커 생성
        const allMarkers = [];
        const rawMarkers = [];
        const latlngList = [];

        locationData.forEach((location) => {
            const lat = location.location_y;
            const lng = location.location_x;
            const latlngStr = `${lat}|${lng}`;

            // 중복 좌표 체크
            if (latlngList.includes(latlngStr)) return;

            const markerImageSrc = getMarkerImageSrc(location.sisul_status);
            const markerImage = new kakao.maps.MarkerImage(
                markerImageSrc,
                new kakao.maps.Size(29, 42)
            );

//         var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
//             iwPosition = new kakao.maps.LatLng(33.450701, 126.570667), //인포윈도우 표시 위치입니다
//             iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
//
// // 인포윈도우를 생성하고 지도에 표시합니다
//         var infowindow = new kakao.maps.InfoWindow({
//             map: map, // 인포윈도우가 표시될 지도
//             position : iwPosition,
//             content : iwContent,
//             removable : iwRemoveable
//         });



            const marker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(lat, lng),
                title: location.tag_id,
                image: markerImage
            });

            // 마커 클릭 이벤트
            kakao.maps.event.addListener(marker, 'click', () => {
                handleMarkerClick(location.tag_id, location.seq, marker.getPosition());
            });

            allMarkers.push({ marker, seq: location.seq });
            rawMarkers.push(marker);
            latlngList.push(latlngStr);
        });

        markersRef.current = allMarkers;

        // 클러스터러 생성
        clustererRef.current = new kakao.maps.MarkerClusterer({
            map: kakaoMapRef.current,
            averageCenter: true,
            minLevel: 2
        });

        // 마커 업데이트 함수
        const updateMapMarkers = () => {
            const level = kakaoMapRef.current.getLevel();
            const bounds = kakaoMapRef.current.getBounds();

            if (level === 1) {
                // 레벨 1: 개별 마커 표시
                clustererRef.current.clear();

                allMarkers.forEach(({ marker }) => {
                    const position = marker.getPosition();
                    marker.setMap(bounds.contain(position) ? kakaoMapRef.current : null);
                });
            } else {
                // 레벨 > 1: 클러스터러 사용
                allMarkers.forEach(({ marker }) => marker.setMap(null));
                clustererRef.current.clear();
                clustererRef.current.addMarkers(rawMarkers);
            }
        };

        // 최초 표시 및 이벤트 등록
        updateMapMarkers();
        kakao.maps.event.addListener(kakaoMapRef.current, 'idle', updateMapMarkers);
    };

    const handleMarkerClick = (title, seq, position) => {
        const kakao = window.kakao;

        // 기존 오버레이 제거
        if (currentOverlayRef.current) {
            currentOverlayRef.current.setMap(null);
        }

        const filterQuery = new URLSearchParams(filterParams).toString();
        const linkUrl = `?mode=view&SEQ=${seq}${filterQuery ? '&' + filterQuery : ''}`;

        const content = `
      <div style="
        position: relative;
        background: white;
        border: 2px solid #8aedff;
        border-radius: 8px;
        padding: 12px 16px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        min-width: 150px;
      ">
        <div style="display: flex; align-items: center; gap: 12px;">
          <span style="font-weight: 600; font-size: 14px; color: #333;">${title}</span>
          <a href="${linkUrl}" target="_blank" style="
            display: flex;
            align-items: center;
            justify-content: center;
            width: 24px;
            height: 24px;
            background: #8aedff;
            border-radius: 50%;
            transition: background 0.2s;
          ">
            <img src="/weven_asset/img/arrow_8aedff_6x10_right.png" 
                 style="width: 10px; height: 10px; filter: brightness(0) invert(1);">
          </a>
        </div>
        <div style="
          position: absolute;
          bottom: -10px;
          left: 50%;
          transform: translateX(-50%);
          width: 0;
          height: 0;
          border-left: 10px solid transparent;
          border-right: 10px solid transparent;
          border-top: 10px solid white;
        "></div>
      </div>
    `;

        currentOverlayRef.current = new kakao.maps.CustomOverlay({
            content: content,
            map: kakaoMapRef.current,
            position: position
        });

        kakaoMapRef.current.setCenter(position);
    };

    const handleSearch = () => {
        const searchValue = searchInput.toLowerCase();
        const found = markersRef.current.find(
            ({ marker }) => marker.getTitle().toLowerCase() === searchValue
        );

        if (found) {
            const position = found.marker.getPosition();
            handleMarkerClick(found.marker.getTitle(), found.seq, position);
            kakaoMapRef.current.setLevel(1);
            kakaoMapRef.current.setCenter(position);
        } else {
            alert('해당 마커를 찾을 수 없습니다.');
        }
    };

    const handleKeyPress = (e) => {
        if (e.key === 'Enter') {
            handleSearch();
        }
    };

    if (!isOpen) return null;

    return (
        <>
            <input type="checkbox" id="map-modal" className="modal-checkbox" />

            <div className="modal-overlay">
                <div className="modal-content map-modal-content">
                    <div className="modal-header">
                        <h3 className="modal-title"></h3>
                        <label htmlFor="map-modal mt-3" className="modal-close">×</label>
                    </div>
                    {/* Map Container */}
                    <div className="flex-1 relative">
                        <div ref={mapRef} className="w-full h-full" style={{minHeight: '400px'}}/>

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