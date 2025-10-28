import { useEffect } from "react";
import { formatNumber } from "@/utils/stay/StayDetailUtils";
import { useNavigate } from "react-router-dom";
import { useAuth } from '@/components/context/AuthContext'; //TODO : 1023 김이슬 코드 추가
import useSearchParamsSync from '@/hooks/search/useSearchParamsSync'; //1024 추가

const RoomSelectionCard = ({ searchParams, rooms }) => {

    const navigate = useNavigate();
    const { isAuthenticated, openLoginModal } = useAuth(); //TODO : 1023 김이슬 코드 추가
    const urlParams = useSearchParamsSync(); //1024추가

    // const { stayId, checkIn, checkOut, adults, children } = searchParams; //1024 주석

    // 1024 위에 주석 처리 후 아래 5줄 코드 추가
    const { stayId } = searchParams;
    const checkIn = searchParams.checkIn || urlParams.checkIn;
    const checkOut = searchParams.checkOut || urlParams.checkOut;
    const adults = searchParams.adults || urlParams.adults || 2;
    const children = searchParams.children || urlParams.children || 0;

    // searchParams 에서 LocalDate로 받아온다고 가정
    const checkInDate = new Date(checkIn);
    const checkOutDate = new Date(checkOut);
    const nights = Number((checkOutDate - checkInDate) / (1000 * 60 * 60 * 24));

    // TODO : 윤하님 원래 코드 일단 주석처리
    // const handleReservation = (roomId) => {
    //     console.log(`예약 페이지로 이동: roomId:${roomId}`);
    //     const totalCount = Number(adults) + Number(children);
    //     console.log(totalCount);
    //
    //     navigate(`/reservation/payment?roomId=${roomId}&checkInDate=${checkIn}&checkOutDate=${checkOut}&guestCount=${totalCount}`);
    // };

    // TODO : 1023 김이슬 코드 추가  - confirm 로그인 유무에 따라서 보이기
    const handleReservation = (roomId) => {
        console.log(`예약 페이지로 이동: roomId:${roomId}`);
        const totalCount = Number(adults) + Number(children);
        console.log(totalCount);
        // 로그인 체크
        if (!isAuthenticated) {
            const goToLogin = window.confirm(
                '로그인 후 예약 가능합니다. \n로그인하시겠습니까?'
            );

            if (goToLogin) {
                // 예약 페이지 URL 저장
                const reservationUrl = `/reservation/payment?roomId=${roomId}&checkInDate=${checkIn}&checkOutDate=${checkOut}&guestCount=${totalCount}`;
                sessionStorage.setItem('redirectUrl', reservationUrl);

                // 로그인 모달 열기
                console.log('객실 선택에서 로그인 모달 열기');
                openLoginModal();
            }
            // confirm 취소하면 아무것도 안 함
            return;
        }

        // 로그인 되어있으면 바로 이동
        console.log(`예약 페이지로 이동: roomId:${roomId}`);
        navigate(`/reservation/payment?roomId=${roomId}&checkInDate=${checkIn}&checkOutDate=${checkOut}&guestCount=${totalCount}`);
    };


    return (
        <div className="col-lg-8 col-sm-12 mb-4 room-card-container" >
            {rooms ? 
            <div className="card card-section-border">
                <div className="card-body px-4 py-4">
                    <h5 className="card-title ms-2 mt-1 mb-4 fw-bold">객실 선택</h5>

                    {rooms.map((room, i) => room.isAvailable&&(
                        <div key={i} className="border rounded p-4 mb-3 room-card">
                            <div className="row ">
                                <div className="col-lg-4 col-md-4 mb-3 mb-md-0 stay-img-container">
                                    <img
                                        src={room?.roomImageUrl}
                                        alt="슈페리어 더블룸"
                                        className="img-fluid rounded room-image w-100 h-100 "
                                        style={{objectFit: "cover"}}
                                        />
                                </div>
                                <div className="col-lg-4 col-md-3 mb-lg-0 room-amenities-section d-flex flex-column gap-1">
                                    <div className="mb-2 fw-bold font-15">{room.roomName}</div>
                                    <div className="room-details text-muted gap-1">
                                        <div className="mb-1">
                                            <i className="bi bi-people me-1"></i> 최대 {room.maximumCapacity}인
                                        </div>
                                        {room.singleBedCount!==0&&
                                        <div className="mb-1">
                                            <i className="fa-solid fa-bed me-1"></i> 싱글 {room.singleBedCount}개
                                        </div>}
                                        {room.doubleBedCount!==0&&
                                        <div className="mb-1">
                                            <i className="fa-solid fa-bed me-1"></i> 더블 {room.doubleBedCount}개
                                        </div>}
                                        {room.queenBedCount!==0&&
                                        <div className="mb-1">
                                            <i className="fa-solid fa-bed me-1"></i> 퀸 {room.queenBedCount}개
                                        </div>}
                                        {room.kingBedCount!==0&&
                                        <div className="mb-1">
                                            {/* <img src="../img/product/icon-queen-bed.svg" className="me-1" /> 퀸 {room.kingBedCount}개 */}
                                            <i className="fa-solid fa-bed me-1"></i> 킹 {room.kingBedCount}개
                                        </div>}


                                        <div className="mb-1">
                                            <i className="bi bi-door-open me-1"></i> 침실 {room.bedroomCount}개
                                        </div>
                                        <div className="mb-1">
                                            <img src="/images/product/icon-bathroom.svg" className="me-1" /> 욕실 {room.bathroomCount}개
                                        </div>
                                    </div>
                                </div>

                                <div className="col-lg-4 col-md-5 text-md-end text-sm-end mt-md-5 room-details-container ">
                                    <div className="room-details text-muted font-12 fw-bold mb-2 dark-gray d-flex justify-content-end">
                                        체크인 {room.checkInTime.slice(0, 5)} ~ 체크아웃 {room.checkOutTime.slice(0, 5)}
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
            </div> : <div>객실 정보가 없습니다.</div> }
        </div>
    );
}

export default RoomSelectionCard;