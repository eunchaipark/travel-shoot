--TRUNCATE TABLE stays;




USE travel_shoot;

describe files;
SET @bucket_name = 'travelshoot-s3';
SET @creator_id = 1;


-- 그랜드 조선 제주
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_1_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_10_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_11_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_12_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_13_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 13, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_14_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 14, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_15_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 15, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_16_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_16_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_16_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 16, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_2_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_3_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_4_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_5_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_6_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_7_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_8_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 조선 제주_9_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%EC%A1%B0%EC%84%A0%20%EC%A0%9C%EC%A3%BC_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 조선 제주' LIMIT 1;

-- 그랜드 하얏트 제주
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 하얏트 제주_1_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 하얏트 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 하얏트 제주_10_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 하얏트 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 하얏트 제주_11_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 하얏트 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 하얏트 제주_12_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 하얏트 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 하얏트 제주_2_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 하얏트 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 하얏트 제주_3_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 하얏트 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 하얏트 제주_4_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 하얏트 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 하얏트 제주_5_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 하얏트 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 하얏트 제주_6_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 하얏트 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 하얏트 제주_7_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 하얏트 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 하얏트 제주_8_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 하얏트 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그랜드 하얏트 제주_9_공공3유형.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9E%9C%EB%93%9C%20%ED%95%98%EC%96%8F%ED%8A%B8%20%EC%A0%9C%EC%A3%BC_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그랜드 하얏트 제주' LIMIT 1;


-- 글로스터호텔 제주
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '글로스터호텔 제주_1_공공3유형.jpg', 'images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '글로스터호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '글로스터호텔 제주_2_공공3유형.jpg', 'images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '글로스터호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '글로스터호텔 제주_3_공공3유형.jpg', 'images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '글로스터호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '글로스터호텔 제주_4_공공3유형.jpg', 'images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '글로스터호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '글로스터호텔 제주_5_공공3유형.jpg', 'images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '글로스터호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '글로스터호텔 제주_6_공공3유형.jpg', 'images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '글로스터호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '글로스터호텔 제주_7_공공3유형.jpg', 'images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '글로스터호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '글로스터호텔 제주_8_공공3유형.jpg', 'images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B8%80%EB%A1%9C%EC%8A%A4%ED%84%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '글로스터호텔 제주' LIMIT 1;


-- 다인오세아노 호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '다인오세아노 호텔_1_공공3유형.jpg', 'images/stays/hotel/%EB%8B%A4%EC%9D%B8%EC%98%A4%EC%84%B8%EC%95%84%EB%85%B8%20%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%A4%EC%9D%B8%EC%98%A4%EC%84%B8%EC%95%84%EB%85%B8%20%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '다인오세아노 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '다인오세아노 호텔_2_공공3유형.jpg', 'images/stays/hotel/%EB%8B%A4%EC%9D%B8%EC%98%A4%EC%84%B8%EC%95%84%EB%85%B8%20%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%A4%EC%9D%B8%EC%98%A4%EC%84%B8%EC%95%84%EB%85%B8%20%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '다인오세아노 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '다인오세아노 호텔_3_공공3유형.jpg', 'images/stays/hotel/%EB%8B%A4%EC%9D%B8%EC%98%A4%EC%84%B8%EC%95%84%EB%85%B8%20%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%A4%EC%9D%B8%EC%98%A4%EC%84%B8%EC%95%84%EB%85%B8%20%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '다인오세아노 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '다인오세아노 호텔_4_공공3유형.jpg', 'images/stays/hotel/%EB%8B%A4%EC%9D%B8%EC%98%A4%EC%84%B8%EC%95%84%EB%85%B8%20%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%A4%EC%9D%B8%EC%98%A4%EC%84%B8%EC%95%84%EB%85%B8%20%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '다인오세아노 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '다인오세아노 호텔_5_공공3유형.jpg', 'images/stays/hotel/%EB%8B%A4%EC%9D%B8%EC%98%A4%EC%84%B8%EC%95%84%EB%85%B8%20%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%A4%EC%9D%B8%EC%98%A4%EC%84%B8%EC%95%84%EB%85%B8%20%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '다인오세아노 호텔' LIMIT 1;


-- 담모라 호텔앤리조트
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_1_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_2_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_3_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_4_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_5_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_6_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_7_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_8_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_9_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_10_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_11_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_12_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_13_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 13, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_14_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 14, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_15_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 15, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_16_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_16_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_16_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 16, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_17_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_17_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_17_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 17, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_18_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_18_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_18_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 18, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_19_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_19_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_19_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 19, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_20_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_20_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_20_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 20, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_21_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_21_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_21_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 21, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_22_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_22_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_22_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 22, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_23_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_23_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_23_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 23, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담모라 호텔앤리조트_24_공공3유형.jpg', 'images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_24_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8B%B4%EB%AA%A8%EB%9D%BC%20%ED%98%B8%ED%85%94%EC%95%A4%EB%A6%AC%EC%A1%B0%ED%8A%B8_24_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 24, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '담모라 호텔앤리조트' LIMIT 1;


-- 더 세리 리조트
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더 세리 리조트_1_공공3유형.jpg', 'images/stays/hotel/%EB%8D%94%20%EC%84%B8%EB%A6%AC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8D%94%20%EC%84%B8%EB%A6%AC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '더 세리 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더 세리 리조트_2_공공3유형.jpg', 'images/stays/hotel/%EB%8D%94%20%EC%84%B8%EB%A6%AC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8D%94%20%EC%84%B8%EB%A6%AC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '더 세리 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더 세리 리조트_3_공공3유형.jpg', 'images/stays/hotel/%EB%8D%94%20%EC%84%B8%EB%A6%AC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8D%94%20%EC%84%B8%EB%A6%AC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '더 세리 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더 세리 리조트_4_공공3유형.jpg', 'images/stays/hotel/%EB%8D%94%20%EC%84%B8%EB%A6%AC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8D%94%20%EC%84%B8%EB%A6%AC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '더 세리 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더 세리 리조트_5_공공3유형.jpg', 'images/stays/hotel/%EB%8D%94%20%EC%84%B8%EB%A6%AC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8D%94%20%EC%84%B8%EB%A6%AC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '더 세리 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더 세리 리조트_6_공공3유형.jpg', 'images/stays/hotel/%EB%8D%94%20%EC%84%B8%EB%A6%AC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8D%94%20%EC%84%B8%EB%A6%AC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '더 세리 리조트' LIMIT 1;


-- 더스테이센추리호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더스테이센추리호텔_1_공공3유형.jpg', 'images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '더스테이센추리호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더스테이센추리호텔_2_공공3유형.jpg', 'images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '더스테이센추리호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더스테이센추리호텔_3_공공3유형.jpg', 'images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '더스테이센추리호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더스테이센추리호텔_4_공공3유형.jpg', 'images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '더스테이센추리호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더스테이센추리호텔_5_공공3유형.jpg', 'images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '더스테이센추리호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더스테이센추리호텔_6_공공3유형.jpg', 'images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '더스테이센추리호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더스테이센추리호텔_7_공공3유형.jpg', 'images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '더스테이센추리호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더스테이센추리호텔_8_공공3유형.jpg', 'images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%8D%94%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%84%BC%EC%B6%94%EB%A6%AC%ED%98%B8%ED%85%94_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '더스테이센추리호텔' LIMIT 1;


-- 디아넥스호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '디아넥스호텔_1_공공3유형.jpg', 'images/stays/hotel/%EB%94%94%EC%95%84%EB%84%A5%EC%8A%A4%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%94%94%EC%95%84%EB%84%A5%EC%8A%A4%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '디아넥스호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '디아넥스호텔_2_공공3유형.jpg', 'images/stays/hotel/%EB%94%94%EC%95%84%EB%84%A5%EC%8A%A4%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%94%94%EC%95%84%EB%84%A5%EC%8A%A4%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '디아넥스호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '디아넥스호텔_3_공공3유형.jpg', 'images/stays/hotel/%EB%94%94%EC%95%84%EB%84%A5%EC%8A%A4%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%94%94%EC%95%84%EB%84%A5%EC%8A%A4%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '디아넥스호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '디아넥스호텔_4_공공3유형.jpg', 'images/stays/hotel/%EB%94%94%EC%95%84%EB%84%A5%EC%8A%A4%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%94%94%EC%95%84%EB%84%A5%EC%8A%A4%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '디아넥스호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '디아넥스호텔_5_공공3유형.jpg', 'images/stays/hotel/%EB%94%94%EC%95%84%EB%84%A5%EC%8A%A4%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%94%94%EC%95%84%EB%84%A5%EC%8A%A4%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '디아넥스호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '디아넥스호텔_6_공공3유형.jpg', 'images/stays/hotel/%EB%94%94%EC%95%84%EB%84%A5%EC%8A%A4%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%94%94%EC%95%84%EB%84%A5%EC%8A%A4%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '디아넥스호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '디아넥스호텔_7_공공3유형.jpg', 'images/stays/hotel/%EB%94%94%EC%95%84%EB%84%A5%EC%8A%A4%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%94%94%EC%95%84%EB%84%A5%EC%8A%A4%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '디아넥스호텔' LIMIT 1;


-- 랜딩관 제주신화월드 호텔 앤 리조트
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '랜딩관 제주신화월드 호텔 앤 리조트_1_공공3유형.jpg', 'images/stays/hotel/%EB%9E%9C%EB%94%A9%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%9E%9C%EB%94%A9%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '랜딩관 제주신화월드 호텔 앤 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '랜딩관 제주신화월드 호텔 앤 리조트_2_공공3유형.jpg', 'images/stays/hotel/%EB%9E%9C%EB%94%A9%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%9E%9C%EB%94%A9%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '랜딩관 제주신화월드 호텔 앤 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '랜딩관 제주신화월드 호텔 앤 리조트_3_공공3유형.jpg', 'images/stays/hotel/%EB%9E%9C%EB%94%A9%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%9E%9C%EB%94%A9%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '랜딩관 제주신화월드 호텔 앤 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '랜딩관 제주신화월드 호텔 앤 리조트_4_공공3유형.jpg', 'images/stays/hotel/%EB%9E%9C%EB%94%A9%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%9E%9C%EB%94%A9%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '랜딩관 제주신화월드 호텔 앤 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '랜딩관 제주신화월드 호텔 앤 리조트_5_공공3유형.jpg', 'images/stays/hotel/%EB%9E%9C%EB%94%A9%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%9E%9C%EB%94%A9%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '랜딩관 제주신화월드 호텔 앤 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '랜딩관 제주신화월드 호텔 앤 리조트_6_공공3유형.jpg', 'images/stays/hotel/%EB%9E%9C%EB%94%A9%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%9E%9C%EB%94%A9%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '랜딩관 제주신화월드 호텔 앤 리조트' LIMIT 1;


