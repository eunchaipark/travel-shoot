import { useEffect, useRef, useState } from "react";

const PhotoModal = ({stayImages, stayId}) => {

  const [mainImg, setMainImg] = useState(null);
  const [currentIndex, setCurrentIndex] = useState(0);
  const thumbnailRefs = useRef([]);
  
  // 줌 기능을 위한 상태
  const [isZoomed, setIsZoomed] = useState(false);
  // 드래그를 위한 상태
  const [isDragging, setIsDragging] = useState(false);
  const [dragStart, setDragStart] = useState({ x: 0, y: 0 });
  const [imagePosition, setImagePosition] = useState({ x: 0, y: 0 });
  const imageRef = useRef(null);
  // 클릭과 드래그를 구분하기 위한 상태
  const [hasMoved, setHasMoved] = useState(false);

  const changeMainImage = (i) => {
    setMainImg(stayImages[i]);
    setCurrentIndex(i);
    scrollToThumbnail(i);
    setIsZoomed(false); // 이미지 변경 시 줌 해제
    setImagePosition({ x: 0, y: 0 }); // 이미지 위치 초기화
  }

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
      const x = e.clientX - rect.left; // 이미지 내에서 클릭한 x 좌표
      const y = e.clientY - rect.top;  // 이미지 내에서 클릭한 y 좌표
      
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
      setHasMoved(false); // 드래그 시작 시 이동 여부 초기화
      setDragStart({
        x: e.clientX - imagePosition.x,
        y: e.clientY - imagePosition.y
      });
      e.preventDefault(); // 기본 드래그 동작 방지
    }
  };

  // 마우스 드래그 중
  const handleMouseMove = (e) => {
    if (isDragging && isZoomed) {
      setHasMoved(true); // 마우스가 움직였음을 표시
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
      setHasMoved(false); // 드래그 시작 시 이동 여부 초기화
      setDragStart({
        x: touch.clientX - imagePosition.x,
        y: touch.clientY - imagePosition.y
      });
    }
  };

  // 터치 드래그 중 (모바일)
  const handleTouchMove = (e) => {
    if (isDragging && isZoomed) {
      setHasMoved(true); // 터치가 움직였음을 표시
      const touch = e.touches[0];
      setImagePosition({
        x: touch.clientX - dragStart.x,
        y: touch.clientY - dragStart.y
      });
      e.preventDefault(); // 스크롤 방지
    }
  };

  // 터치 드래그 종료 (모바일)
  const handleTouchEnd = () => {
    setIsDragging(false);
  };

  
  useEffect(() => {
    if(stayImages.length > 0 && !mainImg){
      setMainImg(stayImages[0]);
      setCurrentIndex(0);
    }
  }, [stayImages])

  // 모달이 열릴 때 data-index를 읽어서 해당 이미지를 메인으로 설정
  useEffect(() => {
    const modalElement = document.getElementById('galleryModal');
    
    // 모달 열리기 시작할 때: 메인 이미지만 설정
    const handleModalShow = (event) => {
      const triggerElement = event.relatedTarget;
      
      if (triggerElement) {
        const index = triggerElement.getAttribute('data-index');
        if (index !== null) {
          const imgIndex = parseInt(index);
          setMainImg(stayImages[imgIndex]);
          setCurrentIndex(imgIndex);
        }
      }
    };

    // 모달 완전히 열린 후: 썸네일 스크롤 이동
    const handleModalShown = () => {
      scrollToThumbnail(currentIndex);
    };

    // 모달 닫힐 때: 줌 상태 및 위치 초기화
    const handleModalHide = () => {
      setIsZoomed(false);
      setImagePosition({ x: 0, y: 0 });
      setHasMoved(false);
    };

    if (modalElement) {
      modalElement.addEventListener('show.bs.modal', handleModalShow);
      modalElement.addEventListener('shown.bs.modal', handleModalShown);
      modalElement.addEventListener('hide.bs.modal', handleModalHide);
    }

    return () => {
      if (modalElement) {
        modalElement.removeEventListener('show.bs.modal', handleModalShow);
        modalElement.removeEventListener('shown.bs.modal', handleModalShown);
        modalElement.removeEventListener('hide.bs.modal', handleModalHide);
      }
    };
  }, [stayImages, currentIndex]);

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
    <div className="photo-modal modal fade" id="galleryModal" tabIndex="-1" aria-labelledby="photoModalLabel" aria-hidden="true">
      <div className="modal-dialog modal-lg modal-dialog-centered">
        <div className="modal-content">
          <div className="modal-header border-0">
            {/* 이미지 카운터 - 현재 몇 번째 이미지인지 표시 */}
            <div className="image-counter">
              <i className="bi bi-images me-2"></i>
              <span>{currentIndex + 1} / {stayImages.length}</span>
            </div>
            <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div className="modal-body">
            <div className="row">
              <div className="col-12 mb-4 pt-2">
                <div 
                  className="modal-main-image-container"
                  onMouseMove={handleMouseMove}
                  onMouseUp={handleMouseUp}
                  onMouseLeave={handleMouseUp} // 컨테이너 밖으로 나가면 드래그 종료
                >
                  {/* 메인 이미지 - 클릭하면 줌 토글, 줌 상태에서 드래그 가능 */}
                  <img 
                    ref={imageRef}
                    src={mainImg?.s3Url}
                    alt="메인 사진" 
                    className={`modal-main-display-image ${isZoomed ? 'zoomed' : ''} ${isDragging ? 'dragging' : ''}`}
                    id="mainImage"
                    loading="eager"
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

              <div className="col-12 pb-4">
                <div className="modal-thumbnails-scroll-container">
                  <div className="modal-thumbnails-flex-wrapper">
                    {
                      stayImages?.map((img, i) => (
                        <img 
                          key={i} 
                          ref={(el) => (thumbnailRefs.current[i] = el)}
                          src={img.s3Url}
                          alt={`썸네일${i}`} 
                          className={"modal-gallery-thumbnail-image"+(mainImg===img?" active":"")}
                          onClick={()=>changeMainImage(i)}
                          loading="lazy"
                          style={{ cursor: 'pointer' }}
                        />
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