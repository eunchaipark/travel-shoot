import { useEffect, useState } from "react";
import { formatNumber } from "@/utils/stay/StayDetailUtils";
// import Lottie from "lottie-react";
import animation from "@/utils/stay/effect/ClickEffect.json";

const StayDetailTitleCard = ({ hotelName, address, price, like }) => {
    const [isLike, setIsLike] = useState(false);
    useEffect(() => {
        like();
    }, [isLike])
    return (
        <div className="card-body">
            <div className="d-flex">
                <div className="col-8">
                    <div className="card-title mt-2 mb-2 fw-bold">
                        {hotelName}
                    </div>
                    <div className="hotel-location">
                        <div className="location-icon"></div>
                        {address}
                    </div>
                </div>
                <div className="col-4">
                    <div className="action-buttons mb-2 mt-1">
                        <button style={{position:'relative'}} onClick={() => setIsLike(!isLike)} className="heart-btn">
                            <i className={"bi bi-heart" + (isLike ? "-fill" : "")}></i>
                            {/* {isLike&&
                            <Lottie style={{position:'absolute', top:-5,left:-1, scale:4.5}} animationData={animation} loop={false} />
                            } */}
                        </button>
                        <button className="share-btn">
                            <i className="bi bi-share"></i>
                        </button>
                    </div>
                    <div className="price-section">
                        <div className="price-label">1박 평균</div>
                        <div className="price-amount">₩ {formatNumber(price)}</div>
                    </div>
                </div>
            </div>
        </div>
    )
}
export default StayDetailTitleCard;