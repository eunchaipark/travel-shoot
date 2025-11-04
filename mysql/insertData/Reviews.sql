
-- 신규 사용자 이름 업데이트
UPDATE users SET user_name = '김민지' WHERE email = 'new1@test.com';
UPDATE users SET user_name = '이서준' WHERE email = 'new2@test.com';
UPDATE users SET user_name = '박지훈' WHERE email = 'new3@test.com';
UPDATE users SET user_name = '최유나' WHERE email = 'new4@test.com';

-- user_id 17, 18번 INSERT
INSERT INTO users (email, password, user_name, email_verified) VALUES 
('light6@test.com', 'dummy_password', '윤서아', TRUE),
('heavy6@test.com', 'dummy_password', '김태희', TRUE);


-- 예약내역 INSERT
-- 나인스파빌 (stay_id: 8) - 10개
INSERT INTO reservations (reservation_code, room_id, user_id, guest_name, guest_phone, guest_email, check_in_date, check_out_date, guest_count, total_nights, total_price, reservation_status, created_at)
VALUES
('RES202501151234567', 23, 1, '김민수', '010-1234-5678', 'minsu.kim@email.com', '2025-01-15', '2025-01-17', 2, 2, 350000.00, '이용완료', '2025-01-10 14:30:00'),
('RES202501182345678', 24, 2, '이영희', '010-2345-6789', 'younghee.lee@email.com', '2025-01-18', '2025-01-20', 3, 2, 400000.00, '이용완료', '2025-01-12 10:20:00'),
('RES202501203456789', 25, 3, '박철수', '010-3456-7890', 'chulsoo.park@email.com', '2025-01-20', '2025-01-22', 2, 2, 360000.00, '이용완료', '2025-01-14 16:45:00'),
('RES202501224567890', 309, 4, '정수진', '010-4567-8901', 'sujin.jung@email.com', '2025-01-22', '2025-01-24', 4, 2, 450000.00, '이용완료', '2025-01-16 11:15:00'),
('RES202501255678901', 23, 5, '최동욱', '010-5678-9012', 'dongwook.choi@email.com', '2025-01-25', '2025-01-27', 2, 2, 340000.00, '이용완료', '2025-01-19 09:30:00'),
('RES202501276789012', 24, 17, '강민지', '010-6789-0123', 'minji.kang@email.com', '2025-01-27', '2025-01-29', 3, 2, 390000.00, '이용완료', '2025-01-21 15:20:00'),
('RES202501297890123', 25, 18, '윤서준', '010-7890-1234', 'seojun.yoon@email.com', '2025-01-29', '2025-01-31', 2, 2, 370000.00, '이용완료', '2025-01-23 13:40:00'),
('RES202502018901234', 309, 1, '임하은', '010-8901-2345', 'haeun.lim@email.com', '2025-02-01', '2025-02-03', 4, 2, 460000.00, '이용완료', '2025-01-25 10:50:00'),
('RES202502039012345', 23, 2, '송지우', '010-9012-3456', 'jiwoo.song@email.com', '2025-02-03', '2025-02-05', 2, 2, 355000.00, '이용완료', '2025-01-28 14:10:00'),
('RES202502050123456', 24, 3, '한예린', '010-0123-4567', 'yerin.han@email.com', '2025-02-05', '2025-02-07', 3, 2, 410000.00, '이용완료', '2025-01-30 16:25:00');

-- 라운지하우스제주다 (stay_id: 16) - 10개
INSERT INTO reservations (reservation_code, room_id, user_id, guest_name, guest_phone, guest_email, check_in_date, check_out_date, guest_count, total_nights, total_price, reservation_status, created_at)
VALUES
('RES202501161111222', 47, 4, '오승현', '010-1111-2222', 'seunghyun.oh@email.com', '2025-01-16', '2025-01-18', 2, 2, 280000.00, '이용완료', '2025-01-11 09:20:00'),
('RES202501192222333', 48, 5, '조은서', '010-2222-3333', 'eunseo.jo@email.com', '2025-01-19', '2025-01-21', 3, 2, 320000.00, '이용완료', '2025-01-13 11:30:00'),
('RES202501213333444', 49, 17, '배준호', '010-3333-4444', 'junho.bae@email.com', '2025-01-21', '2025-01-23', 2, 2, 290000.00, '이용완료', '2025-01-15 14:40:00'),
('RES202501234444555', 328, 18, '권나영', '010-4444-5555', 'nayoung.kwon@email.com', '2025-01-23', '2025-01-25', 4, 2, 380000.00, '이용완료', '2025-01-17 10:15:00'),
('RES202501265555666', 47, 1, '황시우', '010-5555-6666', 'siwoo.hwang@email.com', '2025-01-26', '2025-01-28', 2, 2, 275000.00, '이용완료', '2025-01-20 15:50:00'),
('RES202501286666777', 48, 2, '서아인', '010-6666-7777', 'ain.seo@email.com', '2025-01-28', '2025-01-30', 3, 2, 330000.00, '이용완료', '2025-01-22 13:25:00'),
('RES202501307777888', 49, 3, '남도윤', '010-7777-8888', 'doyun.nam@email.com', '2025-01-30', '2025-02-01', 2, 2, 295000.00, '이용완료', '2025-01-24 09:35:00'),
('RES202502028888999', 328, 4, '안서연', '010-8888-9999', 'seoyeon.ahn@email.com', '2025-02-02', '2025-02-04', 4, 2, 390000.00, '이용완료', '2025-01-26 16:40:00'),
('RES202502049999000', 47, 5, '유재민', '010-9999-0000', 'jaemin.yoo@email.com', '2025-02-04', '2025-02-06', 2, 2, 285000.00, '이용완료', '2025-01-29 11:20:00'),
('RES202502060000111', 48, 17, '장하린', '010-0000-1111', 'harin.jang@email.com', '2025-02-06', '2025-02-08', 3, 2, 325000.00, '이용완료', '2025-01-31 14:55:00');

-- 신세계호텔 (stay_id: 11) - 7개
INSERT INTO reservations (reservation_code, room_id, user_id, guest_name, guest_phone, guest_email, check_in_date, check_out_date, guest_count, total_nights, total_price, reservation_status, created_at)
VALUES
('RES202501171234111', 2, 18, '신태양', '010-1234-1111', 'taeyang.shin@email.com', '2025-01-17', '2025-01-19', 2, 2, 520000.00, '이용완료', '2025-01-12 10:30:00'),
('RES202501192345222', 3, 1, '문소희', '010-2345-2222', 'sohee.moon@email.com', '2025-01-19', '2025-01-21', 3, 2, 580000.00, '이용완료', '2025-01-14 15:20:00'),
('RES202501213456333', 4, 2, '표지훈', '010-3456-3333', 'jihoon.pyo@email.com', '2025-01-21', '2025-01-23', 2, 2, 530000.00, '이용완료', '2025-01-16 09:45:00'),
('RES202501244567444', 2, 3, '고예진', '010-4567-4444', 'yejin.go@email.com', '2025-01-24', '2025-01-26', 4, 2, 620000.00, '이용완료', '2025-01-18 14:10:00'),
('RES202501265678555', 3, 4, '노승우', '010-5678-5555', 'seungwoo.noh@email.com', '2025-01-26', '2025-01-28', 2, 2, 540000.00, '이용완료', '2025-01-20 11:35:00'),
('RES202501296789666', 4, 5, '도하영', '010-6789-6666', 'hayoung.do@email.com', '2025-01-29', '2025-01-31', 3, 2, 590000.00, '이용완료', '2025-01-23 16:50:00'),
('RES202502017890777', 2, 17, '모건우', '010-7890-7777', 'gunwoo.mo@email.com', '2025-02-01', '2025-02-03', 2, 2, 525000.00, '이용완료', '2025-01-25 13:20:00');

