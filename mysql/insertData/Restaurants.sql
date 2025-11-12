TRUNCATE TABLE restaurants;

SET @creator_id = 1;
SET @bucket_name = 'travelshoot-s3';

-- 기존 restaurants에 있고 files에도 있는 68개
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '52번가', '디저트', '제주특별자치도 제주시 도남로 52 (도남동)', '도남로', 33.49570308, 126.5270118, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '73st', '디저트', '제주특별자치도 제주시 해안마을길 73', '해안마을길', 33.45703399, 126.4551439, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '고사리커피', '디저트', '제주특별자치도 제주시 구좌읍 중산간동로 2064', '구좌읍', 33.47340656, 126.7640945, 4.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '고토커피바', '디저트', '제주특별자치도 제주시 애월읍 구엄동3길 56', '애월읍', 33.4810246, 126.3809026, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '그계절', '디저트', '제주특별자치도 제주시 구좌읍 한동로 119', '구좌읍', 33.5320204, 126.8185162, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '그라나다', '디저트', '제주특별자치도 제주시 도공로 86-1', '도공로', 33.4994961, 126.4640755, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '그레이그로브', '디저트', '제주특별자치도 서귀포시 안덕면 형제해안로 70', '안덕면', 33.22587376, 126.2998265, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '그린페블', '디저트', '제주특별자치도 제주시 한림읍 수동7길 54-3', '한림읍', 33.34492924, 126.2483811, 4.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '그초록', '디저트', '제주특별자치도 제주시 구좌읍 행원로7길 23-16', '구좌읍', 33.55633696, 126.8062778, 4.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '김녕에사는김영훈', '디저트', '제주특별자치도 제주시 구좌읍 김녕로6길 2', '구좌읍', 33.55429733, 126.7463525, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '다린', '디저트', '제주특별자치도 서귀포시 법환로 11 (법환동)', '법환로', 33.23655095, 126.5138521, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '델문도', '디저트', '제주특별자치도 제주시 조천읍 조함해안로 519-10', '조천읍', 33.54361115, 126.668729, 3.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '도리 관광농원', '디저트', '제주특별자치도 제주시 조천읍 비자림로 607', '조천읍', 33.43397612, 126.6726811, 3.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '듀포레', '디저트', '제주특별자치도 제주시 서해안로 579 (용담삼동)', '서해안로', 33.51855845, 126.5001053, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '드르쿰다in성산', '디저트', '제주특별자치도 서귀포시 성산읍 섭지코지로25번길 64', '성산읍', 33.44449837, 126.9191262, 4.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '라 플라주', '디저트', '제주특별자치도 제주시 조함해안로 525', '조함해안로', 33.54273903, 126.6690845, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '리틀포레스트', '디저트', '제주특별자치도 서귀포시 월평로 15', '월평로', 33.24483529, 126.4592956, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '마노르블랑', '디저트', '제주특별자치도 서귀포시 안덕면 일주서로2100번길 46', '안덕면', 33.25485104, 126.2949957, 3.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '마노커피하우스', '디저트', '제주특별자치도 서귀포시 천제연로188번길 6-6 (중문동)', '천제연로188번길', 33.25138678, 126.4239763, 4.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '마마롱', '디저트', '제주특별자치도 제주시 애월읍 평화로 2783', '애월읍', 33.45218705, 126.4391927, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '모래비 커피로스터스 앤 베이커리', '디저트', '제주특별자치도 제주시 구좌읍 해맞이해안로 462', '구좌읍', 33.55553966, 126.7962343, 3.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '모카다방', '디저트', '제주특별자치도 서귀포시 남원읍 태신해안로 125', '남원읍', 33.29219875, 126.7613961, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '목장카페드르쿰다', '디저트', '제주특별자치도 서귀포시 표선면 번영로 2454', '표선면', 33.40882213, 126.7698788, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '바다는안보여요', '디저트', '제주특별자치도 제주시 구좌읍 종달로5길 31-1', '구좌읍', 33.49340376, 126.8994462, 3.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '바람벽에흰당나귀', '디저트', '제주특별자치도 제주시 구좌읍 동복로 11', '구좌읍', 33.55388286, 126.7076142, 4.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '벙커하우스', '디저트', '제주특별자치도 서귀포시 막숙포로41번길 66 (법환동)', '막숙포로41번길', 33.24048949, 126.5192349, 5.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '봉주르마담', '디저트', '제주특별자치도 서귀포시 대청로 33 (강정동)', '대청로', 33.25279621, 126.503336, 3.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '뷰스트', '디저트', '제주특별자치도 서귀포시 안덕면 형제해안로 30', '안덕면', 33.22780694, 126.30349, 4.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '블루마운틴4255', '디저트', '제주특별자치도 서귀포시 중산간동로 4255', '중산간동로', 33.38047634, 126.8371931, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '블루메베이글', '디저트', '제주특별자치도 제주시 가령로4길 3', '가령로4길', 33.49674195, 126.5331113, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '비양놀', '디저트', '제주특별자치도 제주시 한림읍 한림해안로 311', '한림읍', 33.42900907, 126.2635168, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '수망다원', '디저트', '제주특별자치도 서귀포시 남원읍 태수로608번길 84', '남원읍', 33.3365904, 126.7189266, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '수와래베이커리', '디저트', '제주특별자치도 서귀포시 남원읍 태위로 17', '남원읍', 33.27247415, 126.6498229, 4.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '스테이위드커피', '디저트', '제주특별자치도 제주시 해안마을5길 29 (해안동)', '해안마을5길', 33.45828386, 126.4557439, 4.3, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '시스터필드', '디저트', '제주특별자치도 서귀포시 월드컵로 8 (강정동)', '월드컵로', 33.24902169, 126.5073358, 3.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '썬셋클리프', '디저트', '제주특별자치도 제주시 애월로1길 19-8', '애월로1길', 33.46183951, 126.3107175, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '아베베베이커리', '디저트', '제주특별자치도 제주시 동문로6길 4동문시장 12번 게이트 옆', '동문로6길', 33.51268456, 126.5288029, 3.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '애월더선셋', '디저트', '제주특별자치도 제주시 애월읍 일주서로 6111', '애월읍', 33.45620955, 126.3090428, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '애플망고1947', '디저트', '제주특별자치도 서귀포시 대정읍 신평로 32', '대정읍', 33.26626308, 126.2575126, 3.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '어니스트밀크 본점', '디저트', '제주특별자치도 서귀포시 성산읍 중산간동로 3147-7', '성산읍', 33.45044139, 126.8718968, 4.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '어브라운브리즈', '디저트', '제주특별자치도 제주시 박성내동길 49-1 (아라이동)', '박성내동길', 33.49085666, 126.5439271, 4.1, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '에오마르', '디저트', '제주특별자치도 제주시 선사로8길 13-6 (삼양일동)', '선사로8길', 33.52576737, 126.5865782, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '오늘은녹차한잔', '디저트', '제주특별자치도 서귀포시 표선면 중산간동로 4772', '표선면', 33.38108942, 126.7912859, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '올티스', '디저트', '제주특별자치도 제주시 조천읍 거문오름길 (23-58)', '조천읍', 33.46304862, 126.7174405, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '인스밀', '디저트', '제주특별자치도 서귀포시 대정읍 일과대수로27번길 22', '대정읍', 33.23850737, 126.2292407, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '인카페온더비치', '디저트', '제주특별자치도 제주시 구좌읍 해맞이해안로 943', '구좌읍', 33.54523298, 126.8280623, 4.3, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '재주도부러워커피', '디저트', '제주특별자치도 제주시 동문로 17', '동문로', 33.51316228, 126.5286779, 4.3, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '제주돌창고', '디저트', '제주특별자치도 제주시 한경면 조수7길 8', '한경면', 33.33712154, 126.233577, 4.1, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '청춘부부', '디저트', '제주특별자치도 서귀포시 대정읍 추사로38번길 181', '대정읍', 33.26595512, 126.2791191, 3.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '초가헌', '디저트', '제주특별자치도 서귀포시 표선면 중산간동로 4628', '표선면', 33.39035245, 126.8012793, 4.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '카페 동백', '디저트', '제주특별자치도 제주시 조천읍 동백로 68', '조천읍', 33.5091407, 126.714498, 3.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '카페 아오오', '디저트', '제주특별자치도 서귀포시 성산읍 환해장성로 75', '성산읍', 33.37911884, 126.8799727, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '카페 톨칸이', '디저트', '제주특별자치도 제주시 우도면 우도해안길 32-24', '우도면', 33.49401292, 126.9548692, 3.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '카페더라이트', '디저트', '제주특별자치도 서귀포시 성산읍 한도로 269', '성산읍', 33.46566575, 126.9360103, 3.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '카페리', '디저트', '제주특별자치도 제주시 구좌읍 평대2길 39', '구좌읍', 33.53398164, 126.8396671, 5.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '카페모알보알 제주점', '디저트', '제주특별자치도 제주시 구좌읍 구좌해안로 141', '구좌읍', 33.55959644, 126.7279651, 4.3, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '카페이면', '디저트', '제주특별자치도 제주시 한림읍 금능5길 13', '한림읍', 33.38862129, 126.2265654, 4.3, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '카페지니', '디저트', '제주특별자치도 서귀포시 남원읍 공천포로11번길 19', '남원읍', 33.26489983, 126.6406544, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '카페콜라', '디저트', '제주특별자치도 제주시 한림읍 일주서로 5857', '한림읍', 33.44334404, 126.2919279, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '카페한라산', '디저트', '제주특별자치도 제주시 구좌읍 면수1길 48', '구좌읍', 33.5247497, 126.8629764, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '커피템플', '디저트', '제주특별자치도 제주시 영평길 269 (월평동)', '영평길', 33.4782418, 126.5696391, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '커피프렌즈촬영지', '디저트', '제주특별자치도 서귀포시 안덕면 중산간서로 2026', '안덕면', 33.28868638, 126.3072217, 3.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '코리코카페 제주점', '디저트', '제주특별자치도 제주시 구좌읍 비자림로 1199제주동화마을', '구좌읍', 33.43654346, 126.7325203, 5.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '크래커스', '디저트', '제주특별자치도 서귀포시 대정읍 보성구억로126번길 34', '대정읍', 33.26331653, 126.279708, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '트라이브', '디저트', '제주특별자치도 제주시 애월읍 애월로 11', '애월읍', 33.46005916, 126.3112758, 4.3, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '하라케케', '디저트', '제주특별자치도 서귀포시 속골로 29-10 (호근동)', '속골로', 33.24261996, 126.5285813, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '허니문하우스', '디저트', '제주특별자치도 서귀포시 토평동 511', '토평동', 33.24695915, 126.5780297, 3.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '휴일로', '디저트', '제주특별자치도 서귀포시 안덕면 난드르로 49-65', '안덕면', 33.23226577, 126.3665956, 4.9, 1);

