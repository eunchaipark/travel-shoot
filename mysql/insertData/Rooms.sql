SET @creator_id = 1;
SET @bucket_name = 'travelshoot-s3';
-- 객실 이미지 INSERT문 (ROOMS 참조)

-- 신세계호텔 (stay_id=1)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신세계호텔_스탠다드.jfif', 'images/room/신세계호텔_스탠다드.jfif', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_%EC%8A%A4%ED%83%A0%EB%8B%A4%EB%93%9C.jfif', @bucket_name, 20, 'image/jpeg', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 1 LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신세계호텔_디럭스.jfif', 'images/room/신세계호텔_디럭스.jfif', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_%EB%94%94%EB%9F%AD%EC%8A%A4.jfif', @bucket_name, 20, 'image/jpeg', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 2 LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신세계호텔_패밀리룸.avif', 'images/room/신세계호텔_패밀리룸.avif', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_%ED%8C%A8%EB%B0%80%EB%A6%AC%EB%A3%B8.avif', @bucket_name, 20, 'image/avif', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 3 LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신세계호텔_스위트.avif', 'images/room/신세계호텔_스위트.avif', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_%EC%8A%A4%EC%9C%84%ED%8A%B8.avif', @bucket_name, 20, 'image/avif', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 4 LIMIT 1;

-- 나인스파빌 (stay_id=8)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_스탠다드룸.avif', 'images/room/나인스파빌_스탠다드룸.avif', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_%EC%8A%A4%ED%83%A0%EB%8B%A4%EB%93%9C%EB%A3%B8.avif', @bucket_name, 20, 'image/avif', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 23 LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_트윈룸.avif', 'images/room/나인스파빌_트윈룸.avif', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_%ED%8A%B8%EC%9C%88%EB%A3%B8.avif', @bucket_name, 20, 'image/avif', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 24 LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_온돌룸.avif', 'images/room/나인스파빌_온돌룸.avif', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_%EC%98%A8%EB%8F%8C%EB%A3%B8.avif', @bucket_name, 20, 'image/avif', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 25 LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_카페뷰_더블avif.avif', 'images/room/나인스파빌_카페뷰_더블avif.avif', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_%EC%B9%B4%ED%8E%98%EB%B7%B0_%EB%8D%94%EB%B8%94avif.avif', @bucket_name, 20, 'image/avif', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 309 LIMIT 1;

-- 라운지하우스제주다 (stay_id=16)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '라운지하우스제주다_스탠다드.avif', 'images/room/라운지하우스제주다_스탠다드.avif', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%EC%A0%9C%EC%A3%BC%EB%8B%A4_%EC%8A%A4%ED%83%A0%EB%8B%A4%EB%93%9C.avif', @bucket_name, 20, 'image/avif', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 47 LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '라운지하우스제주다_디럭스.avif', 'images/room/라운지하우스제주다_디럭스.avif', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%EC%A0%9C%EC%A3%BC%EB%8B%A4_%EB%94%94%EB%9F%AD%EC%8A%A4.avif', @bucket_name, 20, 'image/avif', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 48 LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '라운지하우스제주다_트윈룸.avif', 'images/room/라운지하우스제주다_트윈룸.avif', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%EC%A0%9C%EC%A3%BC%EB%8B%A4_%ED%8A%B8%EC%9C%88%EB%A3%B8.avif', @bucket_name, 20, 'image/avif', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 49 LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '라운지하우스제주다_리조트스위트.avif', 'images/room/라운지하우스제주다_리조트스위트.avif', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%EC%A0%9C%EC%A3%BC%EB%8B%A4_%EB%A6%AC%EC%A1%B0%ED%8A%B8%EC%8A%A4%EC%9C%84%ED%8A%B8.avif', @bucket_name, 20, 'image/avif', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 328 LIMIT 1;

-- 티파니에서아침을 (stay_id=17)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '티파니에서아침을_스탠다드.jpg', 'images/room/티파니에서아침을_스탠다드.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%EC%95%84%EC%B9%A8%EC%9D%84_%EC%8A%A4%ED%83%A0%EB%8B%A4%EB%93%9C.jpg', @bucket_name, 20, 'image/jpeg', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 50 LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '티파니에서아침을_프리미엄.jpg', 'images/room/티파니에서아침을_프리미엄.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%EC%95%84%EC%B9%A8%EC%9D%84_%ED%94%84%EB%A6%AC%EB%AF%B8%EC%97%84.jpg', @bucket_name, 20, 'image/jpeg', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 51 LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '티파니에서아침을_패밀리룸.jpg', 'images/room/티파니에서아침을_패밀리룸.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%EC%95%84%EC%B9%A8%EC%9D%84_%ED%8C%A8%EB%B0%80%EB%A6%AC%EB%A3%B8.jpg', @bucket_name, 20, 'image/jpeg', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 52 LIMIT 1;

-- 제주신라호텔 (stay_id=63)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주신리호텔_스탠다드.jpg', 'images/room/제주신리호텔_스탠다드.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%A6%AC%ED%98%B8%ED%85%94_%EC%8A%A4%ED%83%A0%EB%8B%A4%EB%93%9C.jpg', @bucket_name, 20, 'image/jpeg', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 188 LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주신라호텔_디럭스.jpg', 'images/room/제주신라호텔_디럭스.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%EB%94%94%EB%9F%AD%EC%8A%A4.jpg', @bucket_name, 20, 'image/jpeg', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 189 LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주신라호텔_패밀리룸.jpg', 'images/room/제주신라호텔_패밀리룸.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/room/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_%ED%8C%A8%EB%B0%80%EB%A6%AC%EB%A3%B8.jpg', @bucket_name, 20, 'image/jpeg', 'ROOMS', room_id, 1, 0, @creator_id, TRUE
FROM rooms WHERE room_id = 190 LIMIT 1;

COMMIT;