-- 제주신라호텔 (stay_id: 63) - 17개 (room_id 188에 10개)
INSERT INTO reservations (reservation_code, room_id, user_id, guest_name, guest_phone, guest_email, check_in_date, check_out_date, guest_count, total_nights, total_price, reservation_status, created_at)
VALUES
('RES202501151010202', 188, 18, '곽민석', '010-1010-2020', 'minseok.kwak@email.com', '2025-01-15', '2025-01-17', 2, 2, 680000.00, '이용완료', '2025-01-10 10:20:00'),
('RES202501172020303', 188, 1, '석유나', '010-2020-3030', 'yuna.seok@email.com', '2025-01-17', '2025-01-19', 3, 2, 750000.00, '이용완료', '2025-01-12 14:35:00'),
('RES202501193030404', 188, 2, '빈지안', '010-3030-4040', 'jian.bin@email.com', '2025-01-19', '2025-01-21', 2, 2, 690000.00, '이용완료', '2025-01-14 09:50:00'),
('RES202501214040505', 188, 3, '설윤아', '010-4040-5050', 'yuna.seol@email.com', '2025-01-21', '2025-01-23', 4, 2, 820000.00, '이용완료', '2025-01-16 16:15:00'),
('RES202501235050606', 188, 4, '옥태희', '010-5050-6060', 'taehee.ok@email.com', '2025-01-23', '2025-01-25', 2, 2, 700000.00, '이용완료', '2025-01-18 11:40:00'),
('RES202501256060707', 188, 5, '탁수민', '010-6060-7070', 'sumin.tak@email.com', '2025-01-25', '2025-01-27', 3, 2, 760000.00, '이용완료', '2025-01-20 15:25:00'),
('RES202501277070808', 188, 17, '지현우', '010-7070-8080', 'hyunwoo.ji@email.com', '2025-01-27', '2025-01-29', 2, 2, 710000.00, '이용완료', '2025-01-22 10:50:00'),
('RES202501298080909', 188, 18, '진서아', '010-8080-9090', 'seoa.jin@email.com', '2025-01-29', '2025-01-31', 4, 2, 830000.00, '이용완료', '2025-01-24 14:30:00'),
('RES202501319090101', 188, 1, '차민준', '010-9090-0101', 'minjun.cha@email.com', '2025-01-31', '2025-02-02', 2, 2, 695000.00, '이용완료', '2025-01-26 09:15:00'),
('RES202502020101121', 188, 2, '하윤서', '010-0101-1212', 'yunseo.ha@email.com', '2025-02-02', '2025-02-04', 3, 2, 770000.00, '이용완료', '2025-01-28 16:45:00'),
('RES202501161212232', 189, 3, '편도현', '010-1212-2323', 'dohyun.pyun@email.com', '2025-01-16', '2025-01-18', 2, 2, 685000.00, '이용완료', '2025-01-11 11:20:00'),
('RES202501202323343', 189, 4, '가은지', '010-2323-3434', 'eunji.ga@email.com', '2025-01-20', '2025-01-22', 3, 2, 755000.00, '이용완료', '2025-01-15 13:40:00'),
('RES202501243434454', 189, 5, '갈준영', '010-3434-4545', 'junyoung.gal@email.com', '2025-01-24', '2025-01-26', 2, 2, 705000.00, '이용완료', '2025-01-19 10:25:00'),
('RES202501184545565', 190, 17, '견수아', '010-4545-5656', 'sua.gyeon@email.com', '2025-01-18', '2025-01-20', 4, 2, 825000.00, '이용완료', '2025-01-13 15:50:00'),
('RES202501225656676', 190, 18, '경지훈', '010-5656-6767', 'jihoon.kyung@email.com', '2025-01-22', '2025-01-24', 2, 2, 715000.00, '이용완료', '2025-01-17 09:30:00'),
('RES202501266767787', 190, 1, '계서진', '010-6767-7878', 'seojin.kye@email.com', '2025-01-26', '2025-01-28', 3, 2, 765000.00, '이용완료', '2025-01-21 14:15:00'),
('RES202501307878898', 190, 2, '공민지', '010-7878-8989', 'minji.gong@email.com', '2025-01-30', '2025-02-01', 2, 2, 720000.00, '이용완료', '2025-01-25 11:55:00');

-- 티파니에서아침을 (stay_id: 17) - 5개
INSERT INTO reservations (reservation_code, room_id, user_id, guest_name, guest_phone, guest_email, check_in_date, check_out_date, guest_count, total_nights, total_price, reservation_status, created_at)
VALUES
('RES202501178989090', 50, 3, '구예은', '010-8989-9090', 'yeeun.gu@email.com', '2025-01-17', '2025-01-19', 2, 2, 420000.00, '이용완료', '2025-01-12 10:40:00'),
('RES202501219090101', 51, 4, '국시원', '010-9090-1010', 'siwon.kuk@email.com', '2025-01-21', '2025-01-23', 3, 2, 480000.00, '이용완료', '2025-01-16 15:20:00'),
('RES202501251111212', 52, 5, '궁윤호', '010-1111-2121', 'yunho.kung@email.com', '2025-01-25', '2025-01-27', 2, 2, 430000.00, '이용완료', '2025-01-20 09:55:00'),
('RES202501292121313', 50, 17, '권채원', '010-2121-3131', 'chaewon.kwon@email.com', '2025-01-29', '2025-01-31', 4, 2, 550000.00, '이용완료', '2025-01-24 14:30:00'),
('RES202502023131414', 51, 18, '금도훈', '010-3131-4141', 'dohoon.geum@email.com', '2025-02-02', '2025-02-04', 2, 2, 440000.00, '이용완료', '2025-01-27 16:10:00');

commit;
select * from reservations;

select * from reviews;
-- 리뷰 INSERT
-- 리뷰 데이터
-- 나인스파빌 (stay_id: 8) 리뷰 - 10개

-- 리뷰 INSERT
-- 리뷰 데이터
-- 나인스파빌 (stay_id: 8) 리뷰 - 10개
INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    8,
    4.67, 5.00, 4.50, 4.50, 5.00, 4.50, 4.50,
    '가족들과 함께 다녀왔는데 정말 만족스러운 숙소였습니다. 특히 청결도가 뛰어나고 침구류도 깨끗해서 편안하게 쉴 수 있었어요. 스파 시설이 잘 갖춰져 있어서 여행 피로를 풀기에 최고였습니다. 다만 주차장이 조금 협소한 점은 아쉬웠지만 전반적으로 추천할 만한 숙소입니다.',
    TRUE,
    '2025-01-18 10:30:00'
FROM reservations r
WHERE r.room_id = 23 AND r.user_id = 1 AND r.check_in_date = '2025-01-15'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    8,
    4.83, 5.00, 4.50, 5.00, 5.00, 5.00, 4.50,
    '제주 여행 중 최고의 선택이었습니다! 위치가 정말 좋아서 주요 관광지 접근성이 뛰어났고, 호스트분도 매우 친절하셔서 체크인부터 체크아웃까지 편안했어요. 스파 시설을 이용하면서 힐링할 수 있었고, 조식도 맛있었습니다. 가격 대비 시설이 훌륭해서 다음에 또 방문하고 싶네요.',
    TRUE,
    '2025-01-21 14:20:00'
