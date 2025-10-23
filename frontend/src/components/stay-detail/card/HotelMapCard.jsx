import MapContent from '@/components/map/MapContent';
import { useKakaoMap } from '@/hooks/useKakaoMap';
const HotelMapCard = ({stay}) => {
    const locationData = [{
        latitude: stay.latitude,
        longitude: stay.longitude,
        id: stay.stayId,
        name: stay.stayName,
        placeType: "stay",
    }]
    const { mapRef, kakaoLoaded, selectedLocation } = useKakaoMap(true, locationData, null, true);
    return (
        <div className="map-card card mb-4 card-section-border position-sticky">
            <div className="card-body">
                <div className="position-relative">
                    <div className="map-page main-map-page">
                        <div className="map-container">
                            <MapContent
                                mapRef={mapRef}
                                kakaoLoaded={kakaoLoaded}
                                selectedLocation={selectedLocation}
                            />
                        </div>
                    </div>
                </div>

                <div className="mt-3">
                    <div className="hotel-location">
                        <div className="location-icon"></div>
                        {stay.address}
                    </div>
                </div>
            </div>
        </div>
    )
}
export default HotelMapCard;