// components/common/CourseMap.jsx
import React from 'react';
import { useKakaoMap } from '@/hooks/useKakaoMap';
import '@/assets/css/map.css';

const CourseMap = ({ spots = [], stayData = null }) => {
    const { mapRef, kakaoLoaded, selectedLocation } = useKakaoMap(true, spots, stayData);

    return (
        <div className="map-page position-relative" style={{ height: '400px', marginBottom: '20px' }}>
            <div ref={mapRef} className="w-100 h-100" style={{ borderRadius: '8px' }} />

            {/* 선택된 장소 카드 */}
            {selectedLocation && (
                <div className="map-card-overlay">
                    <div className="card card-custom">
                        <div className="d-flex align-items-center h-100">
                            <div className="col-12 p-3">
                                {/* 숙소 카드 */}
                                {selectedLocation.name && !selectedLocation.spotType ? (
                                    <>
                                        <div className="d-flex align-items-center mb-2">
                                            <div className="title-icon stay-icon me-2"></div>
                                            <h5 className="mb-0 title-text">{selectedLocation.name}</h5>
                                        </div>
                                        <span className="badge bg-success mb-2">숙소</span>
                                        <div className="d-flex align-items-start text-muted">
                                            <span className="location-icon me-2"></span>
                                            <span className="location-text" style={{ fontSize: '0.85rem' }}>
                                                {selectedLocation.address}
                                            </span>
                                        </div>
                                    </>
                                ) : (
                                    /* 코스 카드 */
                                    <>
                                        <div className="d-flex align-items-center mb-2">
                                            <div className={`title-icon ${selectedLocation.spotType === '맛집' ? 'restaurant' : 'activity'}-icon me-2`}></div>
                                            <h5 className="mb-0 title-text">{selectedLocation.spotName}</h5>
                                        </div>

                                        <div className="d-flex align-items-center mb-2">
                                            <span className="badge bg-primary me-2">{selectedLocation.order}번째</span>
                                            <span className="badge bg-secondary me-2">
                                                {selectedLocation.startTime?.slice(0, 5)} ~ {selectedLocation.endTime?.slice(0, 5)}
                                            </span>
                                            <span className="badge bg-info">{selectedLocation.spotType}</span>
                                        </div>

                                        <p className="mb-2" style={{ fontSize: '0.9rem' }}>
                                            {selectedLocation.aiComment}
                                        </p>

                                        <div className="d-flex align-items-start text-muted">
                                            <span className="location-icon me-2"></span>
                                            <span className="location-text" style={{ fontSize: '0.85rem' }}>
                                                {selectedLocation.address}
                                            </span>
                                        </div>
                                    </>
                                )}
                            </div>
                        </div>
                    </div>
                </div>
            )}

            {!kakaoLoaded && (
                <div className="position-absolute top-0 start-0 end-0 bottom-0 d-flex align-items-center justify-content-center bg-light" style={{ borderRadius: '8px' }}>
                    <div className="text-center">
                        <div className="spinner-border text-primary mb-3" role="status">
                            <span className="visually-hidden">Loading...</span>
                        </div>
                        <p className="text-muted">지도를 불러오는 중...</p>
                    </div>
                </div>
            )}
        </div>
    );
};

export default CourseMap;