FROM reservations r
WHERE r.room_id = 24 AND r.user_id = 2 AND r.check_in_date = '2025-01-18'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    8,
    4.33, 4.50, 4.00, 4.50, 4.50, 4.50, 4.00,
    '전반적으로 만족스러운 숙소였습니다. 방이 넓고 깨끗했으며 필요한 편의시설들이 잘 구비되어 있었어요. 스파빌이라는 이름답게 온천 시설이 좋았고, 아이들도 수영장에서 즐겁게 놀았습니다. 다만 성수기라 그런지 가격이 조금 높다는 생각이 들었지만 경험 자체는 좋았습니다.',
    TRUE,
    '2025-01-23 09:15:00'
FROM reservations r
WHERE r.room_id = 25 AND r.user_id = 3 AND r.check_in_date = '2025-01-20'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    8,
    4.50, 4.50, 4.50, 4.50, 4.50, 4.50, 4.50,
    '친구들과 함께 방문했는데 모두가 만족한 숙소입니다. 객실이 깔끔하고 침대도 편안했어요. 스파 시설이 24시간 이용 가능해서 새벽에도 온천을 즐길 수 있어 좋았습니다. 주변에 편의점과 식당들도 있어서 편리했고, 직원분들의 서비스도 친절했습니다. 가격 대비 만족도가 높은 숙소예요.',
    TRUE,
    '2025-01-25 16:40:00'
FROM reservations r
WHERE r.room_id = 309 AND r.user_id = 4 AND r.check_in_date = '2025-01-22'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    8,
    4.17, 4.00, 4.00, 4.50, 4.50, 4.00, 4.00,
    '커플 여행으로 다녀왔습니다. 객실은 깨끗했고 스파 시설도 마음에 들었어요. 다만 주말이라 사람이 많아서 스파를 이용하는 데 조금 불편했습니다. 그래도 조용한 분위기에서 휴식을 취할 수 있어서 좋았고, 체크인 과정도 신속했습니다. 가성비를 생각하면 괜찮은 선택이었다고 생각합니다.',
    TRUE,
    '2025-01-28 11:20:00'
FROM reservations r
WHERE r.room_id = 23 AND r.user_id = 5 AND r.check_in_date = '2025-01-25'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    8,
    4.67, 5.00, 4.50, 4.50, 5.00, 4.50, 4.50,
    '혼자 제주 여행 중 머물렀는데 정말 편안한 시간을 보냈습니다. 청결 상태가 완벽했고, 침구류도 고급스러워서 숙면할 수 있었어요. 스파 시설에서 혼자 여유롭게 힐링했고, 호스트분께서 제주 맛집 정보도 친절하게 알려주셔서 도움이 많이 됐습니다. 재방문 의사 100%입니다!',
    TRUE,
    '2025-01-30 15:50:00'
FROM reservations r
WHERE r.room_id = 24 AND r.user_id = 17 AND r.check_in_date = '2025-01-27'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    8,
    4.50, 4.50, 4.50, 5.00, 4.50, 4.50, 4.00,
    '가족 여행으로 예약했는데 모두가 만족했습니다. 체크인이 매끄럽게 진행됐고, 객실도 넓어서 4명이 지내기에 충분했어요. 스파와 사우나 시설이 잘 되어 있어서 아이들도 즐거워했습니다. 위치도 나쁘지 않았고, 주차장도 편리했어요. 다만 조금 더 저렴하면 더 좋겠다는 생각이 들었습니다.',
    TRUE,
    '2025-02-01 10:30:00'
FROM reservations r
WHERE r.room_id = 25 AND r.user_id = 18 AND r.check_in_date = '2025-01-29'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    8,
    4.83, 5.00, 5.00, 4.50, 5.00, 4.50, 5.00,
    '제주에서 여러 숙소를 이용해봤지만 나인스파빌이 최고였습니다! 시설도 최신식이고 청결 관리가 완벽했어요. 특히 스파 시설의 수질이 좋아서 피부에도 좋은 느낌이었습니다. 직원분들도 정말 친절하시고, 편의시설도 충분해서 불편함이 없었습니다. 가격 대비 최상의 경험이었어요.',
    TRUE,
    '2025-02-04 14:20:00'
FROM reservations r
WHERE r.room_id = 309 AND r.user_id = 1 AND r.check_in_date = '2025-02-01'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    8,
    4.33, 4.50, 4.00, 4.50, 4.50, 4.50, 4.00,
    '부모님 모시고 다녀왔는데 만족스러운 숙소였습니다. 객실이 깨끗하고 침대가 편안해서 부모님도 잘 주무셨어요. 스파 시설을 이용하면서 온 가족이 함께 시간을 보낼 수 있어서 좋았습니다. 다만 조식 메뉴가 좀 더 다양했으면 하는 아쉬움이 있었지만, 전반적으로는 추천할 만합니다.',
    TRUE,
    '2025-02-06 09:40:00'
FROM reservations r
WHERE r.room_id = 23 AND r.user_id = 2 AND r.check_in_date = '2025-02-03'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    8,
    4.67, 5.00, 4.50, 4.50, 5.00, 4.50, 4.50,
    '연인과 함께 방문했는데 로맨틱한 분위기에서 좋은 시간 보냈습니다. 객실 청결도가 매우 높았고, 스파에서 커플 마사지도 받을 수 있어서 특별한 경험이었어요. 호스트분의 응대도 친절했고, 주변 맛집 추천도 정확했습니다. 위치도 좋고 시설도 훌륭해서 기념일에 다시 방문하고 싶네요.',
    TRUE,
    '2025-02-08 16:30:00'
FROM reservations r
WHERE r.room_id = 24 AND r.user_id = 3 AND r.check_in_date = '2025-02-05'
LIMIT 1;

-- 라운지하우스제주다 (stay_id: 16) 리뷰 - 10개
INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    16,
    4.50, 4.50, 4.50, 4.50, 5.00, 4.50, 4.00,
    '제주 감성이 물씬 풍기는 멋진 숙소였습니다. 라운지 공간이 넓고 인테리어가 세련되어서 사진 찍기에도 좋았어요. 침대도 편안했고, 창문을 열면 제주 바다가 보이는 전망이 환상적이었습니다. 호스트분께서 제주 여행 팁도 많이 알려주셔서 감사했어요. 다만 가격이 조금 있는 편이지만 만족스러운 경험이었습니다.',
    TRUE,
    '2025-01-19 11:30:00'
FROM reservations r
WHERE r.room_id = 47 AND r.user_id = 4 AND r.check_in_date = '2025-01-16'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    16,
    4.67, 5.00, 4.50, 4.50, 5.00, 4.50, 4.50,
    '친구들과 함께 머물렀는데 정말 좋았습니다! 공간이 넓어서 3명이 지내기에 충분했고, 주방 시설도 잘 갖춰져 있어서 간단한 요리도 해먹을 수 있었어요. 청결도도 만족스러웠고, 특히 라운지 공간에서 제주 감성을 제대로 느낄 수 있었습니다. 체크인도 편리했고 재방문 의사 있습니다.',
    TRUE,
    '2025-01-22 15:20:00'
FROM reservations r
WHERE r.room_id = 48 AND r.user_id = 5 AND r.check_in_date = '2025-01-19'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    16,
    4.17, 4.00, 4.50, 4.00, 4.50, 4.00, 4.00,
    '전반적으로 괜찮은 숙소였습니다. 인테리어가 감각적이고 분위기가 좋았어요. 라운지에서 보내는 시간이 편안했고, 필요한 편의시설들도 잘 구비되어 있었습니다. 다만 주변이 조금 한적해서 차가 없으면 이동이 불편할 수 있겠다는 생각이 들었어요. 그래도 조용히 휴식하기에는 최적의 장소였습니다.',
    TRUE,
    '2025-01-24 10:50:00'