-- files에만 있던 32개 추가 (좌표는 임시값이므로 실제 데이터로 교체 필요)
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '5L2F', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '88로스터즈', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, 'AND 유 CAFE', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, 'M1971 카페 엠브릿지', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '나이체', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '랜딩커피', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '망고하이', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '머문', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '몽라브', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '바다다', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '베메로 (BAKE MAKE ROAST)', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '블리스풀', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '사일리커피', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '서홍정원', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '애월빵공장앤카페', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '영국찻집', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '오뷔아이스크림', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '와토커피', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '이정의댁', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '인디고트리', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '제주그림카페', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '제주살롱', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '젤코바 베이커리 카페', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '카페 글렌코', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '카페보롬왓', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '카페하귀리', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '커피냅로스터스 제주', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '콜린 제주', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '하례감귤점빵협동조합', '디저트', '제주특별자치도 서귀포시', '서귀포시', 33.25, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '헬로남생이', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '홀츠 애월', '디저트', '제주특별자치도 제주시 애월읍', '애월읍', 33.5, 126.3, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '훈데르트윈즈', '디저트', '제주특별자치도 제주시', '제주시', 33.5, 126.5, 4.0, 1);

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '52번가_1_공공3유형.JPG', 'images/restaurant/cafe/52%EB%B2%88%EA%B0%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/52%EB%B2%88%EA%B0%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '52번가' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '5L2F_1_공공3유형.jpg', 'images/restaurant/cafe/5L2F_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/5L2F_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '5L2F' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '73st_1_공공3유형.jpg', 'images/restaurant/cafe/73st_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/73st_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '73st' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '88로스터즈_1_공공3유형.jpg', 'images/restaurant/cafe/88%EB%A1%9C%EC%8A%A4%ED%84%B0%EC%A6%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/88%EB%A1%9C%EC%8A%A4%ED%84%B0%EC%A6%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '88로스터즈' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'AND 유 CAFE_1_공공3유형.jpg', 'images/restaurant/cafe/AND%20%EC%9C%A0%20CAFE_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/AND%20%EC%9C%A0%20CAFE_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = 'AND 유 CAFE' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'M1971 카페 엠브릿지_1_공공3유형.jpg', 'images/restaurant/cafe/M1971%20%EC%B9%B4%ED%8E%98%20%EC%97%A0%EB%B8%8C%EB%A6%BF%EC%A7%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/M1971%20%EC%B9%B4%ED%8E%98%20%EC%97%A0%EB%B8%8C%EB%A6%BF%EC%A7%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = 'M1971 카페 엠브릿지' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '고사리커피_1_공공3유형.JPG', 'images/restaurant/cafe/%EA%B3%A0%EC%82%AC%EB%A6%AC%EC%BB%A4%ED%94%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EA%B3%A0%EC%82%AC%EB%A6%AC%EC%BB%A4%ED%94%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '고사리커피' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '고토커피바_1_공공3유형.jpg', 'images/restaurant/cafe/%EA%B3%A0%ED%86%A0%EC%BB%A4%ED%94%BC%EB%B0%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EA%B3%A0%ED%86%A0%EC%BB%A4%ED%94%BC%EB%B0%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '고토커피바' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그계절_1_공공3유형.JPG', 'images/restaurant/cafe/%EA%B7%B8%EA%B3%84%EC%A0%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EA%B7%B8%EA%B3%84%EC%A0%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '그계절' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그라나다_1_공공3유형.JPG', 'images/restaurant/cafe/%EA%B7%B8%EB%9D%BC%EB%82%98%EB%8B%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EA%B7%B8%EB%9D%BC%EB%82%98%EB%8B%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '그라나다' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그레이그로브_1_공공3유형.JPG', 'images/restaurant/cafe/%EA%B7%B8%EB%A0%88%EC%9D%B4%EA%B7%B8%EB%A1%9C%EB%B8%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EA%B7%B8%EB%A0%88%EC%9D%B4%EA%B7%B8%EB%A1%9C%EB%B8%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '그레이그로브' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그린페블_1_공공3유형.jpg', 'images/restaurant/cafe/%EA%B7%B8%EB%A6%B0%ED%8E%98%EB%B8%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EA%B7%B8%EB%A6%B0%ED%8E%98%EB%B8%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '그린페블' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그초록_1_공공3유형.jpg', 'images/restaurant/cafe/%EA%B7%B8%EC%B4%88%EB%A1%9D_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EA%B7%B8%EC%B4%88%EB%A1%9D_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '그초록' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '김녕에사는김영훈_1_공공3유형.jpg', 'images/restaurant/cafe/%EA%B9%80%EB%85%95%EC%97%90%EC%82%AC%EB%8A%94%EA%B9%80%EC%98%81%ED%9B%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EA%B9%80%EB%85%95%EC%97%90%EC%82%AC%EB%8A%94%EA%B9%80%EC%98%81%ED%9B%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '김녕에사는김영훈' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나이체_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%82%98%EC%9D%B4%EC%B2%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%82%98%EC%9D%B4%EC%B2%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '나이체' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '다린_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%8B%A4%EB%A6%B0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%8B%A4%EB%A6%B0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '다린' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '델문도_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%8D%B8%EB%AC%B8%EB%8F%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%8D%B8%EB%AC%B8%EB%8F%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '델문도' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '도리 관광농원_1_공공3유형.JPG', 'images/restaurant/cafe/%EB%8F%84%EB%A6%AC%20%EA%B4%80%EA%B4%91%EB%86%8D%EC%9B%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%8F%84%EB%A6%AC%20%EA%B4%80%EA%B4%91%EB%86%8D%EC%9B%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '도리 관광농원' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '듀포레_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%93%80%ED%8F%AC%EB%A0%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%93%80%ED%8F%AC%EB%A0%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '듀포레' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '드르쿰다in성산_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%93%9C%EB%A5%B4%EC%BF%B0%EB%8B%A4in%EC%84%B1%EC%82%B0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%93%9C%EB%A5%B4%EC%BF%B0%EB%8B%A4in%EC%84%B1%EC%82%B0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '드르쿰다in성산' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '라 플라주_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%9D%BC%20%ED%94%8C%EB%9D%BC%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%9D%BC%20%ED%94%8C%EB%9D%BC%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '라 플라주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '랜딩커피_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%9E%9C%EB%94%A9%EC%BB%A4%ED%94%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%9E%9C%EB%94%A9%EC%BB%A4%ED%94%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '랜딩커피' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '리틀포레스트_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%A6%AC%ED%8B%80%ED%8F%AC%EB%A0%88%EC%8A%A4%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%A6%AC%ED%8B%80%ED%8F%AC%EB%A0%88%EC%8A%A4%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '리틀포레스트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '마노르블랑_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%A7%88%EB%85%B8%EB%A5%B4%EB%B8%94%EB%9E%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%A7%88%EB%85%B8%EB%A5%B4%EB%B8%94%EB%9E%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '마노르블랑' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '마노커피하우스_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%A7%88%EB%85%B8%EC%BB%A4%ED%94%BC%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%A7%88%EB%85%B8%EC%BB%A4%ED%94%BC%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '마노커피하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '마마롱_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%A7%88%EB%A7%88%EB%A1%B1_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%A7%88%EB%A7%88%EB%A1%B1_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '마마롱' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '망고하이_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%A7%9D%EA%B3%A0%ED%95%98%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%A7%9D%EA%B3%A0%ED%95%98%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '망고하이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '머문_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%A8%B8%EB%AC%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%A8%B8%EB%AC%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '머문' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '모래비 커피로스터스 앤 베이커리_1_공공3유형.JPG', 'images/restaurant/cafe/%EB%AA%A8%EB%9E%98%EB%B9%84%20%EC%BB%A4%ED%94%BC%EB%A1%9C%EC%8A%A4%ED%84%B0%EC%8A%A4%20%EC%95%A4%20%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%AA%A8%EB%9E%98%EB%B9%84%20%EC%BB%A4%ED%94%BC%EB%A1%9C%EC%8A%A4%ED%84%B0%EC%8A%A4%20%EC%95%A4%20%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '모래비 커피로스터스 앤 베이커리' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '모카다방_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%AA%A8%EC%B9%B4%EB%8B%A4%EB%B0%A9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%AA%A8%EC%B9%B4%EB%8B%A4%EB%B0%A9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '모카다방' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '목장카페드르쿰다_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%AA%A9%EC%9E%A5%EC%B9%B4%ED%8E%98%EB%93%9C%EB%A5%B4%EC%BF%B0%EB%8B%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%AA%A9%EC%9E%A5%EC%B9%B4%ED%8E%98%EB%93%9C%EB%A5%B4%EC%BF%B0%EB%8B%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '목장카페드르쿰다' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '몽라브_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%AA%BD%EB%9D%BC%EB%B8%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%AA%BD%EB%9D%BC%EB%B8%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '몽라브' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다는안보여요_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%B0%94%EB%8B%A4%EB%8A%94%EC%95%88%EB%B3%B4%EC%97%AC%EC%9A%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%B0%94%EB%8B%A4%EB%8A%94%EC%95%88%EB%B3%B4%EC%97%AC%EC%9A%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '바다는안보여요' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다다_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%B0%94%EB%8B%A4%EB%8B%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%B0%94%EB%8B%A4%EB%8B%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '바다다' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바람벽에흰당나귀_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%B0%94%EB%9E%8C%EB%B2%BD%EC%97%90%ED%9D%B0%EB%8B%B9%EB%82%98%EA%B7%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%B0%94%EB%9E%8C%EB%B2%BD%EC%97%90%ED%9D%B0%EB%8B%B9%EB%82%98%EA%B7%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '바람벽에흰당나귀' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '벙커하우스_1_공공3유형.JPG', 'images/restaurant/cafe/%EB%B2%99%EC%BB%A4%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%B2%99%EC%BB%A4%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '벙커하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '베메로 (BAKE MAKE ROAST)_1_공공3유형.JPG', 'images/restaurant/cafe/%EB%B2%A0%EB%A9%94%EB%A1%9C%20%28BAKE%20MAKE%20ROAST%29_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%B2%A0%EB%A9%94%EB%A1%9C%20%28BAKE%20MAKE%20ROAST%29_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '베메로 (BAKE MAKE ROAST)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '봉주르마담_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%B4%89%EC%A3%BC%EB%A5%B4%EB%A7%88%EB%8B%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%B4%89%EC%A3%BC%EB%A5%B4%EB%A7%88%EB%8B%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '봉주르마담' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '뷰스트_1_공공3유형.JPG', 'images/restaurant/cafe/%EB%B7%B0%EC%8A%A4%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%B7%B0%EC%8A%A4%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '뷰스트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '블루마운틴4255_1_공공3유형.JPG', 'images/restaurant/cafe/%EB%B8%94%EB%A3%A8%EB%A7%88%EC%9A%B4%ED%8B%B44255_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%B8%94%EB%A3%A8%EB%A7%88%EC%9A%B4%ED%8B%B44255_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '블루마운틴4255' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '블루메베이글_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%B8%94%EB%A3%A8%EB%A9%94%EB%B2%A0%EC%9D%B4%EA%B8%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%B8%94%EB%A3%A8%EB%A9%94%EB%B2%A0%EC%9D%B4%EA%B8%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '블루메베이글' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '블리스풀_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%B8%94%EB%A6%AC%EC%8A%A4%ED%92%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%B8%94%EB%A6%AC%EC%8A%A4%ED%92%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '블리스풀' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '비양놀_1_공공3유형.jpg', 'images/restaurant/cafe/%EB%B9%84%EC%96%91%EB%86%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EB%B9%84%EC%96%91%EB%86%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '비양놀' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '사일리커피_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%82%AC%EC%9D%BC%EB%A6%AC%EC%BB%A4%ED%94%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%82%AC%EC%9D%BC%EB%A6%AC%EC%BB%A4%ED%94%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '사일리커피' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서홍정원_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%84%9C%ED%99%8D%EC%A0%95%EC%9B%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%84%9C%ED%99%8D%EC%A0%95%EC%9B%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '서홍정원' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '수망다원_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%88%98%EB%A7%9D%EB%8B%A4%EC%9B%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%88%98%EB%A7%9D%EB%8B%A4%EC%9B%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '수망다원' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '수와래베이커리_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%88%98%EC%99%80%EB%9E%98%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%88%98%EC%99%80%EB%9E%98%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '수와래베이커리' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '스테이위드커피_1_공공3유형.JPG', 'images/restaurant/cafe/%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%9C%84%EB%93%9C%EC%BB%A4%ED%94%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%9C%84%EB%93%9C%EC%BB%A4%ED%94%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '스테이위드커피' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '시스터필드_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%8B%9C%EC%8A%A4%ED%84%B0%ED%95%84%EB%93%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%8B%9C%EC%8A%A4%ED%84%B0%ED%95%84%EB%93%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '시스터필드' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '썬셋클리프_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%8D%AC%EC%85%8B%ED%81%B4%EB%A6%AC%ED%94%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%8D%AC%EC%85%8B%ED%81%B4%EB%A6%AC%ED%94%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '썬셋클리프' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '아베베베이커리_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%95%84%EB%B2%A0%EB%B2%A0%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%95%84%EB%B2%A0%EB%B2%A0%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '아베베베이커리' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '애월더선셋_1_공공3유형.JPG', 'images/restaurant/cafe/%EC%95%A0%EC%9B%94%EB%8D%94%EC%84%A0%EC%85%8B_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%95%A0%EC%9B%94%EB%8D%94%EC%84%A0%EC%85%8B_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '애월더선셋' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '애월빵공장앤카페_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%95%A0%EC%9B%94%EB%B9%B5%EA%B3%B5%EC%9E%A5%EC%95%A4%EC%B9%B4%ED%8E%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%95%A0%EC%9B%94%EB%B9%B5%EA%B3%B5%EC%9E%A5%EC%95%A4%EC%B9%B4%ED%8E%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '애월빵공장앤카페' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '애플망고1947_1_공공3유형.JPG', 'images/restaurant/cafe/%EC%95%A0%ED%94%8C%EB%A7%9D%EA%B3%A01947_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%95%A0%ED%94%8C%EB%A7%9D%EA%B3%A01947_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '애플망고1947' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '어니스트밀크 본점_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%96%B4%EB%8B%88%EC%8A%A4%ED%8A%B8%EB%B0%80%ED%81%AC%20%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%96%B4%EB%8B%88%EC%8A%A4%ED%8A%B8%EB%B0%80%ED%81%AC%20%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '어니스트밀크 본점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '어브라운브리즈_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%96%B4%EB%B8%8C%EB%9D%BC%EC%9A%B4%EB%B8%8C%EB%A6%AC%EC%A6%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%96%B4%EB%B8%8C%EB%9D%BC%EC%9A%B4%EB%B8%8C%EB%A6%AC%EC%A6%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '어브라운브리즈' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에오마르_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%97%90%EC%98%A4%EB%A7%88%EB%A5%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%97%90%EC%98%A4%EB%A7%88%EB%A5%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '에오마르' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '영국찻집_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%98%81%EA%B5%AD%EC%B0%BB%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%98%81%EA%B5%AD%EC%B0%BB%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '영국찻집' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '오늘은녹차한잔_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%98%A4%EB%8A%98%EC%9D%80%EB%85%B9%EC%B0%A8%ED%95%9C%EC%9E%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%98%A4%EB%8A%98%EC%9D%80%EB%85%B9%EC%B0%A8%ED%95%9C%EC%9E%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '오늘은녹차한잔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '오뷔아이스크림_1_공공1유형.jpg', 'images/restaurant/cafe/%EC%98%A4%EB%B7%94%EC%95%84%EC%9D%B4%EC%8A%A4%ED%81%AC%EB%A6%BC_1_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%98%A4%EB%B7%94%EC%95%84%EC%9D%B4%EC%8A%A4%ED%81%AC%EB%A6%BC_1_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '오뷔아이스크림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '올티스_1_공공3유형.png', 'images/restaurant/cafe/%EC%98%AC%ED%8B%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.png', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%98%AC%ED%8B%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.png', @bucket_name, 1, 'image/png', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '올티스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '와토커피_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%99%80%ED%86%A0%EC%BB%A4%ED%94%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%99%80%ED%86%A0%EC%BB%A4%ED%94%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '와토커피' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '이정의댁_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%9D%B4%EC%A0%95%EC%9D%98%EB%8C%81_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%9D%B4%EC%A0%95%EC%9D%98%EB%8C%81_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '이정의댁' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '인디고트리_1_공공1유형.jpg', 'images/restaurant/cafe/%EC%9D%B8%EB%94%94%EA%B3%A0%ED%8A%B8%EB%A6%AC_1_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%9D%B8%EB%94%94%EA%B3%A0%ED%8A%B8%EB%A6%AC_1_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '인디고트리' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '인스밀_1_공공3유형.JPG', 'images/restaurant/cafe/%EC%9D%B8%EC%8A%A4%EB%B0%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%9D%B8%EC%8A%A4%EB%B0%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '인스밀' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '인카페온더비치_1_공공3유형.JPG', 'images/restaurant/cafe/%EC%9D%B8%EC%B9%B4%ED%8E%98%EC%98%A8%EB%8D%94%EB%B9%84%EC%B9%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%9D%B8%EC%B9%B4%ED%8E%98%EC%98%A8%EB%8D%94%EB%B9%84%EC%B9%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '인카페온더비치' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '재주도부러워커피_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%9E%AC%EC%A3%BC%EB%8F%84%EB%B6%80%EB%9F%AC%EC%9B%8C%EC%BB%A4%ED%94%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%9E%AC%EC%A3%BC%EB%8F%84%EB%B6%80%EB%9F%AC%EC%9B%8C%EC%BB%A4%ED%94%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '재주도부러워커피' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주그림카페_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%A0%9C%EC%A3%BC%EA%B7%B8%EB%A6%BC%EC%B9%B4%ED%8E%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%A0%9C%EC%A3%BC%EA%B7%B8%EB%A6%BC%EC%B9%B4%ED%8E%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '제주그림카페' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주돌창고_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%A0%9C%EC%A3%BC%EB%8F%8C%EC%B0%BD%EA%B3%A0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%A0%9C%EC%A3%BC%EB%8F%8C%EC%B0%BD%EA%B3%A0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '제주돌창고' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주살롱_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%A0%9C%EC%A3%BC%EC%82%B4%EB%A1%B1_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%A0%9C%EC%A3%BC%EC%82%B4%EB%A1%B1_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '제주살롱' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '젤코바 베이커리 카페_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%A0%A4%EC%BD%94%EB%B0%94%20%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC%20%EC%B9%B4%ED%8E%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%A0%A4%EC%BD%94%EB%B0%94%20%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC%20%EC%B9%B4%ED%8E%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '젤코바 베이커리 카페' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '청춘부부_1_공공3유형.jpeg', 'images/restaurant/cafe/%EC%B2%AD%EC%B6%98%EB%B6%80%EB%B6%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpeg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%B2%AD%EC%B6%98%EB%B6%80%EB%B6%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpeg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '청춘부부' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '초가헌_1_공공3유형.JPG', 'images/restaurant/cafe/%EC%B4%88%EA%B0%80%ED%97%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%B4%88%EA%B0%80%ED%97%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '초가헌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카페 글렌코_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%B9%B4%ED%8E%98%20%EA%B8%80%EB%A0%8C%EC%BD%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%B9%B4%ED%8E%98%20%EA%B8%80%EB%A0%8C%EC%BD%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '카페 글렌코' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카페 동백_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%B9%B4%ED%8E%98%20%EB%8F%99%EB%B0%B1_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%B9%B4%ED%8E%98%20%EB%8F%99%EB%B0%B1_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '카페 동백' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카페 아오오_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%B9%B4%ED%8E%98%20%EC%95%84%EC%98%A4%EC%98%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%B9%B4%ED%8E%98%20%EC%95%84%EC%98%A4%EC%98%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '카페 아오오' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카페 톨칸이_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%B9%B4%ED%8E%98%20%ED%86%A8%EC%B9%B8%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%B9%B4%ED%8E%98%20%ED%86%A8%EC%B9%B8%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '카페 톨칸이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카페더라이트_1_공공3유형.JPG', 'images/restaurant/cafe/%EC%B9%B4%ED%8E%98%EB%8D%94%EB%9D%BC%EC%9D%B4%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%B9%B4%ED%8E%98%EB%8D%94%EB%9D%BC%EC%9D%B4%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '카페더라이트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카페리_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%B9%B4%ED%8E%98%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%B9%B4%ED%8E%98%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '카페리' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카페모알보알 제주점_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%B9%B4%ED%8E%98%EB%AA%A8%EC%95%8C%EB%B3%B4%EC%95%8C%20%EC%A0%9C%EC%A3%BC%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%B9%B4%ED%8E%98%EB%AA%A8%EC%95%8C%EB%B3%B4%EC%95%8C%20%EC%A0%9C%EC%A3%BC%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '카페모알보알 제주점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카페보롬왓_1_공공3유형.JPG', 'images/restaurant/cafe/%EC%B9%B4%ED%8E%98%EB%B3%B4%EB%A1%AC%EC%99%93_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%B9%B4%ED%8E%98%EB%B3%B4%EB%A1%AC%EC%99%93_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '카페보롬왓' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카페이면_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%B9%B4%ED%8E%98%EC%9D%B4%EB%A9%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%B9%B4%ED%8E%98%EC%9D%B4%EB%A9%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '카페이면' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카페지니_1_공공3유형.JPG', 'images/restaurant/cafe/%EC%B9%B4%ED%8E%98%EC%A7%80%EB%8B%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%B9%B4%ED%8E%98%EC%A7%80%EB%8B%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '카페지니' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카페콜라_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%B9%B4%ED%8E%98%EC%BD%9C%EB%9D%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%B9%B4%ED%8E%98%EC%BD%9C%EB%9D%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '카페콜라' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카페하귀리_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%B9%B4%ED%8E%98%ED%95%98%EA%B7%80%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%B9%B4%ED%8E%98%ED%95%98%EA%B7%80%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '카페하귀리' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카페한라산_1_공공3유형.JPG', 'images/restaurant/cafe/%EC%B9%B4%ED%8E%98%ED%95%9C%EB%9D%BC%EC%82%B0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%B9%B4%ED%8E%98%ED%95%9C%EB%9D%BC%EC%82%B0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '카페한라산' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '커피냅로스터스 제주_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%BB%A4%ED%94%BC%EB%83%85%EB%A1%9C%EC%8A%A4%ED%84%B0%EC%8A%A4%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%BB%A4%ED%94%BC%EB%83%85%EB%A1%9C%EC%8A%A4%ED%84%B0%EC%8A%A4%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '커피냅로스터스 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '커피템플_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%BB%A4%ED%94%BC%ED%85%9C%ED%94%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%BB%A4%ED%94%BC%ED%85%9C%ED%94%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '커피템플' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '커피프렌즈촬영지_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%BB%A4%ED%94%BC%ED%94%84%EB%A0%8C%EC%A6%88%EC%B4%AC%EC%98%81%EC%A7%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%BB%A4%ED%94%BC%ED%94%84%EB%A0%8C%EC%A6%88%EC%B4%AC%EC%98%81%EC%A7%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '커피프렌즈촬영지' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '코리코카페 제주점_1_공공1유형.jpg', 'images/restaurant/cafe/%EC%BD%94%EB%A6%AC%EC%BD%94%EC%B9%B4%ED%8E%98%20%EC%A0%9C%EC%A3%BC%EC%A0%90_1_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%BD%94%EB%A6%AC%EC%BD%94%EC%B9%B4%ED%8E%98%20%EC%A0%9C%EC%A3%BC%EC%A0%90_1_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '코리코카페 제주점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '콜린 제주_1_공공3유형.jpg', 'images/restaurant/cafe/%EC%BD%9C%EB%A6%B0%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%EC%BD%9C%EB%A6%B0%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '콜린 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '크래커스_1_공공3유형.jpg', 'images/restaurant/cafe/%ED%81%AC%EB%9E%98%EC%BB%A4%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%ED%81%AC%EB%9E%98%EC%BB%A4%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '크래커스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '트라이브_1_공공3유형.JPG', 'images/restaurant/cafe/%ED%8A%B8%EB%9D%BC%EC%9D%B4%EB%B8%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%ED%8A%B8%EB%9D%BC%EC%9D%B4%EB%B8%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '트라이브' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '하라케케_1_공공3유형.JPG', 'images/restaurant/cafe/%ED%95%98%EB%9D%BC%EC%BC%80%EC%BC%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%ED%95%98%EB%9D%BC%EC%BC%80%EC%BC%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '하라케케' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '하례감귤점빵협동조합_1_공공3유형.jpg', 'images/restaurant/cafe/%ED%95%98%EB%A1%80%EA%B0%90%EA%B7%A4%EC%A0%90%EB%B9%B5%ED%98%91%EB%8F%99%EC%A1%B0%ED%95%A9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%ED%95%98%EB%A1%80%EA%B0%90%EA%B7%A4%EC%A0%90%EB%B9%B5%ED%98%91%EB%8F%99%EC%A1%B0%ED%95%A9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '하례감귤점빵협동조합' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '허니문하우스_1_공공3유형.jpg', 'images/restaurant/cafe/%ED%97%88%EB%8B%88%EB%AC%B8%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%ED%97%88%EB%8B%88%EB%AC%B8%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '허니문하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '헬로남생이_1_공공3유형.jpg', 'images/restaurant/cafe/%ED%97%AC%EB%A1%9C%EB%82%A8%EC%83%9D%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%ED%97%AC%EB%A1%9C%EB%82%A8%EC%83%9D%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '헬로남생이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '홀츠 애월_1_공공3유형.jpg', 'images/restaurant/cafe/%ED%99%80%EC%B8%A0%20%EC%95%A0%EC%9B%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%ED%99%80%EC%B8%A0%20%EC%95%A0%EC%9B%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '홀츠 애월' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '훈데르트윈즈_1_공공3유형.jpg', 'images/restaurant/cafe/%ED%9B%88%EB%8D%B0%EB%A5%B4%ED%8A%B8%EC%9C%88%EC%A6%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%ED%9B%88%EB%8D%B0%EB%A5%B4%ED%8A%B8%EC%9C%88%EC%A6%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '훈데르트윈즈' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '휴일로_1_공공3유형.jpg', 'images/restaurant/cafe/%ED%9C%B4%EC%9D%BC%EB%A1%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/cafe/%ED%9C%B4%EC%9D%BC%EB%A1%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '휴일로' LIMIT 1;

