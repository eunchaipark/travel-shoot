import { useState, useEffect, useRef } from 'react';

const KAKAO_JS_KEY = '3868e95750c9e60a60b89ae4b9455d38';

export const useSearchKakaoMap = (isOpen) => {
    const [kakaoLoaded, setKakaoLoaded] = useState(false);
    const [searchResults, setSearchResults] = useState([]);
    const [pagination, setPagination] = useState(null);
    const [selectedPlace, setSelectedPlace] = useState(null);

    const mapRef = useRef(null);
    const kakaoMapRef = useRef(null);
    const markersRef = useRef([]);
    const infowindowRef = useRef(null);
    const placesServiceRef = useRef(null);

    // Kakao Maps SDK 로드
    useEffect(() => {
        if (!isOpen) return;

        const initKakaoMaps = () => {
            if (window.kakao?.maps?.services?.Places) {
                setKakaoLoaded(true);
                return;
            }

            if (window.kakao?.maps?.load) {
                window.kakao.maps.load(() => {
                    // services 라이브러리 로드 대기
                    const checkServices = () => {
                        if (window.kakao?.maps?.services) {
                            setKakaoLoaded(true);
                        } else {
                            setTimeout(checkServices, 100);
                        }
                    };
                    checkServices();
                });
                return;
            }

            setTimeout(initKakaoMaps, 100);
        };

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
        if (!kakaoLoaded || !isOpen || !mapRef.current) return;
        if (!window.kakao?.maps?.LatLng) return;

        if (!window.kakao?.maps?.services) {
            console.error('Kakao Maps services library not loaded');
            return;
        }

        const kakao = window.kakao;

        const mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567),
            level: 3
        };

        kakaoMapRef.current = new kakao.maps.Map(mapRef.current, mapOption);

        if (kakao.maps.services) {
            placesServiceRef.current = new kakao.maps.services.Places();
            infowindowRef.current = new kakao.maps.InfoWindow({ zIndex: 1 });
        }

        return () => {
            cleanup();
        };
    }, [kakaoLoaded, isOpen]);

    const cleanup = () => {
        removeMarkers();
        if (kakaoMapRef.current) {
            kakaoMapRef.current = null;
        }
        if (mapRef.current) {
            mapRef.current.innerHTML = '';
        }
        setSearchResults([]);
        setPagination(null);
        setSelectedPlace(null);
    };

    const removeMarkers = () => {
        markersRef.current.forEach(marker => {
            marker.setMap(null);
        });
        markersRef.current = [];
    };

    const searchPlaces = (keyword) => {
        if (!keyword.trim()) {
            alert('키워드를 입력해주세요!');
            return;
        }

        if (!placesServiceRef.current) return;

        placesServiceRef.current.keywordSearch(keyword, (data, status, paginationObj) => {
            if (status === window.kakao.maps.services.Status.OK) {
                setSearchResults(data);
                setPagination(paginationObj);
                displayPlaces(data);
            } else if (status === window.kakao.maps.services.Status.ZERO_RESULT) {
                alert('검색 결과가 존재하지 않습니다.');
                setSearchResults([]);
                setPagination(null);
            } else if (status === window.kakao.maps.services.Status.ERROR) {
                alert('검색 중 오류가 발생했습니다.');
                setSearchResults([]);
                setPagination(null);
            }
        });
    };

    const displayPlaces = (places) => {
        const kakao = window.kakao;
        const bounds = new kakao.maps.LatLngBounds();

        removeMarkers();

        places.forEach((place, index) => {
            console.log(place);
            const placePosition = new kakao.maps.LatLng(place.y, place.x);
            const marker = addMarker(placePosition, index);
            bounds.extend(placePosition);

            kakao.maps.event.addListener(marker, 'click', () => {
                displayInfowindow(marker, place.place_name, place.road_address_name, place.place_url);
                setSelectedPlace(place);
            });
        });

        kakaoMapRef.current.setBounds(bounds);
    };

    const addMarker = (position, idx) => {
        const kakao = window.kakao;
        const imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png';
        const imageSize = new kakao.maps.Size(36, 37);
        const imgOptions = {
            spriteSize: new kakao.maps.Size(36, 691),
            spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10),
            offset: new kakao.maps.Point(13, 37)
        };
        const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
        const marker = new kakao.maps.Marker({
            position: position,
            image: markerImage
        });

        marker.setMap(kakaoMapRef.current);
        markersRef.current.push(marker);

        return marker;
    };

    const displayInfowindow = (marker, title, roadAddressName, placeUrl) => {
        // 기존 오버레이 제거
        if (infowindowRef.current) {
            infowindowRef.current.setMap(null);
        }

        const kakao = window.kakao;
        const content = `<div class="map-card-overlay">
                        <div class="activity-card card card-custom search-card">
                            <div class="d-flex align-items-center h-100">
                                <div class="col-12">
                                    <div class="d-flex align-items-center mb-2">
                                        <h4 class="mb-0 title-text">${title}</h4>
                                    </div>
                                    <div class="d-flex mb-2 align-items-center text-muted">
                                        <span class="location-icon me-1"></span>
                                        <span class="location-text">${roadAddressName}</span>
                                    </div>
                                    <div class="text-end">
                                        <button class="btn btn-search" onclick="window.open('${placeUrl}')">검색</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>`;

        // CustomOverlay로 변경
        const customOverlay = new kakao.maps.CustomOverlay({
            position: marker.getPosition(),
            content: content,
            yAnchor: 1.5 // 마커 위에 표시
        });

        customOverlay.setMap(kakaoMapRef.current);
        infowindowRef.current = customOverlay; // 나중에 제거할 수 있도록 저장
    };

    const gotoPage = (page) => {
        if (pagination) {
            pagination.gotoPage(page);
        }
    };

    const moveToPlace = (place) => {
        if (!kakaoMapRef.current) return;

        const kakao = window.kakao;
        const position = new kakao.maps.LatLng(place.y, place.x);
        kakaoMapRef.current.panTo(position);

        const marker = markersRef.current[searchResults.indexOf(place)];
        if (marker) {
            displayInfowindow(marker, place.place_name, place.road_address_name, place.place_url);
        }

        setSelectedPlace(place);
    };

    return {
        mapRef,
        kakaoLoaded,
        searchResults,
        pagination,
        selectedPlace,
        searchPlaces,
        gotoPage,
        moveToPlace
    };
};