import { useEffect, useRef, useState } from "react";
import "@/assets/css/review-list.css";

const ReviewPhotoModal = ({images, selectedIndex}) => {

  const [mainImage, setMainImage] = useState(images?.[0] || "");
  const [activeIndex, setActiveIndex] = useState(0);
  const thumbnailRefs = useRef([]); // 썸네일 ref 배열
  
  // 줌 기능을 위한 상태
  const [isZoomed, setIsZoomed] = useState(false);
  // 드래그를 위한 상태
  const [isDragging, setIsDragging] = useState(false);
  const [dragStart, setDragStart] = useState({ x: 0, y: 0 });
  const [imagePosition, setImagePosition] = useState({ x: 0, y: 0 });
  const imageRef = useRef(null);
  // 클릭과 드래그를 구분하기 위한 상태
  const [hasMoved, setHasMoved] = useState(false);

  // 썸네일 클릭 핸들러
  const handleThumbnailClick = (imageUrl, index) => {
    setMainImage(imageUrl);
    setActiveIndex(index);
    setIsZoomed(false); // 이미지 변경 시 줌 해제
    setImagePosition({ x: 0, y: 0 }); // 이미지 위치 초기화
    scrollToThumbnail(index); // 썸네일 스크롤 이동
  };

  // 썸네일 스크롤 이동 함수
  const scrollToThumbnail = (index) => {
    const thumbnail = thumbnailRefs.current[index];
    if (thumbnail) {
      thumbnail.scrollIntoView({
        behavior: 'smooth',
        block: 'nearest',
        inline: 'center'
      });
    }
  };

  // 줌 토글 함수 - 클릭한 위치를 중심으로 확대
  const toggleZoom = (e) => {
    // 드래그한 경우에는 줌 토글하지 않음
    if (hasMoved) {
      setHasMoved(false);
      return;
    }

    if (!isZoomed) {
      // 확대할 때: 클릭한 위치를 계산하여 해당 부분이 중앙에 오도록 설정
      const rect = imageRef.current.getBoundingClientRect();
      const x = e.clientX - rect.left;
      const y = e.clientY - rect.top;
      
      // 클릭한 지점이 중앙에 오도록 위치 계산 (2배 확대 기준)
      const percentX = x / rect.width;
      const percentY = y / rect.height;
      
      setImagePosition({
        x: (0.5 - percentX) * rect.width,
        y: (0.5 - percentY) * rect.height
      });
      setIsZoomed(true);
    } else {
      // 축소할 때: 줌 해제 및 위치 초기화
      setIsZoomed(false);
      setImagePosition({ x: 0, y: 0 });
    }
  };

  // 마우스 드래그 시작
  const handleMouseDown = (e) => {
    if (isZoomed) {
      setIsDragging(true);
      setHasMoved(false);
      setDragStart({
        x: e.clientX - imagePosition.x,
        y: e.clientY - imagePosition.y
      });
      e.preventDefault();
    }
  };

  // 마우스 드래그 중
  const handleMouseMove = (e) => {
    if (isDragging && isZoomed) {
      setHasMoved(true);
      setImagePosition({
        x: e.clientX - dragStart.x,
        y: e.clientY - dragStart.y
      });
    }
  };

  // 마우스 드래그 종료
  const handleMouseUp = () => {
    setIsDragging(false);
  };

  // 터치 드래그 시작 (모바일)
  const handleTouchStart = (e) => {
    if (isZoomed) {
      const touch = e.touches[0];
      setIsDragging(true);
      setHasMoved(false);
      setDragStart({
        x: touch.clientX - imagePosition.x,
        y: touch.clientY - imagePosition.y
      });
    }
  };

  // 터치 드래그 중 (모바일)
  const handleTouchMove = (e) => {
    if (isDragging && isZoomed) {
      setHasMoved(true);
      const touch = e.touches[0];
      setImagePosition({
        x: touch.clientX - dragStart.x,
        y: touch.clientY - dragStart.y
      });
      e.preventDefault();
    }
  };

  // 터치 드래그 종료 (모바일)
  const handleTouchEnd = () => {
    setIsDragging(false);
  };

  // selectedIndex가 변경될 때 해당 이미지로 전환
  useEffect(() => {
    if (images?.[selectedIndex]) {
      setMainImage(images[selectedIndex]);
      setActiveIndex(selectedIndex);
    }
  }, [selectedIndex, images]);

  // 모달 이벤트 처리
  useEffect(() => {
    const modalElement = document.getElementById('galleryModal');
    
    // 모달 완전히 열린 후: 썸네일 스크롤 이동
    const handleModalShown = () => {
      scrollToThumbnail(activeIndex);
    };

    // 모달 닫힐 때: 줌 상태 및 위치 초기화
    const handleModalHide = () => {
      setIsZoomed(false);
      setImagePosition({ x: 0, y: 0 });
      setHasMoved(false);
    };

    if (modalElement) {
      modalElement.addEventListener('shown.bs.modal', handleModalShown);
      modalElement.addEventListener('hide.bs.modal', handleModalHide);
    }

    return () => {
      if (modalElement) {
        modalElement.removeEventListener('shown.bs.modal', handleModalShown);
        modalElement.removeEventListener('hide.bs.modal', handleModalHide);
      }
    };
  }, [activeIndex]);

  // 드래그 중 마우스가 컨테이너 밖으로 나가도 처리하기 위한 전역 이벤트 리스너
  useEffect(() => {
    if (isDragging) {
      document.addEventListener('mousemove', handleMouseMove);
      document.addEventListener('mouseup', handleMouseUp);
      
      return () => {
        document.removeEventListener('mousemove', handleMouseMove);
        document.removeEventListener('mouseup', handleMouseUp);
      };
    }
  }, [isDragging, dragStart, imagePosition]);

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
            {/* 이미지 카운터 - 현재 몇 번째 이미지인지 표시 */}
            <div className="image-counter">
              <i className="bi bi-images me-2"></i>
              <span>{activeIndex + 1} / {images.length}</span>
            </div>
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
                <div 
                  className="modal-main-image-container"
                  onMouseMove={handleMouseMove}
                  onMouseUp={handleMouseUp}
                  onMouseLeave={handleMouseUp}
                >
                  {/* 메인 이미지 - 클릭하면 줌 토글, 줌 상태에서 드래그 가능 */}
                  <img
                    ref={imageRef}
                    src={mainImage}
                    alt="메인 사진"
                    className={`modal-main-display-image ${isZoomed ? 'zoomed' : ''} ${isDragging ? 'dragging' : ''}`}
                    onClick={toggleZoom}
                    onMouseDown={handleMouseDown}
                    onTouchStart={handleTouchStart}
                    onTouchMove={handleTouchMove}
                    onTouchEnd={handleTouchEnd}
                    style={{ 
                      cursor: isZoomed ? (isDragging ? 'grabbing' : 'grab') : 'zoom-in',
                      transform: isZoomed 
                        ? `scale(2) translate(${imagePosition.x / 2}px, ${imagePosition.y / 2}px)` 
                        : 'scale(1)'
                    }}
                  />
                  {/* 줌 안내 텍스트 - 줌되지 않았을 때만 표시 */}
                  {!isZoomed && (
                    <div className="zoom-hint">
                      <i className="bi bi-zoom-in"></i>
                      <span>클릭하여 확대</span>
                    </div>
                  )}
                </div>
              </div>

              {/* 썸네일 갤러리 */}
              <div className="col-12 pb-4">
                <div className="modal-thumbnails-scroll-container">
                  <div className="modal-thumbnails-flex-wrapper">
                    {images?.map((imageUrl, index) => (
                      <img
                        key={index}
                        ref={(el) => (thumbnailRefs.current[index] = el)}
                        src={imageUrl}
                        alt={`썸네일 ${index + 1}`}
                        className={`modal-gallery-thumbnail-image ${
                          activeIndex === index ? "active" : ""
                        }`}
                        onClick={() => handleThumbnailClick(imageUrl, index)}
                        style={{ cursor: 'pointer' }}
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