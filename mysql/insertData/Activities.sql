use travel_shoot;

SET @creator_id = 1;
SET @bucket_name = 'travelshoot-s3';
TRUNCATE TABLE activities;
TRUNCATE TABLE files;
-- 쇼핑 관광지 이미지 INSERT (file_size = 1)
INSERT INTO activities (region_id, activity_name, activity_type, address, address_detail, latitude, longitude, rating, is_active, created_at) VALUES
(50110, '사라봉(모충사) 의병항쟁기념탑', '사진', '제주특별자치도 제주시 사라봉길 75', '사라봉길', 33.51617335, 126.5470457, 4.23, TRUE, '2025-10-02'),
(50110, '방사탑(제주)', '사진', '제주특별자치도 제주시 조천읍 신흥로1길 25', '조천읍', 33.54749654, 126.6505305, 3.87, TRUE, '2025-10-02'),
(50130, '하멜기념비', '사진', '제주특별자치도 서귀포시 안덕면 사계리 112-3', '안덕면', 33.23374812, 126.31465, 4.15, TRUE, '2025-10-02'),
(50110, '제주해녀항일운동기념탑', '사진', '제주특별자치도 제주시 구좌읍 해녀박물관길 26', '구좌읍', 33.52250274, 126.8639931, 4.56, TRUE, '2025-10-02'),
(50110, '용연구름다리', '사진', '제주특별자치도 제주시 용담이동2581', '용담이동2581', 33.51492852, 126.5143125, 4.78, TRUE, '2025-10-02'),
(50130, '5.16 도로숲터널', '사진', '제주특별자치도 서귀포시 남원읍 신례천로 267-110', '남원읍', 33.31403869, 126.6304292, 4.91, TRUE, '2025-10-02'),
(50130, '송악산전망대', '사진', '제주특별자치도 서귀포시 대정읍 상모리 2-13', '대정읍', 33.19810452, 126.2943831, 4.67, TRUE, '2025-10-02'),
(50110, '답다니탑망대', '사진', '제주특별자치도 제주시 우도면 우도해안길 602', '우도면', 33.52445674, 126.9525853, 4.42, TRUE, '2025-10-02'),
(50130, '제주 글라스하우스', '사진', '제주특별자치도 서귀포시 성산읍 고성리46', '성산읍', 33.42912809, 126.9340141, 4.34, TRUE, '2025-10-02'),
(50130, '거린사슴전망대', '사진', '제주특별자치도 서귀포시 1100로 791 (대포동)', '1100로', 33.30623677, 126.4550112, 3.95, TRUE, '2025-10-02'),
(50130, '호빗집', '사진', '제주특별자치도 서귀포시 남원읍 한남리1429', '남원읍', 33.31265913, 126.6830719, 4.61, TRUE, '2025-10-02'),
(50110, '도두봉전망대', '사진', '제주특별자치도 제주시 도두일동산1', '도두일동산1', 33.50842019, 126.4687472, 4.18, TRUE, '2025-10-02'),
(50130, '가파도 소망전망대', '사진', '제주특별자치도 서귀포시 대정읍 가파리513', '대정읍', 33.1688018, 126.2688166, 4.73, TRUE, '2025-10-02'),
(50130, '새연교', '사진', '제주특별자치도 서귀포시 서홍동', '서홍동', 33.23782931, 126.559612, 4.29, TRUE, '2025-10-02'),
(50130, '선임교', '사진', '제주특별자치도 서귀포시 중문로105번길 37', '중문로105번길', 33.247056, 126.5547484, 3.84, TRUE, '2025-10-02'),
(50110, '추자군도', '레포츠', '제주특별자치도 제주시 추자면 추자로', '추자면', 33.95012969, 126.3095287, 4.52, TRUE, '2025-10-02'),
(50110, '제주항 서부두방파제', '레포츠', '제주특별자치도 제주시 서부두길 22', '서부두길', 33.51816172, 126.5284806, 3.76, TRUE, '2025-10-02'),
(50110, '차귀도 바다낚시', '레포츠', '제주특별자치도 제주시 한경면 고락로 200-52', '한경면', 33.3011473, 126.2053164, 4.08, TRUE, '2025-10-02'),
(50110, '제주청소년수련원', '레포츠', '제주특별자치도 제주시 한림읍 금능남로 128', '한림읍', 33.37761433, 126.2363342, 3.92, TRUE, '2025-10-02'),
(50130, '제주 조랑말타운', '레포츠', '제주특별자치도 서귀포시 표선면 번영로 2486', '표선면', 33.4079306, 126.7722286, 4.45, TRUE, '2025-10-02'),
(50110, '오라컨트리클럽', '레포츠', '제주특별자치도 제주시 오라남로 130-16(오라이동)', '오라남로', 33.44820811, 126.5132502, 4.27, TRUE, '2025-10-02'),
(50130, '캐슬렉스제주 골프클럽', '레포츠', '제주특별자치도 서귀포시 안덕면 평화로 1241', '안덕면', 33.34025634, 126.3488697, 4.69, TRUE, '2025-10-02'),
(50130, '갬주리코지(볼락코지)', '레포츠', '제주특별자치도 서귀포시 대정읍 가파로(대정읍)', '대정읍', 33.17384299, 126.2741882, 3.81, TRUE, '2025-10-02'),
(50110, '홀스랜드(어승생승마장)', '레포츠', '제주특별자치도 제주시 1100로 2659(노형동)', '1100로', 33.42578801, 126.4904194, 4.38, TRUE, '2025-10-02'),
(50130, '오케이 승마장', '레포츠', '제주특별자치도 서귀포시 표선면 번영로 2595', '표선면', 33.40280356, 126.7832056, 4.12, TRUE, '2025-10-02'),
(50130, '알프스승마장 포니', '레포츠', '제주특별자치도 서귀포시 표선면 서성일로 73', '표선면', 33.39845713, 126.8026957, 4.54, TRUE, '2025-10-02'),
(50110, '송당승마장', '레포츠', '제주특별자치도 제주시 구좌읍 번영로 2015', '구좌읍', 33.43647967, 126.7381921, 3.97, TRUE, '2025-10-02'),
(50110, '탐라승마장', '레포츠', '제주특별자치도 제주시 조천읍 비자림로 1044', '조천읍', 33.43306026, 126.7169551, 4.25, TRUE, '2025-10-02'),
(50130, '제주해양레저', '레포츠', '제주특별자치도 서귀포시 중문관광로 192', '중문관광로', 33.24325982, 126.419013, 4.71, TRUE, '2025-10-02'),
(50130, '세계조가비박물관', '문화체험', '제주특별자치도 서귀포시 태평로 284', '태평로', 33.24744479, 126.5516736, 4.33, TRUE, '2025-10-02'),
(50130, '서귀포시립기당미술관', '문화체험', '제주특별자치도 서귀포시 남성중로153번길 15', '남성중로153번길', 33.24479785, 126.5512404, 4.19, TRUE, '2025-10-02'),
(50110, '제주특별자치도민속자연사박물관', '문화체험', '제주특별자치도 제주시 삼성로 40', '삼성로', 33.5064214, 126.5313501, 4.46, TRUE, '2025-10-02'),
(50110, '제주 탑동해변공연장', '문화체험', '제주특별자치도 제주시 중앙로 2', '중앙로', 33.51790613, 126.5243032, 3.88, TRUE, '2025-10-02'),
(50110, '제주문화원', '문화체험', '제주특별자치도 제주시 중앙로 2해변공연장 2층', '중앙로', 33.51790613, 126.5243032, 3.94, TRUE, '2025-10-02'),
(50110, '제주교육박물관', '문화체험', '제주특별자치도 제주시 오복4길 25(이도이동)', '오복4길', 33.49464503, 126.5379248, 4.07, TRUE, '2025-10-02'),
(50130, '한국야구명예전당', '문화체험', '제주특별자치도 서귀포시 중산간서로 97-1(강정동)', '중산간서로', 33.26057306, 126.4984224, 4.58, TRUE, '2025-10-02'),
(50130, '아프리카 박물관', '문화체험', '제주특별자치도 서귀포시 이어도로 49(대포동)', '이어도로', 33.23989924, 126.4290955, 4.22, TRUE, '2025-10-02'),
(50130, '서귀포문화원', '문화체험', '제주특별자치도 서귀포시 이중섭로 33 3층(이중섭창작스튜디오)(서귀동)', '이중섭로', 33.24518413, 126.5644976, 3.91, TRUE, '2025-10-02'),
(50110, '제주항일기념관', '문화체험', '제주특별자치도 제주시 조천읍 신북로 303', '조천읍', 33.54101099, 126.6407703, 4.64, TRUE, '2025-10-02'),
(50130, '테디베어뮤지엄 제주', '문화체험', '제주특별자치도 서귀포시 중문관광로110번길 31(색달동)', '중문관광로110번길', 33.25363354, 126.4102024, 4.77, TRUE, '2025-10-02'),
(50130, '초콜릿 박물관', '문화체험', '제주특별자치도 서귀포시 대정읍 일주서로3000번길 144', '대정읍', 33.25702201, 126.2300235, 4.41, TRUE, '2025-10-02'),
(50110, '국립제주박물관', '문화체험', '제주특별자치도 제주시 일주동로 17 (건입동)', '일주동로', 33.51240158, 126.5492151, 4.85, TRUE, '2025-10-02'),
(50130, '제주민속촌', '문화체험', '제주특별자치도 서귀포시 표선면 민속해안로 631-34', '표선면', 33.3213163, 126.8431023, 4.59, TRUE, '2025-10-02'),
(50110, '동문재래시장', '쇼핑', '제주특별자치도 제주시 관덕로14길 20', '관덕로14길', 33.51156242, 126.5260588, 4.36, TRUE, '2025-10-02'),
(50130, '서귀포매일올레시장', '쇼핑', '제주특별자치도 서귀포시 중앙로62번길 18', '중앙로62번길', 33.25017801, 126.5632364, 4.68, TRUE, '2025-10-02'),
(50110, '이제주숍', '쇼핑', '제주특별자치도 제주시 연삼로 473', '연삼로', 33.49935289, 126.54058, 3.79, TRUE, '2025-10-02'),
(50110, '제주 중앙지하상가', '쇼핑', '제주특별자치도 제주시 중앙로 60', '중앙로', 33.51316777, 126.52467, 4.14, TRUE, '2025-10-02'),
(50110, '한국기념품백화점', '쇼핑', '제주특별자치도 제주시 원노형로 13(노형동)', '원노형로', 33.48742277, 126.4847962, 3.86, TRUE, '2025-10-02'),
(50110, '나이키스포츠신제주대리점', '쇼핑', '제주특별자치도 제주시 신광로 63(연동)', '신광로', 33.48652017, 126.4902208, 4.03, TRUE, '2025-10-02'),
(50130, '고성오일시장', '쇼핑', '제주특별자치도 서귀포시 성산읍 고성오조로 93', '성산읍', 33.45188912, 126.9127293, 4.47, TRUE, '2025-10-02'),
(50130, '표선오일시장', '쇼핑', '제주특별자치도 서귀포시 표선면 표선동서로 203-1', '표선면', 33.32254373, 126.8304061, 4.21, TRUE, '2025-10-02'),
(50130, '대정오일시장', '쇼핑', '제주특별자치도 서귀포시 대정읍 신영로36번길 65(대정읍)', '대정읍', 33.22049299, 126.2483311, 4.09, TRUE, '2025-10-02'),
(50110, '올리브영 제주연동', '쇼핑', '제주특별자치도 제주시 신광로 21 (연동)', '신광로', 33.49016977, 126.4903512, 3.98, TRUE, '2025-10-02'),
(50110, '뉴에라_신제주점', '쇼핑', '제주특별자치도 제주시 신광로 68', '신광로', 33.48623686, 126.4897458, 3.72, TRUE, '2025-10-02'),
(50110, '그라벨호텔_제주점', '쇼핑', '제주특별자치도 제주시 일주서로 7316 1층(외도일동)', '일주서로', 33.49241577, 126.4286649, 4.31, TRUE, '2025-10-02'),
(50110, 'PXG제주', '쇼핑', '제주특별자치도 제주시 연북로 78, 1층(연동, 성남빌딩)', '연북로', 33.48157071, 126.4896376, 4.16, TRUE, '2025-10-02'),
(50110, '신라면세점(제주점)', '쇼핑', '제주특별자치도 제주시 노연로 69', '노연로', 33.48627849, 126.487596, 4.82, TRUE, '2025-10-02'),
(50110, '별도봉', '자연관광', '제주특별자치도 제주시 화북일동', '화북일동', 33.51922867, 126.5531118, 4.24, TRUE, '2025-10-02'),
(50130, '사라오름', '자연관광', '제주특별자치도 서귀포시 남원읍 신례리 산 2-1', '남원읍', 33.36425219, 126.6050441, 4.53, TRUE, '2025-10-02'),
(50130, '가파도', '자연관광', '제주특별자치도 서귀포시 대정읍 가파로', '대정읍', 33.16643269, 126.2735884, 4.48, TRUE, '2025-10-02'),
(50130, '마라도', '자연관광', '제주특별자치도 서귀포시 대정읍 마라로101번길 46', '대정읍', 33.11864619, 126.2671011, 4.66, TRUE, '2025-10-02'),
(50130, '혼인지', '자연관광', '제주특별자치도 서귀포시 성산읍 혼인지로 39-14', '성산읍', 33.41478459, 126.8948512, 4.11, TRUE, '2025-10-02'),
(50130, '쇠소깍', '자연관광', '제주특별자치도 서귀포시 쇠소깍로 104 (하효동)', '쇠소깍로', 33.25427572, 126.6224173, 4.57, TRUE, '2025-10-02'),
(50130, '가문이오름(감은이오름)', '자연관광', '제주특별자치도 서귀포시 표선면 가시리', '표선면', 33.40182991, 126.6876111, 4.39, TRUE, '2025-10-02'),
(50130, '가세오름', '자연관광', '제주특별자치도 서귀포시 표선면 녹산로 554', '표선면', 33.39317588, 126.7231832, 4.05, TRUE, '2025-10-02'),
(50130, '가시오름', '자연관광', '제주특별자치도 서귀포시 대정읍 하모이삼로21번길 1', '대정읍', 33.22363156, 126.250017, 3.83, TRUE, '2025-10-02'),
(50110, '제주레저힐링축제', '축제', '제주특별자치도 제주시 조천읍 조함해안로 525', '조천읍', 33.54273903, 126.6690845, 4.28, TRUE, '2025-10-02'),
(50110, '탐라문화제', '축제', '제주특별자치도 제주시 일도일동', '일도일동', 33.51323725, 126.5273031, 4.62, TRUE, '2025-10-02'),
(50130, '서귀포유채꽃축제', '축제', '제주특별자치도 서귀포시 표선면 녹산로 381-17조랑말체험공원 일대', '표선면', 33.38347715, 126.7356685, 4.76, TRUE, '2025-10-02'),
(50110, '제주 도새기 축제', '축제', '제주특별자치도 제주시 애월읍 봉성리산 59-8 제주 새별오름 일원', '애월읍', 33.36602027, 126.3561629, 4.44, TRUE, '2025-10-02'),
(50110, '난타-제주', '축제', '제주특별자치도 제주시 선돌목동길 56-26 (오등동)제주난타극장', '선돌목동길', 33.44540064, 126.5480639, 4.89, TRUE, '2025-10-02'),
(50110, '2024 오백장군갤러리 기획전 《돌·바람 그리고 돌챙이》', '축제', '제주특별자치도 제주시 조천읍 남조로 2023', '조천읍', 33.44664958, 126.6640038, 4.17, TRUE, '2025-10-02'),
(50130, '제10회 대정암반수마농박람회', '축제', '제주특별자치도 서귀포시 대정읍 하모리대정읍하모체육공원 일대', '대정읍', 33.21872936, 126.2524085, 3.96, TRUE, '2025-10-02'),
(50110, '내가 만든 세상 : Humans Shaping Their Worlds', '축제', '제주특별자치도 제주시 조천읍 남조로 2023', '조천읍', 33.44664958, 126.6640038, 4.13, TRUE, '2025-10-02'),
(50130, '제7회 농촌융복합산업 제주국제박람회', '축제', '제주특별자치도 서귀포시 중문관광로 224 (중문동)', '중문관광로', 33.24127957, 126.424482, 4.37, TRUE, '2025-10-02'),
(50110, '고마로馬문화축제', '축제', '제주특별자치도 제주시 신산로 82 (일도이동)', '신산로', 33.50662143, 126.5345831, 4.55, TRUE, '2025-10-02'),
(50130, '강정마을 생태축제', '축제', '제주특별자치도 서귀포시 이어도로 669 (강정동)', '이어도로', 33.23454519, 126.4870795, 4.26, TRUE, '2025-10-02'),
(50110, '몽생이 WATER WORLD', '축제', '제주특별자치도 제주시 애월읍 평화로 2144렛츠런파크 제주', '애월읍', 33.41002155, 126.3932726, 4.63, TRUE, '2025-10-02'),
(50110, '제주독서대전', '축제', '제주특별자치도 제주시 사라봉동길 30 (건입동)', '사라봉동길', 33.51498739, 126.5478985, 3.89, TRUE, '2025-10-02'),
(50130, 'JEJU MUSIC WEEKEND', '축제', '제주특별자치도 서귀포시 안덕면 신화역사로304번길 38', '안덕면', 33.30725953, 126.319748, 4.74, TRUE, '2025-10-02'),
(50110, '사라봉공원', '휴양', '제주특별자치도 제주시 사라봉길 75 (건입동)', '사라봉길', 33.51603724, 126.5462014, 4.32, TRUE, '2025-10-02'),
(50110, '한림공원', '휴양', '제주특별자치도 제주시 한림읍 한림로 300', '한림읍', 33.38866596, 126.2415557, 4.70, TRUE, '2025-10-02'),
(50130, '팜밸리리조트', '휴양', '제주특별자치도 서귀포시 중산간서로 193(강정동)', '중산간서로', 33.25917309, 126.4907675, 4.20, TRUE, '2025-10-02'),
(50110, '신산공원', '휴양', '제주특별자치도 제주시 신산로 92-12', '신산로', 33.5052799, 126.5337916, 4.01, TRUE, '2025-10-02'),
(50130, '다이나믹 메이즈 제주', '휴양', '제주특별자치도 서귀포시 표선면 번영로 2644', '표선면', 33.39909844, 126.78475, 4.43, TRUE, '2025-10-02'),
(50110, '용두암해수랜드', '휴양', '제주특별자치도 제주시 서해안로 630', '서해안로', 33.51585882, 126.5045689, 4.10, TRUE, '2025-10-02'),
(50110, '수목원테마파크(아이스뮤지엄)', '휴양', '제주특별자치도 제주시 은수길 69', '은수길', 33.47068856, 126.4879352, 4.50, TRUE, '2025-10-02'),
(50130, '제주아이브리조트', '휴양', '제주특별자치도 서귀포시 산록남로 1966-34 (영남동)', '산록남로', 33.28870883, 126.4976385, 4.35, TRUE, '2025-10-02'),
(50110, '비스타리조트', '휴양', '제주특별자치도 제주시 서해안로 74 (이호일동)', '서해안로', 33.50307616, 126.4575955, 4.60, TRUE, '2025-10-02'),
(50130, '새섬공원', '휴양', '제주특별자치도 서귀포시 남성중로 43(서홍동)', '남성중로', 33.23974853, 126.5588093, 4.49, TRUE, '2025-10-02'),
(50110, '용담공원', '휴양', '제주특별자치도 제주시 용담이동 455-1', '용담이동', 33.51492292, 126.51141, 4.06, TRUE, '2025-10-02'),
(50110, '탑동광장', '휴양', '제주특별자치도 제주시 중앙로 1(건입동)', '중앙로', 33.51818945, 126.5251198, 4.40, TRUE, '2025-10-02');



