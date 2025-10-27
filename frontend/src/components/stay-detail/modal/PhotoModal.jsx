import { useEffect, useMemo, useState } from "react";
import { getAllStayImages } from "@/services/stay-detail/stayDetailApiService";

const PhotoModal = ({stayId}) => {

  const [stayImages, setStayImages] = useState([]);
  const [mainImg, setMainImg] = useState(null);

  const changeMainImage = (i) => {
    setMainImg(stayImages[i])
  }

  const fetchStayImages = async() => {
    if(!stayId) return;

    try{
      const response = await getAllStayImages(stayId);
      console.log(response);
      setStayImages(response);
      
    }catch(error){
        console.error("숙소 이미지 조회 실패");
      }
  }

  useEffect(()=>{
    fetchStayImages();
  }, [stayId])

  useEffect(() => {
    if(stayImages.length > 0 && !mainImg){
      setMainImg(stayImages[0]);
    }
  }, [stayImages])


  return (
    <div className="photo-modal modal fade" id="galleryModal" tabIndex="-1" aria-labelledby="photoModalLabel" aria-hidden="true">
      <div className="modal-dialog modal-lg modal-dialog-centered">
        <div className="modal-content">
          <div className="modal-header border-0">
            <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div className="modal-body">
            <div className="row">
              <div className="col-12 mb-4 pt-2">
                <div className="modal-main-image-container">
                  <img src={mainImg.s3Url}
                    alt="메인 사진" className="modal-main-display-image" id="mainImage" />
                </div>
              </div>

              <div className="col-12 pb-4">
                <div className="modal-thumbnails-scroll-container">
                  <div className="modal-thumbnails-flex-wrapper">
                    {
                      stayImages.map((img, i) => (
                        <img key={i} src={img.s3Url}
                          alt={`썸네일${i}`} className={"modal-gallery-thumbnail-image"+(mainImg===img?" active":"")}
                          onClick={()=>changeMainImage(i)} />
                      ))
                    }
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default PhotoModal;