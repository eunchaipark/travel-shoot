import { useMemo, useState } from "react";

const PhotoModal = ({imgs}) => {
  const [mainImg, setMainImg] = useState(imgs[0]);
  const changeMainImage = (i) => {
    setMainImg(imgs[i])
  }
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
                  <img src={mainImg}
                    alt="메인 사진" className="modal-main-display-image" id="mainImage" />
                </div>
              </div>

              <div className="col-12 pb-4">
                <div className="modal-thumbnails-scroll-container">
                  <div className="modal-thumbnails-flex-wrapper">
                    {
                      imgs.map((img, i) => (
                        <img src={img}
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