-- 한식
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '가시식당', '한식', '제주특별자치도 서귀포시 표선면 성읍정의로 81', '표선면', 33.40041655, 126.8021451, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '가시아방국수', '한식', '제주특별자치도 서귀포시 성산읍 섭지코지로 10', '성산읍', 33.43865733, 126.9180931, 4.1, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '갈치바다 애월', '한식', '제주특별자치도 제주시 애월읍 애월해안로 524', '애월읍', 33.47769255, 126.3607469, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '갈치왕', '한식', '제주특별자치도 서귀포시 일주서로 1146 (상예동)', '일주서로', 33.26468201, 126.3907705, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '검은노루', '한식', '제주특별자치도 서귀포시 대정읍 상모로 257', '대정읍', 33.22389838, 126.2617326, 4.1, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '경성수산', '한식', '제주특별자치도 제주시 한림읍 한림로 632', '한림읍', 33.41297275, 126.2619093, 4.3, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '공천포식당', '한식', '제주특별자치도 서귀포시 남원읍 공천포로 89', '남원읍', 33.26641637, 126.6425959, 4.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '곽지국시', '한식', '제주특별자치도 제주시 애월읍 곽지10길 10', '애월읍', 33.45052928, 126.3075311, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '광양해장국집', '한식', '제주특별자치도 제주시 광양13길 25', '광양13길', 33.49988326, 126.5326585, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '구좌읍 우럭튀김 민경이네어등포식당', '한식', '제주특별자치도 제주시 구좌읍 해맞이해안로 1366', '구좌읍', 33.53461027, 126.8518569, 3.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '굼부리식당', '한식', '제주특별자치도 서귀포시 표선면 중산간동로 4587', '표선면', 33.38839161, 126.8048485, 3.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '귤품은흑돼지 제주공항점', '한식', '제주특별자치도 제주시 공항로 2 (용담이동)', '공항로', 33.50767127, 126.4926355, 4.1, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '금강민물장어', '한식', '제주특별자치도 서귀포시 일주동로 8597', '일주동로', 33.25431654, 126.5695497, 4.1, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '금악 똣똣라면', '한식', '제주특별자치도 제주시 한림읍 금악로 18', '한림읍', 33.35868126, 126.2966405, 3.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '김선장회센타', '한식', '제주특별자치도 제주시 구좌읍 해맞이해안로 1930', '구좌읍', 33.51814282, 126.8921322, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '김마리', '한식', '제주특별자치도 제주시 광양14길 17-10 (이도이동)', '광양14길', 33.49716962, 126.5293671, 4.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '꽃밥', '한식', '제주특별자치도 제주시 애월읍 애월북서길 56', '애월읍', 33.46881884, 126.3251581, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '논짓물식당', '한식', '제주특별자치도 제주시 성화로9길 10 (용담이동)', '성화로9길', 33.51265917, 126.5044162, 3.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '놀맨', '한식', '제주특별자치도 제주시 애월읍 애월로1길 24', '애월읍', 33.46250332, 126.3102064, 4.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '누이밥집', '한식', '제주특별자치도 서귀포시 중산간서로 695 (회수동)', '중산간서로', 33.26313298, 126.4411801, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '다정이네 올레시장 본점', '한식', '제주특별자치도 제주시 중앙로 251 (이도일동)', '중앙로', 33.50920892, 126.5267632, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '도갈비', '한식', '제주특별자치도 제주시 한라대학로 85 (노형동)', '한라대학로', 33.47655444, 126.4793136, 4.1, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '도두해녀의집', '한식', '제주특별자치도 제주시 도두1동 1165-1', '도두1동', 33.49521851, 126.4583569, 4.1, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '독개물항', '한식', '제주특별자치도 제주시 한림읍 한림로 478', '한림읍', 33.40191466, 126.251624, 3.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '돌하르방식당', '한식', '제주특별자치도 제주시 한림읍 한림로 300', '한림읍', 33.39020188, 126.2397419, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '동도원', '한식', '제주특별자치도 서귀포시 이어도로 189 (대포동)', '이어도로', 33.23926062, 126.4417917, 3.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '동복뚝배기', '한식', '제주특별자치도 제주시 구좌읍 동복로 30-2', '구좌읍', 33.55321629, 126.7093336, 3.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '두리둠비', '한식', '제주특별자치도 제주시 구좌읍 세화해변로 69', '구좌읍', 33.53068686, 126.8691096, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '뚱딴지 애월본점', '한식', '제주특별자치도 제주시 애월읍 부룡수길 17', '애월읍', 33.47458879, 126.3546912, 3.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '마돈', '한식', '제주특별자치도 제주시 한림읍 금능서1길 5', '한림읍', 33.38775724, 126.2327564, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '마두천손칼국수', '한식', '제주특별자치도 제주시 용해로 45', '용해로', 33.5131341, 126.5029913, 3.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '만족한상회 중문점', '한식', '제주특별자치도 서귀포시 중문상로 58-5 (중문동)', '중문상로', 33.25353103, 126.4267399, 4.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '명랑스낵', '한식', '제주특별자치도 제주시 한림읍 한림로 585', '한림읍', 33.40922507, 126.2587593, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '명문가시리식당', '한식', '제주특별자치도 서귀포시 표선면 번영로 2134', '표선면', 33.38643357, 126.7562914, 3.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '모슬포한라전복 본점', '한식', '제주특별자치도 서귀포시 대정읍 대한로 33', '대정읍', 33.23051128, 126.2452034, 3.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '모해통갈치화덕구이', '한식', '제주특별자치도 서귀포시 성산읍 일출로 267', '성산읍', 33.46180781, 126.9337412, 4.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '바다를본돼지', '한식', '제주특별자치도 제주시 애월읍 애월북서길 33', '애월읍', 33.46778607, 126.3242568, 4.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '바다제비', '한식', '제주특별자치도 제주시 한림읍 한림로 640', '한림읍', 33.41334967, 126.2620867, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '바당한그릇', '한식', '제주특별자치도 제주시 애월읍 애월해안로 552-3', '애월읍', 33.47843293, 126.3624376, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '바타타식탁', '한식', '제주특별자치도 서귀포시 표선면 표선동서로264번길 22', '표선면', 33.32716554, 126.8359361, 3.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '백가네제주한상 함덕본점', '한식', '제주특별자치도 제주시 조천읍 신북로 438', '조천읍', 33.54330444, 126.6602021, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '별돈별 정원본점', '한식', '제주특별자치도 제주시 한경면 고산로8길 21-15', '한경면', 33.30887661, 126.1800962, 4.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '부부요리단', '한식', '제주특별자치도 서귀포시 월드컵로 63 (법환동)1층', '월드컵로', 33.24370004, 126.5059832, 3.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '사랑분식', '한식', '제주특별자치도 제주시 동문로4길 12 (일도일동)', '동문로4길', 33.5124929, 126.5278586, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '산지해장국', '한식', '제주특별자치도 제주시 서사로 13 (삼도일동)', '서사로', 33.51394081, 126.5163808, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '삼다해물뚝배기', '한식', '제주특별자치도 서귀포시 일주동로 8167', '일주동로', 33.2602916, 126.6148456, 4.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '삼매봉153', '한식', '제주특별자치도 서귀포시 남성중로153번길 15 서귀포시 삼매봉도서관', '남성중로153번길', 33.24485619, 126.5519736, 3.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '삼보식당', '한식', '제주특별자치도 서귀포시 중정로 25 (서귀동)', '중정로', 33.24764489, 126.5590869, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '생원전복', '한식', '제주특별자치도 서귀포시 안덕면 산방로 7', '안덕면', 33.24587481, 126.3307706, 4.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '선흘곶', '한식', '제주특별자치도 제주시 조천읍 선흘서2길 22', '조천읍', 33.51089289, 126.6901501, 4.1, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '성산포 자연산 회센타', '한식', '제주특별자치도 서귀포시 성산읍 한도로 67', '성산읍', 33.46817069, 126.9154093, 4.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '성산해촌', '한식', '제주특별자치도 서귀포시 성산읍 일출로 284-10', '성산읍', 33.46307308, 126.9348308, 4.1, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '성읍칠십리식당', '한식', '제주특별자치도 서귀포시 표선면 성읍리 828', '표선면', 33.39776301, 126.8042798, 3.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '소규모식탁', '한식', '제주특별자치도 제주시 애월읍 애월북서길 52-7', '애월읍', 33.46873021, 126.3250253, 4.1, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '소라횟집', '한식', '제주특별자치도 제주시 구좌읍 해맞이해안로 1240-3', '구좌읍', 33.53250969, 126.8463055, 4.3, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '소섬전복', '한식', '제주특별자치도 제주시 우도면 우도해안길 1158', '우도면', 33.49886811, 126.9651071, 4.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '손맛촌', '한식', '제주특별자치도 제주시 조천읍 비자림로 661', '조천읍', 33.4373536, 126.6773612, 4.3, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '순천미향 제주산방산본점', '한식', '제주특별자치도 서귀포시 안덕면 사계남로216번길 24-73', '안덕면', 33.23570065, 126.3124946, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '시골길', '한식', '제주특별자치도 제주시 오복2길 23 (이도이동)', '오복2길', 33.49403119, 126.5363666, 3.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '신해바라기', '한식', '제주특별자치도 제주시 관덕로13길 13 (일도일동)', '관덕로13길', 33.51424267, 126.5259504, 4.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '안녕전복', '한식', '제주특별자치도 제주시 오일장중길 89-16 (도두일동)', '오일장중길', 33.49899634, 126.4759245, 4.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '안녕협재씨', '한식', '제주특별자치도 제주시 한림읍 금능길 12', '한림읍', 33.38659927, 126.2249905, 4.3, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '앙끄레국수 서귀포본점', '한식', '제주특별자치도 서귀포시 법환상로2번길 97-18 (법환동)', '법환상로2번길', 33.2474636, 126.5117576, 3.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '애월리순메밀막국수', '한식', '제주특별자치도 제주시 애월읍 애월해안로 11', '애월읍', 33.4656614, 126.3163947, 5.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '애월튀김간', '한식', '제주특별자치도 제주시 애월읍 애월로 118', '애월읍', 33.4643977, 126.319775, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '어멍이해녀', '한식', '제주특별자치도 제주시 구좌읍 해맞이해안로 2244', '구좌읍', 33.49987823, 126.9112117, 3.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '연미정', '한식', '제주특별자치도 제주시 애월읍 애월북서길 25', '애월읍', 33.4658927, 126.3207207, 4.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '연정식당', '한식', '제주특별자치도 제주시 신광로10길 29 (연동)', '신광로10길', 33.48381486, 126.4867767, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '예원이네 은갈치조림', '한식', '제주특별자치도 서귀포시 색달중앙로 49 (색달동)', '색달중앙로', 33.25983568, 126.4133187, 4.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '옛날옛적 성산본점', '한식', '제주특별자치도 서귀포시 성산읍 일주동로 4660', '성산읍', 33.41440138, 126.8999785, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '오조해녀의집', '한식', '제주특별자치도 제주시 한경면 노을해안로 1118', '한경면', 33.31084359, 126.1794662, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '운정이네', '한식', '제주특별자치도 서귀포시 중산간서로 726 (중문동)', '중산간서로', 33.26357732, 126.4377637, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '월정리 달이뜨는식탁 (달이뜨는식탁)', '한식', '제주특별자치도 제주시 구좌읍 월정1길 14', '구좌읍', 33.55318706, 126.790807, 4.1, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '육도담 제주시청본점', '한식', '제주특별자치도 제주시 광양12길 17 (이도이동)', '광양12길', 33.49933693, 126.5302901, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '은혜전복', '한식', '제주특별자치도 제주시 애월읍 애월로1길 24-3', '애월읍', 33.46301715, 126.3101759, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '일통이반', '한식', '제주특별자치도 제주시 중앙로2길 25 (삼도이동)', '중앙로2길', 33.51710063, 126.5220923, 4.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '자연몸국', '한식', '제주특별자치도 제주시 애월읍 일주서로 7213', '애월읍', 33.41828615, 126.2788773, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '장수해장국', '한식', '제주특별자치도 서귀포시 천제연로 152', '천제연로', 33.25256994, 126.4210515, 4.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '장모식탁', '한식', '제주특별자치도 제주시 연신로 51 (이도이동)', '연신로', 33.49687826, 126.5469489, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '재벌식당', '한식', '제주특별자치도 제주시 애월읍 애월로1길 16', '애월읍', 33.46284372, 126.3100762, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '정가네밥상', '한식', '제주특별자치도 제주시 아란서길 110 (아라일동)', '아란서길', 33.46875627, 126.5399669, 3.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '제주공항그때그집', '한식', '제주특별자치도 제주시 공항로 2 (용담이동)', '공항로', 33.50767127, 126.4926355, 3.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '제주광해 애월점', '한식', '제주특별자치도 제주시 애월읍 애월해안로 867', '애월읍', 33.48777678, 126.3904433, 4.3, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '제주또시랑', '한식', '제주특별자치도 제주시 중앙로17길 21 (삼도이동)', '중앙로17길', 33.51175773, 126.5232341, 4.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '제주로운청해원', '한식', '제주특별자치도 서귀포시 성산읍 신양로 101', '성산읍', 33.4367798, 126.9206596, 4.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '제주미담', '한식', '제주특별자치도 제주시 가령로 19 (이도이동)', '가령로', 33.5023775, 126.5372941, 4.1, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '제주선채향', '한식', '제주특별자치도 제주시 첨단로 197 (영평동)', '첨단로', 33.45066577, 126.5593858, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '제주순메밀막국수', '한식', '제주특별자치도 서귀포시 안덕면 녹차분재로 60', '안덕면', 33.29130823, 126.3019249, 4.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '제주시새우리', '한식', '제주특별자치도 제주시 무근성7길 24 (삼도이동)', '무근성7길', 33.51463977, 126.520748, 3.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '제주에가면', '한식', '제주특별자치도 제주시 탑동로 119 (삼도이동)', '탑동로', 33.51476471, 126.5180205, 3.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '제주연탄길 신제주본점', '한식', '제주특별자치도 제주시 연화남길 10 (연동)', '연화남길', 33.47574635, 126.4894322, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '제주태백산본점', '한식', '제주특별자치도 제주시 도공로 154-12 (이호이동)', '도공로', 33.49476889, 126.4672143, 3.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '제주한라국수', '한식', '제주특별자치도 서귀포시 천제연로188번길 17(중문동)', '천제연로188번길', 33.25031191, 126.424429, 3.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '제주해물밥', '한식', '제주특별자치도 제주시 월대3길 14-6', '월대3길', 33.49473504, 126.4339783, 4.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '젬마손', '한식', '제주특별자치도 제주시 진동로 3 (화북일동, 건하주택)', '진동로', 33.5193789, 126.5686021, 3.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '종달해녀의집', '한식', '제주특별자치도 제주시 구좌읍 해맞이해안로 2276', '구좌읍', 33.49715075, 126.9109146, 5.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '중문 돌담흑돼지', '한식', '제주특별자치도 서귀포시 중문상로 16 (중문동)', '중문상로', 33.25298732, 126.4225166, 4.1, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '중문고등어쌈밥', '한식', '제주특별자치도 서귀포시 일주서로 1240 (상예동)', '일주서로', 33.26530401, 126.380938, 4.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '중문색달통갈치 본점', '한식', '제주특별자치도 서귀포시 일주서로 993 (색달동)', '일주서로', 33.25839126, 126.4045389, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '중문해물라면오빠네', '한식', '제주특별자치도 서귀포시 일주서로 962 (색달동)', '일주서로', 33.25836354, 126.4080775, 5.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '중문회포장센터 새벽야시장', '한식', '제주특별자치도 서귀포시 중문관광로 293 (대포동)', '중문관광로', 33.24665683, 126.4292787, 4.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '죽성고을', '한식', '제주특별자치도 제주시 한북로 176 (오등동)', '한북로', 33.46228189, 126.5341175, 4.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '짱구분식', '한식', '제주특별자치도 제주시 애월읍 애월로 109-1', '애월읍', 33.46390843, 126.3195001, 3.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '차롱보말전복칼국수 제주공항점', '한식', '제주특별자치도 제주시 서해안로 468-4 (용담삼동)', '서해안로', 33.51853328, 126.4894035, 3.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '착한튀김', '한식', '제주특별자치도 제주시 애월읍 애월로 109', '애월읍', 33.46392155, 126.3195193, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '참맛나김밥', '한식', '제주특별자치도 제주시 한라대학로 31 (노형동)', '한라대학로', 33.47864858, 126.4750334, 3.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '청운식당', '한식', '제주특별자치도 서귀포시 성산읍 일출로 285', '성산읍', 33.46308824, 126.9348911, 3.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '춘심이네', '한식', '제주특별자치도 서귀포시 안덕면 창천중앙로24번길 16', '안덕면', 33.26450672, 126.3705528, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '카페술도가제주바당', '한식', '제주특별자치도 제주시 구좌읍 한동로 271층', '구좌읍', 33.53726714, 126.8245378, 3.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '크라운돼지', '한식', '제주특별자치도 제주시 애월읍 상가목장길 84', '애월읍', 33.39343989, 126.3834849, 3.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '토끼와거북이', '한식', '제주특별자치도 제주시 조천읍 신북로 503', '조천읍', 33.54342336, 126.6639869, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '평대스낵', '한식', '제주특별자치도 제주시 구좌읍 대수길 26', '구좌읍', 33.53663965, 126.8379755, 4.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '포도원흑돼지', '한식', '제주특별자치도 제주시 수목원길 51 (연동)', '수목원길', 33.47005811, 126.4901906, 5.0, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '하귀정담', '한식', '제주특별자치도 제주시 중앙로12길 21 (삼도이동)', '중앙로12길', 33.51215118, 126.5224396, 4.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '한길정', '한식', '제주특별자치도 제주시 화북일동 2366-1', '화북일동', 33.51987451, 126.5758593, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '한라식당', '한식', '제주특별자치도 제주시 광양9길 19', '광양9길', 33.50049429, 126.5318224, 3.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '한림칼국수 제주본점', '한식', '제주특별자치도 제주시 한림읍 한림해안로 141', '한림읍', 33.41559663, 126.2615173, 3.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '한성식당', '한식', '제주특별자치도 서귀포시 성산읍 일출로 287', '성산읍', 33.46320767, 126.9350133, 3.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '함덕회춘', '한식', '제주특별자치도 제주시 조천읍 신북로 489', '조천읍', 33.54315832, 126.6624906, 4.3, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '그리운바다성산포', '한식', '제주특별자치도 서귀포시 성산읍 성산등용로 94', '성산읍', 33.46989019, 126.9299886, 4.5, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '골목식당', '한식', '제주특별자치도 제주시 중앙로 63-9 (이도일동)', '중앙로', 33.51185126, 126.5250283, 3.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '나라돈까스', '한식', '제주특별자치도 제주시 내도1길 23 (내도동)', '내도1길', 33.49521003, 126.4370363, 4.2, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '남춘식당', '한식', '제주특별자치도 제주시 청귤로 12 (이도이동)', '청귤로', 33.49969447, 126.5375247, 3.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '담백 월정리본점', '한식', '제주특별자치도 제주시 구좌읍 해맞이해안로 518', '구좌읍', 33.55646186, 126.8013338, 3.8, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '해녀잠수촌', '한식', '제주특별자치도 제주시 서해안로 498(용담삼동)', '서해안로', 33.5192638, 126.4921643, 4.4, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '해녀촌', '한식', '제주특별자치도 제주시 구좌읍 동복로 33', '구좌읍', 33.55368847, 126.7098946, 4.3, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '해성도뚜리', '한식', '제주특별자치도 제주시 애월읍 애월해안로 682', '애월읍', 33.48178831, 126.3749809, 4.9, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50130, '해왓', '한식', '제주특별자치도 서귀포시 성산읍 신고로 30-1', '성산읍', 33.43855177, 126.9171793, 3.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '협재신국수', '한식', '제주특별자치도 제주시 한림읍 명재로 17', '한림읍', 33.39522646, 126.2488049, 4.7, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '혼저', '한식', '제주특별자치도 제주시 한림읍 한림로 158', '한림읍', 33.38576602, 126.2248545, 4.3, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '효퇴국수국밥', '한식', '제주특별자치도 제주시 애월읍 고성리 396-3', '애월읍', 33.47301063, 126.3488805, 4.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '형돈', '한식', '제주특별자치도 제주시 구남로 22 (이도이동)', '구남로', 33.4893511, 126.5329253, 4.6, 1);
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, is_active) VALUES (50110, '훈남횟집', '한식', '제주특별자치도 제주시 조천읍 함덕13길 7', '조천읍', 33.54212797, 126.6678652, 4.9, 1);


