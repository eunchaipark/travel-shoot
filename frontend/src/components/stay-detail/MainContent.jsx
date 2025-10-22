
import Container from "./Container";
import HotelGallery from "./StayDetailImage";


const MainContent = ({data}) => {
    

    return (
        <div className="product-detail-container">
            <div className="container-fluid">
                <HotelGallery imgs={data.stayImages}/>
                <Container data={data}/>
            </div>
        </div>
    )
}

export default MainContent;