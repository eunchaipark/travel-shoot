
import Container from "./Container";
import HotelGallery from "./StayDetailImage";

// 임시 이미지
const imageData = [
    "/images/product/ocean-view-hotel-room-with-balcony.jpg",
    "/images/product/modern-hotel-lobby-interior.jpg",
    "/images/product/hotel-room-city-view.png",
    "/images/product/hotel-bathroom-modern-design.jpg",
    "/images/product/hotel-dining-area.jpg",
    "/images/product/ocean-view-hotel-room-with-balcony.jpg",
    "/images/product/modern-hotel-lobby-interior.jpg"
];

const MainContent = ({data, searchParams}) => {
    
    return (
        <div className="product-detail-container">
            <div className="container-fluid">
                {/* <HotelGallery imgs={data.stayImages}/> */}
                <HotelGallery imgs={imageData}/>
                <Container data={data} searchParams={searchParams} />
            </div>
        </div>
    )
}

export default MainContent;