-- 롯데시티호텔 제주
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_1_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_2_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_3_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_4_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_5_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_6_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_7_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_8_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_9_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_10_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_11_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_12_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_13_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 13, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_14_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 14, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_15_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 15, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_16_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_16_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_16_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 16, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_17_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_17_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_17_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 17, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_18_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_18_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_18_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 18, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_19_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_19_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_19_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 19, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_20_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_20_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_20_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 20, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_21_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_21_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_21_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 21, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_22_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_22_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_22_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 22, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_23_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_23_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_23_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 23, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_24_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_24_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_24_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 24, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_25_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_25_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_25_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 25, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_26_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_26_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_26_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 26, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_27_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_27_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_27_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 27, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_28_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_28_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_28_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 28, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_29_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_29_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_29_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 29, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롯데시티호텔 제주_30_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_30_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%EC%8B%9C%ED%8B%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_30_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 30, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데시티호텔 제주' LIMIT 1;


-- 롯데호텔 제주 (1~12)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) 
SELECT '롯데호텔 제주_1_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '롯데호텔 제주_2_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데호텔 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '롯데호텔 제주_3_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데호텔 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '롯데호텔 제주_4_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데호텔 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '롯데호텔 제주_5_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데호텔 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '롯데호텔 제주_6_공공3유형.JPG', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데호텔 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '롯데호텔 제주_7_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데호텔 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '롯데호텔 제주_8_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데호텔 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '롯데호텔 제주_9_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데호텔 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '롯데호텔 제주_10_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데호텔 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '롯데호텔 제주_11_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데호텔 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '롯데호텔 제주_12_공공3유형.jpg', 'images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A1%AF%EB%8D%B0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '롯데호텔 제주' LIMIT 1;

-- 리치호텔 (1~7)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '리치호텔_1_공공3유형.jpg', 'images/stays/hotel/%EB%A6%AC%EC%B9%98%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A6%AC%EC%B9%98%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '리치호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '리치호텔_2_공공3유형.jpg', 'images/stays/hotel/%EB%A6%AC%EC%B9%98%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A6%AC%EC%B9%98%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '리치호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '리치호텔_3_공공3유형.jpg', 'images/stays/hotel/%EB%A6%AC%EC%B9%98%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A6%AC%EC%B9%98%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '리치호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '리치호텔_4_공공3유형.jpg', 'images/stays/hotel/%EB%A6%AC%EC%B9%98%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A6%AC%EC%B9%98%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '리치호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '리치호텔_5_공공3유형.jpg', 'images/stays/hotel/%EB%A6%AC%EC%B9%98%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A6%AC%EC%B9%98%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '리치호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '리치호텔_6_공공3유형.jpg', 'images/stays/hotel/%EB%A6%AC%EC%B9%98%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A6%AC%EC%B9%98%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '리치호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '리치호텔_7_공공3유형.jpg', 'images/stays/hotel/%EB%A6%AC%EC%B9%98%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A6%AC%EC%B9%98%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '리치호텔' LIMIT 1;

-- 마레보 비치호텔 (1~8)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '마레보 비치호텔_1_공공3유형.JPG', 'images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '마레보 비치호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '마레보 비치호텔_2_공공3유형.jpg', 'images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '마레보 비치호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '마레보 비치호텔_3_공공3유형.jpg', 'images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '마레보 비치호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '마레보 비치호텔_4_공공3유형.JPG', 'images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '마레보 비치호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '마레보 비치호텔_5_공공3유형.JPG', 'images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '마레보 비치호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '마레보 비치호텔_6_공공3유형.JPG', 'images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '마레보 비치호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '마레보 비치호텔_7_공공3유형.JPG', 'images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '마레보 비치호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '마레보 비치호텔_8_공공3유형.JPG', 'images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A7%88%EB%A0%88%EB%B3%B4%20%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '마레보 비치호텔' LIMIT 1;


-- 메리어트관 제주신화월드 호텔 앤 리조트 (1~9)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메리어트관 제주신화월드 호텔 앤 리조트_1_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메리어트관 제주신화월드 호텔 앤 리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메리어트관 제주신화월드 호텔 앤 리조트_2_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메리어트관 제주신화월드 호텔 앤 리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메리어트관 제주신화월드 호텔 앤 리조트_3_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메리어트관 제주신화월드 호텔 앤 리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메리어트관 제주신화월드 호텔 앤 리조트_4_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메리어트관 제주신화월드 호텔 앤 리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메리어트관 제주신화월드 호텔 앤 리조트_5_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메리어트관 제주신화월드 호텔 앤 리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메리어트관 제주신화월드 호텔 앤 리조트_6_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메리어트관 제주신화월드 호텔 앤 리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메리어트관 제주신화월드 호텔 앤 리조트_7_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메리어트관 제주신화월드 호텔 앤 리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메리어트관 제주신화월드 호텔 앤 리조트_8_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메리어트관 제주신화월드 호텔 앤 리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메리어트관 제주신화월드 호텔 앤 리조트_9_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%EA%B4%80%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메리어트관 제주신화월드 호텔 앤 리조트' LIMIT 1;


-- 메종 글래드 제주 (1~10)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_1_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_2_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_3_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_4_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_5_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_6_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_7_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_8_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_9_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_10_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
-- 메종 글래드 제주 (11~20)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_11_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_12_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_13_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 13, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_14_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 14, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_15_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 15, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_16_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_16_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_16_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 16, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_17_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_17_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_17_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 17, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_18_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_18_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_18_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 18, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_19_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_19_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_19_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 19, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_20_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_20_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_20_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 20, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
-- 메종 글래드 제주 (21~23)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_21_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_21_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_21_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 21, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_22_공공3유형.jpg', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_22_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_22_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 22, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public) SELECT '메종 글래드 제주_23_공공3유형.JPG', 'images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_23_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A9%94%EC%A2%85%20%EA%B8%80%EB%9E%98%EB%93%9C%20%EC%A0%9C%EC%A3%BC_23_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 23, FALSE, @creator_id, TRUE FROM stays WHERE stay_name = '메종 글래드 제주' LIMIT 1;

-- JW 메리어트 제주 리조트 & 스파
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'JW 메리어트 제주 리조트 & 스파_1_공공3유형.jpg', 'images/stays/hotel/JW%20%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%20%EC%A0%9C%EC%A3%BC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8%20%26%20%EC%8A%A4%ED%8C%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/JW%20%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%20%EC%A0%9C%EC%A3%BC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8%20%26%20%EC%8A%A4%ED%8C%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = 'JW 메리어트 제주 리조트 & 스파' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'JW 메리어트 제주 리조트 & 스파_2_공공3유형.jpg', 'images/stays/hotel/JW%20%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%20%EC%A0%9C%EC%A3%BC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8%20%26%20%EC%8A%A4%ED%8C%8C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/JW%20%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%20%EC%A0%9C%EC%A3%BC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8%20%26%20%EC%8A%A4%ED%8C%8C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = 'JW 메리어트 제주 리조트 & 스파' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'JW 메리어트 제주 리조트 & 스파_4_공공3유형.jpg', 'images/stays/hotel/JW%20%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%20%EC%A0%9C%EC%A3%BC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8%20%26%20%EC%8A%A4%ED%8C%8C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/JW%20%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%20%EC%A0%9C%EC%A3%BC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8%20%26%20%EC%8A%A4%ED%8C%8C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = 'JW 메리어트 제주 리조트 & 스파' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'JW 메리어트 제주 리조트 & 스파_6_공공3유형.jpg', 'images/stays/hotel/JW%20%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%20%EC%A0%9C%EC%A3%BC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8%20%26%20%EC%8A%A4%ED%8C%8C_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/JW%20%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%20%EC%A0%9C%EC%A3%BC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8%20%26%20%EC%8A%A4%ED%8C%8C_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = 'JW 메리어트 제주 리조트 & 스파' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'JW 메리어트 제주 리조트 & 스파_8_공공3유형.jpg', 'images/stays/hotel/JW%20%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%20%EC%A0%9C%EC%A3%BC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8%20%26%20%EC%8A%A4%ED%8C%8C_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/JW%20%EB%A9%94%EB%A6%AC%EC%96%B4%ED%8A%B8%20%EC%A0%9C%EC%A3%BC%20%EB%A6%AC%EC%A1%B0%ED%8A%B8%20%26%20%EC%8A%A4%ED%8C%8C_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = 'JW 메리어트 제주 리조트 & 스파' LIMIT 1;

-- WE호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'WE호텔_1_공공3유형.jpg', 'images/stays/hotel/WE%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/WE%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = 'WE호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'WE호텔_2_공공3유형.jpg', 'images/stays/hotel/WE%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/WE%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = 'WE호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'WE호텔_4_공공3유형.jpg', 'images/stays/hotel/WE%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/WE%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = 'WE호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'WE호텔_6_공공3유형.jpg', 'images/stays/hotel/WE%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/WE%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = 'WE호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'WE호텔_8_공공3유형.JPG', 'images/stays/hotel/WE%ED%98%B8%ED%85%94_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/WE%ED%98%B8%ED%85%94_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = 'WE호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'WE호텔_11_공공3유형.jpg', 'images/stays/hotel/WE%ED%98%B8%ED%85%94_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/WE%ED%98%B8%ED%85%94_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = 'WE호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'WE호텔_13_공공3유형.jpg', 'images/stays/hotel/WE%ED%98%B8%ED%85%94_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/WE%ED%98%B8%ED%85%94_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 13, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = 'WE호텔' LIMIT 1;

-- 베니키아 중문호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '베니키아 중문호텔_1_공공3유형.jpg', 'images/stays/hotel/%EB%B2%A0%EB%8B%88%ED%82%A4%EC%95%84%20%EC%A4%91%EB%AC%B8%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B2%A0%EB%8B%88%ED%82%A4%EC%95%84%20%EC%A4%91%EB%AC%B8%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '베니키아 중문호텔' LIMIT 1;

