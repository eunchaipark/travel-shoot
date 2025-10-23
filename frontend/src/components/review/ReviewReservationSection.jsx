
const ReviewReservationSection = ({reservationInfo}) => {

    const {
        stayName,
        reservationStatus,
        checkInDate,
        checkOutDate,
        reservationCode,
        totalNights,
        guestCount,
        checkInTime,
        checkOutTime,
        roomName
    } = reservationInfo;

    return (
        <section className="accommodation-info-section">
            <div className="reservation-number">
                <span className="reservation-value">숙소 예약번호: {reservationCode}</span>
                <div className="accommodation-card">
                    <div className="accommodation-image-wrapper">
                        <img src="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-a1WFmEoMhiDZS9ne7Bn747Fu6iMNWH.png" alt={stayName} className="accommodation-image" />
                    </div>
                    <div className="accommodation-details">
                        <div className="accommodation-header">
                            <h2 className="accommodation-name">{stayName}</h2>
                            <span className="status-badge">{reservationStatus}</span>
                        </div>
                        <div className="booking-details">
                            <div className="booking-item">
                                <i className="fas fa-calendar-alt booking-icon calendar-icon"></i>
                                {/* <span className="booking-text">2025.04.21 ~ 04.22 (1박)</span> */}
                                <span className="booking-text">{checkInDate} ~ {checkOutDate} {`(${totalNights}박)`}</span>
                            </div>
                            <div className="booking-item">
                                <i className="fas fa-users booking-icon users-icon"></i>
                                <span className="booking-text">성인 {guestCount}명 · {roomName}</span>
                            </div>
                            <div className="booking-item">
                                <i className="fas fa-clock booking-icon clock-icon"></i>
                                <span className="booking-text">체크인 {checkInTime.slice(0,5)} | 체크아웃 {checkOutTime.slice(0,5)}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    )

}

export default ReviewReservationSection;