import { useEffect } from "react";
import { formatNumber } from "../../../utils/stay/StayDetailUtils";
import { useNavigate } from "react-router-dom";

const RoomSelectionCard = ({ searchParams, rooms }) => {

    const navigate = useNavigate();
    const { stayId, checkIn, checkOut, adults, children } = searchParams;

    // searchParams 에서 LocalDate로 받아온다고 가정
    const checkInDate = new Date("2025-10-27");
    const checkOutDate = new Date("2025-10-29");

    const nights = Number((checkOutDate - checkInDate) / (1000 * 60 * 60 * 24));
    // const nights = (new Date(checkOut) - new Date(checkIn)) / (1000 * 60 * 60 * 24);

    const handleReservation = (roomId) => {
        console.log(`예약 페이지로 이동: roomId:${roomId}`);
        navigate(`/reservation/payment?stayId=${stayId}&checkIn=${checkIn}&checkOut=${checkOut}&adults=${adults}&children=${children}`);
    };


    return (
        <div className="col-lg-8 col-sm-12 mb-4">
            <div className="card card-section-border">
                <div className="card-body px-4 py-4">
                    <h5 className="card-title ms-2 mt-1 mb-4 fw-bold">객실 선택</h5>

                    {rooms.map((room, i) => room.isAvailable&&(
                        <div key={i} className="border rounded p-4 mb-3 room-card">
                            <div className="row align-items-stretch">
                                <div className="col-lg-4 col-md-4 mb-3 mb-md-0">
                                    <img
                                        src="../../../public/images/product/placeholder-room.png"
                                        alt="슈페리어 더블룸"
                                        className="img-fluid rounded room-image w-100 align-self-stretch" />
                                </div>
                                <div className="col-lg-4 col-md-3 mb-lg-0">
                                    <div className="mb-2 fw-bold font-15">{room.roomName}</div>
                                    <div className="room-details text-muted">
                                        <div className="mb-1">
                                            <i className="bi bi-people me-1"></i> 최대 {room.maximumCapacity}인
                                        </div>
                                        {room.singleBedCount!==0&&
                                        <div className="mb-1">
                                            <i class="fa-solid fa-bed me-1"></i> 싱글 {room.singleBedCount}개
                                        </div>}
                                        {room.doubleBedCount!==0&&
                                        <div className="mb-1">
                                            <i class="fa-solid fa-bed me-1"></i> 더블 {room.doubleBedCount}개
                                        </div>}
                                        {room.queenBedCount!==0&&
                                        <div className="mb-1">
                                            <i class="fa-solid fa-bed me-1"></i> 퀸 {room.queenBedCount}개
                                        </div>}
                                        {room.kingBedCount!==0&&
                                        <div className="mb-1">
                                            {/* <img src="../img/product/icon-queen-bed.svg" className="me-1" /> 퀸 {room.kingBedCount}개 */}
                                            <i class="fa-solid fa-bed me-1"></i> 킹 {room.kingBedCount}개
                                        </div>}


                                        <div className="mb-1">
                                            <i className="bi bi-door-open me-1"></i> 침실 {room.bedroomCount}개
                                        </div>
                                        <div className="mb-1">
                                            <img src="../../../../public/images/product/icon-bathroom.svg" className="me-1" /> 욕실 {room.bathroomCount}개
                                        </div>
                                    </div>
                                </div>

                                <div className="col-lg-4 col-md-5 text-md-end text-sm-end mt-md-5">
                                    <div className="room-details text-muted font-12 fw-bold mb-2 dark-gray d-flex justify-content-end">
                                        체크인 {room.checkInTime.substring(-5, 5)} ~ 체크아웃 {room.checkOutTime.substring(-5, 5)}
                                    </div>
                                    <div className="text-muted small d-flex justify-content-end">
                                        <div className="me-2">
                                            {/* <div className="font-12 mb-0 gray">{room.minimumNights}박 평균 {formatNumber((room.weekdayPrice+room.weekendPrice)/2..toString().toLocaleString())}원</div> */}
                                            <div className="font-12 mb-0 gray">{room.minimumNights}박 평균 {formatNumber((room.weekdayPrice).toString().toLocaleString())}원</div>
                                            <div className="price-text">
                                                ₩ {formatNumber(room.weekdayPrice * nights)} <small>/{nights}박</small>
                                            </div>
                                        </div>

                                        {room.roomCount && room.isAvailable ? 
                                            <button className="btn btn-custom fw-bold"
                                                onClick={()=>handleReservation(room.roomId)}>
                                                예약하기
                                            </button> :
                                            <button 
                                                className="btn btn-custom fw-bold"
                                                disabled>
                                                예약마감
                                            </button>

                                    
                                        }
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    )
}

export default RoomSelectionCard;