-- 벤티모 호텔 앤 레지던스 제주
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '벤티모 호텔 앤 레지던스 제주_3_공공3유형.jpg', 'images/stays/hotel/%EB%B2%A4%ED%8B%B0%EB%AA%A8%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A0%88%EC%A7%80%EB%8D%98%EC%8A%A4%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B2%A4%ED%8B%B0%EB%AA%A8%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A0%88%EC%A7%80%EB%8D%98%EC%8A%A4%20%EC%A0%9C%EC%A3%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '벤티모 호텔 앤 레지던스 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '벤티모 호텔 앤 레지던스 제주_5_공공3유형.jpg', 'images/stays/hotel/%EB%B2%A4%ED%8B%B0%EB%AA%A8%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A0%88%EC%A7%80%EB%8D%98%EC%8A%A4%20%EC%A0%9C%EC%A3%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B2%A4%ED%8B%B0%EB%AA%A8%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A0%88%EC%A7%80%EB%8D%98%EC%8A%A4%20%EC%A0%9C%EC%A3%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '벤티모 호텔 앤 레지던스 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '벤티모 호텔 앤 레지던스 제주_7_공공3유형.jpg', 'images/stays/hotel/%EB%B2%A4%ED%8B%B0%EB%AA%A8%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A0%88%EC%A7%80%EB%8D%98%EC%8A%A4%20%EC%A0%9C%EC%A3%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B2%A4%ED%8B%B0%EB%AA%A8%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A0%88%EC%A7%80%EB%8D%98%EC%8A%A4%20%EC%A0%9C%EC%A3%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '벤티모 호텔 앤 레지던스 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '벤티모 호텔 앤 레지던스 제주_9_공공3유형.jpg', 'images/stays/hotel/%EB%B2%A4%ED%8B%B0%EB%AA%A8%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A0%88%EC%A7%80%EB%8D%98%EC%8A%A4%20%EC%A0%9C%EC%A3%BC_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B2%A4%ED%8B%B0%EB%AA%A8%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A0%88%EC%A7%80%EB%8D%98%EC%8A%A4%20%EC%A0%9C%EC%A3%BC_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '벤티모 호텔 앤 레지던스 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '벤티모 호텔 앤 레지던스 제주_10_공공3유형.jpg', 'images/stays/hotel/%EB%B2%A4%ED%8B%B0%EB%AA%A8%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A0%88%EC%A7%80%EB%8D%98%EC%8A%A4%20%EC%A0%9C%EC%A3%BC_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B2%A4%ED%8B%B0%EB%AA%A8%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A0%88%EC%A7%80%EB%8D%98%EC%8A%A4%20%EC%A0%9C%EC%A3%BC_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '벤티모 호텔 앤 레지던스 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '벤티모 호텔 앤 레지던스 제주_12_공공3유형.jpg', 'images/stays/hotel/%EB%B2%A4%ED%8B%B0%EB%AA%A8%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A0%88%EC%A7%80%EB%8D%98%EC%8A%A4%20%EC%A0%9C%EC%A3%BC_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B2%A4%ED%8B%B0%EB%AA%A8%20%ED%98%B8%ED%85%94%20%EC%95%A4%20%EB%A0%88%EC%A7%80%EB%8D%98%EC%8A%A4%20%EC%A0%9C%EC%A3%BC_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '벤티모 호텔 앤 레지던스 제주' LIMIT 1;

-- 비치스토리호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '비치스토리호텔_3_공공3유형.jpg', 'images/stays/hotel/%EB%B9%84%EC%B9%98%EC%8A%A4%ED%86%A0%EB%A6%AC%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B9%84%EC%B9%98%EC%8A%A4%ED%86%A0%EB%A6%AC%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '비치스토리호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '비치스토리호텔_5_공공3유형.jpg', 'images/stays/hotel/%EB%B9%84%EC%B9%98%EC%8A%A4%ED%86%A0%EB%A6%AC%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B9%84%EC%B9%98%EC%8A%A4%ED%86%A0%EB%A6%AC%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '비치스토리호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '비치스토리호텔_7_공공3유형.jpg', 'images/stays/hotel/%EB%B9%84%EC%B9%98%EC%8A%A4%ED%86%A0%EB%A6%AC%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B9%84%EC%B9%98%EC%8A%A4%ED%86%A0%EB%A6%AC%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '비치스토리호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '비치스토리호텔_9_공공3유형.jpg', 'images/stays/hotel/%EB%B9%84%EC%B9%98%EC%8A%A4%ED%86%A0%EB%A6%AC%ED%98%B8%ED%85%94_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B9%84%EC%B9%98%EC%8A%A4%ED%86%A0%EB%A6%AC%ED%98%B8%ED%85%94_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '비치스토리호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '비치스토리호텔_10_공공3유형.jpg', 'images/stays/hotel/%EB%B9%84%EC%B9%98%EC%8A%A4%ED%86%A0%EB%A6%AC%ED%98%B8%ED%85%94_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B9%84%EC%B9%98%EC%8A%A4%ED%86%A0%EB%A6%AC%ED%98%B8%ED%85%94_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '비치스토리호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '비치스토리호텔_12_공공3유형.jpg', 'images/stays/hotel/%EB%B9%84%EC%B9%98%EC%8A%A4%ED%86%A0%EB%A6%AC%ED%98%B8%ED%85%94_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B9%84%EC%B9%98%EC%8A%A4%ED%86%A0%EB%A6%AC%ED%98%B8%ED%85%94_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '비치스토리호텔' LIMIT 1;

-- 비케이호텔 제주(BK호텔 제주)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '비케이호텔 제주(BK호텔 제주)_2_공공3유형.jpg', 'images/stays/hotel/%EB%B9%84%EC%BC%80%EC%9D%B4%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%28BK%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%29_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B9%84%EC%BC%80%EC%9D%B4%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%28BK%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%29_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '비케이호텔 제주(BK호텔 제주)' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '비케이호텔 제주(BK호텔 제주)_4_공공3유형.jpg', 'images/stays/hotel/%EB%B9%84%EC%BC%80%EC%9D%B4%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%28BK%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%29_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B9%84%EC%BC%80%EC%9D%B4%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%28BK%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%29_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '비케이호텔 제주(BK호텔 제주)' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '비케이호텔 제주(BK호텔 제주)_6_공공3유형.jpg', 'images/stays/hotel/%EB%B9%84%EC%BC%80%EC%9D%B4%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%28BK%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%29_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B9%84%EC%BC%80%EC%9D%B4%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%28BK%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%29_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '비케이호텔 제주(BK호텔 제주)' LIMIT 1;

-- 서귀포KAL호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포KAL호텔_1_공공3유형.jpg', 'images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%ACKAL%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%ACKAL%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '서귀포KAL호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포KAL호텔_3_공공3유형.jpg', 'images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%ACKAL%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%ACKAL%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '서귀포KAL호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포KAL호텔_5_공공3유형.jpg', 'images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%ACKAL%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%ACKAL%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '서귀포KAL호텔' LIMIT 1;

-- 서머셋 제주신화월드
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서머셋 제주신화월드_2_공공3유형.jpg', 'images/stays/hotel/%EC%84%9C%EB%A8%B8%EC%85%8B%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%84%9C%EB%A8%B8%EC%85%8B%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '서머셋 제주신화월드' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서머셋 제주신화월드_4_공공3유형.jpg', 'images/stays/hotel/%EC%84%9C%EB%A8%B8%EC%85%8B%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%84%9C%EB%A8%B8%EC%85%8B%20%EC%A0%9C%EC%A3%BC%EC%8B%A0%ED%99%94%EC%9B%94%EB%93%9C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '서머셋 제주신화월드' LIMIT 1;

-- 스타즈 호텔 제주 로베로(구 로베로호텔)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '스타즈 호텔 제주 로베로(구 로베로호텔)_3_공공3유형.jpg', 'images/stays/hotel/%EC%8A%A4%ED%83%80%EC%A6%88%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%28%EA%B5%AC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%ED%98%B8%ED%85%94%29_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%8A%A4%ED%83%80%EC%A6%88%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%28%EA%B5%AC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%ED%98%B8%ED%85%94%29_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '스타즈 호텔 제주 로베로(구 로베로호텔)' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '스타즈 호텔 제주 로베로(구 로베로호텔)_5_공공3유형.jpg', 'images/stays/hotel/%EC%8A%A4%ED%83%80%EC%A6%88%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%28%EA%B5%AC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%ED%98%B8%ED%85%94%29_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%8A%A4%ED%83%80%EC%A6%88%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%28%EA%B5%AC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%ED%98%B8%ED%85%94%29_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '스타즈 호텔 제주 로베로(구 로베로호텔)' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '스타즈 호텔 제주 로베로(구 로베로호텔)_7_공공3유형.jpg', 'images/stays/hotel/%EC%8A%A4%ED%83%80%EC%A6%88%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%28%EA%B5%AC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%ED%98%B8%ED%85%94%29_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%8A%A4%ED%83%80%EC%A6%88%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%28%EA%B5%AC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%ED%98%B8%ED%85%94%29_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '스타즈 호텔 제주 로베로(구 로베로호텔)' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '스타즈 호텔 제주 로베로(구 로베로호텔)_9_공공3유형.jpg', 'images/stays/hotel/%EC%8A%A4%ED%83%80%EC%A6%88%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%28%EA%B5%AC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%ED%98%B8%ED%85%94%29_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%8A%A4%ED%83%80%EC%A6%88%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%28%EA%B5%AC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%ED%98%B8%ED%85%94%29_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '스타즈 호텔 제주 로베로(구 로베로호텔)' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '스타즈 호텔 제주 로베로(구 로베로호텔)_10_공공3유형.jpg', 'images/stays/hotel/%EC%8A%A4%ED%83%80%EC%A6%88%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%28%EA%B5%AC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%ED%98%B8%ED%85%94%29_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%8A%A4%ED%83%80%EC%A6%88%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%28%EA%B5%AC%20%EB%A1%9C%EB%B2%A0%EB%A1%9C%ED%98%B8%ED%85%94%29_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '스타즈 호텔 제주 로베로(구 로베로호텔)' LIMIT 1;

-- 신라스테이 제주
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신라스테이 제주_2_공공3유형.jpg', 'images/stays/hotel/%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '신라스테이 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신라스테이 제주_4_공공3유형.jpg', 'images/stays/hotel/%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '신라스테이 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신라스테이 제주_6_공공3유형.jpg', 'images/stays/hotel/%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '신라스테이 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신라스테이 제주_8_공공3유형.jpg', 'images/stays/hotel/%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%A0%9C%EC%A3%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%A0%9C%EC%A3%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '신라스테이 제주' LIMIT 1;