-- 고성오일시장
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '고성오일시장_1_공공1유형.jpg',
       'images/activity/shopping/%EA%B3%A0%EC%84%B1%EC%98%A4%EC%9D%BC%EC%8B%9C%EC%9E%A5_1_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/shopping/%EA%B3%A0%EC%84%B1%EC%98%A4%EC%9D%BC%EC%8B%9C%EC%9E%A5_1_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '고성오일시장' LIMIT 1;

-- 그라벨호텔_제주점
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그라벨호텔_제주점_3_공공3유형.jpg',
       'images/activity/shopping/%EA%B7%B8%EB%9D%BC%EB%B2%A8%ED%98%B8%ED%85%94_%EC%A0%9C%EC%A3%BC%EC%A0%90_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/shopping/%EA%B7%B8%EB%9D%BC%EB%B2%A8%ED%98%B8%ED%85%94_%EC%A0%9C%EC%A3%BC%EC%A0%90_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '그라벨호텔_제주점' LIMIT 1;

-- 나이키스포츠신제주대리점
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나이키스포츠신제주대리점_2_공공3유형.jpg',
       'images/activity/shopping/%EB%82%98%EC%9D%B4%ED%82%A4%EC%8A%A4%ED%8F%AC%EC%B8%A0%EC%8B%A0%EC%A0%9C%EC%A3%BC%EB%8C%80%EB%A6%AC%EC%A0%90_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/shopping/%EB%82%98%EC%9D%B4%ED%82%A4%EC%8A%A4%ED%8F%AC%EC%B8%A0%EC%8B%A0%EC%A0%9C%EC%A3%BC%EB%8C%80%EB%A6%AC%EC%A0%90_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '나이키스포츠신제주대리점' LIMIT 1;