SET @bucket_name = 'travelshoot-s3';
SET @creator_id = 1;
select * from restaurants;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '가시식당_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EA%B0%80%EC%8B%9C%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%B0%80%EC%8B%9C%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '가시식당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '가시아방국수_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EA%B0%80%EC%8B%9C%EC%95%84%EB%B0%A9%EA%B5%AD%EC%88%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%B0%80%EC%8B%9C%EC%95%84%EB%B0%A9%EA%B5%AD%EC%88%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '가시아방국수' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '갈치바다 애월_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EA%B0%88%EC%B9%98%EB%B0%94%EB%8B%A4%20%EC%95%A0%EC%9B%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%B0%88%EC%B9%98%EB%B0%94%EB%8B%A4%20%EC%95%A0%EC%9B%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '갈치바다 애월' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '갈치왕_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EA%B0%88%EC%B9%98%EC%99%95_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%B0%88%EC%B9%98%EC%99%95_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '갈치왕' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '검은노루_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EA%B2%80%EC%9D%80%EB%85%B8%EB%A3%A8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%B2%80%EC%9D%80%EB%85%B8%EB%A3%A8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '검은노루' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '경성수산_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EA%B2%BD%EC%84%B1%EC%88%98%EC%82%B0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%B2%BD%EC%84%B1%EC%88%98%EC%82%B0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '경성수산' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '공천포식당_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EA%B3%B5%EC%B2%9C%ED%8F%AC%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%B3%B5%EC%B2%9C%ED%8F%AC%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '공천포식당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '곽지국시_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EA%B3%BD%EC%A7%80%EA%B5%AD%EC%8B%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%B3%BD%EC%A7%80%EA%B5%AD%EC%8B%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '곽지국시' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '광양해장국집_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EA%B4%91%EC%96%91%ED%95%B4%EC%9E%A5%EA%B5%AD%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%B4%91%EC%96%91%ED%95%B4%EC%9E%A5%EA%B5%AD%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '광양해장국집' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '구좌읍 우럭튀김 민경이네어등포식당_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EA%B5%AC%EC%A2%8C%EC%9D%8D%20%EC%9A%B0%EB%9F%AD%ED%8A%80%EA%B9%80%20%EB%AF%BC%EA%B2%BD%EC%9D%B4%EB%84%A4%EC%96%B4%EB%93%B1%ED%8F%AC%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%B5%AC%EC%A2%8C%EC%9D%8D%20%EC%9A%B0%EB%9F%AD%ED%8A%80%EA%B9%80%20%EB%AF%BC%EA%B2%BD%EC%9D%B4%EB%84%A4%EC%96%B4%EB%93%B1%ED%8F%AC%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '구좌읍 우럭튀김 민경이네어등포식당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '굼부리식당_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EA%B5%BC%EB%B6%80%EB%A6%AC%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%B5%BC%EB%B6%80%EB%A6%AC%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '굼부리식당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '귤품은흑돼지 제주공항점_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EA%B7%A4%ED%92%88%EC%9D%80%ED%9D%91%EB%8F%BC%EC%A7%80%20%EC%A0%9C%EC%A3%BC%EA%B3%B5%ED%95%AD%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%B7%A4%ED%92%88%EC%9D%80%ED%9D%91%EB%8F%BC%EC%A7%80%20%EC%A0%9C%EC%A3%BC%EA%B3%B5%ED%95%AD%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '귤품은흑돼지 제주공항점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '금강민물장어_1_공공3유형.JPG', 'images/restaurant/koreaFood/%EA%B8%88%EA%B0%95%EB%AF%BC%EB%AC%BC%EC%9E%A5%EC%96%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%B8%88%EA%B0%95%EB%AF%BC%EB%AC%BC%EC%9E%A5%EC%96%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '금강민물장어' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '금악 똣똣라면_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EA%B8%88%EC%95%85%20%EB%98%A3%EB%98%A3%EB%9D%BC%EB%A9%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%B8%88%EC%95%85%20%EB%98%A3%EB%98%A3%EB%9D%BC%EB%A9%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '금악 똣똣라면' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '김선장회센타_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EA%B9%80%EC%84%A0%EC%9E%A5%ED%9A%8C%EC%84%BC%ED%83%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%B9%80%EC%84%A0%EC%9E%A5%ED%9A%8C%EC%84%BC%ED%83%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '김선장회센타' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '꽃밥_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EA%BD%83%EB%B0%A5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EA%BD%83%EB%B0%A5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '꽃밥' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '논짓물식당_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%85%BC%EC%A7%93%EB%AC%BC%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%85%BC%EC%A7%93%EB%AC%BC%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '논짓물식당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '놀맨_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%86%80%EB%A7%A8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%86%80%EB%A7%A8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '놀맨' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '누이밥집_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%88%84%EC%9D%B4%EB%B0%A5%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%88%84%EC%9D%B4%EB%B0%A5%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '누이밥집' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '다정이네 올레시장 본점_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%8B%A4%EC%A0%95%EC%9D%B4%EB%84%A4%20%EC%98%AC%EB%A0%88%EC%8B%9C%EC%9E%A5%20%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%8B%A4%EC%A0%95%EC%9D%B4%EB%84%A4%20%EC%98%AC%EB%A0%88%EC%8B%9C%EC%9E%A5%20%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '다정이네 올레시장 본점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '도갈비_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%8F%84%EA%B0%88%EB%B9%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%8F%84%EA%B0%88%EB%B9%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '도갈비' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '도두해녀의집_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%8F%84%EB%91%90%ED%95%B4%EB%85%80%EC%9D%98%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%8F%84%EB%91%90%ED%95%B4%EB%85%80%EC%9D%98%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '도두해녀의집' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '독개물항_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%8F%85%EA%B0%9C%EB%AC%BC%ED%95%AD_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%8F%85%EA%B0%9C%EB%AC%BC%ED%95%AD_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '독개물항' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '돌하르방식당_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%8F%8C%ED%95%98%EB%A5%B4%EB%B0%A9%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%8F%8C%ED%95%98%EB%A5%B4%EB%B0%A9%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '돌하르방식당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '두리둠비_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%91%90%EB%A6%AC%EB%91%A0%EB%B9%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%91%90%EB%A6%AC%EB%91%A0%EB%B9%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '두리둠비' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '뚱딴지 애월본점_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%9A%B1%EB%94%B4%EC%A7%80%20%EC%95%A0%EC%9B%94%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%9A%B1%EB%94%B4%EC%A7%80%20%EC%95%A0%EC%9B%94%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '뚱딴지 애월본점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '마돈_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%A7%88%EB%8F%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%A7%88%EB%8F%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '마돈' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '마두천손칼국수_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%A7%88%EB%91%90%EC%B2%9C%EC%86%90%EC%B9%BC%EA%B5%AD%EC%88%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%A7%88%EB%91%90%EC%B2%9C%EC%86%90%EC%B9%BC%EA%B5%AD%EC%88%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '마두천손칼국수' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '만족한상회 중문점_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%A7%8C%EC%A1%B1%ED%95%9C%EC%83%81%ED%9A%8C%20%EC%A4%91%EB%AC%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%A7%8C%EC%A1%B1%ED%95%9C%EC%83%81%ED%9A%8C%20%EC%A4%91%EB%AC%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '만족한상회 중문점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '명문가시리식당_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%AA%85%EB%AC%B8%EA%B0%80%EC%8B%9C%EB%A6%AC%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%AA%85%EB%AC%B8%EA%B0%80%EC%8B%9C%EB%A6%AC%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '명문가시리식당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '모슬포한라전복 본점_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%AA%A8%EC%8A%AC%ED%8F%AC%ED%95%9C%EB%9D%BC%EC%A0%84%EB%B3%B5%20%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%AA%A8%EC%8A%AC%ED%8F%AC%ED%95%9C%EB%9D%BC%EC%A0%84%EB%B3%B5%20%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '모슬포한라전복 본점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '모해통갈치화덕구이_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%AA%A8%ED%95%B4%ED%86%B5%EA%B0%88%EC%B9%98%ED%99%94%EB%8D%95%EA%B5%AC%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%AA%A8%ED%95%B4%ED%86%B5%EA%B0%88%EC%B9%98%ED%99%94%EB%8D%95%EA%B5%AC%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '모해통갈치화덕구이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다를본돼지_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%B0%94%EB%8B%A4%EB%A5%BC%EB%B3%B8%EB%8F%BC%EC%A7%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%B0%94%EB%8B%A4%EB%A5%BC%EB%B3%B8%EB%8F%BC%EC%A7%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '바다를본돼지' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바당한그릇_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%B0%94%EB%8B%B9%ED%95%9C%EA%B7%B8%EB%A6%87_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%B0%94%EB%8B%B9%ED%95%9C%EA%B7%B8%EB%A6%87_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '바당한그릇' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바타타식탁_1_공공3유형.JPG', 'images/restaurant/koreaFood/%EB%B0%94%ED%83%80%ED%83%80%EC%8B%9D%ED%83%81_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%B0%94%ED%83%80%ED%83%80%EC%8B%9D%ED%83%81_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '바타타식탁' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '백가네제주한상 함덕본점_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EB%B0%B1%EA%B0%80%EB%84%A4%EC%A0%9C%EC%A3%BC%ED%95%9C%EC%83%81%20%ED%95%A8%EB%8D%95%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%B0%B1%EA%B0%80%EB%84%A4%EC%A0%9C%EC%A3%BC%ED%95%9C%EC%83%81%20%ED%95%A8%EB%8D%95%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '백가네제주한상 함덕본점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '부부요리단_1_공공1유형.jpg', 'images/restaurant/koreaFood/%EB%B6%80%EB%B6%80%EC%9A%94%EB%A6%AC%EB%8B%A8_1_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EB%B6%80%EB%B6%80%EC%9A%94%EB%A6%AC%EB%8B%A8_1_%EA%B3%B5%EA%B3%B51%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '부부요리단' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '사랑분식_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%82%AC%EB%9E%91%EB%B6%84%EC%8B%9D_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%82%AC%EB%9E%91%EB%B6%84%EC%8B%9D_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '사랑분식' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '산지해장국_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%82%B0%EC%A7%80%ED%95%B4%EC%9E%A5%EA%B5%AD_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%82%B0%EC%A7%80%ED%95%B4%EC%9E%A5%EA%B5%AD_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '산지해장국' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '삼매봉153_1_공공3유형.JPG', 'images/restaurant/koreaFood/%EC%82%BC%EB%A7%A4%EB%B4%89153_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%82%BC%EB%A7%A4%EB%B4%89153_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '삼매봉153' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '삼보식당_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%82%BC%EB%B3%B4%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%82%BC%EB%B3%B4%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '삼보식당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '생원전복_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%83%9D%EC%9B%90%EC%A0%84%EB%B3%B5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%83%9D%EC%9B%90%EC%A0%84%EB%B3%B5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '생원전복' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '선흘곶_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%84%A0%ED%9D%98%EA%B3%B6_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%84%A0%ED%9D%98%EA%B3%B6_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '선흘곶' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '성산포 자연산 회센타_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%84%B1%EC%82%B0%ED%8F%AC%20%EC%9E%90%EC%97%B0%EC%82%B0%20%ED%9A%8C%EC%84%BC%ED%83%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%84%B1%EC%82%B0%ED%8F%AC%20%EC%9E%90%EC%97%B0%EC%82%B0%20%ED%9A%8C%EC%84%BC%ED%83%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '성산포 자연산 회센타' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '성산해촌_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%84%B1%EC%82%B0%ED%95%B4%EC%B4%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%84%B1%EC%82%B0%ED%95%B4%EC%B4%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '성산해촌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '성읍칠십리식당_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%84%B1%EC%9D%8D%EC%B9%A0%EC%8B%AD%EB%A6%AC%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%84%B1%EC%9D%8D%EC%B9%A0%EC%8B%AD%EB%A6%AC%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '성읍칠십리식당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '소규모식탁_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%86%8C%EA%B7%9C%EB%AA%A8%EC%8B%9D%ED%83%81_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%86%8C%EA%B7%9C%EB%AA%A8%EC%8B%9D%ED%83%81_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '소규모식탁' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '소라횟집_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%86%8C%EB%9D%BC%ED%9A%9F%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%86%8C%EB%9D%BC%ED%9A%9F%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '소라횟집' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '손맛촌_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%86%90%EB%A7%9B%EC%B4%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%86%90%EB%A7%9B%EC%B4%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '손맛촌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '순천미향 제주산방산본점_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%88%9C%EC%B2%9C%EB%AF%B8%ED%96%A5%20%EC%A0%9C%EC%A3%BC%EC%82%B0%EB%B0%A9%EC%82%B0%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%88%9C%EC%B2%9C%EB%AF%B8%ED%96%A5%20%EC%A0%9C%EC%A3%BC%EC%82%B0%EB%B0%A9%EC%82%B0%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '순천미향 제주산방산본점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '안녕전복_1_공공3유형.JPG', 'images/restaurant/koreaFood/%EC%95%88%EB%85%95%EC%A0%84%EB%B3%B5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%95%88%EB%85%95%EC%A0%84%EB%B3%B5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '안녕전복' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '안녕협재씨_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%95%88%EB%85%95%ED%98%91%EC%9E%AC%EC%94%A8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%95%88%EB%85%95%ED%98%91%EC%9E%AC%EC%94%A8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '안녕협재씨' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '애월튀김간_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%95%A0%EC%9B%94%ED%8A%80%EA%B9%80%EA%B0%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%95%A0%EC%9B%94%ED%8A%80%EA%B9%80%EA%B0%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '애월튀김간' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '어멍이해녀_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%96%B4%EB%A9%8D%EC%9D%B4%ED%95%B4%EB%85%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%96%B4%EB%A9%8D%EC%9D%B4%ED%95%B4%EB%85%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '어멍이해녀' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '연미정_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%97%B0%EB%AF%B8%EC%A0%95_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%97%B0%EB%AF%B8%EC%A0%95_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '연미정' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '예원이네 은갈치조림_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%98%88%EC%9B%90%EC%9D%B4%EB%84%A4%20%EC%9D%80%EA%B0%88%EC%B9%98%EC%A1%B0%EB%A6%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%98%88%EC%9B%90%EC%9D%B4%EB%84%A4%20%EC%9D%80%EA%B0%88%EC%B9%98%EC%A1%B0%EB%A6%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '예원이네 은갈치조림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '옛날옛적 성산본점_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%98%9B%EB%82%A0%EC%98%9B%EC%A0%81%20%EC%84%B1%EC%82%B0%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%98%9B%EB%82%A0%EC%98%9B%EC%A0%81%20%EC%84%B1%EC%82%B0%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '옛날옛적 성산본점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '오조해녀의집_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%98%A4%EC%A1%B0%ED%95%B4%EB%85%80%EC%9D%98%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%98%A4%EC%A1%B0%ED%95%B4%EB%85%80%EC%9D%98%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '오조해녀의집' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '운정이네_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%9A%B4%EC%A0%95%EC%9D%B4%EB%84%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%9A%B4%EC%A0%95%EC%9D%B4%EB%84%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '운정이네' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '월정리 달이뜨는식탁 (달이뜨는식탁)_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%9B%94%EC%A0%95%EB%A6%AC%20%EB%8B%AC%EC%9D%B4%EB%9C%A8%EB%8A%94%EC%8B%9D%ED%83%81%20%28%EB%8B%AC%EC%9D%B4%EB%9C%A8%EB%8A%94%EC%8B%9D%ED%83%81%29_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%9B%94%EC%A0%95%EB%A6%AC%20%EB%8B%AC%EC%9D%B4%EB%9C%A8%EB%8A%94%EC%8B%9D%ED%83%81%20%28%EB%8B%AC%EC%9D%B4%EB%9C%A8%EB%8A%94%EC%8B%9D%ED%83%81%29_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '월정리 달이뜨는식탁 (달이뜨는식탁)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '육도담 제주시청본점_1_공공3유형.JPG', 'images/restaurant/koreaFood/%EC%9C%A1%EB%8F%84%EB%8B%B4%20%EC%A0%9C%EC%A3%BC%EC%8B%9C%EC%B2%AD%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%9C%A1%EB%8F%84%EB%8B%B4%20%EC%A0%9C%EC%A3%BC%EC%8B%9C%EC%B2%AD%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '육도담 제주시청본점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '은혜전복_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%9D%80%ED%98%9C%EC%A0%84%EB%B3%B5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%9D%80%ED%98%9C%EC%A0%84%EB%B3%B5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '은혜전복' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '일통이반_1_공공3유형.JPG', 'images/restaurant/koreaFood/%EC%9D%BC%ED%86%B5%EC%9D%B4%EB%B0%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%9D%BC%ED%86%B5%EC%9D%B4%EB%B0%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '일통이반' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '자연몸국_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%9E%90%EC%97%B0%EB%AA%B8%EA%B5%AD_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%9E%90%EC%97%B0%EB%AA%B8%EA%B5%AD_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '자연몸국' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '장수해장국_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%9E%A5%EC%88%98%ED%95%B4%EC%9E%A5%EA%B5%AD_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%9E%A5%EC%88%98%ED%95%B4%EC%9E%A5%EA%B5%AD_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '장수해장국' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '재벌식당_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%9E%AC%EB%B2%8C%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%9E%AC%EB%B2%8C%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '재벌식당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '정가네밥상_1_공공3유형.JPG', 'images/restaurant/koreaFood/%EC%A0%95%EA%B0%80%EB%84%A4%EB%B0%A5%EC%83%81_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%A0%95%EA%B0%80%EB%84%A4%EB%B0%A5%EC%83%81_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '정가네밥상' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주공항그때그집_1_공공3유형.JPG', 'images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EA%B3%B5%ED%95%AD%EA%B7%B8%EB%95%8C%EA%B7%B8%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EA%B3%B5%ED%95%AD%EA%B7%B8%EB%95%8C%EA%B7%B8%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '제주공항그때그집' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주광해 애월점_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EA%B4%91%ED%95%B4%20%EC%95%A0%EC%9B%94%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EA%B4%91%ED%95%B4%20%EC%95%A0%EC%9B%94%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '제주광해 애월점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주또시랑_1_공공3유형.JPG', 'images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EB%98%90%EC%8B%9C%EB%9E%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EB%98%90%EC%8B%9C%EB%9E%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '제주또시랑' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주로운청해원_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EB%A1%9C%EC%9A%B4%EC%B2%AD%ED%95%B4%EC%9B%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EB%A1%9C%EC%9A%B4%EC%B2%AD%ED%95%B4%EC%9B%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '제주로운청해원' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주선채향_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EC%84%A0%EC%B1%84%ED%96%A5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EC%84%A0%EC%B1%84%ED%96%A5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '제주선채향' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주순메밀막국수_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EC%88%9C%EB%A9%94%EB%B0%80%EB%A7%89%EA%B5%AD%EC%88%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EC%88%9C%EB%A9%94%EB%B0%80%EB%A7%89%EA%B5%AD%EC%88%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '제주순메밀막국수' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주시새우리_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EC%8B%9C%EC%83%88%EC%9A%B0%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EC%8B%9C%EC%83%88%EC%9A%B0%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '제주시새우리' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주연탄길 신제주본점_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EC%97%B0%ED%83%84%EA%B8%B8%20%EC%8B%A0%EC%A0%9C%EC%A3%BC%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%EC%97%B0%ED%83%84%EA%B8%B8%20%EC%8B%A0%EC%A0%9C%EC%A3%BC%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '제주연탄길 신제주본점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주태백산본점_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%ED%83%9C%EB%B0%B1%EC%82%B0%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%ED%83%9C%EB%B0%B1%EC%82%B0%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '제주태백산본점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주한라국수_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%ED%95%9C%EB%9D%BC%EA%B5%AD%EC%88%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%ED%95%9C%EB%9D%BC%EA%B5%AD%EC%88%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '제주한라국수' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주해물밥_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%ED%95%B4%EB%AC%BC%EB%B0%A5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%A0%9C%EC%A3%BC%ED%95%B4%EB%AC%BC%EB%B0%A5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '제주해물밥' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '종달해녀의집_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%A2%85%EB%8B%AC%ED%95%B4%EB%85%80%EC%9D%98%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%A2%85%EB%8B%AC%ED%95%B4%EB%85%80%EC%9D%98%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '종달해녀의집' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '중문 돌담흑돼지_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%A4%91%EB%AC%B8%20%EB%8F%8C%EB%8B%B4%ED%9D%91%EB%8F%BC%EC%A7%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%A4%91%EB%AC%B8%20%EB%8F%8C%EB%8B%B4%ED%9D%91%EB%8F%BC%EC%A7%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '중문 돌담흑돼지' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '짱구분식_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%A7%B1%EA%B5%AC%EB%B6%84%EC%8B%9D_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%A7%B1%EA%B5%AC%EB%B6%84%EC%8B%9D_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '짱구분식' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '착한튀김_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%B0%A9%ED%95%9C%ED%8A%80%EA%B9%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%B0%A9%ED%95%9C%ED%8A%80%EA%B9%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '착한튀김' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '참맛나김밥_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%B0%B8%EB%A7%9B%EB%82%98%EA%B9%80%EB%B0%A5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%B0%B8%EB%A7%9B%EB%82%98%EA%B9%80%EB%B0%A5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '참맛나김밥' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '청운식당_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%B2%AD%EC%9A%B4%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%B2%AD%EC%9A%B4%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '청운식당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '춘심이네_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%B6%98%EC%8B%AC%EC%9D%B4%EB%84%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%B6%98%EC%8B%AC%EC%9D%B4%EB%84%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '춘심이네' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카페술도가제주바당_1_공공3유형.jpg', 'images/restaurant/koreaFood/%EC%B9%B4%ED%8E%98%EC%88%A0%EB%8F%84%EA%B0%80%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%EC%B9%B4%ED%8E%98%EC%88%A0%EB%8F%84%EA%B0%80%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '카페술도가제주바당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '토끼와거북이_1_공공3유형.jpg', 'images/restaurant/koreaFood/%ED%86%A0%EB%81%BC%EC%99%80%EA%B1%B0%EB%B6%81%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%ED%86%A0%EB%81%BC%EC%99%80%EA%B1%B0%EB%B6%81%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '토끼와거북이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '포도원흑돼지_1_공공3유형.jpg', 'images/restaurant/koreaFood/%ED%8F%AC%EB%8F%84%EC%9B%90%ED%9D%91%EB%8F%BC%EC%A7%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%ED%8F%AC%EB%8F%84%EC%9B%90%ED%9D%91%EB%8F%BC%EC%A7%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '포도원흑돼지' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '하귀정담_1_공공3유형.JPG', 'images/restaurant/koreaFood/%ED%95%98%EA%B7%80%EC%A0%95%EB%8B%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%ED%95%98%EA%B7%80%EC%A0%95%EB%8B%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '하귀정담' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '한길정_1_공공3유형.JPG', 'images/restaurant/koreaFood/%ED%95%9C%EA%B8%B8%EC%A0%95_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%ED%95%9C%EA%B8%B8%EC%A0%95_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '한길정' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '한라식당_1_공공3유형.jpg', 'images/restaurant/koreaFood/%ED%95%9C%EB%9D%BC%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%ED%95%9C%EB%9D%BC%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '한라식당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '한림칼국수 제주본점_1_공공3유형.jpg', 'images/restaurant/koreaFood/%ED%95%9C%EB%A6%BC%EC%B9%BC%EA%B5%AD%EC%88%98%20%EC%A0%9C%EC%A3%BC%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%ED%95%9C%EB%A6%BC%EC%B9%BC%EA%B5%AD%EC%88%98%20%EC%A0%9C%EC%A3%BC%EB%B3%B8%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '한림칼국수 제주본점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '한성식당_1_공공3유형.jpg', 'images/restaurant/koreaFood/%ED%95%9C%EC%84%B1%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%ED%95%9C%EC%84%B1%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '한성식당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '해녀잠수촌_1_공공3유형.jpg', 'images/restaurant/koreaFood/%ED%95%B4%EB%85%80%EC%9E%A0%EC%88%98%EC%B4%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%ED%95%B4%EB%85%80%EC%9E%A0%EC%88%98%EC%B4%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '해녀잠수촌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '해녀촌_1_공공3유형.jpg', 'images/restaurant/koreaFood/%ED%95%B4%EB%85%80%EC%B4%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%ED%95%B4%EB%85%80%EC%B4%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '해녀촌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '해성도뚜리_1_공공3유형.jpg', 'images/restaurant/koreaFood/%ED%95%B4%EC%84%B1%EB%8F%84%EB%9A%9C%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%ED%95%B4%EC%84%B1%EB%8F%84%EB%9A%9C%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '해성도뚜리' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '해왓_1_공공3유형.jpg', 'images/restaurant/koreaFood/%ED%95%B4%EC%99%93_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%ED%95%B4%EC%99%93_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '해왓' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '협재신국수_1_공공3유형.jpg', 'images/restaurant/koreaFood/%ED%98%91%EC%9E%AC%EC%8B%A0%EA%B5%AD%EC%88%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%ED%98%91%EC%9E%AC%EC%8B%A0%EA%B5%AD%EC%88%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '협재신국수' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '혼저_1_공공3유형.jpg', 'images/restaurant/koreaFood/%ED%98%BC%EC%A0%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%ED%98%BC%EC%A0%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '혼저' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '효퇴국수국밥_1_공공3유형.jpg', 'images/restaurant/koreaFood/%ED%9A%A8%ED%87%B4%EA%B5%AD%EC%88%98%EA%B5%AD%EB%B0%A5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/koreaFood/%ED%9A%A8%ED%87%B4%EA%B5%AD%EC%88%98%EA%B5%AD%EB%B0%A5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '효퇴국수국밥' LIMIT 1;