-- 신신호텔 제주오션
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신신호텔 제주오션_2_공공3유형.jpg', 'images/stays/hotel/%EC%8B%A0%EC%8B%A0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%EC%98%A4%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%8B%A0%EC%8B%A0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%EC%98%A4%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '신신호텔 제주오션' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신신호텔 제주오션_4_공공3유형.jpg', 'images/stays/hotel/%EC%8B%A0%EC%8B%A0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%EC%98%A4%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%8B%A0%EC%8B%A0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%EC%98%A4%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '신신호텔 제주오션' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신신호텔 제주오션_6_공공3유형.jpg', 'images/stays/hotel/%EC%8B%A0%EC%8B%A0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%EC%98%A4%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%8B%A0%EC%8B%A0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%EC%98%A4%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '신신호텔 제주오션' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신신호텔 제주오션_8_공공3유형.jpg', 'images/stays/hotel/%EC%8B%A0%EC%8B%A0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%EC%98%A4%EC%85%98_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%8B%A0%EC%8B%A0%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC%EC%98%A4%EC%85%98_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '신신호텔 제주오션' LIMIT 1;

-- 썬랜드 호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '썬랜드 호텔_1_공공3유형.jpg', 'images/stays/hotel/%EC%8D%AC%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%8D%AC%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '썬랜드 호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '썬랜드 호텔_3_공공3유형.jpg', 'images/stays/hotel/%EC%8D%AC%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%8D%AC%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '썬랜드 호텔' LIMIT 1;

-- 씨에스 호텔&리조트
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '씨에스 호텔&리조트_2_공공3유형.jpg', 'images/stays/hotel/%EC%94%A8%EC%97%90%EC%8A%A4%20%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%94%A8%EC%97%90%EC%8A%A4%20%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '씨에스 호텔&리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '씨에스 호텔&리조트_4_공공3유형.jpg', 'images/stays/hotel/%EC%94%A8%EC%97%90%EC%8A%A4%20%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%94%A8%EC%97%90%EC%8A%A4%20%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '씨에스 호텔&리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '씨에스 호텔&리조트_6_공공3유형.jpg', 'images/stays/hotel/%EC%94%A8%EC%97%90%EC%8A%A4%20%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%94%A8%EC%97%90%EC%8A%A4%20%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '씨에스 호텔&리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '씨에스 호텔&리조트_8_공공3유형.jpg', 'images/stays/hotel/%EC%94%A8%EC%97%90%EC%8A%A4%20%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%94%A8%EC%97%90%EC%8A%A4%20%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '씨에스 호텔&리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '씨에스 호텔&리조트_10_공공3유형.jpg', 'images/stays/hotel/%EC%94%A8%EC%97%90%EC%8A%A4%20%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%94%A8%EC%97%90%EC%8A%A4%20%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '씨에스 호텔&리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '씨에스 호텔&리조트_12_공공3유형.jpg', 'images/stays/hotel/%EC%94%A8%EC%97%90%EC%8A%A4%20%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%94%A8%EC%97%90%EC%8A%A4%20%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '씨에스 호텔&리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '씨에스 호텔&리조트_14_공공3유형.jpg', 'images/stays/hotel/%EC%94%A8%EC%97%90%EC%8A%A4%20%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%94%A8%EC%97%90%EC%8A%A4%20%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 14, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '씨에스 호텔&리조트' LIMIT 1;

-- 어반아일랜드호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '어반아일랜드호텔_1_공공3유형.jpg', 'images/stays/hotel/%EC%96%B4%EB%B0%98%EC%95%84%EC%9D%BC%EB%9E%9C%EB%93%9C%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%96%B4%EB%B0%98%EC%95%84%EC%9D%BC%EB%9E%9C%EB%93%9C%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '어반아일랜드호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '어반아일랜드호텔_3_공공3유형.jpg', 'images/stays/hotel/%EC%96%B4%EB%B0%98%EC%95%84%EC%9D%BC%EB%9E%9C%EB%93%9C%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%96%B4%EB%B0%98%EC%95%84%EC%9D%BC%EB%9E%9C%EB%93%9C%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '어반아일랜드호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '어반아일랜드호텔_5_공공3유형.jpg', 'images/stays/hotel/%EC%96%B4%EB%B0%98%EC%95%84%EC%9D%BC%EB%9E%9C%EB%93%9C%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%96%B4%EB%B0%98%EC%95%84%EC%9D%BC%EB%9E%9C%EB%93%9C%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '어반아일랜드호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '어반아일랜드호텔_7_공공3유형.jpg', 'images/stays/hotel/%EC%96%B4%EB%B0%98%EC%95%84%EC%9D%BC%EB%9E%9C%EB%93%9C%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%96%B4%EB%B0%98%EC%95%84%EC%9D%BC%EB%9E%9C%EB%93%9C%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '어반아일랜드호텔' LIMIT 1;

-- 엘린호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '엘린호텔_1_공공3유형.jpg', 'images/stays/hotel/%EC%97%98%EB%A6%B0%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%97%98%EB%A6%B0%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '엘린호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '엘린호텔_3_공공3유형.jpg', 'images/stays/hotel/%EC%97%98%EB%A6%B0%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%97%98%EB%A6%B0%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '엘린호텔' LIMIT 1;

-- 제주 메이플호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 메이플호텔_1_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%A9%94%EC%9D%B4%ED%94%8C%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%A9%94%EC%9D%B4%ED%94%8C%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 메이플호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 메이플호텔_3_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%A9%94%EC%9D%B4%ED%94%8C%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%A9%94%EC%9D%B4%ED%94%8C%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 메이플호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 메이플호텔_5_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%A9%94%EC%9D%B4%ED%94%8C%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%A9%94%EC%9D%B4%ED%94%8C%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 메이플호텔' LIMIT 1;

-- 제주 블랙스톤
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 블랙스톤_3_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%B8%94%EB%9E%99%EC%8A%A4%ED%86%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%B8%94%EB%9E%99%EC%8A%A4%ED%86%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 블랙스톤' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 블랙스톤_5_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%B8%94%EB%9E%99%EC%8A%A4%ED%86%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%B8%94%EB%9E%99%EC%8A%A4%ED%86%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 블랙스톤' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 블랙스톤_7_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%B8%94%EB%9E%99%EC%8A%A4%ED%86%A4_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%B8%94%EB%9E%99%EC%8A%A4%ED%86%A4_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 블랙스톤' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 블랙스톤_9_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%B8%94%EB%9E%99%EC%8A%A4%ED%86%A4_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%B8%94%EB%9E%99%EC%8A%A4%ED%86%A4_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 블랙스톤' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 블랙스톤_10_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%B8%94%EB%9E%99%EC%8A%A4%ED%86%A4_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EB%B8%94%EB%9E%99%EC%8A%A4%ED%86%A4_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 블랙스톤' LIMIT 1;

-- 제주 스위트호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 스위트호텔_2_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%8A%A4%EC%9C%84%ED%8A%B8%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%8A%A4%EC%9C%84%ED%8A%B8%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 스위트호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 스위트호텔_4_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%8A%A4%EC%9C%84%ED%8A%B8%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%8A%A4%EC%9C%84%ED%8A%B8%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 스위트호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 스위트호텔_6_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%8A%A4%EC%9C%84%ED%8A%B8%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%8A%A4%EC%9C%84%ED%8A%B8%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 스위트호텔' LIMIT 1;

-- 제주 스카브로호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 스카브로호텔_1_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%8A%A4%EC%B9%B4%EB%B8%8C%EB%A1%9C%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%8A%A4%EC%B9%B4%EB%B8%8C%EB%A1%9C%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 스카브로호텔' LIMIT 1;

-- 제주 오리엔탈 호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 오리엔탈 호텔_2_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%98%A4%EB%A6%AC%EC%97%94%ED%83%88%20%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%98%A4%EB%A6%AC%EC%97%94%ED%83%88%20%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 오리엔탈 호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 오리엔탈 호텔_4_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%98%A4%EB%A6%AC%EC%97%94%ED%83%88%20%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%98%A4%EB%A6%AC%EC%97%94%ED%83%88%20%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 오리엔탈 호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 오리엔탈 호텔_6_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%98%A4%EB%A6%AC%EC%97%94%ED%83%88%20%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%98%A4%EB%A6%AC%EC%97%94%ED%83%88%20%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 오리엔탈 호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 오리엔탈 호텔_8_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%98%A4%EB%A6%AC%EC%97%94%ED%83%88%20%ED%98%B8%ED%85%94_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%98%A4%EB%A6%AC%EC%97%94%ED%83%88%20%ED%98%B8%ED%85%94_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 오리엔탈 호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 오리엔탈 호텔_10_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%98%A4%EB%A6%AC%EC%97%94%ED%83%88%20%ED%98%B8%ED%85%94_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%98%A4%EB%A6%AC%EC%97%94%ED%83%88%20%ED%98%B8%ED%85%94_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 오리엔탈 호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 오리엔탈 호텔_12_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%98%A4%EB%A6%AC%EC%97%94%ED%83%88%20%ED%98%B8%ED%85%94_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%EC%98%A4%EB%A6%AC%EC%97%94%ED%83%88%20%ED%98%B8%ED%85%94_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 오리엔탈 호텔' LIMIT 1;

-- 제주 펄 관광호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 펄 관광호텔_1_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%8E%84%20%EA%B4%80%EA%B4%91%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%8E%84%20%EA%B4%80%EA%B4%91%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 펄 관광호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 펄 관광호텔_3_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%8E%84%20%EA%B4%80%EA%B4%91%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%8E%84%20%EA%B4%80%EA%B4%91%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 펄 관광호텔' LIMIT 1;

-- 제주로얄호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주로얄호텔_2_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%A1%9C%EC%96%84%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%A1%9C%EC%96%84%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주로얄호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주로얄호텔_4_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%A1%9C%EC%96%84%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%A1%9C%EC%96%84%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주로얄호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주로얄호텔_6_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%A1%9C%EC%96%84%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%A1%9C%EC%96%84%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주로얄호텔' LIMIT 1;

-- 제주신라호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주신라호텔_1_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주신라호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주신라호텔_3_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주신라호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주신라호텔_5_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주신라호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주신라호텔_7_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주신라호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주신라호텔_9_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주신라호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주신라호텔_11_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주신라호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주신라호텔_13_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 13, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주신라호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주신라호텔_15_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 15, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주신라호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주신라호텔_17_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_17_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94_17_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 17, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주신라호텔' LIMIT 1;

-- 제주엠리조트
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주엠리조트_2_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%97%A0%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%97%A0%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주엠리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주엠리조트_4_공공3유형.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%97%A0%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%97%A0%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주엠리조트' LIMIT 1;

