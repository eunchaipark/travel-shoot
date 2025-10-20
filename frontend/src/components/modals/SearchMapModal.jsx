import React, { useState, useEffect } from 'react';
import { useSearchKakaoMap } from '@/hooks/useSearchKakaoMap';
import '@/assets/css/reservation.css';

const SearchMapModal = ({ isOpen, onClose, spotId, onUpdateSuccess }) => {
    const [keyword, setKeyword] = useState('제주 맛집'); //TODO: reservation에 담겨있는 숙소에 OO시+ 맛집 이라고 들어가야 함.
    const {
        mapRef,
        kakaoLoaded,
        searchResults,
        pagination,
        selectedPlace,
        searchPlaces,
        gotoPage,
        moveToPlace,
        isUpdating
    } = useSearchKakaoMap(isOpen, onClose, spotId, onUpdateSuccess);
    useEffect(() => { if (kakaoLoaded && isOpen) { searchPlaces(keyword); } }, [kakaoLoaded, isOpen]);
    const handleSearch = (e) => {
        e.preventDefault();
        searchPlaces(keyword);
    };

    const handlePlaceClick = (place) => {
        moveToPlace(place);
    };

    if (!isOpen) return null;

    return (
        <>
            <input
                type="checkbox"
                id="search-map-modal"
                className="modal-checkbox"
                checked={isOpen}
                onChange={() => {}}
            />

            <div className="modal-overlay">
                <div className="search-map-modal modal-content">
                    {/* 로딩 오버레이 추가 */}
                    {isUpdating && (
                        <div className="updating-overlay">
                            <div className="updating-content">
                                <div className="spinner-border mb-3" role="status" style={{ width: '3rem', height: '3rem' }}>
                                    <span className="visually-hidden">Loading...</span>
                                </div>
                                <h4 className="updating-title mb-2">일정 수정 중...</h4>
                                <p className="updating-description text-muted">
                                    AI가 장소 정보를 분석하고 있습니다.<br/>
                                    최대 20초 정도 소요됩니다.
                                </p>
                            </div>
                        </div>
                    )}
                    <div className="modal-header">
                        <h3 className="modal-title">일정 수정</h3>
                        <button onClick={onClose} className="modal-close">×</button>
                    </div>

                    <div className="search-map-body map-page">
                        {/* 왼쪽 검색 패널 */}
                        <div className="search-panel">
                            {/* 검색 폼 */}
                            <div className="search-form-wrapper">
                                <form onSubmit={handleSearch} className="d-flex gap-2">
                                    <input
                                        type="text"
                                        className="form-control"
                                        placeholder="키워드를 입력하세요"
                                        value={keyword}
                                        onChange={(e) => setKeyword(e.target.value)}
                                    />
                                    <button type="submit" className="search-btn">
                                        <div className="search-icon"></div>
                                    </button>
                                </form>
                            </div>

                            {/* 검색 결과 목록 */}
                            <div className="search-results-wrapper">
                                <ul className="list-group search-results-list">
                                    {searchResults.map((place, index) => (
                                        <li
                                            key={place.id}
                                            className={`list-group-item search-result-item ${
                                                selectedPlace?.id === place.id ? 'active' : ''
                                            }`}
                                            onClick={() => handlePlaceClick(place)}
                                        >
                                            <div className="d-flex align-items-start">
                                                <span className="result-number me-3">{index + 1}</span>
                                                <div className="flex-grow-1">
                                                    <h6 className="mb-1 result-title">{place.place_name}</h6>
                                                    {place.road_address_name ? (
                                                        <>
                                                            <p className="mb-0 result-address">
                                                                {place.road_address_name}
                                                            </p>
                                                            <p className="mb-0 result-jibun">
                                                                (지번) {place.address_name}
                                                            </p>
                                                        </>
                                                    ) : (
                                                        <p className="mb-0 result-address">
                                                            {place.address_name}
                                                        </p>
                                                    )}
                                                    {place.phone && (
                                                        <p className="mb-0 result-phone text-muted">
                                                            {place.phone}
                                                        </p>
                                                    )}
                                                </div>
                                            </div>
                                        </li>
                                    ))}
                                </ul>

                                {/* 페이지네이션 */}
                                {pagination && pagination.last > 1 && (
                                    <div className="pagination-wrapper d-flex justify-content-center gap-1 mt-3">
                                        {Array.from({ length: pagination.last }, (_, i) => i + 1).map((page) => (
                                            <button
                                                key={page}
                                                className={`paging-btn ${
                                                    page === pagination.current ? 'btn-primary' : 'btn-outline-primary'
                                                }`}
                                                onClick={() => gotoPage(page)}
                                            >
                                                {page}
                                            </button>
                                        ))}
                                    </div>
                                )}
                            </div>
                        </div>

                        {/* 오른쪽 지도 */}
                        <div className="map-wrapper">
                            <div ref={mapRef} className="search-map"></div>

                            {!kakaoLoaded && (
                                <div className="map-loading">
                                    <div className="text-center">
                                        <div className="spinner-border text-primary" role="status">
                                            <span className="visually-hidden">Loading...</span>
                                        </div>
                                        <p className="mt-2">지도를 불러오는 중...</p>
                                    </div>
                                </div>
                            )}
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
};

export default SearchMapModal;