-- 일식

INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '[백년가게]향원복집', '일식', '제주특별자치도 서귀포시 부두로 43', '부두로', 33.24117903, 126.5648726, 4.5, NULL, NULL, TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '513텐동', '일식', '제주특별자치도 제주시 구남로8길 17 (이도이동)', '구남로8길', 33.49029272, 126.5370555, 4.2, NULL, '매주 토요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '다미회', '일식', '제주특별자치도 제주시 동광로2길 9-4', '동광로2길', 33.50042762, 126.5312475, 4.3, NULL, '매주 일요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '당포로나인 돈카츠', '일식', '제주특별자치도 서귀포시 표선면 표선당포로 9', '표선면', 33.32578803, 126.8435882, 4.3, NULL, '매주 일요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '동해미락', '일식', '제주특별자치도 서귀포시 칠십리로 133', '칠십리로', 33.2436427, 126.5682723, 4.3, NULL, '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '두모리이수사', '일식', '제주특별자치도 제주시 한경면 두신로 112', '한경면', 33.35261629, 126.184867, 4.2, NULL, '매주 월요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '래용', '일식', '제주특별자치도 제주시 우정로 17 제웅1차솔내음빌리지', '우정로', 33.49124094, 126.4311758, 4.2, NULL, '매주 토요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '만부정', '일식', '제주특별자치도 제주시 사장길 38', '사장길', 33.48260401, 126.4945566, 4.4, NULL, '설·추석 당일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '만지식당', '일식', '제주특별자치도 제주시 애월읍 고내로 13-1', '애월읍', 33.46331479, 126.3390761, 4.2, NULL, '매주 목요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '마니주', '일식', '제주특별자치도 제주시 광령2길 1021, 2층', '광령2길', 33.45120366, 126.4288714, 4.3, NULL, '매주 수요일 / 명절 당일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '모루쿠다', '일식', '제주특별자치도 서귀포시 태평로431번길 32 1층', '태평로431번길', 33.24832826, 126.5661835, 4.1, NULL, NULL, TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '문쏘 제주협재점', '일식', '제주특별자치도 제주시 한림상로 15-5', '한림상로', 33.40572821, 126.2569179, 4.3, NULL, '매주 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '미친부엌', '일식', '제주특별자치도 제주시 탑동로 15 (삼도이동)', '탑동로', 33.51702843, 126.5231672, 4.3, NULL, '매주 월요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '부온', '일식', '제주특별자치도 제주시 구남동2길 26', '구남동2길', 33.48946501, 126.5352862, 4.3, NULL, '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '사계의시간', '일식', '제주특별자치도 서귀포시 사계남로 214', '사계남로', 33.23224542, 126.3089978, 4.4, NULL, '매주 월요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '서작가초밥집', '일식', '제주특별자치도 서귀포시 태평로 416-1', '태평로', 33.24487862, 126.5648114, 4.3, NULL, '매주 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '성산 타쿠마스시', '일식', '제주특별자치도 서귀포시 성산읍 섭지코지로 15', '성산읍', 33.43907396, 126.9185069, 4.4, NULL, '매주 화요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '스시애월', '일식', '제주특별자치도 제주시 애월읍 장전로 57', '애월읍', 33.45222507, 126.3842808, 4.6, NULL, '매주 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '심바카레', '일식', '제주특별자치도 제주시 애월읍 애월로 87-16', '애월읍', 33.46341721, 126.3168642, 4.3, NULL, '매주 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '아리', '일식', '제주특별자치도 서귀포시 홍중로 99 (서홍동)', '홍중로', 33.26143775, 126.5554202, 4.3, NULL, '매주 일요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '연돈', '일식', '제주특별자치도 서귀포시 색달로 10 (색달동)', '색달로', 33.25889123, 126.4061249, 4.7, NULL, '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '영육일삼', '일식', '제주특별자치도 서귀포시 이어도로 679 (강정동)', '이어도로', 33.23447022, 126.4883516, 4.4, NULL, '매주 화요일, 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '올레안뜰', '일식', '제주특별자치도 서귀포시 법환로 24(법환동)', '법환로', 33.23725919, 126.5128244, 4.3, NULL, '매주 목요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '온차', '일식', '제주특별자치도 제주시 서부두남길 12', '서부두남길', 33.51518426, 126.5276835, 4.2, NULL, '매주 금요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '우동카덴', '일식', '제주특별자치도 제주시 조천읍 교래3길 23', '조천읍', 33.43586768, 126.6793083, 4.4, NULL, '매주 화요일, 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '이돈갓', '일식', '제주특별자치도 제주시 칠성로길 27 (일도일동)', '칠성로길', 33.51453431, 126.5257893, 4.3, NULL, '매주 월요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '잔마이 제원', '일식', '제주특별자치도 제주시 제원길 16', '제원길', 33.48852271, 126.4892292, 4.4, NULL, '화요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '잇칸시타', '일식', '제주특별자치도 제주시 애월읍 신엄안2길 54-1', '애월읍', 33.47711376, 126.3702509, 4.3, NULL, '매주 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '털보네장원랜드', '일식', '제주특별자치도 제주시 1100로 3001', '1100로', 33.45463197, 126.4862746, 4.2, NULL, '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '제주고로', '일식', '제주특별자치도 서귀포시 대정읍 서삼중로 94', '대정읍', 33.2711839, 126.2024645, 4.1, NULL, '매주 화요일, 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '표선우동가게', '일식', '제주특별자치도 서귀포시 표선관정로 105-1', '표선관정로', 33.32413246, 126.8312977, 4.3, NULL, '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '코우', '일식', '제주특별자치도 서귀포시 신중로13번길 3-5 (강정동)', '신중로13번길', 33.25616256, 126.506294, 4.3, NULL, '매주 일요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '키친아루요', '일식', '제주특별자치도 제주시 애월읍 유수암평화5길 15-8', '애월읍', 33.42379244, 126.4052962, 4.3, NULL, '매주 일요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '하나', '일식', '제주특별자치도 제주시 우정로11길 5 1층', '우정로11길', 33.48802186, 126.4316731, 4.2, NULL, '매주 화요일, 매월 마지막주 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '협재 수우동', '일식', '제주특별자치도 제주시 한림읍 협재1길 11', '한림읍', 33.39654289, 126.242486, 4.4, NULL, '매주 화요일 / 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '호자', '일식', '제주특별자치도 제주시 세화8길 7', '세화8길', 33.52150831, 126.8575797, 4.2, NULL, '설·추석 연휴', TRUE, NOW(), NOW());







