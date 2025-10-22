const ReservationNoticeCard = ({notice}) => {
    return (
        <div className="col-lg-8 col-sm-12">
            <div className="card mb-4 card-section-border">
                <div className="card-body px-4 py-4">
                    <h5 className="card-title mt-2 mb-4 fw-bold">예약 공지</h5>
                    <div className="small text-muted room-content">
                        {notice}
                    </div>
                </div>
            </div>
        </div>
    )
}

export default ReservationNoticeCard;