-- 뉴에라_신제주점
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '뉴에라_신제주점_1_공공3유형.jpg',
       'images/activity/shopping/%EB%89%B4%EC%97%90%EB%9D%BC_%EC%8B%A0%EC%A0%9C%EC%A3%BC%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/shopping/%EB%89%B4%EC%97%90%EB%9D%BC_%EC%8B%A0%EC%A0%9C%EC%A3%BC%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '뉴에라_신제주점' LIMIT 1;

-- 대정오일시장
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '대정오일시장_2_공공3유형.jpg',
       'images/activity/shopping/%EB%8C%80%EC%A0%95%EC%98%A4%EC%9D%BC%EC%8B%9C%EC%9E%A5_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/shopping/%EB%8C%80%EC%A0%95%EC%98%A4%EC%9D%BC%EC%8B%9C%EC%9E%A5_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '대정오일시장' LIMIT 1;

-- 동문재래시장
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '동문재래시장_5_공공3유형.jpg',
       'images/activity/shopping/%EB%8F%99%EB%AC%B8%EC%9E%AC%EB%9E%98%EC%8B%9C%EC%9E%A5_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/shopping/%EB%8F%99%EB%AC%B8%EC%9E%AC%EB%9E%98%EC%8B%9C%EC%9E%A5_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '동문재래시장' LIMIT 1;

-- 서귀포매일올레시장
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포매일올레시장_2_공공1유형.jpg',
       'images/activity/shopping/%EC%84%9C%EA%B7%80%ED%8F%AC%EB%A7%A4%EC%9D%BC%EC%98%AC%EB%A0%88%EC%8B%9C%EC%9E%A5_2_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/shopping/%EC%84%9C%EA%B7%80%ED%8F%AC%EB%A7%A4%EC%9D%BC%EC%98%AC%EB%A0%88%EC%8B%9C%EC%9E%A5_2_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '서귀포매일올레시장' LIMIT 1;

-- 신라면세점(제주점)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신라면세점(제주점)_2_공공3유형.jpg',
       'images/activity/shopping/%EC%8B%A0%EB%9D%BC%EB%A9%B4%EC%84%B8%EC%A0%90%28%EC%A0%9C%EC%A3%BC%EC%A0%90%29_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/shopping/%EC%8B%A0%EB%9D%BC%EB%A9%B4%EC%84%B8%EC%A0%90%28%EC%A0%9C%EC%A3%BC%EC%A0%90%29_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '신라면세점(제주점)' LIMIT 1;

-- 올리브영 제주연동
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '올리브영 제주연동_1_공공3유형.jpg',
       'images/activity/shopping/%EC%98%AC%EB%A6%AC%EB%B8%8C%EC%98%81%20%EC%A0%9C%EC%A3%BC%EC%97%B0%EB%8F%99_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/shopping/%EC%98%AC%EB%A6%AC%EB%B8%8C%EC%98%81%20%EC%A0%9C%EC%A3%BC%EC%97%B0%EB%8F%99_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '올리브영 제주연동' LIMIT 1;

