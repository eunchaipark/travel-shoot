
import Container from "./Container";
import HotelGallery from "./StayDetailImage";


const MainContent = ({data, searchParams}) => {
    
    return (
        <div className="product-detail-container">
            <div className="container-fluid">
                <HotelGallery imgs={data?.stayImages}/>
                <Container data={data} searchParams={searchParams} />
            </div>
        </div>
    )
}

export default MainContent;