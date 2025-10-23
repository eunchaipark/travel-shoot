import {useState, useEffect, useRef} from 'react';

const KAKAO_JS_KEY = '3868e95750c9e60a60b89ae4b9455d38';

export const useSearchKakaoMap = (isOpen, onModalClose, spotId, onUpdateSuccess) => {
    const [kakaoLoaded, setKakaoLoaded] = useState(false);
    const [isUpdating, setIsUpdating] = useState(false);
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
            infowindowRef.current = new kakao.maps.InfoWindow({zIndex: 1});
        }

        return () => {
            cleanup();
        };
    }, [kakaoLoaded, isOpen]);

    useEffect(() => {
        if (!mapRef.current) return;

        const handleClick = (e) => {
            if (e.target.classList.contains('place-select-btn')) {
                const placeName = e.target.dataset.placeName;

                if (!confirm(`${placeName}(으)로 수정하시겠습니까?`)) {
                    return;
                }

                const placeData = {
                    id: e.target.dataset.placeId,
                    place_name: e.target.dataset.placeName,
                    x: e.target.dataset.placeX,
                    y: e.target.dataset.placeY,
                    address_name: e.target.dataset.placeAddress,
                    place_url: e.target.dataset.placeUrl,
                    category_name: e.target.dataset.categoryName,
                    category_group_name: e.target.dataset.categoryGroupName
                };
                handlePlaceSelect(placeData);
            }
        };

        mapRef.current.addEventListener('click', handleClick);

        return () => {
            if (mapRef.current) {
                mapRef.current.removeEventListener('click', handleClick);
            }
        };
    }, [mapRef, spotId]);

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
            const placePosition = new kakao.maps.LatLng(place.y, place.x);
            const marker = addMarker(placePosition, index);
            bounds.extend(placePosition);

            kakao.maps.event.addListener(marker, 'click', () => {
                displayInfowindow(marker, place);
                setSelectedPlace(place);
            });
        });

        kakaoMapRef.current.setBounds(bounds);
    };

    const handlePlaceSelect = async (placeData) => {
        try {
            setIsUpdating(true); // 로딩 시작

            const response = await fetch(`${window.API_BASE_URL}/api/ai/course/update`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                credentials: 'include',
                body: JSON.stringify({
                    spotId: spotId,
                    place: placeData
                })
            });

            if (response.ok) {
                alert('일정이 수정되었습니다.');
                if (onUpdateSuccess) {
                    await onUpdateSuccess();
                }

            } else {
                alert('수정에 실패했습니다.');
            }
        } catch (error) {
            console.error('Error updating course:', error);
            alert('오류가 발생했습니다.');
        } finally {
            setIsUpdating(false);
            if (onModalClose) {
                onModalClose(); // 모달 닫기
            }
        }
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

    const displayInfowindow = (marker, place) => {
        if (infowindowRef.current) {
            infowindowRef.current.setMap(null);
        }
        console.log(place);
        const kakao = window.kakao;

        const content = `<div class="map-card-overlay">
                    <div class="activity-card card card-custom search-card">
                        <div class="d-flex align-items-center h-100">
                            <div class="col-12">
                                <div class="d-flex align-items-center mb-2">
                                    <h4 class="mb-0 title-text">${place.place_name}</h4>
                                </div>
                                <div class="d-flex mb-2 align-items-center text-muted">
                                    <span class="location-icon me-1"></span>
                                    <span class="location-text">${place.road_address_name || place.address_name}</span>
                                </div>
                                <div class="text-end">
                                    <button class="btn btn-search white" onclick="window.open('${place.place_url}')">검색</button>
                                    <button class="btn btn-search place-select-btn" 
                                            data-place-id="${place.id}"
                                            data-place-name="${place.place_name}"
                                            data-place-x="${place.x}"
                                            data-place-y="${place.y}"
                                            data-place-address="${place.road_address_name || place.address_name}"
                                            data-place-url="${place.place_url}"
                                            data-category-name="${place.category_name}"
                                            data-category-group-name="${place.category_group_name}">선택</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>`;

        const customOverlay = new kakao.maps.CustomOverlay({
            position: marker.getPosition(),
            content: content,
            yAnchor: 1.5
        });

        customOverlay.setMap(kakaoMapRef.current);
        infowindowRef.current = customOverlay;
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
            displayInfowindow(marker, place);
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
        moveToPlace,
        isUpdating,
    };
};