const HotelGallery = ({ imgs }) => {
    return (
        <div className="row g-2 mb-4 mt-1">
            <div className="col-md-6">
                <img src={imgs[0]} alt="호텔 객실 바다 전망"
                    className="img-fluid rounded w-100 gallery-trigger" style={{ height: 300, objectFit: 'cover' }}
                    data-bs-toggle="modal" data-bs-target="#galleryModal" data-index="0" />
            </div>
            <div className="col-md-6">
                <div className="row g-2">
                    {
                        imgs.map((img, i) => {
                            if(i > 3 ){
                                return
                            }
                            if (i === 3) {
                                return (
                                    <div className="col-6 position-relative gallery-trigger" data-bs-toggle="modal"
                                        data-bs-target="#galleryModal" data-index="4">
                                        <img src={imgs[i+1]} alt={'img'+i+1}
                                            className="img-fluid rounded w-100" style={{ height: 145, objectFit: 'cover' }} />
                                        <div className="position-absolute top-50 start-50 translate-middle">
                                            <div className="gallery-overlay">
                                                <i className="bi bi-images"></i>
                                                <span>사진 더보기</span>
                                            </div>
                                        </div>
                                    </div>
                                )
                            } else {
                                return (
                                    <div key={i} className="col-6">
                                        <img src={imgs[i+1]} alt={'img'+i+1}
                                            className="img-fluid rounded w-100 gallery-trigger"
                                            style={{ height: 145, objectFit: 'cover' }}
                                            data-bs-toggle="modal" data-bs-target="#galleryModal" data-index={i+1} />
                                    </div>
                                )
                            }
                        }
                        )
                    }


                </div>
            </div>
        </div>
    )
}

export default HotelGallery;