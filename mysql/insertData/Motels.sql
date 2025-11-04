SET @creator_id = 1;
SET @bucket_name = 'travelshoot-s3';

-- select * from files where reference_type = "STAYS";
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_1_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_10_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_11_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_12_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_13_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 13, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_14_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 14, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_15_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 15, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_16_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_16_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_16_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 16, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_2_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_3_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_4_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_5_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_6_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_7_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_8_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나인스파빌_9_공공3유형.jpg', 'images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%82%98%EC%9D%B8%EC%8A%A4%ED%8C%8C%EB%B9%8C_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나인스파빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '늘송파크텔_1_공공3유형.jpg', 'images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '늘송파크텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '늘송파크텔_10_공공3유형.jpg', 'images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '늘송파크텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '늘송파크텔_11_공공3유형.jpg', 'images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '늘송파크텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '늘송파크텔_12_공공3유형.jpg', 'images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '늘송파크텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '늘송파크텔_13_공공3유형.jpg', 'images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 13, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '늘송파크텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '늘송파크텔_2_공공3유형.jpg', 'images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '늘송파크텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '늘송파크텔_3_공공3유형.jpg', 'images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '늘송파크텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '늘송파크텔_4_공공3유형.jpg', 'images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '늘송파크텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '늘송파크텔_5_공공3유형.jpg', 'images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '늘송파크텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '늘송파크텔_6_공공3유형.jpg', 'images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '늘송파크텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '늘송파크텔_7_공공3유형.jpg', 'images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '늘송파크텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '늘송파크텔_8_공공3유형.jpg', 'images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '늘송파크텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '늘송파크텔_9_공공3유형.jpg', 'images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%8A%98%EC%86%A1%ED%8C%8C%ED%81%AC%ED%85%94_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '늘송파크텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신세계호텔_1_공공3유형.jpg', 'images/stays/motel/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '신세계호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신세계호텔_2_공공3유형.jpg', 'images/stays/motel/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '신세계호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신세계호텔_3_공공3유형.jpg', 'images/stays/motel/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '신세계호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신세계호텔_4_공공3유형.jpg', 'images/stays/motel/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '신세계호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '신세계호텔_5_공공3유형.jpg', 'images/stays/motel/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%8B%A0%EC%84%B8%EA%B3%84%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '신세계호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에코랜드 호텔_1_공공3유형.png', 'images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.png', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.png', @bucket_name, 1, 'image/png', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '에코랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에코랜드 호텔_10_공공3유형.jpg', 'images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '에코랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에코랜드 호텔_11_공공3유형.jpg', 'images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '에코랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에코랜드 호텔_12_공공3유형.jpg', 'images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '에코랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에코랜드 호텔_13_공공3유형.jpg', 'images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 13, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '에코랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에코랜드 호텔_14_공공3유형.jpg', 'images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 14, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '에코랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에코랜드 호텔_15_공공3유형.jpg', 'images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 15, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '에코랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에코랜드 호텔_2_공공3유형.jpg', 'images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '에코랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에코랜드 호텔_3_공공3유형.jpg', 'images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '에코랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에코랜드 호텔_4_공공3유형.jpg', 'images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '에코랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에코랜드 호텔_5_공공3유형.jpg', 'images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '에코랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에코랜드 호텔_6_공공3유형.jpg', 'images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '에코랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에코랜드 호텔_7_공공3유형.jpg', 'images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '에코랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에코랜드 호텔_8_공공3유형.jpg', 'images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '에코랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '에코랜드 호텔_9_공공3유형.jpg', 'images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%97%90%EC%BD%94%EB%9E%9C%EB%93%9C%20%ED%98%B8%ED%85%94_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '에코랜드 호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제이뷰호텔_1_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제이뷰호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제이뷰호텔_2_공공3유형.JPG', 'images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제이뷰호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제이뷰호텔_3_공공3유형.JPG', 'images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제이뷰호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제이뷰호텔_4_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제이뷰호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제이뷰호텔_5_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제이뷰호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제이뷰호텔_6_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제이뷰호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제이뷰호텔_7_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제이뷰호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제이뷰호텔_8_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%9D%B4%EB%B7%B0%ED%98%B8%ED%85%94_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제이뷰호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주알(R)호텔_1_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%EC%95%8C%28R%29%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%EC%95%8C%28R%29%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주알(R)호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주알(R)호텔_2_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%EC%95%8C%28R%29%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%EC%95%8C%28R%29%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주알(R)호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주알(R)호텔_3_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%EC%95%8C%28R%29%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%EC%95%8C%28R%29%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주알(R)호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주알(R)호텔_4_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%EC%95%8C%28R%29%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%EC%95%8C%28R%29%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주알(R)호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주알(R)호텔_5_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%EC%95%8C%28R%29%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%EC%95%8C%28R%29%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주알(R)호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주해군호텔_1_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%95%B4%EA%B5%B0%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%95%B4%EA%B5%B0%ED%98%B8%ED%85%94_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주해군호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주해군호텔_2_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%95%B4%EA%B5%B0%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%95%B4%EA%B5%B0%ED%98%B8%ED%85%94_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주해군호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주해군호텔_3_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%95%B4%EA%B5%B0%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%95%B4%EA%B5%B0%ED%98%B8%ED%85%94_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주해군호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주해군호텔_4_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%95%B4%EA%B5%B0%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%95%B4%EA%B5%B0%ED%98%B8%ED%85%94_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주해군호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주해군호텔_5_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%95%B4%EA%B5%B0%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%95%B4%EA%B5%B0%ED%98%B8%ED%85%94_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주해군호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주해군호텔_6_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%95%B4%EA%B5%B0%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%95%B4%EA%B5%B0%ED%98%B8%ED%85%94_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주해군호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주해군호텔_7_공공3유형.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%95%B4%EA%B5%B0%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%95%B4%EA%B5%B0%ED%98%B8%ED%85%94_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주해군호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 리젠트마린_1_공공3유형.jpg', 'images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 리젠트마린' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 리젠트마린_2_공공3유형.jpg', 'images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 리젠트마린' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 리젠트마린_3_공공3유형.jpg', 'images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 리젠트마린' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 리젠트마린_4_공공3유형.jpg', 'images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 리젠트마린' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 리젠트마린_5_공공3유형.jpg', 'images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 리젠트마린' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 리젠트마린_6_공공3유형.jpg', 'images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 리젠트마린' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 리젠트마린_7_공공3유형.jpg', 'images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 리젠트마린' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔 리젠트마린_8_공공3유형.jpg', 'images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%98%B8%ED%85%94%20%EB%A6%AC%EC%A0%A0%ED%8A%B8%EB%A7%88%EB%A6%B0_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔 리젠트마린' LIMIT 1;


