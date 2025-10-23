// components/modals/MapModal.jsx
import React from 'react';
import { useKakaoMap } from '@/hooks/useKakaoMap';
import MapContent from '@/components/map/MapContent';
import '@/assets/css/map.css';

const MapModal = ({ isOpen, onClose, locationData = [], filterParams = {} }) => {
    const { mapRef, kakaoLoaded, selectedLocation } = useKakaoMap(isOpen, locationData);

    if (!isOpen) return null;

    return (
        <>
            <input
                type="checkbox"
                id="map-modal"
                className="modal-checkbox"
                checked={isOpen}
                onChange={() => {}}
            />

            <div className="modal-overlay">
                <div className="map-page modal-content map-modal-content">
                    <div className="modal-header">
                        <h3 className="modal-title">지도</h3>
                        <button onClick={onClose} className="mt-3 modal-close">×</button>
                    </div>

                    <MapContent
                        mapRef={mapRef}
                        kakaoLoaded={kakaoLoaded}
                        selectedLocation={selectedLocation}
                    />
                </div>
            </div>
        </>
    );
};

export default MapModal;