FROM reservations r
WHERE r.room_id = 49 AND r.user_id = 17 AND r.check_in_date = '2025-01-21'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    16,
    4.83, 5.00, 5.00, 4.50, 5.00, 4.50, 5.00,
    '제주 여행 중 최고의 숙소였습니다! 사진으로 보던 것보다 실제가 훨씬 더 좋았어요. 청결 상태가 완벽했고, 라운지 공간도 넓고 쾌적했습니다. 주방 시설이 잘 되어 있어서 장을 봐서 요리해 먹기도 좋았고, 호스트분의 응대도 신속하고 친절했습니다. 가성비가 정말 뛰어난 숙소예요!',
    TRUE,
    '2025-01-26 14:30:00'
FROM reservations r
WHERE r.room_id = 328 AND r.user_id = 18 AND r.check_in_date = '2025-01-23'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    16,
    4.00, 4.00, 4.00, 4.00, 4.50, 4.00, 3.50,
    '커플 여행으로 방문했습니다. 분위기는 정말 좋았고 인테리어도 감각적이었어요. 다만 생각보다 방음이 잘 되지 않아서 옆 객실 소리가 조금 들렸습니다. 그래도 라운지 공간이 넓고 편안해서 대부분의 시간을 그곳에서 보냈어요. 체크인 과정은 원활했고, 호스트분도 친절하셨습니다.',
    TRUE,
    '2025-01-29 09:20:00'
FROM reservations r
WHERE r.room_id = 47 AND r.user_id = 1 AND r.check_in_date = '2025-01-26'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    16,
    4.67, 5.00, 4.50, 4.50, 5.00, 4.50, 4.50,
    '가족 여행으로 다녀왔는데 모두가 만족한 숙소입니다. 객실이 깨끗하고 라운지도 넓어서 아이들이 뛰어놀기 좋았어요. 주방 시설도 훌륭해서 아침 식사를 직접 준비할 수 있었고, 주변 뷰도 멋졌습니다. 호스트분께서 아이 동반 가족에게 필요한 것들을 미리 준비해주셔서 감동이었습니다.',
    TRUE,
    '2025-01-31 16:40:00'
FROM reservations r
WHERE r.room_id = 48 AND r.user_id = 2 AND r.check_in_date = '2025-01-28'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    16,
    4.33, 4.50, 4.00, 4.50, 4.50, 4.50, 4.00,
    '제주 감성을 제대로 느낄 수 있는 숙소였습니다. 인테리어가 세련되고 공간 활용도 잘 되어 있었어요. 침대가 편안해서 숙면할 수 있었고, 라운지에서 제주 풍경을 감상하며 커피 마시는 시간이 좋았습니다. 다만 성수기 가격이 조금 부담스러웠지만, 경험 자체는 만족스러웠습니다.',
    TRUE,
    '2025-02-02 11:15:00'
FROM reservations r
WHERE r.room_id = 49 AND r.user_id = 3 AND r.check_in_date = '2025-01-30'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    16,
    4.50, 4.50, 4.50, 4.50, 5.00, 4.50, 4.00,
    '친구들과 제주 여행 중 머물렀는데 정말 좋았어요. 공간이 넓고 쾌적해서 여러 명이 지내기에 적합했습니다. 청결도도 만족스러웠고, 특히 라운지 공간의 인테리어가 인스타 감성이라 사진도 많이 찍었어요. 체크인 과정이 간편했고, 호스트분의 커뮤니케이션도 신속했습니다.',
    TRUE,
    '2025-02-05 14:50:00'
FROM reservations r
WHERE r.room_id = 328 AND r.user_id = 4 AND r.check_in_date = '2025-02-02'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    16,
    4.17, 4.00, 4.00, 4.50, 4.50, 4.00, 4.00,
    '혼자 워케이션으로 다녀왔습니다. 조용하고 편안한 분위기에서 업무에 집중할 수 있었어요. 와이파이도 빠르고 라운지 공간에 작업하기 좋은 테이블이 있어서 편리했습니다. 청결도는 괜찮았고, 체크인도 원활했어요. 다만 주변에 식당이 많지 않아서 차량이 필요했습니다.',
    TRUE,
    '2025-02-07 10:30:00'
FROM reservations r
WHERE r.room_id = 47 AND r.user_id = 5 AND r.check_in_date = '2025-02-04'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    16,
    4.67, 5.00, 4.50, 4.50, 5.00, 4.50, 4.50,
    '제주 여행의 하이라이트였던 숙소입니다! 청결도가 매우 높았고, 라운지하우스라는 이름에 걸맞게 라운지 공간이 정말 넓고 편안했어요. 인테리어 감각도 뛰어나고, 필요한 시설들이 다 갖춰져 있었습니다. 호스트분의 응대도 완벽했고, 제주 여행 정보도 상세히 알려주셔서 감사했습니다.',
    TRUE,
    '2025-02-09 15:20:00'
FROM reservations r
WHERE r.room_id = 48 AND r.user_id = 17 AND r.check_in_date = '2025-02-06'
LIMIT 1;

-- 신세계호텔 (stay_id: 11) 리뷰 - 7개
INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    11,
    4.83, 5.00, 5.00, 5.00, 4.50, 4.50, 4.50,
    '신세계호텔의 명성답게 정말 훌륭한 숙소였습니다. 객실이 넓고 고급스러웠으며, 청결 상태가 완벽했어요. 침구류의 품질도 최상이었고, 욕실 시설도 훌륭했습니다. 호텔 직원분들의 서비스가 매우 전문적이고 친절했으며, 부대시설도 다양해서 호텔 안에서도 즐길 거리가 많았습니다. 가격은 있지만 그만한 가치가 있는 곳입니다.',
    TRUE,
    '2025-01-20 11:30:00'
FROM reservations r
WHERE r.room_id = 2 AND r.user_id = 18 AND r.check_in_date = '2025-01-17'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    11,
    4.67, 5.00, 4.50, 4.50, 4.50, 5.00, 4.50,
    '가족 여행으로 방문했는데 모두가 만족한 호텔이었습니다. 위치가 시내 중심에 있어서 쇼핑과 관광이 편리했고, 객실도 깨끗하고 넓었어요. 조식 뷔페의 퀄리티가 정말 좋았고, 수영장과 피트니스 시설도 훌륭했습니다. 체크인 과정도 신속했고, 직원분들의 서비스가 5성급 호텔답게 완벽했습니다.',
    TRUE,
    '2025-01-22 16:20:00'
FROM reservations r
WHERE r.room_id = 3 AND r.user_id = 1 AND r.check_in_date = '2025-01-19'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    11,
    4.50, 4.50, 4.50, 5.00, 4.50, 4.50, 4.00,
    '출장차 방문했는데 비즈니스 여행객에게 최적의 호텔입니다. 객실이 쾌적하고 업무 공간도 잘 마련되어 있었어요. 와이파이 속도도 빠르고, 비즈니스 센터 시설도 훌륭했습니다. 체크인이 매우 빠르게 진행됐고, 컨시어지 서비스도 도움이 많이 됐습니다. 다만 가격대가 높은 편이라 개인 여행보다는 비즈니스에 적합한 것 같아요.',
    TRUE,
    '2025-01-24 10:40:00'
FROM reservations r
WHERE r.room_id = 4 AND r.user_id = 2 AND r.check_in_date = '2025-01-21'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    11,
    4.83, 5.00, 5.00, 4.50, 5.00, 4.50, 4.50,
    '허니문으로 다녀왔는데 정말 특별한 시간을 보냈습니다. 객실 청결도가 완벽했고, 호텔 시설도 최신식이었어요. 특히 루프탑 바에서 보는 야경이 환상적이었고, 스파 시설에서 커플 마사지를 받으며 힐링할 수 있었습니다. 직원분들께서 신혼부부라는 걸 아시고 특별히 더 신경 써주셔서 감동이었어요. 최고의 선택이었습니다!',
    TRUE,
    '2025-01-27 14:50:00'