-- 이제주숍
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '이제주숍_3_공공3유형.jpg',
       'images/activity/shopping/%EC%9D%B4%EC%A0%9C%EC%A3%BC%EC%88%8D_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/shopping/%EC%9D%B4%EC%A0%9C%EC%A3%BC%EC%88%8D_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '이제주숍' LIMIT 1;

-- 제주 중앙지하상가
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 중앙지하상가_1_공공3유형.jpg',
       'images/activity/shopping/%EC%A0%9C%EC%A3%BC%20%EC%A4%91%EC%95%99%EC%A7%80%ED%95%98%EC%83%81%EA%B0%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/shopping/%EC%A0%9C%EC%A3%BC%20%EC%A4%91%EC%95%99%EC%A7%80%ED%95%98%EC%83%81%EA%B0%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '제주 중앙지하상가' LIMIT 1;

-- 표선오일시장
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '표선오일시장_4_공공3유형.jpg',
       'images/activity/shopping/%ED%91%9C%EC%84%A0%EC%98%A4%EC%9D%BC%EC%8B%9C%EC%9E%A5_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/shopping/%ED%91%9C%EC%84%A0%EC%98%A4%EC%9D%BC%EC%8B%9C%EC%9E%A5_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '표선오일시장' LIMIT 1;

-- 한국기념품백화점
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '한국기념품백화점_1_공공3유형.jpg',
       'images/activity/shopping/%ED%95%9C%EA%B5%AD%EA%B8%B0%EB%85%90%ED%92%88%EB%B0%B1%ED%99%94%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/shopping/%ED%95%9C%EA%B5%AD%EA%B8%B0%EB%85%90%ED%92%88%EB%B0%B1%ED%99%94%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '한국기념품백화점' LIMIT 1;

-- PXG제주
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'PXG제주_1_공공3유형.jpg',
       'images/activity/shopping/PXG%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/shopping/PXG%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = 'PXG제주' LIMIT 1;

COMMIT;


SET @creator_id = 1;
SET @bucket_name = 'travelshoot-s3';

-- 사진 관광지 이미지 INSERT (file_size = 1)

-- 5.16 도로숲터널
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '5.16 도로숲터널_2_공공3유형.jpg',
       'images/activity/photo/5.16%20%EB%8F%84%EB%A1%9C%EC%88%B2%ED%84%B0%EB%84%90_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/photo/5.16%20%EB%8F%84%EB%A1%9C%EC%88%B2%ED%84%B0%EB%84%90_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '5.16 도로숲터널' LIMIT 1;

-- 가파도 소망전망대
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '가파도 소망전망대_4_공공3유형.jpg',
       'images/activity/photo/%EA%B0%80%ED%8C%8C%EB%8F%84%20%EC%86%8C%EB%A7%9D%EC%A0%84%EB%A7%9D%EB%8C%80_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/photo/%EA%B0%80%ED%8C%8C%EB%8F%84%20%EC%86%8C%EB%A7%9D%EC%A0%84%EB%A7%9D%EB%8C%80_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '가파도 소망전망대' LIMIT 1;

-- 거린사슴전망대
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '거린사슴전망대_4_공공3유형.jpg',
       'images/activity/photo/%EA%B1%B0%EB%A6%B0%EC%82%AC%EC%8A%B4%EC%A0%84%EB%A7%9D%EB%8C%80_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/photo/%EA%B1%B0%EB%A6%B0%EC%82%AC%EC%8A%B4%EC%A0%84%EB%A7%9D%EB%8C%80_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '거린사슴전망대' LIMIT 1;

-- 답다니탑망대
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '답다니탑망대_4_공공3유형.jpg',
       'images/activity/photo/%EB%8B%B5%EB%8B%A4%EB%8B%88%ED%83%91%EB%A7%9D%EB%8C%80_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/photo/%EB%8B%B5%EB%8B%A4%EB%8B%88%ED%83%91%EB%A7%9D%EB%8C%80_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '답다니탑망대' LIMIT 1;

-- 도두봉전망대
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '도두봉전망대_1_공공3유형.jpg',
       'images/activity/photo/%EB%8F%84%EB%91%90%EB%B4%89%EC%A0%84%EB%A7%9D%EB%8C%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/photo/%EB%8F%84%EB%91%90%EB%B4%89%EC%A0%84%EB%A7%9D%EB%8C%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '도두봉전망대' LIMIT 1;

-- 방사탑(제주)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '방사탑(제주)_4_공공3유형.jpg',
       'images/activity/photo/%EB%B0%A9%EC%82%AC%ED%83%91%28%EC%A0%9C%EC%A3%BC%29_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/photo/%EB%B0%A9%EC%82%AC%ED%83%91%28%EC%A0%9C%EC%A3%BC%29_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '방사탑(제주)' LIMIT 1;

-- 사라봉(모충사) 의병항쟁기념탑
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '사라봉(모충사) 의병항쟁기념탑_1_공공3유형.jpg',
       'images/activity/photo/%EC%82%AC%EB%9D%BC%EB%B4%89%28%EB%AA%A8%EC%B6%A9%EC%82%AC%29%20%EC%9D%98%EB%B3%91%ED%95%AD%EC%9F%81%EA%B8%B0%EB%85%90%ED%83%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/photo/%EC%82%AC%EB%9D%BC%EB%B4%89%28%EB%AA%A8%EC%B6%A9%EC%82%AC%29%20%EC%9D%98%EB%B3%91%ED%95%AD%EC%9F%81%EA%B8%B0%EB%85%90%ED%83%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '사라봉(모충사) 의병항쟁기념탑' LIMIT 1;

-- 새연교
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '새연교_4_공공1유형.jpg',
       'images/activity/photo/%EC%83%88%EC%97%B0%EA%B5%90_4_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/photo/%EC%83%88%EC%97%B0%EA%B5%90_4_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '새연교' LIMIT 1;

-- 선임교
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '선임교_1_공공3유형.jpg',
       'images/activity/photo/%EC%84%A0%EC%9E%84%EA%B5%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/photo/%EC%84%A0%EC%9E%84%EA%B5%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '선임교' LIMIT 1;

-- 송악산전망대
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '송악산전망대_10_공공4유형.jpg',
       'images/activity/photo/%EC%86%A1%EC%95%85%EC%82%B0%EC%A0%84%EB%A7%9D%EB%8C%80_10_%EA%B3%B5%EA%B3%B54%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/photo/%EC%86%A1%EC%95%85%EC%82%B0%EC%A0%84%EB%A7%9D%EB%8C%80_10_%EA%B3%B5%EA%B3%B54%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '송악산전망대' LIMIT 1;

-- 용연구름다리
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '용연구름다리_1_공공3유형.jpg',
       'images/activity/photo/%EC%9A%A9%EC%97%B0%EA%B5%AC%EB%A6%84%EB%8B%A4%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/photo/%EC%9A%A9%EC%97%B0%EA%B5%AC%EB%A6%84%EB%8B%A4%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '용연구름다리' LIMIT 1;

-- 제주 글라스하우스
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 글라스하우스_4_공공1유형.jpg',
       'images/activity/photo/%EC%A0%9C%EC%A3%BC%20%EA%B8%80%EB%9D%BC%EC%8A%A4%ED%95%98%EC%9A%B0%EC%8A%A4_4_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/photo/%EC%A0%9C%EC%A3%BC%20%EA%B8%80%EB%9D%BC%EC%8A%A4%ED%95%98%EC%9A%B0%EC%8A%A4_4_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '제주 글라스하우스' LIMIT 1;

-- 제주해녀항일운동기념탑
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주해녀항일운동기념탑_2_공공3유형.jpg',
       'images/activity/photo/%EC%A0%9C%EC%A3%BC%ED%95%B4%EB%85%80%ED%95%AD%EC%9D%BC%EC%9A%B4%EB%8F%99%EA%B8%B0%EB%85%90%ED%83%91_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/photo/%EC%A0%9C%EC%A3%BC%ED%95%B4%EB%85%80%ED%95%AD%EC%9D%BC%EC%9A%B4%EB%8F%99%EA%B8%B0%EB%85%90%ED%83%91_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '제주해녀항일운동기념탑' LIMIT 1;

-- 하멜기념비
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '하멜기념비_1_공공1유형.jpg',
       'images/activity/photo/%ED%95%98%EB%A9%9C%EA%B8%B0%EB%85%90%EB%B9%84_1_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/photo/%ED%95%98%EB%A9%9C%EA%B8%B0%EB%85%90%EB%B9%84_1_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '하멜기념비' LIMIT 1;

