const HotelMapCard = ({latitude, longitude, address}) => {
    return (
        <div className="map-card card mb-4 card-section-border position-sticky">
            <div className="card-body">
                <div className="position-relative">
                    <img src="../img/product/map-showing-hotel-location-in-gangneung-with-red-m.jpg"
                        alt="호텔 위치"
                        className="img-fluid rounded w-100" style={{ height: 250, objectFit: 'cover' }} />
                    <div className="position-absolute top-50 start-50 translate-middle">
                        <div className="map-marker">
                            <i className="bi bi-geo-alt-fill"></i>
                        </div>
                    </div>
                </div>

                <div className="mt-3">
                    <div className="hotel-location">
                        <div className="location-icon"></div>
                        {address}
                    </div>
                </div>
            </div>
        </div>
    )
}
export default HotelMapCard;