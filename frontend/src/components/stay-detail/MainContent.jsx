
import Container from "./Container";
import HotelGallery from "./StayDetailImage";

// 임시 이미지
const imageData = [
"../../../public/images/product/ocean-view-hotel-room-with-balcony.jpg",
    "../../../public/images/product/modern-hotel-lobby-interior.jpg",
    "../../../public/images/product/hotel-room-city-view.png",
    "../../../public/images/product/hotel-bathroom-modern-design.jpg",
    "../../../public/images/product/hotel-dining-area.jpg",
    "../../../public/images/product/ocean-view-hotel-room-with-balcony.jpg",
    "../../../public/images/product/modern-hotel-lobby-interior.jpg"
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