-- 호빗집
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호빗집_1_공공3유형.jpg',
       'images/activity/photo/%ED%98%B8%EB%B9%97%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/photo/%ED%98%B8%EB%B9%97%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '호빗집' LIMIT 1;

COMMIT;


SET @creator_id = 1;
SET @bucket_name = 'travelshoot-s3';

-- 축제 관광지 이미지 INSERT (file_size = 1)

-- 2024 오백장군갤러리 기획전 《돌·바람 그리고 돌챙이》
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '2024 오백장군갤러리 기획전 《돌·바람 그리고 돌챙이》_10_공공4유형.jpg',
       'images/activity/festival/2024%20%EC%98%A4%EB%B0%B1%EC%9E%A5%EA%B5%B0%EA%B0%A4%EB%9F%AC%EB%A6%AC%20%EA%B8%B0%ED%9A%8D%EC%A0%84%20%E3%80%8A%EB%8F%8C%C2%B7%EB%B0%94%EB%9E%8C%20%EA%B7%B8%EB%A6%AC%EA%B3%A0%20%EB%8F%8C%EC%B1%99%EC%9D%B4%E3%80%8B_10_%EA%B3%B5%EA%B3%B54%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/festival/2024%20%EC%98%A4%EB%B0%B1%EC%9E%A5%EA%B5%B0%EA%B0%A4%EB%9F%AC%EB%A6%AC%20%EA%B8%B0%ED%9A%8D%EC%A0%84%20%E3%80%8A%EB%8F%8C%C2%B7%EB%B0%94%EB%9E%8C%20%EA%B7%B8%EB%A6%AC%EA%B3%A0%20%EB%8F%8C%EC%B1%99%EC%9D%B4%E3%80%8B_10_%EA%B3%B5%EA%B3%B54%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '2024 오백장군갤러리 기획전 《돌·바람 그리고 돌챙이》' LIMIT 1;

-- 강정마을 생태축제
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '강정마을 생태축제_4_공공3유형.jpg',
       'images/activity/festival/%EA%B0%95%EC%A0%95%EB%A7%88%EC%9D%84%20%EC%83%9D%ED%83%9C%EC%B6%95%EC%A0%9C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/festival/%EA%B0%95%EC%A0%95%EB%A7%88%EC%9D%84%20%EC%83%9D%ED%83%9C%EC%B6%95%EC%A0%9C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '강정마을 생태축제' LIMIT 1;

-- 고마로馬문화축제
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '고마로馬문화축제_10_공공4유형.jfif',
       'images/activity/festival/%EA%B3%A0%EB%A7%88%EB%A1%9C%E9%A6%AC%EB%AC%B8%ED%99%94%EC%B6%95%EC%A0%9C_10_%EA%B3%B5%EA%B3%B54%EC%9C%A0%ED%98%95.jfif',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/festival/%EA%B3%A0%EB%A7%88%EB%A1%9C%E9%A6%AC%EB%AC%B8%ED%99%94%EC%B6%95%EC%A0%9C_10_%EA%B3%B5%EA%B3%B54%EC%9C%A0%ED%98%95.jfif',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '고마로馬문화축제' LIMIT 1;

-- 난타-제주
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '난타-제주_10_공공4유형.jpg',
       'images/activity/festival/%EB%82%9C%ED%83%80-%EC%A0%9C%EC%A3%BC_10_%EA%B3%B5%EA%B3%B54%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/festival/%EB%82%9C%ED%83%80-%EC%A0%9C%EC%A3%BC_10_%EA%B3%B5%EA%B3%B54%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '난타-제주' LIMIT 1;

-- 내가 만든 세상 : Humans Shaping Their Worlds
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '내가 만든 세상 Humans Shaping Their Worlds_10_공공4유형.jpg',
       'images/activity/festival/%EB%82%B4%EA%B0%80%20%EB%A7%8C%EB%93%A0%20%EC%84%B8%EC%83%81%20Humans%20Shaping%20Their%20Worlds_10_%EA%B3%B5%EA%B3%B54%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/festival/%EB%82%B4%EA%B0%80%20%EB%A7%8C%EB%93%A0%20%EC%84%B8%EC%83%81%20Humans%20Shaping%20Their%20Worlds_10_%EA%B3%B5%EA%B3%B54%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '내가 만든 세상 : Humans Shaping Their Worlds' LIMIT 1;

-- 몽생이 WATER WORLD
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '몽생이 WATER WORLD_6_공공3유형.jpg',
       'images/activity/festival/%EB%AA%BD%EC%83%9D%EC%9D%B4%20WATER%20WORLD_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/festival/%EB%AA%BD%EC%83%9D%EC%9D%B4%20WATER%20WORLD_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '몽생이 WATER WORLD' LIMIT 1;

-- 서귀포유채꽃축제
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포유채꽃축제_1_공공3유형.jpg',
       'images/activity/festival/%EC%84%9C%EA%B7%80%ED%8F%AC%EC%9C%A0%EC%B1%84%EA%BD%83%EC%B6%95%EC%A0%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/festival/%EC%84%9C%EA%B7%80%ED%8F%AC%EC%9C%A0%EC%B1%84%EA%BD%83%EC%B6%95%EC%A0%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '서귀포유채꽃축제' LIMIT 1;

-- 제10회 대정암반수마농박람회
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제10회 대정암반수마농박람회_10_공공4유형.jpg',
       'images/activity/festival/%EC%A0%9C10%ED%9A%8C%20%EB%8C%80%EC%A0%95%EC%95%94%EB%B0%98%EC%88%98%EB%A7%88%EB%86%8D%EB%B0%95%EB%9E%8C%ED%9A%8C_10_%EA%B3%B5%EA%B3%B54%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/festival/%EC%A0%9C10%ED%9A%8C%20%EB%8C%80%EC%A0%95%EC%95%94%EB%B0%98%EC%88%98%EB%A7%88%EB%86%8D%EB%B0%95%EB%9E%8C%ED%9A%8C_10_%EA%B3%B5%EA%B3%B54%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '제10회 대정암반수마농박람회' LIMIT 1;

-- 제7회 농촌융복합산업 제주국제박람회
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제7회 농촌융복합산업 제주국제박람회_1_공공3유형.png',
       'images/activity/festival/%EC%A0%9C7%ED%9A%8C%20%EB%86%8D%EC%B4%8C%EC%9C%B5%EB%B3%B5%ED%95%A9%EC%82%B0%EC%97%85%20%EC%A0%9C%EC%A3%BC%EA%B5%AD%EC%A0%9C%EB%B0%95%EB%9E%8C%ED%9A%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.png',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/festival/%EC%A0%9C7%ED%9A%8C%20%EB%86%8D%EC%B4%8C%EC%9C%B5%EB%B3%B5%ED%95%A9%EC%82%B0%EC%97%85%20%EC%A0%9C%EC%A3%BC%EA%B5%AD%EC%A0%9C%EB%B0%95%EB%9E%8C%ED%9A%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.png',
       @bucket_name,
       1,
       'image/png',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '제7회 농촌융복합산업 제주국제박람회' LIMIT 1;

-- 제주 도새기 축제
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 도새기 축제_2_공공3유형.png',
       'images/activity/festival/%EC%A0%9C%EC%A3%BC%20%EB%8F%84%EC%83%88%EA%B8%B0%20%EC%B6%95%EC%A0%9C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.png',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/festival/%EC%A0%9C%EC%A3%BC%20%EB%8F%84%EC%83%88%EA%B8%B0%20%EC%B6%95%EC%A0%9C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.png',
       @bucket_name,
       1,
       'image/png',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '제주 도새기 축제' LIMIT 1;

-- 제주독서대전
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주독서대전_1_공공3유형.JPG',
       'images/activity/festival/%EC%A0%9C%EC%A3%BC%EB%8F%85%EC%84%9C%EB%8C%80%EC%A0%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/festival/%EC%A0%9C%EC%A3%BC%EB%8F%85%EC%84%9C%EB%8C%80%EC%A0%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '제주독서대전' LIMIT 1;