SET @bucket_name = 'travelshoot-s3';
SET @creator_id = 1;

-- [백년가게]향원복집
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT '[백년가게]향원복집_1_공공3유형.jpg',
       'images/restaurant/japanenseFood/%5B%EB%B0%B1%EB%85%84%EA%B0%80%EA%B2%8C%5D%ED%96%A5%EC%9B%90%EB%B3%B5%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%5B%EB%B0%B1%EB%85%84%EA%B0%80%EA%B2%8C%5D%ED%96%A5%EC%9B%90%EB%B3%B5%EC%A7%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
       @bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
       r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '[백년가게]향원복집' LIMIT 1;

-- 513텐동
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'513텐동_1_공공3유형.JPG',
'images/restaurant/japanenseFood/513%ED%85%90%EB%8F%99_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/513%ED%85%90%EB%8F%99_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '513텐동' LIMIT 1;

-- 당포로나인 돈카츠
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'당포로나인 돈카츠_1_공공3유형.JPG',
'images/restaurant/japanenseFood/%EB%8B%B9%ED%8F%AC%EB%A1%9C%EB%82%98%EC%9D%B8%20%EB%8F%88%EC%B9%B4%EC%B8%A0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EB%8B%B9%ED%8F%AC%EB%A1%9C%EB%82%98%EC%9D%B8%20%EB%8F%88%EC%B9%B4%EC%B8%A0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r
WHERE r.restaurant_name = '당포로나인 돈카츠'
LIMIT 1;

