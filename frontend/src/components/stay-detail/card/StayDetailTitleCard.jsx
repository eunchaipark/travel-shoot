import { useEffect, useState } from "react";
import { formatNumber } from "@/utils/stay/StayDetailUtils";
// import Lottie from "lottie-react";
import animation from "@/utils/stay/effect/ClickEffect.json";

const StayDetailTitleCard = ({ hotelName, address, price, like }) => {
    const [isLike, setIsLike] = useState(false);
    useEffect(() => {
        like();
    }, [isLike])


    const handleShare = () => {
        const url = window.location.href;
        
        if (navigator.share) {
            navigator.share({
                title: hotelName,
                text: address,
                url: url
            }).catch(() => {});
        } else {
            navigator.clipboard.writeText(url).then(() => {
                alert('링크가 복사되었습니다!');
            });
        }
    };

    
    const copyToClipboard = async (text) => {
        try {
            await navigator.clipboard.writeText(text);
            alert('링크가 복사되었습니다!');
        } catch (err) {
            // Fallback: 텍스트 선택 방식
            const textArea = document.createElement('textarea');
            textArea.value = text;
            textArea.style.position = 'fixed';
            textArea.style.opacity = '0';
            document.body.appendChild(textArea);
            textArea.select();
            try {
                document.execCommand('copy');
                alert('링크가 복사되었습니다!');
            } catch (e) {
                alert('복사에 실패했습니다.');
            }
            document.body.removeChild(textArea);
        }
    };

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
                        </button>
                        <button className="share-btn" onClick={handleShare}>
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