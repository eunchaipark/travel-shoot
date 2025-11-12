const HotelGallery = ({ imgs }) => {
    // 이미지가 없거나 배열이 아닌 경우 처리
    if (!imgs || !Array.isArray(imgs) || imgs.length === 0) {
        return null;
    }

    const imageCount = imgs.length; // 이미지 개수 저장

    // 1개일 때: 적절한 높이로 표시
    if (imageCount === 1) {
        return (
            <div className="row g-2 mb-4 mt-2">
                <div className="col-12">
                    <img 
                        src={imgs[0]?.s3Url} 
                        alt={`${imgs[0]?.fileId}`}
                        className="img-fluid rounded w-100 gallery-trigger" 
                        style={{ height: 300, objectFit: 'cover' }}
                        data-bs-toggle="modal" data-bs-target="#galleryModal"
                        data-index="0" 
                    />
                </div>
            </div>                                         
        );
    }

    // 2개일 때: 나란히 2개 배치
    if (imageCount === 2) {
        return (
            <div className="row g-2 mb-4 mt-2">
                {imgs.map((img, index) => (
                    <div key={index} className="col-md-6">
                        <img 
                            src={img.s3Url} 
                            alt={`숙소 이미지 ${index + 1}`}
                            className="img-fluid rounded w-100 gallery-trigger" 
                            style={{ height: 300, objectFit: 'cover' }}
                            data-bs-toggle="modal" data-bs-target="#galleryModal"
                            data-index={index} 
                        />
                    </div>
                ))}
            </div>
        );
    }

    // 3개일 때: 데스크탑(왼쪽 1개, 오른쪽 2개) / 모바일(위 1개, 아래 2개)
    if (imageCount === 3) {
        return (
            <div className="row g-2 mb-4 mt-2">
                <div className="col-md-6 col-12"> {/* 첫 번째 이미지 */}
                    <img 
                        src={imgs[0]?.s3Url} 
                        alt={`${imgs[0]?.fileId}`}
                        className="img-fluid rounded w-100 gallery-trigger gallery-img-main" // 메인 이미지 클래스 추가
                        style={{ height: 300, objectFit: 'cover' }}
                        data-bs-toggle="modal" data-bs-target="#galleryModal"
                        data-index="0" 
                    />
                </div>
                <div className="col-md-6 col-12"> {/* 나머지 2개 이미지 */}
                    <div className="row g-2">
                        {imgs.slice(1, 3).map((img, index) => (
                            <div key={index + 1} className="col-md-12 col-6"> {/* 모바일에서 반반 배치 */}
                                <img 
                                    src={img.s3Url} 
                                    alt={`숙소 이미지 ${index + 2}`}
                                    className="img-fluid rounded w-100 gallery-trigger gallery-img-sub" // 서브 이미지 클래스 추가
                                    style={{ height: 146, objectFit: 'cover' }}
                                    data-bs-toggle="modal" data-bs-target="#galleryModal"
                                    data-index={index + 1} 
                                />
                            </div>
                        ))}
                    </div>
                </div>
            </div>
        );
    }

    // 4개일 때: 데스크탑(왼쪽 1개, 오른쪽 위 2개 + 아래 1개) / 모바일(2x2 그리드)
if (imageCount === 4) {
    return (
        <div className="row g-2 mb-4 mt-2">
            <div className="col-md-6 col-12"> {/* 첫 번째 이미지 */}
                <img 
                    src={imgs[0]?.s3Url} 
                    alt={`${imgs[0]?.fileId}`}
                    className="img-fluid rounded w-100 gallery-trigger gallery-img-main d-md-block d-none" // 데스크탑에서만 표시
                    style={{ height: 300, objectFit: 'cover' }}
                    data-bs-toggle="modal" data-bs-target="#galleryModal"
                    data-index="0" 
                />
            </div>
            <div className="col-md-6 col-12">
                <div className="row g-2">
                    <div className="col-md-6 col-6 d-md-none"> {/* 모바일에서만 표시되는 첫 번째 이미지 */}
                        <img 
                            src={imgs[0]?.s3Url} 
                            alt={`${imgs[0]?.fileId}`}
                            className="img-fluid rounded w-100 gallery-trigger gallery-img-sub"
                            style={{ height: 146, objectFit: 'cover' }}
                            data-bs-toggle="modal" data-bs-target="#galleryModal"
                            data-index="0" 
                        />
                    </div>
                    {/* 데스크탑: 위쪽 2개 / 모바일: 2개 */}
                    {imgs.slice(1, 3).map((img, index) => (
                        <div key={index + 1} className="col-md-6 col-6"> {/* 데스크탑/모바일 모두 반반 */}
                            <img 
                                src={img.s3Url} 
                                alt={`숙소 이미지 ${index + 2}`}
                                className="img-fluid rounded w-100 gallery-trigger gallery-img-sub"
                                style={{ height: 146, objectFit: 'cover' }}
                                data-bs-toggle="modal" data-bs-target="#galleryModal"
                                data-index={index + 1} 
                            />
                        </div>
                    ))}
                    {/* 데스크탑: 아래쪽 1개 (전체 너비) / 모바일: 마지막 1개 (반 너비) */}
                    <div className="col-md-12 col-6"> {/* 데스크탑에서 전체 너비, 모바일에서 반 너비 */}
                        <img 
                            src={imgs[3]?.s3Url} 
                            alt={`숙소 이미지 4`}
                            className="img-fluid rounded w-100 gallery-trigger gallery-img-sub"
                            style={{ height: 146, objectFit: 'cover' }}
                            data-bs-toggle="modal" data-bs-target="#galleryModal"
                            data-index="3" 
                        />
                    </div>
                </div>
            </div>
        </div>
    );
}

    // 5개 이상일 때: 기존 레이아웃 (왼쪽 1개, 오른쪽 4개 + "더보기" 오버레이)
    return (
        <div className="row g-2 mb-4 mt-2">
            <div className="col-md-6 col-12">
                <img 
                    src={imgs[0]?.s3Url} 
                    alt={`${imgs[0]?.fileId}`}
                    className="img-fluid rounded w-100 gallery-trigger gallery-img-main" // 메인 이미지 클래스
                    style={{ height: 300, objectFit: 'cover' }}
                    data-bs-toggle="modal" data-bs-target="#galleryModal"
                    data-index="0" 
                />
            </div>

            <div className="col-md-6 col-12">
                <div className="row g-2">
                    {imgs.slice(1, 5).map((img, index) => {
                        const actualIndex = index + 1;
                        const isLastSlot = index === 3;

                        if (isLastSlot) {
                            return (
                                <div
                                    key={actualIndex}
                                    className="col-md-6 col-6 position-relative"
                                    data-bs-toggle="modal"
                                    data-bs-target="#galleryModal"
                                    data-index={actualIndex}
                                >
                                    <img
                                        src={img.s3Url}
                                        alt={`숙소 이미지 ${actualIndex + 1}`}
                                        className="img-fluid rounded w-100 gallery-img-sub" // 서브 이미지 클래스
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

                        return (
                            <div key={actualIndex} className="col-md-6 col-6">
                                <img
                                    src={img.s3Url}
                                    alt={`숙소 이미지 ${actualIndex + 1}`}
                                    className="img-fluid rounded w-100 gallery-img-sub" // 서브 이미지 클래스
                                    style={{ height: 146, objectFit: 'cover'}}
                                    data-bs-toggle="modal" data-bs-target="#galleryModal"
                                    data-index={actualIndex}
                                />
                            </div>
                        );
                    })}
                </div>
            </div>
        </div>
    );
}

export default HotelGallery;