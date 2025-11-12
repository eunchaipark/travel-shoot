const InformationCard = ({information}) => {
    return (
        <div className="card mb-4 card-section-border">
            <div className="card-body px-4 py-4">
                <h5 className="card-title mt-2 mb-4 fw-bold">숙소 소개</h5>
                <p className="text-muted room-content">
                    {information}
                </p>
            </div>
        </div>
    )
}

export default InformationCard;