---부족한 것들
SET @bucket_name = 'travelshoot-s3';
SET @creator_id = 1;

-- 밀라노모텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '밀라노모텔_1.jpg', 'images/stays/motel/%EB%B0%80%EB%9D%BC%EB%85%B8%EB%AA%A8%ED%85%94_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%B0%80%EB%9D%BC%EB%85%B8%EB%AA%A8%ED%85%94_1.jpg', @bucket_name, 9420, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '밀라노모텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '밀라노모텔_2.jpg', 'images/stays/motel/%EB%B0%80%EB%9D%BC%EB%85%B8%EB%AA%A8%ED%85%94_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%B0%80%EB%9D%BC%EB%85%B8%EB%AA%A8%ED%85%94_2.jpg', @bucket_name, 11059, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '밀라노모텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '밀라노모텔_3.jpg', 'images/stays/motel/%EB%B0%80%EB%9D%BC%EB%85%B8%EB%AA%A8%ED%85%94_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%B0%80%EB%9D%BC%EB%85%B8%EB%AA%A8%ED%85%94_3.jpg', @bucket_name, 10240, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '밀라노모텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '밀라노모텔_4.jpg', 'images/stays/motel/%EB%B0%80%EB%9D%BC%EB%85%B8%EB%AA%A8%ED%85%94_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%B0%80%EB%9D%BC%EB%85%B8%EB%AA%A8%ED%85%94_4.jpg', @bucket_name, 6553, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '밀라노모텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '밀라노모텔_5.jpg', 'images/stays/motel/%EB%B0%80%EB%9D%BC%EB%85%B8%EB%AA%A8%ED%85%94_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EB%B0%80%EB%9D%BC%EB%85%B8%EB%AA%A8%ED%85%94_5.jpg', @bucket_name, 6963, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '밀라노모텔' LIMIT 1;