-- 취다선 리조트
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '취다선 리조트_2_공공3유형.jpg', 'images/stays/hotel/%EC%B7%A8%EB%8B%A4%EC%84%A0%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%B7%A8%EB%8B%A4%EC%84%A0%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '취다선 리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '취다선 리조트_4_공공3유형.jpg', 'images/stays/hotel/%EC%B7%A8%EB%8B%A4%EC%84%A0%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%B7%A8%EB%8B%A4%EC%84%A0%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '취다선 리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '취다선 리조트_6_공공3유형.jpg', 'images/stays/hotel/%EC%B7%A8%EB%8B%A4%EC%84%A0%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%B7%A8%EB%8B%A4%EC%84%A0%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '취다선 리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '취다선 리조트_8_공공3유형.jpg', 'images/stays/hotel/%EC%B7%A8%EB%8B%A4%EC%84%A0%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%B7%A8%EB%8B%A4%EC%84%A0%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '취다선 리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '취다선 리조트_11_공공3유형.jpg', 'images/stays/hotel/%EC%B7%A8%EB%8B%A4%EC%84%A0%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%B7%A8%EB%8B%A4%EC%84%A0%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '취다선 리조트' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '취다선 리조트_13_공공3유형.jpg', 'images/stays/hotel/%EC%B7%A8%EB%8B%A4%EC%84%A0%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%B7%A8%EB%8B%A4%EC%84%A0%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 13, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '취다선 리조트' LIMIT 1;

-- 카세로지
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카세로지_1_공공3유형.jpg', 'images/stays/hotel/%EC%B9%B4%EC%84%B8%EB%A1%9C%EC%A7%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%B9%B4%EC%84%B8%EB%A1%9C%EC%A7%80_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '카세로지' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카세로지_3_공공3유형.jpg', 'images/stays/hotel/%EC%B9%B4%EC%84%B8%EB%A1%9C%EC%A7%80_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%B9%B4%EC%84%B8%EB%A1%9C%EC%A7%80_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '카세로지' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카세로지_5_공공3유형.jpg', 'images/stays/hotel/%EC%B9%B4%EC%84%B8%EB%A1%9C%EC%A7%80_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%B9%B4%EC%84%B8%EB%A1%9C%EC%A7%80_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '카세로지' LIMIT 1;

-- 하니크라운호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '하니크라운호텔_1_공공3유형.jpg', 'images/stays/hotel/%ED%95%98%EB%8B%88%ED%81%AC%EB%9D%BC%EC%9A%B4%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%95%98%EB%8B%88%ED%81%AC%EB%9D%BC%EC%9A%B4%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '하니크라운호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '하니크라운호텔_3_공공3유형.jpg', 'images/stays/hotel/%ED%95%98%EB%8B%88%ED%81%AC%EB%9D%BC%EC%9A%B4%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%95%98%EB%8B%88%ED%81%AC%EB%9D%BC%EC%9A%B4%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '하니크라운호텔' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '하니크라운호텔_5_공공3유형.jpg', 'images/stays/hotel/%ED%95%98%EB%8B%88%ED%81%AC%EB%9D%BC%EC%9A%B4%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%95%98%EB%8B%88%ED%81%AC%EB%9D%BC%EC%9A%B4%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '하니크라운호텔' LIMIT 1;

-- 헤이, 서귀포
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '헤이, 서귀포_2_공공3유형.JPG', 'images/stays/hotel/%ED%97%A4%EC%9D%B4%2C%20%EC%84%9C%EA%B7%80%ED%8F%AC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%97%A4%EC%9D%B4%2C%20%EC%84%9C%EA%B7%80%ED%8F%AC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '헤이, 서귀포' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '헤이, 서귀포_4_공공3유형.JPG', 'images/stays/hotel/%ED%97%A4%EC%9D%B4%2C%20%EC%84%9C%EA%B7%80%ED%8F%AC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%97%A4%EC%9D%B4%2C%20%EC%84%9C%EA%B7%80%ED%8F%AC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '헤이, 서귀포' LIMIT 1;

-- 호텔 골든데이지 서귀포오션
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 골든데이지 서귀포오션_1_공공3유형.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%20%EA%B3%A8%EB%93%A0%EB%8D%B0%EC%9D%B4%EC%A7%80%20%EC%84%9C%EA%B7%80%ED%8F%AC%EC%98%A4%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%20%EA%B3%A8%EB%93%A0%EB%8D%B0%EC%9D%B4%EC%A7%80%20%EC%84%9C%EA%B7%80%ED%8F%AC%EC%98%A4%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 골든데이지 서귀포오션' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 골든데이지 서귀포오션_3_공공3유형.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%20%EA%B3%A8%EB%93%A0%EB%8D%B0%EC%9D%B4%EC%A7%80%20%EC%84%9C%EA%B7%80%ED%8F%AC%EC%98%A4%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%20%EA%B3%A8%EB%93%A0%EB%8D%B0%EC%9D%B4%EC%A7%80%20%EC%84%9C%EA%B7%80%ED%8F%AC%EC%98%A4%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 골든데이지 서귀포오션' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 골든데이지 서귀포오션_5_공공3유형.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%20%EA%B3%A8%EB%93%A0%EB%8D%B0%EC%9D%B4%EC%A7%80%20%EC%84%9C%EA%B7%80%ED%8F%AC%EC%98%A4%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%20%EA%B3%A8%EB%93%A0%EB%8D%B0%EC%9D%B4%EC%A7%80%20%EC%84%9C%EA%B7%80%ED%8F%AC%EC%98%A4%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 골든데이지 서귀포오션' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 골든데이지 서귀포오션_7_공공3유형.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%20%EA%B3%A8%EB%93%A0%EB%8D%B0%EC%9D%B4%EC%A7%80%20%EC%84%9C%EA%B7%80%ED%8F%AC%EC%98%A4%EC%85%98_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%20%EA%B3%A8%EB%93%A0%EB%8D%B0%EC%9D%B4%EC%A7%80%20%EC%84%9C%EA%B7%80%ED%8F%AC%EC%98%A4%EC%85%98_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 골든데이지 서귀포오션' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 골든데이지 서귀포오션_9_공공3유형.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%20%EA%B3%A8%EB%93%A0%EB%8D%B0%EC%9D%B4%EC%A7%80%20%EC%84%9C%EA%B7%80%ED%8F%AC%EC%98%A4%EC%85%98_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%20%EA%B3%A8%EB%93%A0%EB%8D%B0%EC%9D%B4%EC%A7%80%20%EC%84%9C%EA%B7%80%ED%8F%AC%EC%98%A4%EC%85%98_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 골든데이지 서귀포오션' LIMIT 1;

-- 호텔 더본 제주
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 더본 제주_2_공공3유형.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%20%EB%8D%94%EB%B3%B8%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%20%EB%8D%94%EB%B3%B8%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 더본 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 더본 제주_4_공공3유형.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%20%EB%8D%94%EB%B3%B8%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%20%EB%8D%94%EB%B3%B8%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 더본 제주' LIMIT 1;

-- 호텔스위트캐슬
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔스위트캐슬_1_공공3유형.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EC%8A%A4%EC%9C%84%ED%8A%B8%EC%BA%90%EC%8A%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EC%8A%A4%EC%9C%84%ED%8A%B8%EC%BA%90%EC%8A%AC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 1, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔스위트캐슬' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔스위트캐슬_3_공공3유형.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EC%8A%A4%EC%9C%84%ED%8A%B8%EC%BA%90%EC%8A%AC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EC%8A%A4%EC%9C%84%ED%8A%B8%EC%BA%90%EC%8A%AC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔스위트캐슬' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔스위트캐슬_5_공공3유형.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EC%8A%A4%EC%9C%84%ED%8A%B8%EC%BA%90%EC%8A%AC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EC%8A%A4%EC%9C%84%ED%8A%B8%EC%BA%90%EC%8A%AC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔스위트캐슬' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔스위트캐슬_7_공공3유형.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EC%8A%A4%EC%9C%84%ED%8A%B8%EC%BA%90%EC%8A%AC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EC%8A%A4%EC%9C%84%ED%8A%B8%EC%BA%90%EC%8A%AC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔스위트캐슬' LIMIT 1;

-- 호텔컬리넌 제주
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔컬리넌 제주_2_공공3유형.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EC%BB%AC%EB%A6%AC%EB%84%8C%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EC%BB%AC%EB%A6%AC%EB%84%8C%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔컬리넌 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔컬리넌 제주_4_공공3유형.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EC%BB%AC%EB%A6%AC%EB%84%8C%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EC%BB%AC%EB%A6%AC%EB%84%8C%20%EC%A0%9C%EC%A3%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔컬리넌 제주' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔컬리넌 제주_6_공공3유형.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EC%BB%AC%EB%A6%AC%EB%84%8C%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EC%BB%AC%EB%A6%AC%EB%84%8C%20%EC%A0%9C%EC%A3%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔컬리넌 제주' LIMIT 1;

-- 히든 클리프 호텔 & 네이쳐
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '히든 클리프 호텔 & 네이쳐_2_공공3유형.jpg', 'images/stays/hotel/%ED%9E%88%EB%93%A0%20%ED%81%B4%EB%A6%AC%ED%94%84%20%ED%98%B8%ED%85%94%20%26%20%EB%84%A4%EC%9D%B4%EC%B3%90_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%9E%88%EB%93%A0%20%ED%81%B4%EB%A6%AC%ED%94%84%20%ED%98%B8%ED%85%94%20%26%20%EB%84%A4%EC%9D%B4%EC%B3%90_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '히든 클리프 호텔 & 네이쳐' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '히든 클리프 호텔 & 네이쳐_4_공공3유형.jpg', 'images/stays/hotel/%ED%9E%88%EB%93%A0%20%ED%81%B4%EB%A6%AC%ED%94%84%20%ED%98%B8%ED%85%94%20%26%20%EB%84%A4%EC%9D%B4%EC%B3%90_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%9E%88%EB%93%A0%20%ED%81%B4%EB%A6%AC%ED%94%84%20%ED%98%B8%ED%85%94%20%26%20%EB%84%A4%EC%9D%B4%EC%B3%90_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '히든 클리프 호텔 & 네이쳐' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '히든 클리프 호텔 & 네이쳐_6_공공3유형.jpg', 'images/stays/hotel/%ED%9E%88%EB%93%A0%20%ED%81%B4%EB%A6%AC%ED%94%84%20%ED%98%B8%ED%85%94%20%26%20%EB%84%A4%EC%9D%B4%EC%B3%90_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%9E%88%EB%93%A0%20%ED%81%B4%EB%A6%AC%ED%94%84%20%ED%98%B8%ED%85%94%20%26%20%EB%84%A4%EC%9D%B4%EC%B3%90_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '히든 클리프 호텔 & 네이쳐' LIMIT 1;
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '히든 클리프 호텔 & 네이쳐_8_공공3유형.jpg', 'images/stays/hotel/%ED%9E%88%EB%93%A0%20%ED%81%B4%EB%A6%AC%ED%94%84%20%ED%98%B8%ED%85%94%20%26%20%EB%84%A4%EC%9D%B4%EC%B3%90_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%9E%88%EB%93%A0%20%ED%81%B4%EB%A6%AC%ED%94%84%20%ED%98%B8%ED%85%94%20%26%20%EB%84%A4%EC%9D%B4%EC%B3%90_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '히든 클리프 호텔 & 네이쳐' LIMIT 1;