-- 동해미락
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'동해미락_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EB%8F%99%ED%95%B4%EB%AF%B8%EB%9D%BD_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EB%8F%99%ED%95%B4%EB%AF%B8%EB%9D%BD_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '동해미락' LIMIT 1;

-- 두모리이수사
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'두모리이수사_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EB%91%90%EB%AA%A8%EB%A6%AC%EC%9D%B4%EC%88%98%EC%82%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EB%91%90%EB%AA%A8%EB%A6%AC%EC%9D%B4%EC%88%98%EC%82%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '두모리이수사' LIMIT 1;

-- 래용
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'래용_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EB%9E%98%EC%9A%A9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EB%9E%98%EC%9A%A9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '래용' LIMIT 1;

-- 만부정
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'만부정_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EB%A7%8C%EB%B6%80%EC%A0%95_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EB%A7%8C%EB%B6%80%EC%A0%95_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '만부정' LIMIT 1;

-- 만지식당
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'만지식당_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EB%A7%8C%EC%A7%80%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EB%A7%8C%EC%A7%80%EC%8B%9D%EB%8B%B9_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '만지식당' LIMIT 1;

-- 문쏘 제주협재점
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'문쏘 제주협재점_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EB%AC%B8%EC%8F%98%20%EC%A0%9C%EC%A3%BC%ED%98%91%EC%9E%AC%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EB%AC%B8%EC%8F%98%20%EC%A0%9C%EC%A3%BC%ED%98%91%EC%9E%AC%EC%A0%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '문쏘 제주협재점' LIMIT 1;

-- 미친부엌
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'미친부엌_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EB%AF%B8%EC%B9%9C%EB%B6%80%EC%97%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EB%AF%B8%EC%B9%9C%EB%B6%80%EC%97%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '미친부엌' LIMIT 1;

-- 부온
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'부온_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EB%B6%80%EC%98%A8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EB%B6%80%EC%98%A8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '부온' LIMIT 1;

-- 사계의시간
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'사계의시간_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EC%82%AC%EA%B3%84%EC%9D%98%EC%8B%9C%EA%B0%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EC%82%AC%EA%B3%84%EC%9D%98%EC%8B%9C%EA%B0%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '사계의시간' LIMIT 1;

-- 성산 타쿠마스시
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'성산 타쿠마스시_1_공공3유형.png',
'images/restaurant/japanenseFood/%EC%84%B1%EC%82%B0%20%ED%83%80%EC%BF%A0%EB%A7%88%EC%8A%A4%EC%8B%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.png',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EC%84%B1%EC%82%B0%20%ED%83%80%EC%BF%A0%EB%A7%88%EC%8A%A4%EC%8B%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.png',
@bucket_name, 1, 'image/png', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '성산 타쿠마스시' LIMIT 1;

-- 스시애월
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'스시애월_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EC%8A%A4%EC%8B%9C%EC%95%A0%EC%9B%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EC%8A%A4%EC%8B%9C%EC%95%A0%EC%9B%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '스시애월' LIMIT 1;

-- 심바카레
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'심바카레_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EC%8B%AC%EB%B0%94%EC%B9%B4%EB%A0%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EC%8B%AC%EB%B0%94%EC%B9%B4%EB%A0%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '심바카레' LIMIT 1;

-- 아리
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'아리_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EC%95%84%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EC%95%84%EB%A6%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '아리' LIMIT 1;

-- 연돈
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'연돈_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EC%97%B0%EB%8F%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EC%97%B0%EB%8F%88_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '연돈' LIMIT 1;

-- 영육일삼
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'영육일삼_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EC%98%81%EC%9C%A1%EC%9D%BC%EC%82%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EC%98%81%EC%9C%A1%EC%9D%BC%EC%82%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '영육일삼' LIMIT 1;

-- 온차
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'온차_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EC%98%A8%EC%B0%A8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EC%98%A8%EC%B0%A8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '온차' LIMIT 1;

-- 우동카덴
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'우동카덴_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EC%9A%B0%EB%8F%99%EC%B9%B4%EB%8D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EC%9A%B0%EB%8F%99%EC%B9%B4%EB%8D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '우동카덴' LIMIT 1;

-- 이돈갓
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'이돈갓_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EC%9D%B4%EB%8F%88%EA%B0%93_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EC%9D%B4%EB%8F%88%EA%B0%93_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '이돈갓' LIMIT 1;

-- 잇칸시타
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'잇칸시타_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EC%9E%87%EC%B9%B8%EC%8B%9C%ED%83%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EC%9E%87%EC%B9%B8%EC%8B%9C%ED%83%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '잇칸시타' LIMIT 1;

-- 제주고로
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'제주고로_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EC%A0%9C%EC%A3%BC%EA%B3%A0%EB%A1%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EC%A0%9C%EC%A3%BC%EA%B3%A0%EB%A1%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '제주고로' LIMIT 1;


-- 코우
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'코우_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%EC%BD%94%EC%9A%B0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%EC%BD%94%EC%9A%B0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '코우' LIMIT 1;

-- 키친아루요
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'키친아루요_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%ED%82%A4%EC%B9%9C%EC%95%84%EB%A3%A8%EC%9A%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%ED%82%A4%EC%B9%9C%EC%95%84%EB%A3%A8%EC%9A%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '키친아루요' LIMIT 1;

-- 하나
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'하나_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%ED%95%98%EB%82%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%ED%95%98%EB%82%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '하나' LIMIT 1;

-- 협재 수우동
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'협재 수우동_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%ED%98%91%EC%9E%AC%20%EC%88%98%EC%9A%B0%EB%8F%99_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%ED%98%91%EC%9E%AC%20%EC%88%98%EC%9A%B0%EB%8F%99_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '협재 수우동' LIMIT 1;

-- 호자
INSERT IGNORE INTO files (
  original_filename, s3_key, s3_url, bucket_name, file_size, content_type,
  reference_type, reference_id, sort_order, is_representative, creator_id,
  uploaded_at, is_public, is_deleted
)
SELECT
'호자_1_공공3유형.jpg',
'images/restaurant/japanenseFood/%ED%98%B8%EC%9E%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/japanenseFood/%ED%98%B8%EC%9E%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg',
@bucket_name, 1, 'image/jpeg', 'RESTAURANTS',
r.restaurant_id, 1, TRUE, @creator_id, NOW(), TRUE, FALSE
FROM restaurants r WHERE r.restaurant_name = '호자' LIMIT 1;

-- 양식
SET @bucket_name = 'travelshoot-s3';
SET @creator_id = 1;
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '글라글라하와이', '양식', '제주특별자치도 제주시 애월읍 애월해안로 398', '애월읍', 33.47236684, 126.3520772, 4.5, NULL, '매주 화요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '달페이지', '양식', '제주특별자치도 서귀포시 색달로64번길 51', '색달로64번길', 33.2597857, 126.4139408, 4.2, '달브런치', '매주 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '더스푼', '양식', '제주특별자치도 제주시 구남동1길 45', '구남동1길', 33.49343133, 126.5411634, 4.4, '성게어란파스타', '매주 월요일, 화요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '도두후레쉬', '양식', '제주특별자치도 제주시 도공로 34 (도두일동)', '도공로', 33.50329849, 126.4658975, 4.4, '새우튀김버거', '매주 화요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '돌담너머바다', '양식', '제주특별자치도 제주시 테우해안로 44-1', '테우해안로', 33.49574613, 126.4398055, 4.8, '현무암치킨프리또', '설·추석 연휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '로맨틱새우 애월곽지본점', '양식', '제주특별자치도 제주시 애월읍 곽지1길 12-12 (곽지어촌계펜션)', '애월읍', 33.4480465, 126.305185, 4.6, '레드빅뱅쉬림프', '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '롱로드', '양식', '제주특별자치도 제주시 한림읍 귀덕3길 44', '한림읍', 33.4416107, 126.2792179, 4.5, '비프 수제 함박스테이크', '매주 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '리보스코화덕피자', '양식', '제주특별자치도 제주시 수목원길 27 (연동)', '수목원길', 33.4694748, 126.4878686, 4.3, '해녀톳도우 한라산용암 피자', '매주 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '릴로', '양식', '제주특별자치도 제주시 구좌읍 하도13길 63', '구좌읍', 33.51083228, 126.8928825, 4.6, '바게트 비프 샌드위치', '매주 화요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '맛있는폴부엌', '양식', '제주특별자치도 제주시 한림읍 명월성로 181층 102호', '한림읍', 33.40721151, 126.2654588, 4.5, '치아바타', '매주 목요일~일요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '모들한상', '양식', '제주특별자치도 제주시 애월읍 하가로 180', '애월읍', 33.45537691, 126.3469895, 4.7, '모들 돈가스', '매주 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '묘한식당', '양식', '제주특별자치도 제주시 녹차분재로 601', '녹차분재로', 33.32265137, 126.2621387, 4.6, '흑돼지돔베카츠', '매주 화요일, 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '무거버거', '양식', '제주특별자치도 제주시 조천읍 조함해안로 356', '조천읍', 33.54921864, 126.655105, 4.2, '당근버거', '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '반디파스타', '양식', '제주특별자치도 제주시 조함해안로 5283층', '조함해안로', 33.54251961, 126.6692262, 4.7, '돌문어 오일 파스타', '매주 화요일~수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '뱅인타코 제주본점', '양식', '제주특별자치도 서귀포시 대정읍 에듀시티로 74 (라온프라이빗에듀)', '대정읍', 33.28860267, 126.2826099, 4.2, '타코', '매주 월요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '버거스테이', '양식', '제주특별자치도 제주시 세화1길 20-18', '세화1길', 33.52566892, 126.8554882, 4.3, '굿즈버거', '화요일, 수요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '불특정식당', '양식', '제주특별자치도 서귀포시 삼달로 239', '삼달로', 33.37536036, 126.8446453, 4.6, '맡김차림', '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '뿌리와열매', '양식', '제주특별자치도 제주시 중산간동로 2255', '중산간동로', 33.4718265, 126.7838706, 4.6, '새우버섯감자피자', '월, 화요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '섭섭이네', '양식', '제주특별자치도 제주시 구좌읍 중산간동로 2261', '구좌읍', 33.47158765, 126.7843928, 4.8, '흑돼지퐁당커리', '매주 일요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '센트로', '양식', '제주특별자치도 서귀포시 태평로 449 (서귀동)', '태평로', 33.24668957, 126.5675834, 4.5, '감자뇨끼', '매주 월요일, 화요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '스모크하우스인구억', '양식', '제주특별자치도 서귀포시 대정읍 보성구억로 223', '대정읍', 33.27081846, 126.2783968, 4.4, '더블쿼터파운드버거', '매주 월요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '식당 마요네즈', '양식', '제주특별자치도 제주시 다랑곶3길 18', '다랑곶3길', 33.48894194, 126.4786745, 4.1, '등심 돈카츠', '매주 일요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '양가형제', '양식', '제주특별자치도 제주시 청수동8길 3', '청수동8길', 33.30724739, 126.2539592, 4.4, '양버거', '매주 목요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '오뚜기빵집', '양식', '제주특별자치도 서귀포시 남원읍 태위로 129', '남원읍', 33.27514625, 126.6611774, 4.7, '수제햄버거', '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '온더스톤 브런치카페 제주성산점', '양식', '제주특별자치도 서귀포시 성산읍 해맞이해안로 2746H동 1~2층', '성산읍', 33.47029828, 126.9182257, 4.5, '온더스톤브렉퍼스트 / 제주흑돼지버거세트', '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '와르다레스토랑', '양식', '제주특별자치도 제주시 관덕로8길 24-1 (삼도이동)', '관덕로8길', 33.51106798, 126.5231229, 4.2, '사와르마치킨케밥', '매주 일요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '윤스타피자앤파스타', '양식', '제주특별자치도 제주시 구좌읍 문주란로1길 74-20', '구좌읍', 33.52524723, 126.884994, 4.3, '윤스타사랑해요', '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '이스트포레스트', '양식', '제주특별자치도 제주시 구좌읍 종달로1길 26-1', '구좌읍', 33.4959118, 126.8987795, 4.9, '문어크림파스타', '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '자연스러운식당', '양식', '제주특별자치도 서귀포시 태평로92번길 8', '태평로92번길', 33.24353104, 126.5328059, 4.3, '제주 수블라키와 차지키', '매주 월요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '제주소녀', '양식', '제주특별자치도 제주시 비자숲길 21', '비자숲길', 33.49463554, 126.811626, 4.3, '반반피자', '매주 월요일, 일요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '제주학센', '양식', '제주특별자치도 제주시 서해안로 232, 1층', '서해안로', 33.50850354, 126.4707386, 4.3, '흑돼지 학센 / 흑돼지 커리부어스트', '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '제주약수터', '양식', '제주특별자치도 서귀포시 중앙로 35 (서귀동)', '중앙로', 33.24776158, 126.5617172, 4.5, '제주수제맥주', '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '취향의섬', '양식', '제주특별자치도 서귀포시 남원읍 태위로398번길 7', '남원읍', 33.27441624, 126.6898277, 4.8, '고등어오일파스타', '매주 일요일, 월요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '칠분의오', '양식', '제주특별자치도 제주시 해맞이해안로 650-20', '해맞이해안로', 33.55853405, 126.8135077, 4.4, '두툼버거 플레이트', '매주 목요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '카고크루즈', '양식', '제주특별자치도 제주시 탑동로 43', '탑동로', 33.51767832, 126.5203647, 4.6, '갈치속젓버터와 버섯 파스타', '매주 일요일, 월요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '커트러리', '양식', '제주특별자치도 서귀포시 상예로 201층', '상예로', 33.24828382, 126.3904709, 4.1, '경양식 돈가스', '일요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '코코리파이프', '양식', '제주특별자치도 제주시 하귀6길 22', '하귀6길', 33.48866595, 126.4143662, 4.7, '저크치킨 매쉬 포테이토', '화요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '코코마마', '양식', '제주특별자치도 서귀포시 성산읍 일출로 258-11', '성산읍', 33.46105234, 126.9343189, 4.5, '통 파인애플쥬스', '매주 목요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, '페를로', '양식', '제주특별자치도 서귀포시 안덕면 덕수회관로74번길 33', '안덕면', 33.25671768, 126.3063225, 4.5, '성게어란파스타', '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '피어22', '양식', '제주특별자치도 제주시 한림읍 금능7길 22', '한림읍', 33.38997394, 126.2278124, 4.8, '태왁(딱새우찜)', '매주 화요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '피즈 버거 노형점', '양식', '제주특별자치도 제주시 노형10길 6 (노형동)', '노형10길', 33.48365085, 126.4776192, 4.2, '피즈버거', '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '하하호호', '양식', '제주특별자치도 제주시 우도해안길 532', '우도해안길', 33.52092096, 126.9485746, 4.4, '구좌마늘 흑돼지버거', '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '허디거디 이도점', '양식', '제주특별자치도 제주시 신설로11길 2-81층', '신설로11길', 33.49112886, 126.5442549, 4.7, '허디거디 크림파스타', '연중무휴', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50110, '환영키친', '양식', '제주특별자치도 제주시 송당2길 2', '송당2길', 33.47149039, 126.7818625, 4.6, '해물짬뽕파스타', '매주 화요일', TRUE, NOW(), NOW());
INSERT INTO restaurants (region_id, restaurant_name, food_type, address, address_detail, latitude, longitude, rating, signature_menu, closed_days, is_active, created_at, updated_at) VALUES (50130, 'Revolver', '양식', '제주특별자치도 서귀포시 예래로 31', '예래로', 33.25667753, 126.4025697, 4.9, '한치&새우숯불구이와 감자 / 지중해식 숯불문어 스테이크 / 빠에야 네그라', '연중무휴', TRUE, NOW(), NOW());

