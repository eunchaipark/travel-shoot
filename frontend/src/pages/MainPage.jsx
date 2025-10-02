import {useState} from 'react';
import {useNavigate, Link} from 'react-router-dom';
import Header from '@/components/layout/Header';
import MapModal from '@/components/modals/MapModal';
import '@/assets/css/common.css';

function MainPage() {
    const [showMap, setShowMap] = useState(false);

    const locationData = [
        {
            seq: 1,
            location_y: 37.5665,
            location_x: 126.9780,
            tag_id: "서울타워",
            sisul_status: 1
        },
        // ... more data
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

export default MainPage;