--- 부족한 호텔 추가

SET @bucket_name = 'travelshoot-s3';
SET @creator_id = 1;

-- 그라벨호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그라벨호텔_1.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9D%BC%EB%B2%A8%ED%98%B8%ED%85%94_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9D%BC%EB%B2%A8%ED%98%B8%ED%85%94_1.jpg', @bucket_name, 7372, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '그라벨호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그라벨호텔_2.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9D%BC%EB%B2%A8%ED%98%B8%ED%85%94_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9D%BC%EB%B2%A8%ED%98%B8%ED%85%94_2.jpg', @bucket_name, 10956, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그라벨호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그라벨호텔_3.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9D%BC%EB%B2%A8%ED%98%B8%ED%85%94_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9D%BC%EB%B2%A8%ED%98%B8%ED%85%94_3.jpg', @bucket_name, 10138, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그라벨호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그라벨호텔_4.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9D%BC%EB%B2%A8%ED%98%B8%ED%85%94_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9D%BC%EB%B2%A8%ED%98%B8%ED%85%94_4.jpg', @bucket_name, 9318, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그라벨호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그라벨호텔_5.jpg', 'images/stays/hotel/%EA%B7%B8%EB%9D%BC%EB%B2%A8%ED%98%B8%ED%85%94_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EA%B7%B8%EB%9D%BC%EB%B2%A8%ED%98%B8%ED%85%94_5.jpg', @bucket_name, 8090, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그라벨호텔' LIMIT 1;

-- 라마다제주함덕호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '라마다제주함덕호텔_1.jpg', 'images/stays/hotel/%EB%9D%BC%EB%A7%88%EB%8B%A4%EC%A0%9C%EC%A3%BC%ED%95%A8%EB%8D%95%ED%98%B8%ED%85%94_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%9D%BC%EB%A7%88%EB%8B%A4%EC%A0%9C%EC%A3%BC%ED%95%A8%EB%8D%95%ED%98%B8%ED%85%94_1.jpg', @bucket_name, 12697, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '라마다제주함덕호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '라마다제주함덕호텔_2.jpg', 'images/stays/hotel/%EB%9D%BC%EB%A7%88%EB%8B%A4%EC%A0%9C%EC%A3%BC%ED%95%A8%EB%8D%95%ED%98%B8%ED%85%94_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%9D%BC%EB%A7%88%EB%8B%A4%EC%A0%9C%EC%A3%BC%ED%95%A8%EB%8D%95%ED%98%B8%ED%85%94_2.jpg', @bucket_name, 11264, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '라마다제주함덕호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '라마다제주함덕호텔_3.jpg', 'images/stays/hotel/%EB%9D%BC%EB%A7%88%EB%8B%A4%EC%A0%9C%EC%A3%BC%ED%95%A8%EB%8D%95%ED%98%B8%ED%85%94_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%9D%BC%EB%A7%88%EB%8B%A4%EC%A0%9C%EC%A3%BC%ED%95%A8%EB%8D%95%ED%98%B8%ED%85%94_3.jpg', @bucket_name, 13312, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '라마다제주함덕호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '라마다제주함덕호텔_4.jpg', 'images/stays/hotel/%EB%9D%BC%EB%A7%88%EB%8B%A4%EC%A0%9C%EC%A3%BC%ED%95%A8%EB%8D%95%ED%98%B8%ED%85%94_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%9D%BC%EB%A7%88%EB%8B%A4%EC%A0%9C%EC%A3%BC%ED%95%A8%EB%8D%95%ED%98%B8%ED%85%94_4.jpg', @bucket_name, 9011, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '라마다제주함덕호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '라마다제주함덕호텔_5.jpg', 'images/stays/hotel/%EB%9D%BC%EB%A7%88%EB%8B%A4%EC%A0%9C%EC%A3%BC%ED%95%A8%EB%8D%95%ED%98%B8%ED%85%94_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%9D%BC%EB%A7%88%EB%8B%A4%EC%A0%9C%EC%A3%BC%ED%95%A8%EB%8D%95%ED%98%B8%ED%85%94_5.jpg', @bucket_name, 11673, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '라마다제주함덕호텔' LIMIT 1;

-- 머큐어앰배서더 제주
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '머큐어앰배서더 제주_1.jpg', 'images/stays/hotel/%EB%A8%B8%ED%81%90%EC%96%B4%EC%95%B0%EB%B0%B0%EC%84%9C%EB%8D%94%20%EC%A0%9C%EC%A3%BC_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A8%B8%ED%81%90%EC%96%B4%EC%95%B0%EB%B0%B0%EC%84%9C%EB%8D%94%20%EC%A0%9C%EC%A3%BC_1.jpg', @bucket_name, 11059, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '머큐어앰배서더 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '머큐어앰배서더 제주_2.jpg', 'images/stays/hotel/%EB%A8%B8%ED%81%90%EC%96%B4%EC%95%B0%EB%B0%B0%EC%84%9C%EB%8D%94%20%EC%A0%9C%EC%A3%BC_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A8%B8%ED%81%90%EC%96%B4%EC%95%B0%EB%B0%B0%EC%84%9C%EB%8D%94%20%EC%A0%9C%EC%A3%BC_2.jpg', @bucket_name, 9216, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '머큐어앰배서더 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '머큐어앰배서더 제주_3.jpg', 'images/stays/hotel/%EB%A8%B8%ED%81%90%EC%96%B4%EC%95%B0%EB%B0%B0%EC%84%9C%EB%8D%94%20%EC%A0%9C%EC%A3%BC_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A8%B8%ED%81%90%EC%96%B4%EC%95%B0%EB%B0%B0%EC%84%9C%EB%8D%94%20%EC%A0%9C%EC%A3%BC_3.jpg', @bucket_name, 10956, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '머큐어앰배서더 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '머큐어앰배서더 제주_4.jpg', 'images/stays/hotel/%EB%A8%B8%ED%81%90%EC%96%B4%EC%95%B0%EB%B0%B0%EC%84%9C%EB%8D%94%20%EC%A0%9C%EC%A3%BC_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A8%B8%ED%81%90%EC%96%B4%EC%95%B0%EB%B0%B0%EC%84%9C%EB%8D%94%20%EC%A0%9C%EC%A3%BC_4.jpg', @bucket_name, 12902, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '머큐어앰배서더 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '머큐어앰배서더 제주_5.jpg', 'images/stays/hotel/%EB%A8%B8%ED%81%90%EC%96%B4%EC%95%B0%EB%B0%B0%EC%84%9C%EB%8D%94%20%EC%A0%9C%EC%A3%BC_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%A8%B8%ED%81%90%EC%96%B4%EC%95%B0%EB%B0%B0%EC%84%9C%EB%8D%94%20%EC%A0%9C%EC%A3%BC_5.jpg', @bucket_name, 10956, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '머큐어앰배서더 제주' LIMIT 1;

-- 베니키아 호텔 제주
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '베니키아 호텔 제주_1.jpg', 'images/stays/hotel/%EB%B2%A0%EB%8B%88%ED%82%A4%EC%95%84%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B2%A0%EB%8B%88%ED%82%A4%EC%95%84%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_1.jpg', @bucket_name, 10854, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '베니키아 호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '베니키아 호텔 제주_2.jpg', 'images/stays/hotel/%EB%B2%A0%EB%8B%88%ED%82%A4%EC%95%84%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B2%A0%EB%8B%88%ED%82%A4%EC%95%84%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_2.jpg', @bucket_name, 12493, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '베니키아 호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '베니키아 호텔 제주_3.jpg', 'images/stays/hotel/%EB%B2%A0%EB%8B%88%ED%82%A4%EC%95%84%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B2%A0%EB%8B%88%ED%82%A4%EC%95%84%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_3.jpg', @bucket_name, 11878, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '베니키아 호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '베니키아 호텔 제주_4.jpg', 'images/stays/hotel/%EB%B2%A0%EB%8B%88%ED%82%A4%EC%95%84%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B2%A0%EB%8B%88%ED%82%A4%EC%95%84%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_4.jpg', @bucket_name, 11776, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '베니키아 호텔 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '베니키아 호텔 제주_5.jpg', 'images/stays/hotel/%EB%B2%A0%EB%8B%88%ED%82%A4%EC%95%84%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EB%B2%A0%EB%8B%88%ED%82%A4%EC%95%84%20%ED%98%B8%ED%85%94%20%EC%A0%9C%EC%A3%BC_5.jpg', @bucket_name, 9523, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '베니키아 호텔 제주' LIMIT 1;

-- 서귀포호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포호텔_1.jpg', 'images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%AC%ED%98%B8%ED%85%94_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%AC%ED%98%B8%ED%85%94_1.jpg', @bucket_name, 13312, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '서귀포 그랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포호텔_2.jpg', 'images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%AC%ED%98%B8%ED%85%94_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%AC%ED%98%B8%ED%85%94_2.jpg', @bucket_name, 9728, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '서귀포 그랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포호텔_3.jpg', 'images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%AC%ED%98%B8%ED%85%94_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%AC%ED%98%B8%ED%85%94_3.jpg', @bucket_name, 8294, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '서귀포 그랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포호텔_4.jpg', 'images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%AC%ED%98%B8%ED%85%94_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%AC%ED%98%B8%ED%85%94_4.jpg', @bucket_name, 11264, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '서귀포 그랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포호텔_5.jpg', 'images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%AC%ED%98%B8%ED%85%94_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%84%9C%EA%B7%80%ED%8F%AC%ED%98%B8%ED%85%94_5.jpg', @bucket_name, 8601, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '서귀포호텔 그랜드 호텔' LIMIT 1;

