
import AIReviewSummaryCard from "./card/AIReviewSummaryCard";
import FacilitiesCard from "./card/FacilitiesCard";
import HotelMapCard from "./card/HotelMapCard";
import InformationCard from "./card/InformationCard";
import ReservationNoticeCard from "./card/ReservationNoticeCard";
import RoomSelectionCard from "./card/RoomSelectionCard";
import StayDetailTitleCard from "./card/StayDetailTitleCard";

const Container = ({data, searchParams}) => {

    const like = () => {
        console.log('좋아요 기능');
    }

    return (
        <div className="container">
            <div className="row">
                <div className="col-lg-8">
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
                </div>
                <div className="col-lg-4">
                    <AIReviewSummaryCard stayId={data.stayId} score={data.averageRating} reviewCount={data.reviewCount}/>
                    <HotelMapCard stay={data}/>
                </div>
                <RoomSelectionCard searchParams={searchParams} rooms={data.rooms} />
                <ReservationNoticeCard notice={data.reservationNotice}/>
            </div>
        </div>
    )
}

export default Container;