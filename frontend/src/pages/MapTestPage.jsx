import {useState} from 'react';
import Header from '@/components/layout/Header';
import MapModal from '@/components/modals/MapModal';
import '@/assets/css/common.css';

function MapTestPage() {
    const [showMap, setShowMap] = useState(false);

    const locationData = [
        {
            id: 1,
            latitude: 33.24471471,
            longitude: 126.5623172,
            name: "신세계호텔",
            lowestPrice: 376000,
            stayType: "호텔",
            placeType: "stay",
            image: ""
        },
        {
            id: 2,
            latitude: 33.50850354,
            longitude: 126.4707386,
            name: "제이학센",
            lowestPrice: null,
            stayType: null,
            placeType: "restaurant",
            image: ""
        },
        {
            id: 3,
            latitude: 33.51617335,
            longitude: 126.5470457,
            name: "사라봉(모충사)",
            lowestPrice: null,
            stayType: null,
            placeType: "activity",
            image: ""
        }
    ];

    return (
        <>
            <Header/>
            <button onClick={() => setShowMap(true)}>
                <label htmlFor="map-modal" className="btn-withdraw">
                    지도
                </label>
            </button>
            <MapModal
                isOpen={showMap}
                onClose={() => setShowMap(false)}
                locationData={locationData}
                filterParams={{category: 'tourism'}}
            />
        </>
    );
}

export default MapTestPage;