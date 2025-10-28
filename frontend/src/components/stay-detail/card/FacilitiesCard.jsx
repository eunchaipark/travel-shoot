const FacilitiesCard = ({ services }) => {
    const iconSelector = (name) => {
        switch(name){
            case "얼리 체크인": return "clock"
            case "주차장": return "car-front"
            case "조식 포함": return "cup-hot"
            case "금연": return "ban"
            case "OTT 가능": return "tv"
            case "반려동물 동반": return "heart"
            case "장애인용 편의시설": return "universal-access"
            case "공항 이동 교통편": return "airplane"
            case "수영장": return "water"
            case "피트니스 센터": return "heart-pulse"
            case "사우나": return "thermometer-sun"
            case "야외 공간": return "tree"
            case "장애인용 편의 시설": return "person-wheelchair"
        }
    }    
    return (
        <div className="card-body">
            <h5 className="card-title mt-2 mb-4 fw-bold">
                편의 시설/서비스
            </h5>
            <div className="row ms-1">
                {services.map((data, i) => (
                    <div key={i} className="col-lg-3 col-md-4 col-6 mb-2">
                        <i className={"bi bi-"+iconSelector(data.amenityName)+" facility-icon me-2"}></i>
                        <small>{data.amenityName}</small>
                    </div>
                ))}
            </div>
        </div>
    )
}

export default FacilitiesCard;