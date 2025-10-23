import { useEffect, useState } from "react";
import "@/assets/css/review-list.css"; // 기존 스타일 유지

const ReviewPhotoModal = ({images, selectedIndex}) => {


  const [mainImage, setMainImage] = useState(images?.[0] || "");
  const [activeIndex, setActiveIndex] = useState(0);

  const handleThumbnailClick = (imageUrl, index) => {
    setMainImage(imageUrl);
    setActiveIndex(index);
  };

   useEffect(() => {
    if (images?.[selectedIndex]) {
      setMainImage(images[selectedIndex]);
      setActiveIndex(selectedIndex);
    }
  }, [selectedIndex, images]);



  return (
    <div
      className="photo-modal modal fade"
      id="galleryModal"
      tabIndex="-1"
      aria-labelledby="galleryModalLabel"
      aria-hidden="true"
    >
      <div className="modal-dialog modal-lg modal-dialog-centered">
        <div className="modal-content">
          <div className="modal-header border-0">
            <button
              type="button"
              className="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>

          <div className="modal-body">
            <div className="row">
              {/* 메인 이미지 */}
              <div className="col-12 mb-4 pt-2">
                <div className="modal-main-image-container">
                  <img
                    src={mainImage}
                    alt="메인 사진"
                    className="modal-main-display-image"
                  />
                </div>
              </div>

              {/* 썸네일 갤러리 */}
              <div className="col-12 pb-4">
                <div className="modal-thumbnails-scroll-container">
                  <div className="modal-thumbnails-flex-wrapper">
                    {images?.map((imageUrl, index) => (
                      <img
                        key={index}
                        src={imageUrl}
                        alt={`썸네일 ${index + 1}`}
                        className={`modal-gallery-thumbnail-image ${
                          activeIndex === index ? "active" : ""
                        }`}
                        onClick={() => handleThumbnailClick(imageUrl, index)}
                      />
                    ))}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>  
    </div>
  );
};

export default ReviewPhotoModal;