-- 제주레저힐링축제
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주레저힐링축제_1_공공3유형.jpg',
       'images/activity/festival/%EC%A0%9C%EC%A3%BC%EB%A0%88%EC%A0%80%ED%9E%90%EB%A7%81%EC%B6%95%EC%A0%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/festival/%EC%A0%9C%EC%A3%BC%EB%A0%88%EC%A0%80%ED%9E%90%EB%A7%81%EC%B6%95%EC%A0%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '제주레저힐링축제' LIMIT 1;

-- 탐라문화제
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '탐라문화제_1_공공3유형.jpg',
       'images/activity/festival/%ED%83%90%EB%9D%BC%EB%AC%B8%ED%99%94%EC%A0%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/festival/%ED%83%90%EB%9D%BC%EB%AC%B8%ED%99%94%EC%A0%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '탐라문화제' LIMIT 1;

-- JEJU MUSIC WEEKEND
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'JEJU MUSIC WEEKEND_3_공공3유형.JPG',
       'images/activity/festival/JEJU%20MUSIC%20WEEKEND_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/festival/JEJU%20MUSIC%20WEEKEND_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = 'JEJU MUSIC WEEKEND' LIMIT 1;

COMMIT;


INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '다이나믹 메이즈 제주_7_공공3유형.jpg', 'images/activity/recreation/다이나믹 메이즈 제주_7_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/recreation/%EB%8B%A4%EC%9D%B4%EB%82%98%EB%AF%B9%20%EB%A9%94%EC%9D%B4%EC%A6%88%20%EC%A0%9C%EC%A3%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '다이나믹 메이즈 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '비스타리조트_2_공공3유형.jpg', 'images/activity/recreation/비스타리조트_2_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/recreation/%EB%B9%84%EC%8A%A4%ED%83%80%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '비스타리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '사라봉공원_7_공공3유형.jpg', 'images/activity/recreation/사라봉공원_7_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/recreation/%EC%82%AC%EB%9D%BC%EB%B4%89%EA%B3%B5%EC%9B%90_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '사라봉공원' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '새섬공원_6_공공1유형.jpg', 'images/activity/recreation/새섬공원_6_공공1유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/recreation/%EC%83%88%EC%84%AC%EA%B3%B5%EC%9B%90_6_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '새섬공원' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '수목원테마파크(아이스뮤지엄)_1_공공3유형.jpg', 'images/activity/recreation/수목원테마파크(아이스뮤지엄)_1_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/recreation/%EC%88%98%EB%AA%A9%EC%9B%90%ED%85%8C%EB%A7%88%ED%8C%8C%ED%81%AC%28%EC%95%84%EC%9D%B4%EC%8A%A4%EB%AE%A4%EC%A7%80%EC%97%84%29_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '수목원테마파크(아이스뮤지엄)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '신산공원_4_공공1유형.jpg', 'images/activity/recreation/신산공원_4_공공1유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/recreation/%EC%8B%A0%EC%82%B0%EA%B3%B5%EC%9B%90_4_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '신산공원' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '에코랜드테마파크_1_공공3유형.jpg', 'images/activity/recreation/에코랜드테마파크_1_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/recreation/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%ED%85%8C%EB%A7%88%ED%8C%8C%ED%81%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '에코랜드테마파크' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '용담공원_4_공공1유형.jpg', 'images/activity/recreation/용담공원_4_공공1유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/recreation/%EC%9A%A9%EB%8B%B4%EA%B3%B5%EC%9B%90_4_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '용담공원' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '용두암해수랜드_8_공공3유형.jpg', 'images/activity/recreation/용두암해수랜드_8_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/recreation/%EC%9A%A9%EB%91%90%EC%95%94%ED%95%B4%EC%88%98%EB%9E%9C%EB%93%9C_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '용두암해수랜드' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '제주드림타워복합리조트_10_공공4유형.jpg', 'images/activity/recreation/제주드림타워복합리조트_10_공공4유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/recreation/%EC%A0%9C%EC%A3%BC%EB%93%9C%EB%A6%BC%ED%83%80%EC%9B%8C%EB%B3%B5%ED%95%A9%EB%A6%AC%EC%A1%B0%ED%8A%B8_10_%EA%B3%B5%EA%B3%B54%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '제주드림타워복합리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '제주아이브리조트_3_공공3유형.jpg', 'images/activity/recreation/제주아이브리조트_3_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/recreation/%EC%A0%9C%EC%A3%BC%EC%95%84%EC%9D%B4%EB%B8%8C%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '제주아이브리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '탑동광장_1_공공3유형.jpg', 'images/activity/recreation/탑동광장_1_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/recreation/%ED%83%91%EB%8F%99%EA%B4%91%EC%9E%A5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '탑동광장' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '팜밸리리조트_10_공공4유형.jpg', 'images/activity/recreation/팜밸리리조트_10_공공4유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/recreation/%ED%8C%9C%EB%B0%B8%EB%A6%AC%EB%A6%AC%EC%A1%B0%ED%8A%B8_10_%EA%B3%B5%EA%B3%B54%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '팜밸리리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '한림공원_4_공공1유형.jpg', 'images/activity/recreation/한림공원_4_공공1유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/recreation/%ED%95%9C%EB%A6%BC%EA%B3%B5%EC%9B%90_4_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '한림공원' LIMIT 1;




SET @creator_id = 1;
SET @bucket_name = 'travelshoot-s3';

-- 문화체험 관광지 이미지 INSERT (file_size = 1)

-- 국립제주박물관
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '국립제주박물관_2_공공1유형.jpg',
       'images/activity/cultureTourism/%EA%B5%AD%EB%A6%BD%EC%A0%9C%EC%A3%BC%EB%B0%95%EB%AC%BC%EA%B4%80_2_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/cultureTourism/%EA%B5%AD%EB%A6%BD%EC%A0%9C%EC%A3%BC%EB%B0%95%EB%AC%BC%EA%B4%80_2_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '국립제주박물관' LIMIT 1;

-- 서귀포문화원
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포문화원_6_공공1유형.jpg',
       'images/activity/cultureTourism/%EC%84%9C%EA%B7%80%ED%8F%AC%EB%AC%B8%ED%99%94%EC%9B%90_6_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/cultureTourism/%EC%84%9C%EA%B7%80%ED%8F%AC%EB%AC%B8%ED%99%94%EC%9B%90_6_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '서귀포문화원' LIMIT 1;

-- 서귀포시립기당미술관
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포시립기당미술관_5_공공1유형.jpg',
       'images/activity/cultureTourism/%EC%84%9C%EA%B7%80%ED%8F%AC%EC%8B%9C%EB%A6%BD%EA%B8%B0%EB%8B%B9%EB%AF%B8%EC%88%A0%EA%B4%80_5_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/cultureTourism/%EC%84%9C%EA%B7%80%ED%8F%AC%EC%8B%9C%EB%A6%BD%EA%B8%B0%EB%8B%B9%EB%AF%B8%EC%88%A0%EA%B4%80_5_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '서귀포시립기당미술관' LIMIT 1;

-- 세계조가비박물관
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '세계조가비박물관_6_공공1유형.jpg',
       'images/activity/cultureTourism/%EC%84%B8%EA%B3%84%EC%A1%B0%EA%B0%80%EB%B9%84%EB%B0%95%EB%AC%BC%EA%B4%80_6_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/cultureTourism/%EC%84%B8%EA%B3%84%EC%A1%B0%EA%B0%80%EB%B9%84%EB%B0%95%EB%AC%BC%EA%B4%80_6_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '세계조가비박물관' LIMIT 1;

-- 아프리카 박물관
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '아프리카 박물관_4_공공1유형.jpg',
       'images/activity/cultureTourism/%EC%95%84%ED%94%84%EB%A6%AC%EC%B9%B4%20%EB%B0%95%EB%AC%BC%EA%B4%80_4_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/cultureTourism/%EC%95%84%ED%94%84%EB%A6%AC%EC%B9%B4%20%EB%B0%95%EB%AC%BC%EA%B4%80_4_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '아프리카 박물관' LIMIT 1;

-- 제주 탑동해변공연장
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 탑동해변공연장_9_공공3유형.jpg',
       'images/activity/cultureTourism/%EC%A0%9C%EC%A3%BC%20%ED%83%91%EB%8F%99%ED%95%B4%EB%B3%80%EA%B3%B5%EC%97%B0%EC%9E%A5_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/cultureTourism/%EC%A0%9C%EC%A3%BC%20%ED%83%91%EB%8F%99%ED%95%B4%EB%B3%80%EA%B3%B5%EC%97%B0%EC%9E%A5_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '제주 탑동해변공연장' LIMIT 1;

