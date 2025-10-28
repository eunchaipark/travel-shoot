import React, { useState } from "react";
import "../../assets/css/review-list.css";
import ReviewPhotoModal from "./ReviewPhotoModal";

const ReviewPhotoList = ({images}) => {

  const [selectedImageIndex, setSelectedImageIndex] = useState(0);

  const handleImageClick = (index) => {
    setSelectedImageIndex(index);
  };

  return (
    <div className="photo-gallery-section">
      <div className="d-flex justify-content-between align-items-center mb-3">
        <div className="fw-bold mb-0">숙소 후기사진</div>
        <button
          className="photo-count-display-button d-flex align-items-center justify-content-between gap-1"
          data-bs-toggle="modal"
          data-bs-target="#galleryModal"
          onClick={() => handleImageClick(0)}
        >
          전체 사진 보기 ({images.length}) <i className="fas fa-chevron-right mt-1"></i>
        </button>
      </div>

      <div className="photo-thumbnails-scroll-container">
        <div className="photo-thumbnails-flex-wrapper">
          {images.map((image, idx) => (
            <div
              key={idx}
              className="photo-thumbnail-item"
              style={{ backgroundImage: `url(${image})` }}
              data-bs-toggle="modal"
              data-bs-target="#galleryModal"
              onClick={() => handleImageClick(idx)}
            ></div>
          ))}
        </div>
      </div>

      <ReviewPhotoModal images={images} selectedIndex={selectedImageIndex}/>
    </div>
  );
};

export default ReviewPhotoList;
