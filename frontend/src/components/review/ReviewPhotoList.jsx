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
        <h6 className="fw-bold mb-0">숙소 후기사진</h6>
        <button
          className="photo-count-display-button"
          data-bs-toggle="modal"
          data-bs-target="#galleryModal"
          onClick={() => handleImageClick(0)}
        >
          전체 {images.length}개 후기 <i className="fas fa-chevron-right"></i>
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