-- 오션스위츠 제주호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '오션스위츠 제주호텔_1.jpg', 'images/stays/hotel/%EC%98%A4%EC%85%98%EC%8A%A4%EC%9C%84%EC%B8%A0%20%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%98%A4%EC%85%98%EC%8A%A4%EC%9C%84%EC%B8%A0%20%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94_1.jpg', @bucket_name, 11469, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '오션스위츠 제주호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '오션스위츠 제주호텔_2.jpg', 'images/stays/hotel/%EC%98%A4%EC%85%98%EC%8A%A4%EC%9C%84%EC%B8%A0%20%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%98%A4%EC%85%98%EC%8A%A4%EC%9C%84%EC%B8%A0%20%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94_2.jpg', @bucket_name, 9830, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '오션스위츠 제주호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '오션스위츠 제주호텔_3.jpg', 'images/stays/hotel/%EC%98%A4%EC%85%98%EC%8A%A4%EC%9C%84%EC%B8%A0%20%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%98%A4%EC%85%98%EC%8A%A4%EC%9C%84%EC%B8%A0%20%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94_3.jpg', @bucket_name, 10649, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '오션스위츠 제주호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '오션스위츠 제주호텔_4.jpg', 'images/stays/hotel/%EC%98%A4%EC%85%98%EC%8A%A4%EC%9C%84%EC%B8%A0%20%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%98%A4%EC%85%98%EC%8A%A4%EC%9C%84%EC%B8%A0%20%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94_4.jpg', @bucket_name, 10752, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '오션스위츠 제주호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '오션스위츠 제주호텔_5.jpg', 'images/stays/hotel/%EC%98%A4%EC%85%98%EC%8A%A4%EC%9C%84%EC%B8%A0%20%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%98%A4%EC%85%98%EC%8A%A4%EC%9C%84%EC%B8%A0%20%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94_5.jpg', @bucket_name, 9830, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '오션스위츠 제주호텔' LIMIT 1;

-- 이스턴호텔제주
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '이스턴호텔제주_1.jpg', 'images/stays/hotel/%EC%9D%B4%EC%8A%A4%ED%84%B4%ED%98%B8%ED%85%94%EC%A0%9C%EC%A3%BC_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%9D%B4%EC%8A%A4%ED%84%B4%ED%98%B8%ED%85%94%EC%A0%9C%EC%A3%BC_1.jpg', @bucket_name, 11059, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '이스턴호텔제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '이스턴호텔제주_2.jpg', 'images/stays/hotel/%EC%9D%B4%EC%8A%A4%ED%84%B4%ED%98%B8%ED%85%94%EC%A0%9C%EC%A3%BC_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%9D%B4%EC%8A%A4%ED%84%B4%ED%98%B8%ED%85%94%EC%A0%9C%EC%A3%BC_2.jpg', @bucket_name, 10035, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '이스턴호텔제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '이스턴호텔제주_3.jpg', 'images/stays/hotel/%EC%9D%B4%EC%8A%A4%ED%84%B4%ED%98%B8%ED%85%94%EC%A0%9C%EC%A3%BC_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%9D%B4%EC%8A%A4%ED%84%B4%ED%98%B8%ED%85%94%EC%A0%9C%EC%A3%BC_3.jpg', @bucket_name, 10035, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '이스턴호텔제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '이스턴호텔제주_4.jpg', 'images/stays/hotel/%EC%9D%B4%EC%8A%A4%ED%84%B4%ED%98%B8%ED%85%94%EC%A0%9C%EC%A3%BC_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%9D%B4%EC%8A%A4%ED%84%B4%ED%98%B8%ED%85%94%EC%A0%9C%EC%A3%BC_4.jpg', @bucket_name, 12800, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '이스턴호텔제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '이스턴호텔제주_5.jpg', 'images/stays/hotel/%EC%9D%B4%EC%8A%A4%ED%84%B4%ED%98%B8%ED%85%94%EC%A0%9C%EC%A3%BC_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%9D%B4%EC%8A%A4%ED%84%B4%ED%98%B8%ED%85%94%EC%A0%9C%EC%A3%BC_5.jpg', @bucket_name, 9011, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '이스턴호텔제주' LIMIT 1;

-- 제주 퍼시픽 호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 퍼시픽 호텔_1.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%8D%BC%EC%8B%9C%ED%94%BD%20%ED%98%B8%ED%85%94_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%8D%BC%EC%8B%9C%ED%94%BD%20%ED%98%B8%ED%85%94_1.jpg', @bucket_name, 11980, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 퍼시픽 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 퍼시픽 호텔_2.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%8D%BC%EC%8B%9C%ED%94%BD%20%ED%98%B8%ED%85%94_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%8D%BC%EC%8B%9C%ED%94%BD%20%ED%98%B8%ED%85%94_2.jpg', @bucket_name, 16793, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 퍼시픽 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 퍼시픽 호텔_3.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%8D%BC%EC%8B%9C%ED%94%BD%20%ED%98%B8%ED%85%94_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%8D%BC%EC%8B%9C%ED%94%BD%20%ED%98%B8%ED%85%94_3.jpg', @bucket_name, 11469, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 퍼시픽 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 퍼시픽 호텔_4.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%8D%BC%EC%8B%9C%ED%94%BD%20%ED%98%B8%ED%85%94_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%8D%BC%EC%8B%9C%ED%94%BD%20%ED%98%B8%ED%85%94_4.jpg', @bucket_name, 12595, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 퍼시픽 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 퍼시픽 호텔_5.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%8D%BC%EC%8B%9C%ED%94%BD%20%ED%98%B8%ED%85%94_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%8D%BC%EC%8B%9C%ED%94%BD%20%ED%98%B8%ED%85%94_5.jpg', @bucket_name, 11980, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 퍼시픽 호텔' LIMIT 1;

-- 제주 항공우주 호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 항공우주 호텔_1.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%95%AD%EA%B3%B5%EC%9A%B0%EC%A3%BC%20%ED%98%B8%ED%85%94_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%95%AD%EA%B3%B5%EC%9A%B0%EC%A3%BC%20%ED%98%B8%ED%85%94_1.jpg', @bucket_name, 9420, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 항공우주 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 항공우주 호텔_2.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%95%AD%EA%B3%B5%EC%9A%B0%EC%A3%BC%20%ED%98%B8%ED%85%94_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%95%AD%EA%B3%B5%EC%9A%B0%EC%A3%BC%20%ED%98%B8%ED%85%94_2.jpg', @bucket_name, 10240, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 항공우주 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 항공우주 호텔_3.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%95%AD%EA%B3%B5%EC%9A%B0%EC%A3%BC%20%ED%98%B8%ED%85%94_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%95%AD%EA%B3%B5%EC%9A%B0%EC%A3%BC%20%ED%98%B8%ED%85%94_3.jpg', @bucket_name, 11161, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 항공우주 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 항공우주 호텔_4.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%95%AD%EA%B3%B5%EC%9A%B0%EC%A3%BC%20%ED%98%B8%ED%85%94_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%95%AD%EA%B3%B5%EC%9A%B0%EC%A3%BC%20%ED%98%B8%ED%85%94_4.jpg', @bucket_name, 9625, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 항공우주 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 항공우주 호텔_5.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%95%AD%EA%B3%B5%EC%9A%B0%EC%A3%BC%20%ED%98%B8%ED%85%94_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%20%ED%95%AD%EA%B3%B5%EC%9A%B0%EC%A3%BC%20%ED%98%B8%ED%85%94_5.jpg', @bucket_name, 8090, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 항공우주 호텔' LIMIT 1;

-- 제주부영호텔&리조트
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주부영호텔&리조트_1.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%B6%80%EC%98%81%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%B6%80%EC%98%81%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_1.jpg', @bucket_name, 22016, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주부영호텔&리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주부영호텔&리조트_2.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%B6%80%EC%98%81%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%B6%80%EC%98%81%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_2.jpg', @bucket_name, 13209, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주부영호텔&리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주부영호텔&리조트_3.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%B6%80%EC%98%81%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%B6%80%EC%98%81%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_3.jpg', @bucket_name, 11980, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주부영호텔&리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주부영호텔&리조트_4.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%B6%80%EC%98%81%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%B6%80%EC%98%81%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_4.jpg', @bucket_name, 9318, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주부영호텔&리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주부영호텔&리조트_5.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%B6%80%EC%98%81%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EB%B6%80%EC%98%81%ED%98%B8%ED%85%94%26%EB%A6%AC%EC%A1%B0%ED%8A%B8_5.jpg', @bucket_name, 9318, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주부영호텔&리조트' LIMIT 1;

-- 제주서우봉비치호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주서우봉비치호텔_1.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%84%9C%EC%9A%B0%EB%B4%89%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%84%9C%EC%9A%B0%EB%B4%89%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_1.jpg', @bucket_name, 9318, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주서우봉비치호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주서우봉비치호텔_2.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%84%9C%EC%9A%B0%EB%B4%89%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%84%9C%EC%9A%B0%EB%B4%89%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_2.jpg', @bucket_name, 8294, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주서우봉비치호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주서우봉비치호텔_3.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%84%9C%EC%9A%B0%EB%B4%89%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%84%9C%EC%9A%B0%EB%B4%89%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_3.jpg', @bucket_name, 10444, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주서우봉비치호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주서우봉비치호텔_4.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%84%9C%EC%9A%B0%EB%B4%89%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%84%9C%EC%9A%B0%EB%B4%89%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_4.jpg', @bucket_name, 8396, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주서우봉비치호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주서우봉비치호텔_5.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%84%9C%EC%9A%B0%EB%B4%89%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%EC%84%9C%EC%9A%B0%EB%B4%89%EB%B9%84%EC%B9%98%ED%98%B8%ED%85%94_5.jpg', @bucket_name, 9113, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주서우봉비치호텔' LIMIT 1;

-- 제주팔레스호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주팔레스호텔_1.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%ED%8C%94%EB%A0%88%EC%8A%A4%ED%98%B8%ED%85%94_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%ED%8C%94%EB%A0%88%EC%8A%A4%ED%98%B8%ED%85%94_1.jpg', @bucket_name, 9523, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주팔레스호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주팔레스호텔_2.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%ED%8C%94%EB%A0%88%EC%8A%A4%ED%98%B8%ED%85%94_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%ED%8C%94%EB%A0%88%EC%8A%A4%ED%98%B8%ED%85%94_2.jpg', @bucket_name, 10547, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주팔레스호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주팔레스호텔_3.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%ED%8C%94%EB%A0%88%EC%8A%A4%ED%98%B8%ED%85%94_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%ED%8C%94%EB%A0%88%EC%8A%A4%ED%98%B8%ED%85%94_3.jpg', @bucket_name, 11673, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주팔레스호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주팔레스호텔_4.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%ED%8C%94%EB%A0%88%EC%8A%A4%ED%98%B8%ED%85%94_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%ED%8C%94%EB%A0%88%EC%8A%A4%ED%98%B8%ED%85%94_4.jpg', @bucket_name, 12083, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주팔레스호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주팔레스호텔_5.jpg', 'images/stays/hotel/%EC%A0%9C%EC%A3%BC%ED%8C%94%EB%A0%88%EC%8A%A4%ED%98%B8%ED%85%94_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%EC%A0%9C%EC%A3%BC%ED%8C%94%EB%A0%88%EC%8A%A4%ED%98%B8%ED%85%94_5.jpg', @bucket_name, 8499, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주팔레스호텔' LIMIT 1;