SET @bucket_name = 'travelshoot-s3';
SET @creator_id = 1;

-- 양식당 이미지 파일 INSERT
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '글라글라하와이.jpg', 'images/restaurant/westernFood/%EA%B8%80%EB%9D%BC%EA%B8%80%EB%9D%BC%ED%95%98%EC%99%80%EC%9D%B4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EA%B8%80%EB%9D%BC%EA%B8%80%EB%9D%BC%ED%95%98%EC%99%80%EC%9D%B4.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '글라글라하와이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '달페이지.jpg', 'images/restaurant/westernFood/%EB%8B%AC%ED%8E%98%EC%9D%B4%EC%A7%80.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%8B%AC%ED%8E%98%EC%9D%B4%EC%A7%80.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '달페이지' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더스푼.jpg', 'images/restaurant/westernFood/%EB%8D%94%EC%8A%A4%ED%91%BC.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%8D%94%EC%8A%A4%ED%91%BC.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '더스푼' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '도두후레쉬.jpg', 'images/restaurant/westernFood/%EB%8F%84%EB%91%90%ED%9B%84%EB%A0%88%EC%89%AC.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%8F%84%EB%91%90%ED%9B%84%EB%A0%88%EC%89%AC.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '도두후레쉬' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '돌담너머바다.jpg', 'images/restaurant/westernFood/%EB%8F%8C%EB%8B%B4%EB%84%88%EB%A8%B8%EB%B0%94%EB%8B%A4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%8F%8C%EB%8B%B4%EB%84%88%EB%A8%B8%EB%B0%94%EB%8B%A4.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '돌담너머바다' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '로맨틱새우 애월곽지본점.jpg', 'images/restaurant/westernFood/%EB%A1%9C%EB%A7%A8%ED%8B%B1%EC%83%88%EC%9A%B0%20%EC%95%A0%EC%9B%94%EA%B3%BD%EC%A7%80%EB%B3%B8%EC%A0%90.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%A1%9C%EB%A7%A8%ED%8B%B1%EC%83%88%EC%9A%B0%20%EC%95%A0%EC%9B%94%EA%B3%BD%EC%A7%80%EB%B3%B8%EC%A0%90.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '로맨틱새우 애월곽지본점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롱로드.jpg', 'images/restaurant/westernFood/%EB%A1%B1%EB%A1%9C%EB%93%9C.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%A1%B1%EB%A1%9C%EB%93%9C.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '롱로드' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '리보스코화덕피자.jpg', 'images/restaurant/westernFood/%EB%A6%AC%EB%B3%B4%EC%8A%A4%EC%BD%94%ED%99%94%EB%8D%95%ED%94%BC%EC%9E%90.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%A6%AC%EB%B3%B4%EC%8A%A4%EC%BD%94%ED%99%94%EB%8D%95%ED%94%BC%EC%9E%90.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '리보스코화덕피자' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '릴로.jpg', 'images/restaurant/westernFood/%EB%A6%B4%EB%A1%9C.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%A6%B4%EB%A1%9C.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '릴로' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '맛있는폴부엌.jpg', 'images/restaurant/westernFood/%EB%A7%9B%EC%9E%88%EB%8A%94%ED%8F%B4%EB%B6%80%EC%97%8C.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%A7%9B%EC%9E%88%EB%8A%94%ED%8F%B4%EB%B6%80%EC%97%8C.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '맛있는폴부엌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '모들한상.jpg', 'images/restaurant/westernFood/%EB%AA%A8%EB%93%A4%ED%95%9C%EC%83%81.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%AA%A8%EB%93%A4%ED%95%9C%EC%83%81.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '모들한상' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '묘한식당.jpg', 'images/restaurant/westernFood/%EB%AC%98%ED%95%9C%EC%8B%9D%EB%8B%B9.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%AC%98%ED%95%9C%EC%8B%9D%EB%8B%B9.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '묘한식당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '무거버거.jpg', 'images/restaurant/westernFood/%EB%AC%B4%EA%B1%B0%EB%B2%84%EA%B1%B0.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%AC%B4%EA%B1%B0%EB%B2%84%EA%B1%B0.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '무거버거' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '반디파스타.jpg', 'images/restaurant/westernFood/%EB%B0%98%EB%94%94%ED%8C%8C%EC%8A%A4%ED%83%80.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%B0%98%EB%94%94%ED%8C%8C%EC%8A%A4%ED%83%80.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '반디파스타' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '뱅인타코 제주본점.jpg', 'images/restaurant/westernFood/%EB%B1%85%EC%9D%B8%ED%83%80%EC%BD%94%20%EC%A0%9C%EC%A3%BC%EB%B3%B8%EC%A0%90.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%B1%85%EC%9D%B8%ED%83%80%EC%BD%94%20%EC%A0%9C%EC%A3%BC%EB%B3%B8%EC%A0%90.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '뱅인타코 제주본점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '버거스테이.jpg', 'images/restaurant/westernFood/%EB%B2%84%EA%B1%B0%EC%8A%A4%ED%85%8C%EC%9D%B4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%B2%84%EA%B1%B0%EC%8A%A4%ED%85%8C%EC%9D%B4.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '버거스테이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '불특정식당.jpg', 'images/restaurant/westernFood/%EB%B6%88%ED%8A%B9%EC%A0%95%EC%8B%9D%EB%8B%B9.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%B6%88%ED%8A%B9%EC%A0%95%EC%8B%9D%EB%8B%B9.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '불특정식당' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '뿌리와열매.jpg', 'images/restaurant/westernFood/%EB%BF%8C%EB%A6%AC%EC%99%80%EC%97%B4%EB%A7%A4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EB%BF%8C%EB%A6%AC%EC%99%80%EC%97%B4%EB%A7%A4.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '뿌리와열매' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '섭섭이네.jpg', 'images/restaurant/westernFood/%EC%84%AD%EC%84%AD%EC%9D%B4%EB%84%A4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%84%AD%EC%84%AD%EC%9D%B4%EB%84%A4.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '섭섭이네' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '센트로.jpg', 'images/restaurant/westernFood/%EC%84%BC%ED%8A%B8%EB%A1%9C.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%84%BC%ED%8A%B8%EB%A1%9C.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '센트로' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '스모크하우스인구억.jpg', 'images/restaurant/westernFood/%EC%8A%A4%EB%AA%A8%ED%81%AC%ED%95%98%EC%9A%B0%EC%8A%A4%EC%9D%B8%EA%B5%AC%EC%96%B5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%8A%A4%EB%AA%A8%ED%81%AC%ED%95%98%EC%9A%B0%EC%8A%A4%EC%9D%B8%EA%B5%AC%EC%96%B5.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '스모크하우스인구억' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '식당 마요네즈.jpg', 'images/restaurant/westernFood/%EC%8B%9D%EB%8B%B9%20%EB%A7%88%EC%9A%94%EB%84%A4%EC%A6%88.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%8B%9D%EB%8B%B9%20%EB%A7%88%EC%9A%94%EB%84%A4%EC%A6%88.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '식당 마요네즈' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '양가형제.jpg', 'images/restaurant/westernFood/%EC%96%91%EA%B0%80%ED%98%95%EC%A0%9C.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%96%91%EA%B0%80%ED%98%95%EC%A0%9C.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '양가형제' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '오뚜기빵집.jpg', 'images/restaurant/westernFood/%EC%98%A4%EB%9A%9C%EA%B8%B0%EB%B9%B5%EC%A7%91.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%98%A4%EB%9A%9C%EA%B8%B0%EB%B9%B5%EC%A7%91.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '오뚜기빵집' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '온더스톤 브런치카페 제주성산점.jpg', 'images/restaurant/westernFood/%EC%98%A8%EB%8D%94%EC%8A%A4%ED%86%A4%20%EB%B8%8C%EB%9F%B0%EC%B9%98%EC%B9%B4%ED%8E%98%20%EC%A0%9C%EC%A3%BC%EC%84%B1%EC%82%B0%EC%A0%90.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%98%A8%EB%8D%94%EC%8A%A4%ED%86%A4%20%EB%B8%8C%EB%9F%B0%EC%B9%98%EC%B9%B4%ED%8E%98%20%EC%A0%9C%EC%A3%BC%EC%84%B1%EC%82%B0%EC%A0%90.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '온더스톤 브런치카페 제주성산점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '와르다레스토랑.jpg', 'images/restaurant/westernFood/%EC%99%80%EB%A5%B4%EB%8B%A4%EB%A0%88%EC%8A%A4%ED%86%A0%EB%9E%91.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%99%80%EB%A5%B4%EB%8B%A4%EB%A0%88%EC%8A%A4%ED%86%A0%EB%9E%91.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '와르다레스토랑' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '윤스타피자앤파스타.jpg', 'images/restaurant/westernFood/%EC%9C%A4%EC%8A%A4%ED%83%80%ED%94%BC%EC%9E%90%EC%95%A4%ED%8C%8C%EC%8A%A4%ED%83%80.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%9C%A4%EC%8A%A4%ED%83%80%ED%94%BC%EC%9E%90%EC%95%A4%ED%8C%8C%EC%8A%A4%ED%83%80.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '윤스타피자앤파스타' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '이스트포레스트.jpg', 'images/restaurant/westernFood/%EC%9D%B4%EC%8A%A4%ED%8A%B8%ED%8F%AC%EB%A0%88%EC%8A%A4%ED%8A%B8.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%9D%B4%EC%8A%A4%ED%8A%B8%ED%8F%AC%EB%A0%88%EC%8A%A4%ED%8A%B8.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '이스트포레스트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주약수터.jpg', 'images/restaurant/westernFood/%EC%A0%9C%EC%A3%BC%EC%95%BD%EC%88%98%ED%84%B0.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%A0%9C%EC%A3%BC%EC%95%BD%EC%88%98%ED%84%B0.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '제주약수터' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '취향의섬.jpg', 'images/restaurant/westernFood/%EC%B7%A8%ED%96%A5%EC%9D%98%EC%84%AC.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%B7%A8%ED%96%A5%EC%9D%98%EC%84%AC.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '취향의섬' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '칠분의오.jpg', 'images/restaurant/westernFood/%EC%B9%A0%EB%B6%84%EC%9D%98%EC%98%A4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%B9%A0%EB%B6%84%EC%9D%98%EC%98%A4.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '칠분의오' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카고크루즈.jpg', 'images/restaurant/westernFood/%EC%B9%B4%EA%B3%A0%ED%81%AC%EB%A3%A8%EC%A6%88.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%B9%B4%EA%B3%A0%ED%81%AC%EB%A3%A8%EC%A6%88.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '카고크루즈' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '커트러리.jpg', 'images/restaurant/westernFood/%EC%BB%A4%ED%8A%B8%EB%9F%AC%EB%A6%AC.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%BB%A4%ED%8A%B8%EB%9F%AC%EB%A6%AC.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '커트러리' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '코코리파이프.jpg', 'images/restaurant/westernFood/%EC%BD%94%EC%BD%94%EB%A6%AC%ED%8C%8C%EC%9D%B4%ED%94%84.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%BD%94%EC%BD%94%EB%A6%AC%ED%8C%8C%EC%9D%B4%ED%94%84.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '코코리파이프' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '코코마마.jpg', 'images/restaurant/westernFood/%EC%BD%94%EC%BD%94%EB%A7%88%EB%A7%88.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%EC%BD%94%EC%BD%94%EB%A7%88%EB%A7%88.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '코코마마' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '페를로.jpg', 'images/restaurant/westernFood/%ED%8E%98%EB%A5%BC%EB%A1%9C.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%ED%8E%98%EB%A5%BC%EB%A1%9C.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '페를로' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '피어22.jpg', 'images/restaurant/westernFood/%ED%94%BC%EC%96%B422.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%ED%94%BC%EC%96%B422.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '피어22' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '피즈 버거 노형점.jpg', 'images/restaurant/westernFood/%ED%94%BC%EC%A6%88%20%EB%B2%84%EA%B1%B0%20%EB%85%B8%ED%98%95%EC%A0%90.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%ED%94%BC%EC%A6%88%20%EB%B2%84%EA%B1%B0%20%EB%85%B8%ED%98%95%EC%A0%90.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '피즈 버거 노형점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '하하호호.jpg', 'images/restaurant/westernFood/%ED%95%98%ED%95%98%ED%98%B8%ED%98%B8.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%ED%95%98%ED%95%98%ED%98%B8%ED%98%B8.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '하하호호' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '허디거디 이도점.jpg', 'images/restaurant/westernFood/%ED%97%88%EB%94%94%EA%B1%B0%EB%94%94%20%EC%9D%B4%EB%8F%84%EC%A0%90.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%ED%97%88%EB%94%94%EA%B1%B0%EB%94%94%20%EC%9D%B4%EB%8F%84%EC%A0%90.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '허디거디 이도점' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '환영키친.jpg', 'images/restaurant/westernFood/%ED%99%98%EC%98%81%ED%82%A4%EC%B9%9C.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/%ED%99%98%EC%98%81%ED%82%A4%EC%B9%9C.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = '환영키친' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'Revolver.jpg', 'images/restaurant/westernFood/Revolver.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/restaurant/westernFood/Revolver.jpg', @bucket_name, 1, 'image/jpeg', 'RESTAURANTS', restaurant_id, 1, TRUE, @creator_id, TRUE
FROM restaurants WHERE restaurant_name = 'Revolver' LIMIT 1;
