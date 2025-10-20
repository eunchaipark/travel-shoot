import React, {useState} from 'react';
import SimpleHeader from '@/components/layout/SimpleHeader';
import {useReservationDetail} from '@/hooks/useReservationDetail';
import CourseMap from '@/components/reservation/CourseMap';
import 'bootstrap/dist/css/bootstrap.min.css';
import '@/assets/css/reservation.css';
import SearchMapModal from '@/components/modals/SearchMapModal';

const ReservationDetailPage = () => {
    const [activeDay, setActiveDay] = useState(1);
    const [showSearchMap, setShowSearchMap] = useState(false);
    const [editingSpotId, setEditingSpotId] = useState(null);

    // URL에서 reservationId 가져오기
    const queryParams = new URLSearchParams(window.location.search);
    const reservationId = queryParams.get('reservationId');

    // 커스텀 훅으로 데이터 관리
    const { reservationData, courseData, loading, error, refetchCourseData } = useReservationDetail(reservationId);

    const handleCopyAddress = (address) => {
        navigator.clipboard.writeText(address);
        alert('주소가 복사되었습니다.');
    };

    const getSpotTypeClass = (spotType) => {
        return spotType === '맛집' ? 'course-restaurant' : 'course-attraction';
    };

    // 로딩 중
    if (loading) {
        return (
            <>
                <SimpleHeader/>
                <main className="content-area">
                    <div className="container text-center py-5">
                        <div>로딩 중...</div>
                    </div>
                </main>
            </>
        );
    }

    // 에러 발생
    if (error) {
        return (
            <>
                <SimpleHeader/>
                <main className="content-area">
                    <div className="container text-center py-5">
                        <div className="text-danger">{error}</div>
                    </div>
                </main>
            </>
        );
    }

    return (
        <>
            <SimpleHeader/>

            <main className="content-area reservation-detail-page">
                <div className="container">
                    <div className="row">
                        {/* 예약 완료 섹션 */}
                        <div className="col-12 content-section">
                            <div className="content-section-state-inner">
                                <div className="content-section-title mb-4">
                                    예약 완료
                                    <span className="reservation-number">
                                        (숙소 예약 번호 : {reservationData?.reservationNumber})
                                    </span>
                                </div>
                                <div className="col-12 reservation-complete d-flex">
                                    <div className="col-6 d-flex justify-content-start">
                                        <input
                                            type="button"
                                            value="후기 작성하기"
                                            className="review-btn"
                                        />
                                    </div>
                                    <div className="col-6 d-flex justify-content-end">
                                        <input
                                            type="button"
                                            value="다시 예약하기"
                                            className="re-reservation-btn"
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>

                        {/* 숙소 정보 섹션 */}
                        <div className="col-lg-7 col-12 content-section">
                            <div className="content-section-inner">
                                <div className="content-section-title mb-3">숙소</div>

                                <div className="row align-items-center">
                                    <div className="col-12">
                                        <span className="lodging-caption">
                                            • 숙소와 날짜를 다시 한번 확인하세요
                                        </span>
                                    </div>
                                    <div className="col-auto lodging-image-con">
                                        <img
                                            src={reservationData?.lodgingImage}
                                            alt={reservationData?.lodgingName}
                                            className="lodging-image"
                                        />
                                    </div>
                                    <div className="col">
                                        <div className="row lodging-info">
                                            <div className="col-12 mb-3">
                                                <h5 className="mb-3 mt-2 fw-bold">
                                                    {reservationData?.lodgingName}
                                                </h5>

                                                <div className="row small-text mb-2">
                                                    <div className="col-5">
                                                        <div className="mb-1">체크인</div>
                                                        <div className="fw-bold">
                                                            {reservationData?.checkIn.date}
                                                        </div>
                                                        <div className="fw-bold">
                                                            {reservationData?.checkIn.time}
                                                        </div>
                                                    </div>
                                                    <div className="col-2 reservation-detail-arrow-con">
                                                        <div className="reservation-detail-arrow"></div>
                                                    </div>
                                                    <div className="col-5">
                                                        <div className="mb-1">체크아웃</div>
                                                        <div className="fw-bold">
                                                            {reservationData?.checkOut.date}
                                                        </div>
                                                        <div className="fw-bold">
                                                            {reservationData?.checkOut.time}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="col-xl-5 mb-3 text-end">
                                                <div className="price-highlight text-nowrap">
                                                    <span className="small-text me-2 mb-1 standard">
                                                        숙박/1박당
                                                    </span>
                                                    ₩ {reservationData?.pricePerNight.toLocaleString()}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        {/* 결제 정보 섹션 */}
                        <div className="col-lg-5 col-12 p-0">
                            <div className="ms-3 content-section">
                                <div className="content-section-inner">
                                    <div className="content-section-title mb-4">결제 정보</div>

                                    <div className="mb-3">
                                        <div className="mb-2 room-night-summary">
                                            객실 {reservationData?.numberOfRooms}개 x {reservationData?.numberOfNights}박
                                        </div>
                                        <div className="d-flex">
                                            <div className="col-1 pay-line-con">
                                                <div className="vr pay-line"></div>
                                            </div>
                                            <div className="col-11">
                                                <div className="row align-items-center mb-2">
                                                    <div className="col">객실 요금</div>
                                                    <div className="col-auto">
                                                        ₩ {reservationData?.pricePerNight.toLocaleString()}
                                                    </div>
                                                </div>
                                                <div className="row align-items-center mb-2">
                                                    <div className="col">숙박 일수</div>
                                                    <div className="col-auto">
                                                        {reservationData?.numberOfNights}박
                                                    </div>
                                                </div>
                                                <div className="row align-items-center pb-3">
                                                    <div className="col">결제 방법</div>
                                                    <div className="col-auto">
                                                        {reservationData?.paymentMethod}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="payment-info-dotted-line mb-3"></div>
                                        <div className="row align-items-center">
                                            <div className="col">
                                                <strong>최종 가격</strong>
                                            </div>
                                            <div className="col-auto">
                                                <span className="final-price">
                                                    ₩ {reservationData?.totalPrice.toLocaleString()}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        {/* AI 여행 추천 코스 섹션 */}
                        <div className="col-12 content-section">
                            <div className="content-section-inner">
                                <div className="content-section-title mb-3">AI 여행 추천코스</div>

                                {/* 코스 데이터 로딩 중일 때 스켈레톤 */}
                                {!courseData ? (
                                    <div>
                                        {/* Day Tabs Skeleton */}
                                        <ul className="nav nav-pills day-tabs mb-4">
                                            {[1, 2, 3].map((i) => (
                                                <li className="nav-item" key={i}>
                                                    <div className="nav-link" style={{opacity: 0.5}}>
                                                        <div className="day fw-bold">DAY{i}</div>
                                                        <div className="day-desc">로딩중...</div>
                                                    </div>
                                                </li>
                                            ))}
                                        </ul>

                                        {/* Map Skeleton */}
                                        <div className="map-placeholder mb-4" style={{background: '#f0f0f0'}}>
                                            <div className="text-center py-5">
                                                <div className="spinner-border text-secondary" role="status">
                                                    <span className="visually-hidden">Loading...</span>
                                                </div>
                                                <div className="mt-2 text-muted">지도 로딩 중...</div>
                                            </div>
                                        </div>

                                        {/* Course Items Skeleton */}
                                        <div className="course-list">
                                            {[1, 2, 3, 4].map((i) => (
                                                <div className="course-item" key={i} style={{opacity: 0.6}}>
                                                    <div className="course-number course-attraction">{i}</div>
                                                    <div className="course-content">
                                                        <div className="course-title">
                                                            <div
                                                                style={{
                                                                    height: '20px',
                                                                    width: '70%',
                                                                    background: '#e0e0e0',
                                                                    borderRadius: '4px',
                                                                    marginBottom: '8px'
                                                                }}
                                                            ></div>
                                                        </div>
                                                        <div
                                                            style={{
                                                                height: '16px',
                                                                width: '90%',
                                                                background: '#e0e0e0',
                                                                borderRadius: '4px',
                                                                marginBottom: '8px'
                                                            }}
                                                        ></div>
                                                        <div
                                                            style={{
                                                                height: '16px',
                                                                width: '60%',
                                                                background: '#e0e0e0',
                                                                borderRadius: '4px'
                                                            }}
                                                        ></div>
                                                    </div>
                                                </div>
                                            ))}
                                        </div>
                                    </div>
                                ) : (
                                    // 실제 코스 데이터
                                    <div>
                                        {/* Day Tabs */}
                                        <ul className="nav nav-pills day-tabs mb-4">
                                            {courseData.dailyCourses.map((dailyCourse) => (
                                                <li className="nav-item" key={dailyCourse.day}>
                                                    <a
                                                        className={`nav-link ${activeDay === dailyCourse.day ? 'active' : ''}`}
                                                        href={`#day${dailyCourse.day}`}
                                                        onClick={(e) => {
                                                            e.preventDefault();
                                                            setActiveDay(dailyCourse.day);
                                                        }}
                                                    >
                                                        <div className="day fw-bold">DAY{dailyCourse.day}</div>
                                                        <div className="day-desc">({dailyCourse.date})</div>
                                                    </a>
                                                </li>
                                            ))}
                                        </ul>
                                        {courseData?.dailyCourses.find(dc => dc.day === activeDay)?.spots && (
                                            <CourseMap
                                                spots={courseData.dailyCourses.find(dc => dc.day === activeDay).spots}
                                                stayData={courseData.stay}
                                            />
                                        )}
                                        {/* Course Items */}
                                        <div className="course-list">
                                            {courseData.dailyCourses
                                                .find(dc => dc.day === activeDay)
                                                ?.spots.map((spot) => (
                                                    <div className="course-item" key={spot.spotId}>
                                                        <div
                                                            className={`course-number ${getSpotTypeClass(spot.spotType)}`}>
                                                            {spot.order}
                                                        </div>
                                                        <div className="course-content">
                                                            <div
                                                                className="course-title d-flex flex-column justify-content-between flex-sm-row">
                                                                <div>
                                                                    <span className="me-1 mb-1 mb-sm-0">
                                                                        [{spot.startTime.slice(0, 5)}~{spot.endTime.slice(0, 5)}]
                                                                    </span>
                                                                    <span className="me-1 mb-1 mb-sm-0">
                                                                        {spot.spotName}
                                                                    </span>
                                                                    <span className="course-time">
                                                                        {spot.spotType} | {spot.type}
                                                                    </span>
                                                                </div>
                                                                <div>
                                                                    <button onClick={() => {
                                                                        setEditingSpotId(spot.spotId);
                                                                        setShowSearchMap(true);
                                                                    }} className="edit-btn">
                                                                        수정하기
                                                                    </button>
                                                                </div>
                                                            </div>

                                                            <div className="course-description">
                                                                {spot.aiComment}
                                                            </div>
                                                            <div className="course-location">
                                                                <div className="location-icon"></div>
                                                                {spot.address}
                                                                <div
                                                                    className="copy-btn-con"
                                                                    onClick={() => handleCopyAddress(spot.address)}
                                                                    style={{cursor: 'pointer'}}
                                                                >
                                                                    <div className="copy-image"></div>
                                                                    <span className="copy-btn">복사</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                ))}
                                        </div>
                                    </div>
                                )}
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <SearchMapModal
                isOpen={showSearchMap}
                onClose={() => {
                    setShowSearchMap(false);
                    setEditingSpotId(null);
                }}
                spotId={editingSpotId}
                onUpdateSuccess={refetchCourseData}
            />
        </>
    );
};

export default ReservationDetailPage;