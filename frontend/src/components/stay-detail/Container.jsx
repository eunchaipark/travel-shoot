import AIReviewSummaryCard from "./card/AIReviewSummaryCard";
import FacilitiesCard from "./card/FacilitiesCard";
import HotelMapCard from "./card/HotelMapCard";
import InformationCard from "./card/InformationCard";
import ReservationNoticeCard from "./card/ReservationNoticeCard";
import RoomSelectionCard from "./card/RoomSelectionCard";
import StayDetailTitleCard from "./card/StayDetailTitleCard";

const Container = ({data}) => {

    const reservation = (roomCode, roomId) => {
        console.log(`예약합시다 roomCode:${roomCode} roomId:${roomId}`);
    }
    const like = () => {
        console.log('좋아요 기능입니다.');
        
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
                    <AIReviewSummaryCard score={data.averageRating} review={data.overallSummary} totalReview={data.reviewCount}/>
                    <HotelMapCard longitude={data.longitude} latitude={data.latitude} address={data.address}/>
                </div>
                <RoomSelectionCard rooms={data.rooms} reservation={reservation}/>
                <ReservationNoticeCard notice={data.reservationNotice}/>
            </div>
        </div>
    )
}

export default Container;