FROM reservations r
WHERE r.room_id = 2 AND r.user_id = 3 AND r.check_in_date = '2025-01-24'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    11,
    4.33, 4.50, 4.50, 4.00, 4.50, 4.50, 4.00,
    '제주 여행 중 머물렀는데 만족스러운 호텔이었습니다. 객실이 깨끗하고 시설도 좋았어요. 조식이 맛있었고, 호텔 주변에 편의시설들이 많아서 편리했습니다. 다만 주말이라 사람이 많아서 조식당과 수영장이 다소 붐볐어요. 그래도 전반적인 서비스는 훌륭했고, 직원들도 친절했습니다. 가격 대비는 적절한 것 같습니다.',
    TRUE,
    '2025-01-30 09:30:00'
FROM reservations r
WHERE r.room_id = 3 AND r.user_id = 4 AND r.check_in_date = '2025-01-26'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    11,
    4.67, 5.00, 4.50, 4.50, 4.50, 5.00, 4.50,
    '제주에서 특별한 날을 기념하기 위해 방문했습니다. 객실 뷰가 정말 멋졌고, 침대도 너무 편안해서 숙면할 수 있었어요. 호텔 레스토랑에서 저녁을 먹었는데 음식 퀄리티가 훌륭했습니다. 위치도 시내 중심이라 이동이 편리했고, 직원분들의 서비스도 매우 만족스러웠습니다. 다음에도 꼭 다시 방문하고 싶어요.',
    TRUE,
    '2025-02-02 15:40:00'
FROM reservations r
WHERE r.room_id = 4 AND r.user_id = 5 AND r.check_in_date = '2025-01-29'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    11,
    4.50, 4.50, 4.50, 5.00, 4.50, 4.50, 4.00,
    '부모님 모시고 제주 여행 중 머물렀습니다. 체크인 과정이 매우 원활했고, 객실도 넓고 쾌적했어요. 부모님께서 특히 침대가 편하다고 좋아하셨고, 조식 뷔페도 다양해서 만족스러웠습니다. 호텔 시설이 잘 되어 있어서 노약자 분들이 이용하기에도 편리했어요. 가격은 있지만 서비스를 생각하면 합리적입니다.',
    TRUE,
    '2025-02-04 11:20:00'
FROM reservations r
WHERE r.room_id = 2 AND r.user_id = 17 AND r.check_in_date = '2025-02-01'
LIMIT 1;

-- 제주신라호텔 (stay_id: 63) 리뷰 - 17개
INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.83, 5.00, 5.00, 5.00, 4.50, 4.50, 4.50,
    '제주신라호텔의 명성은 거짓이 아니었습니다! 객실의 청결도와 고급스러움이 기대 이상이었어요. 특히 오션뷰 객실에서 보는 일출이 정말 환상적이었습니다. 호텔 내 모든 시설이 최상급이었고, 직원분들의 서비스도 완벽했어요. 조식 뷔페의 퀄리티도 훌륭했고, 수영장과 스파 시설도 최고였습니다. 가격은 높지만 그만한 가치가 충분한 호텔입니다.',
    TRUE,
    '2025-01-18 10:30:00'
FROM reservations r
WHERE r.room_id = 188 AND r.user_id = 18 AND r.check_in_date = '2025-01-15'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.67, 5.00, 4.50, 4.50, 4.50, 5.00, 4.50,
    '제주 여행의 하이라이트였던 호텔입니다. 체크인부터 체크아웃까지 모든 과정이 완벽했어요. 객실이 넓고 깨끗했으며, 바다가 보이는 전망이 정말 멋졌습니다. 호텔 내 레스토랑에서 식사했는데 음식 맛도 훌륭했고, 위치도 주요 관광지와 가까워서 편리했습니다. 직원분들의 친절함도 인상 깊었어요. 재방문 의사 100%입니다!',
    TRUE,
    '2025-01-20 14:50:00'
FROM reservations r
WHERE r.room_id = 188 AND r.user_id = 1 AND r.check_in_date = '2025-01-17'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.50, 4.50, 4.50, 4.50, 4.50, 4.50, 4.50,
    '가족 여행으로 다녀왔는데 모두가 만족한 호텔이었습니다. 객실이 깔끔하고 시설도 최신식이었어요. 아이들이 키즈 클럽에서 즐겁게 놀았고, 수영장도 가족 단위로 이용하기 좋았습니다. 조식 뷔페의 메뉴가 다양해서 매일 다른 음식을 즐길 수 있었어요. 호텔 직원분들도 아이들에게 친절하게 대해주셔서 감사했습니다.',
    TRUE,
    '2025-01-22 09:20:00'
FROM reservations r
WHERE r.room_id = 188 AND r.user_id = 2 AND r.check_in_date = '2025-01-19'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.83, 5.00, 5.00, 4.50, 5.00, 4.50, 4.50,
    '제주에서 묵은 호텔 중 최고였습니다! 청결 상태가 완벽했고, 모든 편의시설이 훌륭했어요. 특히 스파와 사우나 시설이 정말 잘 되어 있어서 매일 이용했습니다. 호텔 정원도 아름답고, 산책하기 좋았어요. 컨시어지 서비스를 통해 렌터카와 맛집 예약도 도움받았고, 모든 직원분들이 프로페셔널했습니다. 최상의 경험이었어요!',
    TRUE,
    '2025-01-24 16:30:00'
FROM reservations r
WHERE r.room_id = 188 AND r.user_id = 3 AND r.check_in_date = '2025-01-21'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.33, 4.50, 4.00, 4.50, 4.50, 4.50, 4.00,
    '출장 겸 휴가로 방문했습니다. 비즈니스 센터 시설이 잘 갖춰져 있어서 업무 보기에 편리했고, 객실도 쾌적했어요. 조식 시간이 여유로워서 천천히 식사할 수 있었고, 호텔 내 레스토랑과 바의 퀄리티도 좋았습니다. 다만 성수기라 가격이 다소 높았지만, 시설과 서비스를 생각하면 합리적인 수준이라고 생각합니다.',
    TRUE,
    '2025-01-26 11:40:00'
FROM reservations r
WHERE r.room_id = 188 AND r.user_id = 4 AND r.check_in_date = '2025-01-23'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.67, 5.00, 4.50, 4.50, 4.50, 5.00, 4.50,
    '부모님 모시고 제주 여행 중 머물렀는데 정말 만족스러웠습니다. 객실이 넓고 깨끗해서 부모님께서도 편안하게 쉬셨어요. 호텔 위치가 좋아서 주요 관광지를 둘러보기 편리했고, 바다 전망도 멋졌습니다. 직원분들께서 노약자를 배려해주시는 모습이 인상적이었고, 조식 뷔페의 음식 퀄리티도 훌륭했습니다.',
    TRUE,
    '2025-01-28 15:20:00'
FROM reservations r
WHERE r.room_id = 188 AND r.user_id = 5 AND r.check_in_date = '2025-01-25'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.50, 4.50, 4.50, 4.50, 5.00, 4.50, 4.00,
    '친구들과 제주 여행으로 방문했습니다. 객실이 깔끔하고 시설도 좋았어요. 수영장과 피트니스 센터를 매일 이용했고, 호텔 내 카페에서 여유로운 시간도 보냈습니다. 직원분들의 커뮤니케이션이 신속하고 친절했으며, 요청사항도 빠르게 처리해주셨어요. 가격대가 있지만 그만한 가치는 충분히 있는 호텔입니다.',
    TRUE,
    '2025-01-30 10:50:00'
