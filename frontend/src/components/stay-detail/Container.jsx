
import AIReviewSummaryCard from "./card/AIReviewSummaryCard";
import FacilitiesCard from "./card/FacilitiesCard";
import HotelMapCard from "./card/HotelMapCard";
import InformationCard from "./card/InformationCard";
import ReservationNoticeCard from "./card/ReservationNoticeCard";
import RoomSelectionCard from "./card/RoomSelectionCard";
import StayDetailTitleCard from "./card/StayDetailTitleCard";
import PhotoModal from "./modal/PhotoModal";


const Container = ({data, searchParams}) => {

    const like = () => {
        console.log('좋아요 기능');
    }

    return (
        <div className="container">
            <div className="row align-items-stretch">
                <div className="col-lg-8 d-flex flex-column">
                    <div className="card mb-4 card-section-border">
                        <StayDetailTitleCard
                            hotelName={data.stayName}
                            address={data.address}
                            price={data.minPrice} 
                            like={like}/>
                    </div>
                    <div className="card mb-4 card-section-border">
                        <FacilitiesCard services={data.amenities} />
                    </div>

                    <InformationCard information={data.description} />
                    {/* <AIReviewSummaryCard stayId={data.stayId} score={data.averageRating} reviewCount={data.reviewCount}/> */}
                </div>
                <div className="col-lg-4 right-container">
                    <AIReviewSummaryCard stayId={data.stayId} score={data.averageRating} reviewCount={data.reviewCount}/>
                    <HotelMapCard stay={data}/>
                </div>
                
                <RoomSelectionCard searchParams={searchParams} rooms={data.rooms} />
                <ReservationNoticeCard notice={data.reservationNotice}/>
            </div>
            {/* <PhotoModal stayId={data.stayId} /> */}
        </div>
    )
}

export default Container;