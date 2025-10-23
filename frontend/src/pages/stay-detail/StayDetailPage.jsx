import { useEffect, useState } from "react";
import MainContent from "@/components/stay-detail/MainContent";
import PhotoModal from '@/components/stay-detail/modal/PhotoModal';
import "@/assets/css/stay-detail.css";
import { useParams, useSearchParams } from "react-router-dom";
import { getStayDetail } from "@/services/stay-detail/stayDetailApiService";
import Header from '@/components/layout/Header';

const StayDetailPage = () => {

  const { stayId } = useParams();
  const [searchParams]  = useSearchParams();

  const checkIn = searchParams.get('checkIn');
  const checkOut = searchParams.get('checkOut');
  const adults = searchParams.get('adults');
  const children = searchParams.get('children');

  const [stayData, setStayData] = useState(null);

  // 임시 이미지
  const imageData = [
    "../../../public/images/product/ocean-view-hotel-room-with-balcony.jpg",
        "../../../public/images/product/modern-hotel-lobby-interior.jpg",
        "../../../public/images/product/hotel-room-city-view.png",
        "../../../public/images/product/hotel-bathroom-modern-design.jpg",
        "../../../public/images/product/hotel-dining-area.jpg",
        "../../../public/images/product/ocean-view-hotel-room-with-balcony.jpg",
        "../../../public/images/product/modern-hotel-lobby-interior.jpg"
  ];

  const fetchStayDetail = async() => {

    if (!stayId) return;

    try{
      const response = await getStayDetail(stayId);
      setStayData(response);
      console.log(response);
      

    }catch(error){
      console.error("숙소 조회 실패");
    }
  }

  useEffect(()=>{
    fetchStayDetail();
  }, [stayId])


  return (
    stayData &&
    <>
      <Header />
      <main>
        <MainContent data={stayData} searchParams={{ checkIn, checkOut, adults, children, stayId }}/>
      </main>
      {/* <PhotoModal imgs={stayData.stayImages} /> */}
      <PhotoModal imgs={imageData} />
    </>
  )

}

export default StayDetailPage;