FROM reservations r
WHERE r.room_id = 188 AND r.user_id = 17 AND r.check_in_date = '2025-01-27'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.83, 5.00, 5.00, 4.50, 5.00, 4.50, 4.50,
    '제주 허니문의 완벽한 마무리를 책임진 호텔입니다! 신혼부부를 위한 특별한 서비스와 룸 세팅에 감동했어요. 객실 청결도가 완벽했고, 오션뷰 발코니에서 보낸 시간이 정말 로맨틱했습니다. 호텔 내 레스토랑에서 코스 요리를 즐겼는데 음식 맛이 일품이었어요. 직원분들의 세심한 배려에 감사드립니다. 기념일마다 찾고 싶은 곳이에요!',
    TRUE,
    '2025-02-01 14:30:00'
FROM reservations r
WHERE r.room_id = 188 AND r.user_id = 18 AND r.check_in_date = '2025-01-29'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.33, 4.50, 4.00, 4.50, 4.50, 4.50, 4.00,
    '제주 여행 중 2박 3일 머물렀습니다. 전반적으로 만족스러운 호텔이었어요. 객실이 깨끗하고 침대도 편안했습니다. 조식 뷔페가 다양하고 맛있었지만, 주말이라 사람이 많아서 다소 붐볐어요. 그래도 호텔 시설은 훌륭했고, 직원분들도 친절했습니다. 가격은 조금 있지만 제주신라호텔의 명성에 걸맞은 서비스를 받을 수 있었습니다.',
    TRUE,
    '2025-02-03 09:40:00'
FROM reservations r
WHERE r.room_id = 188 AND r.user_id = 1 AND r.check_in_date = '2025-01-31'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.67, 5.00, 4.50, 4.50, 5.00, 4.50, 4.50,
    '워케이션 목적으로 제주를 찾았고, 제주신라호텔을 선택했습니다. 객실 내 업무 공간이 잘 마련되어 있었고, 와이파이도 빠르고 안정적이었어요. 청결도가 매우 높았고, 비즈니스 센터도 편리하게 이용했습니다. 업무 후 수영장과 스파에서 피로를 풀 수 있어서 좋았고, 직원분들의 서비스도 완벽했습니다. 업무 여행에 최적의 호텔이에요!',
    TRUE,
    '2025-02-05 16:20:00'
FROM reservations r
WHERE r.room_id = 188 AND r.user_id = 2 AND r.check_in_date = '2025-02-02'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.50, 4.50, 4.50, 4.50, 4.50, 5.00, 4.00,
    '제주 시내 중심에 위치해 있어서 접근성이 정말 좋았습니다. 주요 관광지와 쇼핑 지역이 가까워서 편리했어요. 객실도 깨끗하고 넓었으며, 호텔 시설도 훌륭했습니다. 조식 뷔페의 퀄리티가 높았고, 특히 로컬 음식 코너가 인상적이었어요. 직원분들도 친절했고, 체크인 과정도 신속했습니다. 위치와 시설 모두 만족스러운 호텔입니다.',
    TRUE,
    '2025-01-19 11:30:00'
FROM reservations r
WHERE r.room_id = 189 AND r.user_id = 3 AND r.check_in_date = '2025-01-16'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.67, 5.00, 4.50, 4.50, 4.50, 5.00, 4.50,
    '커플 여행으로 다녀왔는데 정말 특별한 경험이었습니다. 객실 청결도가 완벽했고, 바다가 보이는 뷰가 환상적이었어요. 호텔 내 스파에서 커플 마사지를 받았는데 최고의 힐링 시간이었습니다. 레스토랑 음식도 맛있었고, 루프탑 바에서 보는 야경도 멋졌어요. 직원분들의 세심한 서비스에 감동했고, 다음에 또 방문하고 싶습니다.',
    TRUE,
    '2025-01-21 15:50:00'
FROM reservations r
WHERE r.room_id = 189 AND r.user_id = 4 AND r.check_in_date = '2025-01-20'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.33, 4.50, 4.00, 4.50, 4.50, 4.50, 4.00,
    '가족과 함께 제주 여행 중 머물렀습니다. 객실이 넓어서 가족 4명이 지내기에 충분했어요. 키즈 클럽이 있어서 아이들이 즐겁게 놀았고, 수영장도 가족 단위로 이용하기 좋았습니다. 조식이 맛있었지만 피크 타임에는 자리가 없어서 조금 기다려야 했어요. 그래도 전반적으로 만족스러운 호텔이었고, 직원분들도 친절했습니다.',
    TRUE,
    '2025-01-23 10:20:00'
FROM reservations r
WHERE r.room_id = 189 AND r.user_id = 5 AND r.check_in_date = '2025-01-24'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.83, 5.00, 5.00, 4.50, 5.00, 4.50, 4.50,
    '제주에서 최고의 호텔 경험이었습니다! 모든 것이 완벽했어요. 객실의 청결도와 시설이 5성급 호텔 그 이상이었고, 직원분들의 서비스도 탁월했습니다. 특히 컨시어지 팀의 도움으로 제주 여행 일정을 완벽하게 계획할 수 있었어요. 호텔 내 레스토랑, 스파, 수영장 모두 최상급이었고, 위치도 훌륭했습니다. 강력 추천합니다!',
    TRUE,
    '2025-01-27 14:40:00'
FROM reservations r
WHERE r.room_id = 190 AND r.user_id = 17 AND r.check_in_date = '2025-01-18'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.50, 4.50, 4.50, 5.00, 4.50, 4.50, 4.00,
    '제주 출장 중 머물렀는데 매우 만족스러웠습니다. 체크인이 신속하게 진행됐고, 비즈니스 센터 시설도 훌륭했어요. 객실이 쾌적하고 업무하기에 좋은 환경이었습니다. 호텔 내 레스토랑에서 비즈니스 미팅도 가졌는데, 음식과 분위기 모두 적합했어요. 직원분들의 프로페셔널한 서비스가 인상적이었고, 다음 출장 때도 이용하고 싶습니다.',
    TRUE,
    '2025-01-29 09:30:00'
FROM reservations r
WHERE r.room_id = 190 AND r.user_id = 18 AND r.check_in_date = '2025-01-22'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.67, 5.00, 4.50, 4.50, 5.00, 4.50, 4.50,
    '제주 여행의 마지막 밤을 제주신라호텔에서 보냈는데 최고의 선택이었습니다. 객실이 정말 깨끗하고 편안했어요. 특히 침구류의 품질이 뛰어나서 숙면할 수 있었습니다. 호텔 정원이 아름다워서 산책하기 좋았고, 직원분들께서 체크아웃 전 짐 보관도 친절하게 도와주셨어요. 다음 제주 여행 때도 꼭 다시 방문하겠습니다!',
    TRUE,
    '2025-01-31 16:50:00'
FROM reservations r
WHERE r.room_id = 190 AND r.user_id = 1 AND r.check_in_date = '2025-01-26'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    63,
    4.50, 4.50, 4.50, 4.50, 4.50, 5.00, 4.00,
    '제주 시내에서 가장 좋은 위치의 호텔인 것 같아요. 주변에 맛집과 카페, 쇼핑몰이 많아서 너무 편리했습니다. 객실도 깨끗하고 시설도 훌륭했어요. 조식 뷔페에서 제주 특산물을 활용한 메뉴들이 인상적이었고, 호텔 직원분들도 매우 친절했습니다. 가격은 있지만 위치와 시설, 서비스를 고려하면 합리적이라고 생각합니다.',
    TRUE,
    '2025-02-03 11:40:00'
FROM reservations r
WHERE r.room_id = 190 AND r.user_id = 2 AND r.check_in_date = '2025-01-30'
LIMIT 1;