-- 탑스텐 빌라드 애월 제주
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '탑스텐 빌라드 애월 제주_1.jpg', 'images/stays/hotel/%ED%83%91%EC%8A%A4%ED%85%90%20%EB%B9%8C%EB%9D%BC%EB%93%9C%20%EC%95%A0%EC%9B%94%20%EC%A0%9C%EC%A3%BC_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%83%91%EC%8A%A4%ED%85%90%20%EB%B9%8C%EB%9D%BC%EB%93%9C%20%EC%95%A0%EC%9B%94%20%EC%A0%9C%EC%A3%BC_1.jpg', @bucket_name, 11673, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '탑스텐 빌라드 애월 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '탑스텐 빌라드 애월 제주_2.jpg', 'images/stays/hotel/%ED%83%91%EC%8A%A4%ED%85%90%20%EB%B9%8C%EB%9D%BC%EB%93%9C%20%EC%95%A0%EC%9B%94%20%EC%A0%9C%EC%A3%BC_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%83%91%EC%8A%A4%ED%85%90%20%EB%B9%8C%EB%9D%BC%EB%93%9C%20%EC%95%A0%EC%9B%94%20%EC%A0%9C%EC%A3%BC_2.jpg', @bucket_name, 11673, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '탑스텐 빌라드 애월 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '탑스텐 빌라드 애월 제주_3.jpg', 'images/stays/hotel/%ED%83%91%EC%8A%A4%ED%85%90%20%EB%B9%8C%EB%9D%BC%EB%93%9C%20%EC%95%A0%EC%9B%94%20%EC%A0%9C%EC%A3%BC_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%83%91%EC%8A%A4%ED%85%90%20%EB%B9%8C%EB%9D%BC%EB%93%9C%20%EC%95%A0%EC%9B%94%20%EC%A0%9C%EC%A3%BC_3.jpg', @bucket_name, 6860, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '탑스텐 빌라드 애월 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '탑스텐 빌라드 애월 제주_4.jpg', 'images/stays/hotel/%ED%83%91%EC%8A%A4%ED%85%90%20%EB%B9%8C%EB%9D%BC%EB%93%9C%20%EC%95%A0%EC%9B%94%20%EC%A0%9C%EC%A3%BC_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%83%91%EC%8A%A4%ED%85%90%20%EB%B9%8C%EB%9D%BC%EB%93%9C%20%EC%95%A0%EC%9B%94%20%EC%A0%9C%EC%A3%BC_4.jpg', @bucket_name, 7065, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '탑스텐 빌라드 애월 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '탑스텐 빌라드 애월 제주_5.jpg', 'images/stays/hotel/%ED%83%91%EC%8A%A4%ED%85%90%20%EB%B9%8C%EB%9D%BC%EB%93%9C%20%EC%95%A0%EC%9B%94%20%EC%A0%9C%EC%A3%BC_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%83%91%EC%8A%A4%ED%85%90%20%EB%B9%8C%EB%9D%BC%EB%93%9C%20%EC%95%A0%EC%9B%94%20%EC%A0%9C%EC%A3%BC_5.jpg', @bucket_name, 6041, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '탑스텐 빌라드 애월 제주' LIMIT 1;

-- 토스카나 호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '토스카나 호텔_1.jpg', 'images/stays/hotel/%ED%86%A0%EC%8A%A4%EC%B9%B4%EB%82%98%20%ED%98%B8%ED%85%94_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%86%A0%EC%8A%A4%EC%B9%B4%EB%82%98%20%ED%98%B8%ED%85%94_1.jpg', @bucket_name, 11264, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '토스카나 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '토스카나 호텔_2.jpg', 'images/stays/hotel/%ED%86%A0%EC%8A%A4%EC%B9%B4%EB%82%98%20%ED%98%B8%ED%85%94_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%86%A0%EC%8A%A4%EC%B9%B4%EB%82%98%20%ED%98%B8%ED%85%94_2.jpg', @bucket_name, 13004, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '토스카나 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '토스카나 호텔_3.jpg', 'images/stays/hotel/%ED%86%A0%EC%8A%A4%EC%B9%B4%EB%82%98%20%ED%98%B8%ED%85%94_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%86%A0%EC%8A%A4%EC%B9%B4%EB%82%98%20%ED%98%B8%ED%85%94_3.jpg', @bucket_name, 11878, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '토스카나 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '토스카나 호텔_4.jpg', 'images/stays/hotel/%ED%86%A0%EC%8A%A4%EC%B9%B4%EB%82%98%20%ED%98%B8%ED%85%94_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%86%A0%EC%8A%A4%EC%B9%B4%EB%82%98%20%ED%98%B8%ED%85%94_4.jpg', @bucket_name, 10138, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '토스카나 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '토스카나 호텔_5.jpg', 'images/stays/hotel/%ED%86%A0%EC%8A%A4%EC%B9%B4%EB%82%98%20%ED%98%B8%ED%85%94_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%86%A0%EC%8A%A4%EC%B9%B4%EB%82%98%20%ED%98%B8%ED%85%94_5.jpg', @bucket_name, 10342, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '토스카나 호텔' LIMIT 1;

-- 호텔 앨리스 앤 트렁크
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 앨리스 앤 트렁크_1.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%20%EC%95%A8%EB%A6%AC%EC%8A%A4%20%EC%95%A4%20%ED%8A%B8%EB%A0%81%ED%81%AC_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%20%EC%95%A8%EB%A6%AC%EC%8A%A4%20%EC%95%A4%20%ED%8A%B8%EB%A0%81%ED%81%AC_1.jpg', @bucket_name, 8192, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 앨리스 앤 트렁크' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 앨리스 앤 트렁크_2.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%20%EC%95%A8%EB%A6%AC%EC%8A%A4%20%EC%95%A4%20%ED%8A%B8%EB%A0%81%ED%81%AC_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%20%EC%95%A8%EB%A6%AC%EC%8A%A4%20%EC%95%A4%20%ED%8A%B8%EB%A0%81%ED%81%AC_2.jpg', @bucket_name, 7782, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 앨리스 앤 트렁크' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 앨리스 앤 트렁크_3.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%20%EC%95%A8%EB%A6%AC%EC%8A%A4%20%EC%95%A4%20%ED%8A%B8%EB%A0%81%ED%81%AC_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%20%EC%95%A8%EB%A6%AC%EC%8A%A4%20%EC%95%A4%20%ED%8A%B8%EB%A0%81%ED%81%AC_3.jpg', @bucket_name, 10138, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 앨리스 앤 트렁크' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 앨리스 앤 트렁크_4.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%20%EC%95%A8%EB%A6%AC%EC%8A%A4%20%EC%95%A4%20%ED%8A%B8%EB%A0%81%ED%81%AC_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%20%EC%95%A8%EB%A6%AC%EC%8A%A4%20%EC%95%A4%20%ED%8A%B8%EB%A0%81%ED%81%AC_4.jpg', @bucket_name, 9011, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 앨리스 앤 트렁크' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 앨리스 앤 트렁크_5.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%20%EC%95%A8%EB%A6%AC%EC%8A%A4%20%EC%95%A4%20%ED%8A%B8%EB%A0%81%ED%81%AC_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%20%EC%95%A8%EB%A6%AC%EC%8A%A4%20%EC%95%A4%20%ED%8A%B8%EB%A0%81%ED%81%AC_5.jpg', @bucket_name, 9420, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 앨리스 앤 트렁크' LIMIT 1;

-- 호텔레오
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔레오_1.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EB%A0%88%EC%98%A4_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EB%A0%88%EC%98%A4_1.jpg', @bucket_name, 13414, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔레오' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔레오_2.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EB%A0%88%EC%98%A4_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EB%A0%88%EC%98%A4_2.jpg', @bucket_name, 13414, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔레오' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔레오_3.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EB%A0%88%EC%98%A4_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EB%A0%88%EC%98%A4_3.jpg', @bucket_name, 18329, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔레오' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔레오_4.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EB%A0%88%EC%98%A4_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EB%A0%88%EC%98%A4_4.jpg', @bucket_name, 9625, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔레오' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔레오_5.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EB%A0%88%EC%98%A4_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EB%A0%88%EC%98%A4_5.jpg', @bucket_name, 15974, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔레오' LIMIT 1;

-- 호텔에이치아이
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔에이치아이_1.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EC%97%90%EC%9D%B4%EC%B9%98%EC%95%84%EC%9D%B4_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EC%97%90%EC%9D%B4%EC%B9%98%EC%95%84%EC%9D%B4_1.jpg', @bucket_name, 11366, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔에이치아이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔에이치아이_2.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EC%97%90%EC%9D%B4%EC%B9%98%EC%95%84%EC%9D%B4_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EC%97%90%EC%9D%B4%EC%B9%98%EC%95%84%EC%9D%B4_2.jpg', @bucket_name, 12800, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔에이치아이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔에이치아이_3.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EC%97%90%EC%9D%B4%EC%B9%98%EC%95%84%EC%9D%B4_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EC%97%90%EC%9D%B4%EC%B9%98%EC%95%84%EC%9D%B4_3.jpg', @bucket_name, 11776, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔에이치아이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔에이치아이_4.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EC%97%90%EC%9D%B4%EC%B9%98%EC%95%84%EC%9D%B4_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EC%97%90%EC%9D%B4%EC%B9%98%EC%95%84%EC%9D%B4_4.jpg', @bucket_name, 11571, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔에이치아이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔에이치아이_5.jpg', 'images/stays/hotel/%ED%98%B8%ED%85%94%EC%97%90%EC%9D%B4%EC%B9%98%EC%95%84%EC%9D%B4_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/hotel/%ED%98%B8%ED%85%94%EC%97%90%EC%9D%B4%EC%B9%98%EC%95%84%EC%9D%B4_5.jpg', @bucket_name, 9318, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔에이치아이' LIMIT 1;