-- 제주호텔더엠
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주호텔더엠_1.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94%EB%8D%94%EC%97%A0_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94%EB%8D%94%EC%97%A0_1.jpg', @bucket_name, 9318, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주호텔더엠' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주호텔더엠_2.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94%EB%8D%94%EC%97%A0_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94%EB%8D%94%EC%97%A0_2.jpg', @bucket_name, 9523, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주호텔더엠' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주호텔더엠_3.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94%EB%8D%94%EC%97%A0_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94%EB%8D%94%EC%97%A0_3.jpg', @bucket_name, 12902, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주호텔더엠' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주호텔더엠_4.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94%EB%8D%94%EC%97%A0_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94%EB%8D%94%EC%97%A0_4.jpg', @bucket_name, 10956, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주호텔더엠' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주호텔더엠_5.jpg', 'images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94%EB%8D%94%EC%97%A0_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%EC%A0%9C%EC%A3%BC%ED%98%B8%ED%85%94%EB%8D%94%EC%97%A0_5.jpg', @bucket_name, 10956, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주호텔더엠' LIMIT 1;

-- 키코앤일레인호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '키코앤일레인호텔_1.jpg', 'images/stays/motel/%ED%82%A4%EC%BD%94%EC%95%A4%EC%9D%BC%EB%A0%88%EC%9D%B8%ED%98%B8%ED%85%94_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%82%A4%EC%BD%94%EC%95%A4%EC%9D%BC%EB%A0%88%EC%9D%B8%ED%98%B8%ED%85%94_1.jpg', @bucket_name, 10240, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '키코앤일레인호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '키코앤일레인호텔_2.jpg', 'images/stays/motel/%ED%82%A4%EC%BD%94%EC%95%A4%EC%9D%BC%EB%A0%88%EC%9D%B8%ED%98%B8%ED%85%94_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%82%A4%EC%BD%94%EC%95%A4%EC%9D%BC%EB%A0%88%EC%9D%B8%ED%98%B8%ED%85%94_2.jpg', @bucket_name, 9113, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '키코앤일레인호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '키코앤일레인호텔_3.jpg', 'images/stays/motel/%ED%82%A4%EC%BD%94%EC%95%A4%EC%9D%BC%EB%A0%88%EC%9D%B8%ED%98%B8%ED%85%94_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%82%A4%EC%BD%94%EC%95%A4%EC%9D%BC%EB%A0%88%EC%9D%B8%ED%98%B8%ED%85%94_3.jpg', @bucket_name, 5734, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '키코앤일레인호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '키코앤일레인호텔_4.jpg', 'images/stays/motel/%ED%82%A4%EC%BD%94%EC%95%A4%EC%9D%BC%EB%A0%88%EC%9D%B8%ED%98%B8%ED%85%94_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%82%A4%EC%BD%94%EC%95%A4%EC%9D%BC%EB%A0%88%EC%9D%B8%ED%98%B8%ED%85%94_4.jpg', @bucket_name, 6451, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '키코앤일레인호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '키코앤일레인호텔_5.jpg', 'images/stays/motel/%ED%82%A4%EC%BD%94%EC%95%A4%EC%9D%BC%EB%A0%88%EC%9D%B8%ED%98%B8%ED%85%94_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%82%A4%EC%BD%94%EC%95%A4%EC%9D%BC%EB%A0%88%EC%9D%B8%ED%98%B8%ED%85%94_5.jpg', @bucket_name, 7782, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '키코앤일레인호텔' LIMIT 1;