-- 티파니에서아침을 (stay_id: 17) 리뷰 - 5개
INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    17,
    4.67, 5.00, 4.50, 4.50, 5.00, 4.50, 4.50,
    '티파니에서아침을이라는 이름처럼 정말 로맨틱하고 감성적인 숙소였습니다! 인테리어가 너무 예뻐서 사진 찍기에 완벽했어요. 객실이 깨끗하고, 특히 아침 식사가 정말 맛있었습니다. 호스트분께서 직접 준비해주신 브런치가 감동적이었고, 제주 여행 팁도 많이 알려주셔서 도움이 됐어요. 커플 여행에 강력 추천하는 숙소입니다!',
    TRUE,
    '2025-01-20 10:30:00'
FROM reservations r
WHERE r.room_id = 50 AND r.user_id = 3 AND r.check_in_date = '2025-01-17'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    17,
    4.50, 4.50, 4.50, 4.50, 5.00, 4.50, 4.00,
    '제주 감성이 물씬 나는 멋진 숙소였습니다. 티파니 블루 컬러의 인테리어가 정말 예쁘고, 공간도 아늑했어요. 침대가 편안해서 잘 잤고, 아침에 제공되는 브런치도 훌륭했습니다. 호스트분의 응대가 매우 친절했고, 제주 맛집과 카페 추천도 정확했어요. 다만 성수기 가격이 조금 있는 편이지만, 경험 자체는 만족스러웠습니다.',
    TRUE,
    '2025-01-24 14:50:00'
FROM reservations r
WHERE r.room_id = 51 AND r.user_id = 4 AND r.check_in_date = '2025-01-21'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    17,
    4.33, 4.50, 4.00, 4.50, 4.50, 4.50, 4.00,
    '친구와 제주 여행 중 머물렀는데 분위기가 정말 좋았어요. 인테리어가 감각적이고 사진 찍기 좋은 포인트들이 많았습니다. 객실은 깨끗했고, 아침 식사로 제공되는 메뉴가 맛있었어요. 주변에 카페와 맛집들도 있어서 편리했습니다. 다만 주차 공간이 협소한 점은 아쉬웠지만, 전반적으로 추천할 만한 숙소입니다.',
    TRUE,
    '2025-01-28 09:40:00'
FROM reservations r
WHERE r.room_id = 52 AND r.user_id = 5 AND r.check_in_date = '2025-01-25'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    17,
    4.83, 5.00, 5.00, 4.50, 5.00, 4.50, 4.50,
    '제주 여행 중 최고의 숙소였습니다! 티파니 콘셉트의 인테리어가 너무 예쁘고, 청결도도 완벽했어요. 호스트분께서 직접 준비해주시는 아침 식사가 정말 훌륭했고, 세심한 배려가 느껴졌습니다. 객실 내 모든 시설이 잘 갖춰져 있었고, 커뮤니케이션도 신속했어요. 가격 대비 최고의 만족도를 느낀 숙소이고, 재방문 의사 100%입니다!',
    TRUE,
    '2025-02-01 15:30:00'
FROM reservations r
WHERE r.room_id = 50 AND r.user_id = 17 AND r.check_in_date = '2025-01-29'
LIMIT 1;

INSERT INTO reviews (reservation_id, user_id, stay_id, total_rating, clean_rating, convenience_rating, checkin_rating, communication_rating, location_rating, value_rating, review_content, is_recommended, created_at)
SELECT 
    r.reservation_id,
    r.user_id,
    17,
    4.50, 4.50, 4.50, 4.50, 5.00, 4.50, 4.00,
    '커플 여행으로 방문했는데 로맨틱한 분위기에서 좋은 시간 보냈습니다. 티파니 블루 컬러의 인테리어가 감성적이고 예뻤어요. 침대도 편안했고, 아침에 제공되는 브런치가 맛있었습니다. 호스트분께서 제주 여행 코스도 추천해주시고, 필요한 것들을 친절하게 챙겨주셔서 감사했어요. 제주에서 특별한 추억을 만들고 싶다면 추천합니다!',
    TRUE,
    '2025-02-05 11:20:00'
FROM reservations r
WHERE r.room_id = 51 AND r.user_id = 18 AND r.check_in_date = '2025-02-02'
LIMIT 1;

commit;
select * from reviews;



-- 리뷰 이미지 INSERT
SET @creator_id = 1;
SET @bucket_name = 'travelshoot-s3';

-- 리뷰 이미지 INSERT문 (REVIEWS 참조)

-- 나인스파빌 (stay_id=8) 리뷰 이미지 - 10개
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '나인스파빌_후기1.jpg',
    'images/review/나인스파빌_후기1.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_%ED%9B%84%EA%B8%B01.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 8 AND user_id = 1 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '나인스파빌_후기2.jpg',
    'images/review/나인스파빌_후기2.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_%ED%9B%84%EA%B8%B02.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 8 AND user_id = 2 
ORDER BY review_id ASC
LIMIT 1 OFFSET 0;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '나인스파빌_후기3.jpg',
    'images/review/나인스파빌_후기3.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_%ED%9B%84%EA%B8%B03.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 8 AND user_id = 3 
ORDER BY review_id ASC
LIMIT 1 OFFSET 0;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '나인스파빌_후기4.jpg',
    'images/review/나인스파빌_후기4.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_%ED%9B%84%EA%B8%B04.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 8 AND user_id = 4 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '나인스파빌_후기5.jpg',
    'images/review/나인스파빌_후기5.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_%ED%9B%84%EA%B8%B05.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 8 AND user_id = 5 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '나인스파빌_후기6.jpg',
    'images/review/나인스파빌_후기6.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_%ED%9B%84%EA%B8%B06.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 8 AND user_id = 17 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '나인스파빌_후기7.jpg',
    'images/review/나인스파빌_후기7.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_%ED%9B%84%EA%B8%B07.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 8 AND user_id = 18 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '나인스파빌_후기8.jpg',
    'images/review/나인스파빌_후기8.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_%ED%9B%84%EA%B8%B08.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 8 AND user_id = 1 
ORDER BY review_id ASC
LIMIT 1 OFFSET 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '나인스파빌_후기9.jpg',
    'images/review/나인스파빌_후기9.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_%ED%9B%84%EA%B8%B09.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 8 AND user_id = 2 
ORDER BY review_id ASC
LIMIT 1 OFFSET 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '나인스파빌_후기10.jpg',
    'images/review/나인스파빌_후기10.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_%ED%9B%84%EA%B8%B010.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 8 AND user_id = 3 
ORDER BY review_id ASC
LIMIT 1 OFFSET 1;

