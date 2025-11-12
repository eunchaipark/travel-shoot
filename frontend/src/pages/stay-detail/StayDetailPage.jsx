import { useEffect, useState } from "react";
import MainContent from "@/components/stay-detail/MainContent";
import PhotoModal from '@/components/stay-detail/modal/PhotoModal';
import "@/assets/css/stay-detail.css";
import { useParams, useSearchParams } from "react-router-dom";
import { getStayDetail, getAllStayImages } from "@/services/stay-detail/stayDetailApiService";
import Header from '@/components/layout/Header';

const StayDetailPage = () => {

  const { stayId } = useParams();
  const [searchParams]  = useSearchParams();

  const checkIn = searchParams.get('checkIn');
  const checkOut = searchParams.get('checkOut');
  const adults = searchParams.get('adults');
  const children = searchParams.get('children');

  const [stayData, setStayData] = useState(null);
  const [stayImages, setStayImages] = useState([]);

  const fetchData = async () => {
    if (!stayId) return;
    try {
      const [stayResponse, imageResponse] = await Promise.all([
        getStayDetail(stayId, checkIn, checkOut),
        getAllStayImages(stayId),
      ]);
      setStayData(stayResponse);
      setStayImages(imageResponse);
      console.log("숙소 상세:", stayResponse);
      console.log("이미지 목록:", imageResponse);
    } catch (error) {
      console.error("숙소 데이터 병렬 요청 실패:", error);
    }
  };

  useEffect(()=>{
    if(stayId){
      fetchData();
    }
  }, [stayId, checkIn, checkOut]) //아아아아악 화난다...후하
  // }, [stayId])


  return (
    stayData &&
    <>
      <Header />
      <main>
        <MainContent data={stayData} searchParams={{ checkIn, checkOut, adults, children, stayId }}/>
      </main>
      {stayImages && <PhotoModal stayImages={stayImages} stayId={stayId} />}
    </>
  )

}

export default StayDetailPage;