const HotelGallery = ({ imgs }) => {

    // 이미지가 없거나 배열이 아닌 경우 처리
    if (!imgs || !Array.isArray(imgs) || imgs.length === 0) {
        return null;
    }

    // 일단은 머지 받고, 처리 안될 시 thumbnails 가 5개 이상일 때만 렌더링

    return (

        <div className="row g-2 mb-4 mt-2">
            <div className="col-md-6">
                <img src={imgs[0]?.s3Url} alt={`${imgs[0]?.fileId}`}
                    className="img-fluid rounded w-100 gallery-trigger" style={{ height: 300, objectFit: 'cover' }}
                    data-index="0" />
            </div>

            {/* 나머지 이미지들 (최대 4개) */}
            <div className="col-md-6">
                <div className="row g-2">
                    {imgs.slice(1, 5).map((img, index) => {
                        const actualIndex = index + 1; // 실제 imgs 배열에서의 인덱스
                        const isLastSlot = index === 3; // 4번째 슬롯인지 확인

                        // 마지막 슬롯 이미지 경우
                        if (isLastSlot) {
                            return (
                                <div
                                    key={actualIndex}
                                    className="col-6 position-relative"
                                    data-bs-toggle="modal"
                                    data-bs-target="#galleryModal"
                                    data-index={actualIndex}
                                >
                                    <img
                                        src={img.s3Url}
                                        alt={`숙소 이미지 ${actualIndex + 1}`}
                                        className="img-fluid rounded w-100"
                                        style={{ height: 146, objectFit: 'cover' }}
                                    />
                                    <div className="position-absolute top-50 start-50 translate-middle">
                                        <div className="gallery-overlay">
                                            <i className="bi bi-images"></i>
                                            <span>사진 더보기</span>
                                        </div>
                                    </div>
                                </div>
                            );
                        }

                        // 일반 이미지
                        return (
                            <div key={actualIndex} className="col-6">
                                <img
                                    src={img.s3Url}
                                    alt={`숙소 이미지 ${actualIndex + 1}`}
                                    className="img-fluid rounded w-100"
                                    style={{ height: 146, objectFit: 'cover'}}
                                    // data-bs-toggle="modal"
                                    // data-bs-target="#galleryModal"
                                    data-index={actualIndex}
                                />
                            </div>
                        );
                    })}
                </div>
            </div>
        </div>
    )
}

export default HotelGallery;