-- 제주교육박물관
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주교육박물관_2_공공1유형.jpg',
       'images/activity/cultureTourism/%EC%A0%9C%EC%A3%BC%EA%B5%90%EC%9C%A1%EB%B0%95%EB%AC%BC%EA%B4%80_2_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/cultureTourism/%EC%A0%9C%EC%A3%BC%EA%B5%90%EC%9C%A1%EB%B0%95%EB%AC%BC%EA%B4%80_2_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '제주교육박물관' LIMIT 1;

-- 제주문화원
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주문화원_1_공공3유형.jpg',
       'images/activity/cultureTourism/%EC%A0%9C%EC%A3%BC%EB%AC%B8%ED%99%94%EC%9B%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/cultureTourism/%EC%A0%9C%EC%A3%BC%EB%AC%B8%ED%99%94%EC%9B%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '제주문화원' LIMIT 1;

-- 제주민속촌
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주민속촌_5_공공1유형.jpg',
       'images/activity/cultureTourism/%EC%A0%9C%EC%A3%BC%EB%AF%BC%EC%86%8D%EC%B4%8C_5_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/cultureTourism/%EC%A0%9C%EC%A3%BC%EB%AF%BC%EC%86%8D%EC%B4%8C_5_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '제주민속촌' LIMIT 1;

-- 제주특별자치도민속자연사박물관
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주특별자치도민속자연사박물관_4_공공3유형.jpg',
       'images/activity/cultureTourism/%EC%A0%9C%EC%A3%BC%ED%8A%B9%EB%B3%84%EC%9E%90%EC%B9%98%EB%8F%84%EB%AF%BC%EC%86%8D%EC%9E%90%EC%97%B0%EC%82%AC%EB%B0%95%EB%AC%BC%EA%B4%80_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/cultureTourism/%EC%A0%9C%EC%A3%BC%ED%8A%B9%EB%B3%84%EC%9E%90%EC%B9%98%EB%8F%84%EB%AF%BC%EC%86%8D%EC%9E%90%EC%97%B0%EC%82%AC%EB%B0%95%EB%AC%BC%EA%B4%80_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '제주특별자치도민속자연사박물관' LIMIT 1;

-- 제주항일기념관
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주항일기념관_12_공공3유형.jpg',
       'images/activity/cultureTourism/%EC%A0%9C%EC%A3%BC%ED%95%AD%EC%9D%BC%EA%B8%B0%EB%85%90%EA%B4%80_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/cultureTourism/%EC%A0%9C%EC%A3%BC%ED%95%AD%EC%9D%BC%EA%B8%B0%EB%85%90%EA%B4%80_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '제주항일기념관' LIMIT 1;

-- 초콜릿 박물관
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '초콜릿 박물관_2_공공1유형.jpg',
       'images/activity/cultureTourism/%EC%B4%88%EC%BD%9C%EB%A6%BF%20%EB%B0%95%EB%AC%BC%EA%B4%80_2_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/cultureTourism/%EC%B4%88%EC%BD%9C%EB%A6%BF%20%EB%B0%95%EB%AC%BC%EA%B4%80_2_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '초콜릿 박물관' LIMIT 1;

-- 테디베어뮤지엄 제주
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '테디베어뮤지엄 제주_3_공공1유형.jpg',
       'images/activity/cultureTourism/%ED%85%8C%EB%94%94%EB%B2%A0%EC%96%B4%EB%AE%A4%EC%A7%80%EC%97%84%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/cultureTourism/%ED%85%8C%EB%94%94%EB%B2%A0%EC%96%B4%EB%AE%A4%EC%A7%80%EC%97%84%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '테디베어뮤지엄 제주' LIMIT 1;

-- 한국야구명예전당
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '한국야구명예전당_5_공공3유형.jpg',
       'images/activity/cultureTourism/%ED%95%9C%EA%B5%AD%EC%95%BC%EA%B5%AC%EB%AA%85%EC%98%88%EC%A0%84%EB%8B%B9_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/cultureTourism/%ED%95%9C%EA%B5%AD%EC%95%BC%EA%B5%AC%EB%AA%85%EC%98%88%EC%A0%84%EB%8B%B9_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name,
       1,
       'image/jpeg',
       'ACTIVITIES',
       activity_id,
       1,
       TRUE,
       @creator_id,
       TRUE
FROM activities WHERE activity_name = '한국야구명예전당' LIMIT 1;

COMMIT;



INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '갬주리코지(볼락코지)_1_공공3유형.jpg', 'images/activity/lesports/갬주리코지(볼락코지)_1_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/lesports/%EA%B0%AC%EC%A3%BC%EB%A6%AC%EC%BD%94%EC%A7%80%28%EB%B3%BC%EB%9D%BD%EC%BD%94%EC%A7%80%29_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '갬주리코지(볼락코지)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '송당승마장_1_공공3유형.jpg', 'images/activity/lesports/송당승마장_1_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/lesports/%EC%86%A1%EB%8B%B9%EC%8A%B9%EB%A7%88%EC%9E%A5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '송당승마장' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '알프스승마장 포니_1_공공3유형.jpg', 'images/activity/lesports/알프스승마장 포니_1_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/lesports/%EC%95%8C%ED%94%84%EC%8A%A4%EC%8A%B9%EB%A7%88%EC%9E%A5%20%ED%8F%AC%EB%8B%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '알프스승마장 포니' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '오라컨트리클럽_1_공공3유형.jpg', 'images/activity/lesports/오라컨트리클럽_1_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/lesports/%EC%98%A4%EB%9D%BC%EC%BB%A8%ED%8A%B8%EB%A6%AC%ED%81%B4%EB%9F%BD_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '오라컨트리클럽' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '오케이 승마장_4_공공3유형.jpg', 'images/activity/lesports/오케이 승마장_4_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/lesports/%EC%98%A4%EC%BC%80%EC%9D%B4%20%EC%8A%B9%EB%A7%88%EC%9E%A5_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '오케이 승마장' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 조랑말타운_5_공공3유형.jpg', 'images/activity/lesports/제주 조랑말타운_5_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/lesports/%EC%A0%9C%EC%A3%BC%20%EC%A1%B0%EB%9E%91%EB%A7%90%ED%83%80%EC%9A%B4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '제주 조랑말타운' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주청소년수련원_8_공공3유형.jpg', 'images/activity/lesports/제주청소년수련원_8_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/lesports/%EC%A0%9C%EC%A3%BC%EC%B2%AD%EC%86%8C%EB%85%84%EC%88%98%EB%A0%A8%EC%9B%90_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '제주청소년수련원' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주항 서부두방파제_7_공공3유형.jpg', 'images/activity/lesports/제주항 서부두방파제_7_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/lesports/%EC%A0%9C%EC%A3%BC%ED%95%AD%20%EC%84%9C%EB%B6%80%EB%91%90%EB%B0%A9%ED%8C%8C%EC%A0%9C_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '제주항 서부두방파제' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주해양레저_1_공공3유형.jpg', 'images/activity/lesports/제주해양레저_1_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/leports/%EC%A0%9C%EC%A3%BC%ED%95%B4%EC%96%91%EB%A0%88%EC%A0%80.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '제주해양레저' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '차귀도 바다낚시_1_공공3유형.jpg', 'images/activity/lesports/차귀도 바다낚시_1_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/lesports/%EC%B0%A8%EA%B7%80%EB%8F%84%20%EB%B0%94%EB%8B%A4%EB%82%9A%EC%8B%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '차귀도 바다낚시' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '추자군도_5_공공3유형.jpg', 'images/activity/lesports/추자군도_5_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/lesports/%EC%B6%94%EC%9E%90%EA%B5%B0%EB%8F%84_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '추자군도' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '캐슬렉스제주 골프클럽_1_공공3유형.jpg', 'images/activity/lesports/캐슬렉스제주 골프클럽_1_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/lesports/%EC%BA%90%EC%8A%AC%EB%A0%89%EC%8A%A4%EC%A0%9C%EC%A3%BC%20%EA%B3%A8%ED%94%84%ED%81%B4%EB%9F%BD_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '캐슬렉스제주 골프클럽' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '탐라승마장_1_공공3유형.jpg', 'images/activity/lesports/탐라승마장_1_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/lesports/%ED%83%90%EB%9D%BC%EC%8A%B9%EB%A7%88%EC%9E%A5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '탐라승마장' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '홀스랜드(어승생승마장)_1_공공3유형.jpg', 'images/activity/lesports/홀스랜드(어승생승마장)_1_공공3유형.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/lesports/%ED%99%80%EC%8A%A4%EB%9E%9C%EB%93%9C%28%EC%96%B4%EC%8A%B9%EC%83%9D%EC%8A%B9%EB%A7%88%EC%9E%A5%29_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'ACTIVITIES', activity_id, 1, TRUE, @creator_id, TRUE FROM activities WHERE activity_name = '홀스랜드(어승생승마장)' LIMIT 1;