-- 라운지하우스제주다 (stay_id=16) 리뷰 이미지 - 10개
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '라운지하우스제주다_후기1.avif',
    'images/review/라운지하우스제주다_후기1.avif',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%EC%A0%9C%EC%A3%BC%EB%8B%A4_%ED%9B%84%EA%B8%B01.avif',
    @bucket_name,
    150,
    'image/avif',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 16 AND user_id = 4 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '라운지하우스제주다_후기2.avif',
    'images/review/라운지하우스제주다_후기2.avif',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%EC%A0%9C%EC%A3%BC%EB%8B%A4_%ED%9B%84%EA%B8%B02.avif',
    @bucket_name,
    150,
    'image/avif',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 16 AND user_id = 5 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '라운지하우스제주다_후기3.avif',
    'images/review/라운지하우스제주다_후기3.avif',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%EC%A0%9C%EC%A3%BC%EB%8B%A4_%ED%9B%84%EA%B8%B03.avif',
    @bucket_name,
    150,
    'image/avif',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 16 AND user_id = 17 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '라운지하우스제주다_후기4.avif',
    'images/review/라운지하우스제주다_후기4.avif',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%EC%A0%9C%EC%A3%BC%EB%8B%A4_%ED%9B%84%EA%B8%B04.avif',
    @bucket_name,
    150,
    'image/avif',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 16 AND user_id = 18 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '라운지하우스제주다_후기5.avif',
    'images/review/라운지하우스제주다_후기5.avif',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%EC%A0%9C%EC%A3%BC%EB%8B%A4_%ED%9B%84%EA%B8%B05.avif',
    @bucket_name,
    150,
    'image/avif',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 16 AND user_id = 1 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '라운지하우스제주다_후기6.avif',
    'images/review/라운지하우스제주다_후기6.avif',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%EC%A0%9C%EC%A3%BC%EB%8B%A4_%ED%9B%84%EA%B8%B06.avif',
    @bucket_name,
    150,
    'image/avif',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 16 AND user_id = 2 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '라운지하우스제주다_후기7.avif',
    'images/review/라운지하우스제주다_후기7.avif',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%EC%A0%9C%EC%A3%BC%EB%8B%A4_%ED%9B%84%EA%B8%B07.avif',
    @bucket_name,
    150,
    'image/avif',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 16 AND user_id = 3 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '라운지하우스제주다_후기8.jpg',
    'images/review/라운지하우스제주다_후기8.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%EC%A0%9C%EC%A3%BC%EB%8B%A4_%ED%9B%84%EA%B8%B08.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 16 AND user_id = 4 
ORDER BY review_id ASC
LIMIT 1 OFFSET 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '라운지하우스제주다_후기9.avif',
    'images/review/라운지하우스제주다_후기9.avif',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%EC%A0%9C%EC%A3%BC%EB%8B%A4_%ED%9B%84%EA%B8%B09.avif',
    @bucket_name,
    150,
    'image/avif',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 16 AND user_id = 5 
ORDER BY review_id ASC
LIMIT 1 OFFSET 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '라운지하우스제주다_후기10.avif',
    'images/review/라운지하우스제주다_후기10.avif',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%EC%A0%9C%EC%A3%BC%EB%8B%A4_%ED%9B%84%EA%B8%B010.avif',
    @bucket_name,
    150,
    'image/avif',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 16 AND user_id = 17 
ORDER BY review_id ASC
LIMIT 1 OFFSET 1;

-- 신세계호텔 (stay_id=11) 리뷰 이미지 - 7개
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '신세계호텔_후기1.jpg',
    'images/review/신세계호텔_후기1.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B01.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 11 AND user_id = 18 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '신세계호텔_후기2.jpg',
    'images/review/신세계호텔_후기2.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B02.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 11 AND user_id = 1 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '신세계호텔_후기3.jpg',
    'images/review/신세계호텔_후기3.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B03.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 11 AND user_id = 2 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '신세계호텔_후기4.jpg',
    'images/review/신세계호텔_후기4.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B04.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 11 AND user_id = 3 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '신세계호텔_후기5.jpg',
    'images/review/신세계호텔_후기5.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B05.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 11 AND user_id = 4 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '신세계호텔_후기6.jpg',
    'images/review/신세계호텔_후기6.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B06.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 11 AND user_id = 5 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '신세계호텔_후기7.jpg',
    'images/review/신세계호텔_후기7.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B07.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 11 AND user_id = 17 
ORDER BY review_id ASC
LIMIT 1;

-- 제주신라호텔 (stay_id=63) 리뷰 이미지 - 17개
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기1.jpg',
    'images/review/제주신라호텔_후기1.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B01.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 18 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기2.jpg',
    'images/review/제주신라호텔_후기2.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B02.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 1 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기3.jpg',
    'images/review/제주신라호텔_후기3.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B03.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 2 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기4.jpg',
    'images/review/제주신라호텔_후기4.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B04.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 3 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기5.jpg',
    'images/review/제주신라호텔_후기5.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B05.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 4 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기6.jpg',
    'images/review/제주신라호텔_후기6.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B06.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 5 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기7.jpg',
    'images/review/제주신라호텔_후기7.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B07.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 17 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기8.jpg',
    'images/review/제주신라호텔_후기8.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B08.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 18 
ORDER BY review_id ASC
LIMIT 1 OFFSET 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기9.jpg',
    'images/review/제주신라호텔_후기9.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B09.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 1 
ORDER BY review_id ASC
LIMIT 1 OFFSET 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기10.jpg',
    'images/review/제주신라호텔_후기10.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B010.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 2 
ORDER BY review_id ASC
LIMIT 1 OFFSET 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기11.jpg',
    'images/review/제주신라호텔_후기11.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B011.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 3 
ORDER BY review_id ASC
LIMIT 1 OFFSET 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기12.webp',
    'images/review/제주신라호텔_후기12.webp',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B012.webp',
    @bucket_name,
    150,
    'image/webp',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 4 
ORDER BY review_id ASC
LIMIT 1 OFFSET 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기13.jpg',
    'images/review/제주신라호텔_후기13.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B013.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 5 
ORDER BY review_id ASC
LIMIT 1 OFFSET 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기14.jpg',
    'images/review/제주신라호텔_후기14.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B014.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 17 
ORDER BY review_id ASC
LIMIT 1 OFFSET 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기15.jpg',
    'images/review/제주신라호텔_후기15.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B015.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 18 
ORDER BY review_id ASC
LIMIT 1 OFFSET 2;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기16.jpg',
    'images/review/제주신라호텔_후기16.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B016.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 1 
ORDER BY review_id ASC
LIMIT 1 OFFSET 2;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '제주신라호텔_후기17.jpg',
    'images/review/제주신라호텔_후기17.jpg',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%9B%84%EA%B8%B017.jpg',
    @bucket_name,
    150,
    'image/jpeg',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 63 AND user_id = 2 
ORDER BY review_id ASC
LIMIT 1 OFFSET 2;

-- 티파니에서아침을 (stay_id=17) 리뷰 이미지 - 5개
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '티파니에서아침을_후기1.avif',
    'images/review/티파니에서아침을_후기1.avif',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%EC%95%84%EC%B9%A8%EC%9D%84_%ED%9B%84%EA%B8%B01.avif',
    @bucket_name,
    150,
    'image/avif',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 17 AND user_id = 3 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '티파니에서아침을_후기2.avif',
    'images/review/티파니에서아침을_후기2.avif',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%EC%95%84%EC%B9%A8%EC%9D%84_%ED%9B%84%EA%B8%B02.avif',
    @bucket_name,
    150,
    'image/avif',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 17 AND user_id = 4 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '티파니에서아침을_후기3.avif',
    'images/review/티파니에서아침을_후기3.avif',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%EC%95%84%EC%B9%A8%EC%9D%84_%ED%9B%84%EA%B8%B03.avif',
    @bucket_name,
    150,
    'image/avif',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 17 AND user_id = 5 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '티파니에서아침을_후기4.avif',
    'images/review/티파니에서아침을_후기4.avif',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%EC%95%84%EC%B9%A8%EC%9D%84_%ED%9B%84%EA%B8%B04.avif',
    @bucket_name,
    150,
    'image/avif',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 17 AND user_id = 17 
ORDER BY review_id ASC
LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 
    '티파니에서아침을_후기5.avif',
    'images/review/티파니에서아침을_후기5.avif',
    'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/review/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%EC%95%84%EC%B9%A8%EC%9D%84_%ED%9B%84%EA%B8%B05.avif',
    @bucket_name,
    150,
    'image/avif',
    'REVIEWS',
    review_id,
    1,
    1,
    @creator_id,
    TRUE
FROM reviews
WHERE stay_id = 17 AND user_id = 18 
ORDER BY review_id ASC
LIMIT 1;

COMMIT;
SELECT * FROM files WHERE reference_type="REVIEWS";