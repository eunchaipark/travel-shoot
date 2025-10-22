import { useEffect, useState } from "react";
import Header from "../../components/stay-detail/Header";
import MainContent from "../../components/stay-detail/MainContent";
import PhotoModal from '../../components/stay-detail/modal/PhotoModal';
import mockData from './mockData.json';
import "../../assets/css/stay-detail.css";

export default function StayDetailPage() {
  const [data, setData] = useState(mockData);
  const getStayDetailData = async () => {


    //const res = await axios.get(``);
    //res.code >= 200 ? setData(res.data) : mockData;
  }
  useEffect(()=>{
    getStayDetailData();
  },[])
  return (
    <>
      <Header />
      <main>
        <MainContent data={data}/>
      </main>
      <PhotoModal imgs={data.stayImages} />
    </>
  )
}