--- 자연


SET @bucket_name = 'travelshoot-s3';
SET @creator_id = 1;

-- 별도봉 (activity_id = 58)
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
) VALUES (
  '별도봉_3_공공3유형.jpg',
  'images/activity/natureTourism/별도봉_3_공공3유형.jpg',
  'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/natureTourism/%EB%B3%84%EB%8F%84%EB%B4%89_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
  'travelshoot-s3', 1, 'image/jpeg',
  'ACTIVITIES', 58, 1, TRUE, 1, NOW(), TRUE, FALSE
);

-- 제주도 국가지질공원 (activity_id = 59)
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
) VALUES (
  '제주도 국가지질공원_1_공공1유형.jpg',
  'images/activity/natureTourism/제주도 국가지질공원_1_공공1유형.jpg',
  'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/natureTourism/%EC%A0%9C%EC%A3%BC%EB%8F%84+%EA%B5%AD%EA%B0%80%EC%A7%80%EC%A7%88%EA%B3%B5%EC%9B%90_1_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
  'travelshoot-s3', 1, 'image/jpeg',
  'ACTIVITIES', 59, 1, TRUE, 1, NOW(), TRUE, FALSE
);

-- 사라오름 (activity_id = 60)
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
) VALUES (
  '사라오름_1_공공3유형.jpg',
  'images/activity/natureTourism/사라오름_1_공공3유형.jpg',
  'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/natureTourism/%EC%82%AC%EB%9D%BC%EC%98%A4%EB%A6%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
  'travelshoot-s3', 1, 'image/jpeg',
  'ACTIVITIES', 60, 1, TRUE, 1, NOW(), TRUE, FALSE
);

-- 성산일출봉 [유네스코 세계자연유산] (activity_id = 61)
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
) VALUES (
  '성산일출봉 [유네스코 세계자연유산]_5_공공3유형.jpg',
  'images/activity/natureTourism/성산일출봉 [유네스코 세계자연유산]_5_공공3유형.jpg',
  'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/natureTourism/%EC%84%B1%EC%82%B0%EC%9D%BC%EC%B6%9C%EB%B4%89+%5B%EC%9C%A0%EB%84%A4%EC%8A%A4%EC%BD%94+%EC%84%B8%EA%B3%84%EC%9E%90%EC%97%B0%EC%9C%A0%EC%82%B0%5D_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
  'travelshoot-s3', 1, 'image/jpeg',
  'ACTIVITIES', 61, 1, TRUE, 1, NOW(), TRUE, FALSE
);

-- 천지연폭포 (activity_id = 62)
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
) VALUES (
  '천지연폭포_4_공공1유형.jpg',
  'images/activity/natureTourism/천지연폭포_4_공공1유형.jpg',
  'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/natureTourism/%EC%B2%9C%EC%A7%80%EC%97%B0%ED%8F%AD%ED%8F%AC_4_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
  'travelshoot-s3', 1, 'image/jpeg',
  'ACTIVITIES', 62, 1, TRUE, 1, NOW(), TRUE, FALSE
);

-- 가파도 (activity_id = 63)
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
) VALUES (
  '가파도_6_공공1유형.jpg',
  'images/activity/natureTourism/가파도_6_공공1유형.jpg',
  'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/natureTourism/%EA%B0%80%ED%8C%8C%EB%8F%84_6_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
  'travelshoot-s3', 1, 'image/jpeg',
  'ACTIVITIES', 63, 1, TRUE, 1, NOW(), TRUE, FALSE
);

-- 마라도 (activity_id = 64)
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
) VALUES (
  '마라도_5_공공1유형.jpg',
  'images/activity/natureTourism/마라도_5_공공1유형.jpg',
  'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/natureTourism/%EB%A7%88%EB%9D%BC%EB%8F%84_5_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
  'travelshoot-s3', 1, 'image/jpeg',
  'ACTIVITIES', 64, 1, TRUE, 1, NOW(), TRUE, FALSE
);

-- 함덕해수욕장 (activity_id = 65)
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
) VALUES (
  '함덕해수욕장 (함덕 서우봉 해변)_2_공공3유형.jpg',
  'images/activity/natureTourism/함덕해수욕장 (함덕 서우봉 해변)_2_공공3유형.jpg',
  'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/natureTourism/%ED%95%A8%EB%8D%95%ED%95%B4%EC%88%98%EC%9A%95%EC%9E%A5+(%ED%95%A8%EB%8D%95+%EC%84%9C%EC%9A%B0%EB%B4%89+%ED%95%B4%EB%B3%80)_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
  'travelshoot-s3', 1, 'image/jpeg',
  'ACTIVITIES', 65, 1, TRUE, 1, NOW(), TRUE, FALSE
);

-- 혼인지 (activity_id = 66)
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
) VALUES (
  '혼인지_2_공공1유형.jpg',
  'images/activity/natureTourism/혼인지_2_공공1유형.jpg',
  'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/natureTourism/%ED%98%BC%EC%9D%B8%EC%A7%80_2_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
  'travelshoot-s3', 1, 'image/jpeg',
  'ACTIVITIES', 66, 1, TRUE, 1, NOW(), TRUE, FALSE
);

-- 송악산 (activity_id = 67)
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
) VALUES (
  '송악산_4_공공3유형.jpg',
  'images/activity/natureTourism/송악산_4_공공3유형.jpg',
  'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/natureTourism/%EC%86%A1%EC%95%85%EC%82%B0_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
  'travelshoot-s3', 1, 'image/jpeg',
  'ACTIVITIES', 67, 1, TRUE, 1, NOW(), TRUE, FALSE
);

-- 쇠소깍 (activity_id = 68)
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
) VALUES (
  '쇠소깍_3_공공1유형.jpg',
  'images/activity/natureTourism/쇠소깍_3_공공1유형.jpg',
  'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/natureTourism/%EC%87%A0%EC%86%8C%EA%B9%8D_3_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg',
  'travelshoot-s3', 1, 'image/jpeg',
  'ACTIVITIES', 68, 1, TRUE, 1, NOW(), TRUE, FALSE
);

-- 가문이오름 (activity_id = 69)
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
) VALUES (
  '가문이오름(감은이오름)_3_공공3유형.jpg',
  'images/activity/natureTourism/가문이오름(감은이오름)_3_공공3유형.jpg',
  'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/natureTourism/%EA%B0%80%EB%AC%B8%EC%9D%B4%EC%98%A4%EB%A6%84(%EA%B0%90%EC%9D%80%EC%9D%B4%EC%98%AC%EB%A6%84)_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
  'travelshoot-s3', 1, 'image/jpeg',
  'ACTIVITIES', 69, 1, TRUE, 1, NOW(), TRUE, FALSE
);

-- 가세오름 (activity_id = 70)
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
) VALUES (
  '가세오름_1_공공3유형.jpg',
  'images/activity/natureTourism/가세오름_1_공공3유형.jpg',
  'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/natureTourism/%EA%B0%80%EC%84%B8%EC%98%A4%EB%A6%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
  'travelshoot-s3', 1, 'image/jpeg',
  'ACTIVITIES', 70, 1, TRUE, 1, NOW(), TRUE, FALSE
);


INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
VALUES (
  '가시오름_1_공공3유형.jpg',
  'images/activity/natureTourism/가시오름_1_공공3유형.jpg',
  'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/activity/natureTourism/%EA%B0%80%EC%8B%9C%EC%98%A4%EB%A6%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
  'travelshoot-s3', 1, 'image/jpeg',
  'ACTIVITIES', 71, 1, TRUE, 1, NOW(), TRUE, FALSE
);



