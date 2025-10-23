import React from 'react';
import { getStayType } from '@/utils/formatters';
import { useNavigate } from "react-router-dom";

const MapContent = ({ mapRef, kakaoLoaded, selectedLocation }) => {
    const navigate = useNavigate();
    console.log(selectedLocation);
    return (
        <div className="flex-1 relative">
            <div ref={mapRef} className="w-full h-full" style={{minHeight: '400px'}} />

            {/* 선택된 위치 카드 */}
            {selectedLocation && (
                <div
                    className="map-card-overlay"
                    onClick={() => {
                        if (selectedLocation.placeType === "stay") {
                            navigate(`/stays/${selectedLocation?.id}`);
                        }
                    }}
                    style={{
                        cursor: selectedLocation.placeType === "stay" ? "pointer" : "default"
                    }}
                >
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
                                            <div className={`title-icon ${getStayType(selectedLocation.stayType)}-icon`}></div>
                                            <span className="mb-0 title-text">{selectedLocation.name}</span>
                                        </div>
                                        <div className="d-flex align-items-center mb-4">
                                            <span className="star-rating me-1">★</span>
                                            <span className="star-rating-text">({selectedLocation.rating || '4.5'}/5)</span>
                                        </div>
                                        <div className="text-end pe-1">
                                            <span className="price-text pe-1">₩ {selectedLocation.lowestPrice?.toLocaleString()}</span>
                                            <span className="standard-text">(1박당 요금)</span>
                                        </div>
                                    </div>
                                </>
                            ) : (
                                <>
                                    <div className="col-12">
                                        <div className={`d-flex align-items-center ${selectedLocation.placeType === 'activity' ? 'mb-2' : 'mb-1'}`}>
                                            <div className={`title-icon ${selectedLocation.placeType}-icon`}></div>
                                            <h4 className="mb-0 title-text">{selectedLocation.name}</h4>
                                        </div>

                                        {selectedLocation.placeType === "restaurant" ? (
                                            <>
                                                <div className="d-flex align-items-center mb-3">
                                                    <span className="star-rating me-1">★</span>
                                                    <span className="star-rating-text">({selectedLocation.rating || '4.5'}/5)</span>
                                                </div>
                                            </>
                                        ) : (
                                            <>
                                                <div className="d-flex align-items-center text-muted">
                                                    <span className="location-icon me-1"></span>
                                                    <span className="location-text">
                                                        {selectedLocation.address}<br/>{selectedLocation.name}
                                                    </span>
                                                </div>
                                            </>
                                        )}

                                        <div className="text-end">
                                            <button className="btn btn-search"
                                                    onClick={() => {
                                                        const url = `https://map.kakao.com/link/map/${selectedLocation?.name},${selectedLocation?.latitude},${selectedLocation?.longitude}`;
                                                        window.open(url, '_blank');
                                                    }}>검색</button>
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
                        <div className="animate-spin rounded-full h-12 w-12 border-4 border-blue-600 border-t-transparent mx-auto mb-4"></div>
                        {/*<p className="text-gray-600 font-medium">지도를 불러오는 중...</p>*/}
                    </div>
                </div>
            )}
        </div>
    );
};

export default MapContent;