-- 포도호텔
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '포도호텔_1.jpg', 'images/stays/motel/%ED%8F%AC%EB%8F%84%ED%98%B8%ED%85%94_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%8F%AC%EB%8F%84%ED%98%B8%ED%85%94_1.jpg', @bucket_name, 9216, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '포도호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '포도호텔_2.jpg', 'images/stays/motel/%ED%8F%AC%EB%8F%84%ED%98%B8%ED%85%94_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%8F%AC%EB%8F%84%ED%98%B8%ED%85%94_2.jpg', @bucket_name, 9011, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '포도호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '포도호텔_3.jpg', 'images/stays/motel/%ED%8F%AC%EB%8F%84%ED%98%B8%ED%85%94_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%8F%AC%EB%8F%84%ED%98%B8%ED%85%94_3.jpg', @bucket_name, 4915, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '포도호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '포도호텔_4.jpg', 'images/stays/motel/%ED%8F%AC%EB%8F%84%ED%98%B8%ED%85%94_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%8F%AC%EB%8F%84%ED%98%B8%ED%85%94_4.jpg', @bucket_name, 7372, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '포도호텔' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '포도호텔_5.jpg', 'images/stays/motel/%ED%8F%AC%EB%8F%84%ED%98%B8%ED%85%94_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%8F%AC%EB%8F%84%ED%98%B8%ED%85%94_5.jpg', @bucket_name, 7372, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '포도호텔' LIMIT 1;

-- 호텔제이엠(HotelJM)
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔제이엠(HotelJM)_1.jpg', 'images/stays/motel/%ED%98%B8%ED%85%94%EC%A0%9C%EC%9D%B4%EC%97%A0(HotelJM)_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%98%B8%ED%85%94%EC%A0%9C%EC%9D%B4%EC%97%A0(HotelJM)_1.jpg', @bucket_name, 6348, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔제이엠(HotelJM)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔제이엠(HotelJM)_2.jpg', 'images/stays/motel/%ED%98%B8%ED%85%94%EC%A0%9C%EC%9D%B4%EC%97%A0(HotelJM)_2.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%98%B8%ED%85%94%EC%A0%9C%EC%9D%B4%EC%97%A0(HotelJM)_2.jpg', @bucket_name, 10240, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔제이엠(HotelJM)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔제이엠(HotelJM)_3.jpg', 'images/stays/motel/%ED%98%B8%ED%85%94%EC%A0%9C%EC%9D%B4%EC%97%A0(HotelJM)_3.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%98%B8%ED%85%94%EC%A0%9C%EC%9D%B4%EC%97%A0(HotelJM)_3.jpg', @bucket_name, 5632, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔제이엠(HotelJM)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔제이엠(HotelJM)_4.jpg', 'images/stays/motel/%ED%98%B8%ED%85%94%EC%A0%9C%EC%9D%B4%EC%97%A0(HotelJM)_4.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%98%B8%ED%85%94%EC%A0%9C%EC%9D%B4%EC%97%A0(HotelJM)_4.jpg', @bucket_name, 8192, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔제이엠(HotelJM)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '호텔제이엠(HotelJM)_5.jpg', 'images/stays/motel/%ED%98%B8%ED%85%94%EC%A0%9C%EC%9D%B4%EC%97%A0(HotelJM)_5.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/motel/%ED%98%B8%ED%85%94%EC%A0%9C%EC%9D%B4%EC%97%A0(HotelJM)_5.jpg', @bucket_name, 11264, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '호텔제이엠(HotelJM)' LIMIT 1;