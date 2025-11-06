
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '가름게스트하우스_1_공공3유형.JPG', 'images/stays/pension/%EA%B0%80%EB%A6%84%EA%B2%8C%EC%8A%A4%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B0%80%EB%A6%84%EA%B2%8C%EC%8A%A4%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '가름게스트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '가름게스트하우스_2_공공3유형.jpg', 'images/stays/pension/%EA%B0%80%EB%A6%84%EA%B2%8C%EC%8A%A4%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B0%80%EB%A6%84%EA%B2%8C%EC%8A%A4%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '가름게스트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '가름게스트하우스_3_공공3유형.jpg', 'images/stays/pension/%EA%B0%80%EB%A6%84%EA%B2%8C%EC%8A%A4%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B0%80%EB%A6%84%EA%B2%8C%EC%8A%A4%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '가름게스트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '가름게스트하우스_4_공공3유형.jpg', 'images/stays/pension/%EA%B0%80%EB%A6%84%EA%B2%8C%EC%8A%A4%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B0%80%EB%A6%84%EA%B2%8C%EC%8A%A4%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '가름게스트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '가름게스트하우스_5_공공3유형.jpg', 'images/stays/pension/%EA%B0%80%EB%A6%84%EA%B2%8C%EC%8A%A4%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B0%80%EB%A6%84%EA%B2%8C%EC%8A%A4%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '가름게스트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '가름게스트하우스_6_공공3유형.JPG', 'images/stays/pension/%EA%B0%80%EB%A6%84%EA%B2%8C%EC%8A%A4%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B0%80%EB%A6%84%EA%B2%8C%EC%8A%A4%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '가름게스트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '관음사가는길펜션_1_공공3유형.JPG', 'images/stays/pension/%EA%B4%80%EC%9D%8C%EC%82%AC%EA%B0%80%EB%8A%94%EA%B8%B8%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B4%80%EC%9D%8C%EC%82%AC%EA%B0%80%EB%8A%94%EA%B8%B8%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '관음사가는길펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '관음사가는길펜션_2_공공3유형.JPG', 'images/stays/pension/%EA%B4%80%EC%9D%8C%EC%82%AC%EA%B0%80%EB%8A%94%EA%B8%B8%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B4%80%EC%9D%8C%EC%82%AC%EA%B0%80%EB%8A%94%EA%B8%B8%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '관음사가는길펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '귤익는마을_1_공공3유형.jpg', 'images/stays/pension/%EA%B7%A4%EC%9D%B5%EB%8A%94%EB%A7%88%EC%9D%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%A4%EC%9D%B5%EB%8A%94%EB%A7%88%EC%9D%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '귤익는마을' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '귤익는마을_2_공공3유형.jpg', 'images/stays/pension/%EA%B7%A4%EC%9D%B5%EB%8A%94%EB%A7%88%EC%9D%84_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%A4%EC%9D%B5%EB%8A%94%EB%A7%88%EC%9D%84_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '귤익는마을' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '귤익는마을_3_공공3유형.jpg', 'images/stays/pension/%EA%B7%A4%EC%9D%B5%EB%8A%94%EB%A7%88%EC%9D%84_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%A4%EC%9D%B5%EB%8A%94%EB%A7%88%EC%9D%84_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '귤익는마을' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '귤익는마을_4_공공3유형.jpg', 'images/stays/pension/%EA%B7%A4%EC%9D%B5%EB%8A%94%EB%A7%88%EC%9D%84_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%A4%EC%9D%B5%EB%8A%94%EB%A7%88%EC%9D%84_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '귤익는마을' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '귤익는마을_5_공공3유형.jpg', 'images/stays/pension/%EA%B7%A4%EC%9D%B5%EB%8A%94%EB%A7%88%EC%9D%84_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%A4%EC%9D%B5%EB%8A%94%EB%A7%88%EC%9D%84_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '귤익는마을' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그린사이드_1_공공3유형.jpg', 'images/stays/pension/%EA%B7%B8%EB%A6%B0%EC%82%AC%EC%9D%B4%EB%93%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%B8%EB%A6%B0%EC%82%AC%EC%9D%B4%EB%93%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '그린사이드' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그린사이드_2_공공3유형.jpg', 'images/stays/pension/%EA%B7%B8%EB%A6%B0%EC%82%AC%EC%9D%B4%EB%93%9C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%B8%EB%A6%B0%EC%82%AC%EC%9D%B4%EB%93%9C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그린사이드' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그린사이드_3_공공3유형.jpg', 'images/stays/pension/%EA%B7%B8%EB%A6%B0%EC%82%AC%EC%9D%B4%EB%93%9C_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%B8%EB%A6%B0%EC%82%AC%EC%9D%B4%EB%93%9C_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그린사이드' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그린사이드_4_공공3유형.jpg', 'images/stays/pension/%EA%B7%B8%EB%A6%B0%EC%82%AC%EC%9D%B4%EB%93%9C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%B8%EB%A6%B0%EC%82%AC%EC%9D%B4%EB%93%9C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그린사이드' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그린사이드_5_공공3유형.jpg', 'images/stays/pension/%EA%B7%B8%EB%A6%B0%EC%82%AC%EC%9D%B4%EB%93%9C_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%B8%EB%A6%B0%EC%82%AC%EC%9D%B4%EB%93%9C_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그린사이드' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그린사이드_6_공공3유형.jpg', 'images/stays/pension/%EA%B7%B8%EB%A6%B0%EC%82%AC%EC%9D%B4%EB%93%9C_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%B8%EB%A6%B0%EC%82%AC%EC%9D%B4%EB%93%9C_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그린사이드' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그린사이드_7_공공3유형.jpg', 'images/stays/pension/%EA%B7%B8%EB%A6%B0%EC%82%AC%EC%9D%B4%EB%93%9C_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%B8%EB%A6%B0%EC%82%AC%EC%9D%B4%EB%93%9C_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그린사이드' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그림리조트_1_공공3유형.jpg', 'images/stays/pension/%EA%B7%B8%EB%A6%BC%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%B8%EB%A6%BC%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '그림리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그림리조트_2_공공3유형.jpg', 'images/stays/pension/%EA%B7%B8%EB%A6%BC%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%B8%EB%A6%BC%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그림리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그림리조트_3_공공3유형.jpg', 'images/stays/pension/%EA%B7%B8%EB%A6%BC%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%B8%EB%A6%BC%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그림리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그림리조트_4_공공3유형.jpg', 'images/stays/pension/%EA%B7%B8%EB%A6%BC%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%B8%EB%A6%BC%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그림리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '그림리조트_5_공공3유형.jpg', 'images/stays/pension/%EA%B7%B8%EB%A6%BC%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%B8%EB%A6%BC%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '그림리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '까델아스 리조트_1_공공3유형.jpg', 'images/stays/pension/%EA%B9%8C%EB%8D%B8%EC%95%84%EC%8A%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B9%8C%EB%8D%B8%EC%95%84%EC%8A%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '까델아스 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '까델아스 리조트_2_공공3유형.jpg', 'images/stays/pension/%EA%B9%8C%EB%8D%B8%EC%95%84%EC%8A%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B9%8C%EB%8D%B8%EC%95%84%EC%8A%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '까델아스 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '까델아스 리조트_3_공공3유형.jpg', 'images/stays/pension/%EA%B9%8C%EB%8D%B8%EC%95%84%EC%8A%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B9%8C%EB%8D%B8%EC%95%84%EC%8A%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '까델아스 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '까델아스 리조트_4_공공3유형.jpg', 'images/stays/pension/%EA%B9%8C%EB%8D%B8%EC%95%84%EC%8A%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B9%8C%EB%8D%B8%EC%95%84%EC%8A%A4%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '까델아스 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '꿈꾸는 노마드_1_공공3유형.jpg', 'images/stays/pension/%EA%BF%88%EA%BE%B8%EB%8A%94%20%EB%85%B8%EB%A7%88%EB%93%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%BF%88%EA%BE%B8%EB%8A%94%20%EB%85%B8%EB%A7%88%EB%93%9C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '꿈꾸는 노마드' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '꿈꾸는 노마드_2_공공3유형.jpg', 'images/stays/pension/%EA%BF%88%EA%BE%B8%EB%8A%94%20%EB%85%B8%EB%A7%88%EB%93%9C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%BF%88%EA%BE%B8%EB%8A%94%20%EB%85%B8%EB%A7%88%EB%93%9C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '꿈꾸는 노마드' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '꿈꾸는 노마드_3_공공3유형.jpg', 'images/stays/pension/%EA%BF%88%EA%BE%B8%EB%8A%94%20%EB%85%B8%EB%A7%88%EB%93%9C_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%BF%88%EA%BE%B8%EB%8A%94%20%EB%85%B8%EB%A7%88%EB%93%9C_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '꿈꾸는 노마드' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '꿈꾸는 노마드_4_공공3유형.jpg', 'images/stays/pension/%EA%BF%88%EA%BE%B8%EB%8A%94%20%EB%85%B8%EB%A7%88%EB%93%9C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%BF%88%EA%BE%B8%EB%8A%94%20%EB%85%B8%EB%A7%88%EB%93%9C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '꿈꾸는 노마드' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '끄라비 펜션_1_공공3유형.jpg', 'images/stays/pension/%EB%81%84%EB%9D%BC%EB%B9%84%20%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%81%84%EB%9D%BC%EB%B9%84%20%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '끄라비 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '끄라비 펜션_2_공공3유형.jpg', 'images/stays/pension/%EB%81%84%EB%9D%BC%EB%B9%84%20%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%81%84%EB%9D%BC%EB%B9%84%20%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '끄라비 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '끄라비 펜션_3_공공3유형.jpg', 'images/stays/pension/%EB%81%84%EB%9D%BC%EB%B9%84%20%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%81%84%EB%9D%BC%EB%B9%84%20%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '끄라비 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '끄라비 펜션_4_공공3유형.jpg', 'images/stays/pension/%EB%81%84%EB%9D%BC%EB%B9%84%20%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%81%84%EB%9D%BC%EB%B9%84%20%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '끄라비 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나.미.송_1_공공3유형.jpg', 'images/stays/pension/%EB%82%98.%EB%AF%B8.%EC%86%A1_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%82%98.%EB%AF%B8.%EC%86%A1_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '나.미.송' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나.미.송_2_공공3유형.jpg', 'images/stays/pension/%EB%82%98.%EB%AF%B8.%EC%86%A1_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%82%98.%EB%AF%B8.%EC%86%A1_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나.미.송' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나.미.송_3_공공3유형.jpg', 'images/stays/pension/%EB%82%98.%EB%AF%B8.%EC%86%A1_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%82%98.%EB%AF%B8.%EC%86%A1_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나.미.송' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나.미.송_4_공공3유형.jpg', 'images/stays/pension/%EB%82%98.%EB%AF%B8.%EC%86%A1_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%82%98.%EB%AF%B8.%EC%86%A1_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나.미.송' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나.미.송_5_공공3유형.jpg', 'images/stays/pension/%EB%82%98.%EB%AF%B8.%EC%86%A1_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%82%98.%EB%AF%B8.%EC%86%A1_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나.미.송' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나.미.송_6_공공3유형.jpg', 'images/stays/pension/%EB%82%98.%EB%AF%B8.%EC%86%A1_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%82%98.%EB%AF%B8.%EC%86%A1_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나.미.송' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '나.미.송_7_공공3유형.jpg', 'images/stays/pension/%EB%82%98.%EB%AF%B8.%EC%86%A1_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%82%98.%EB%AF%B8.%EC%86%A1_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '나.미.송' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '다인리조트_1_공공3유형.jpg', 'images/stays/pension/%EB%8B%A4%EC%9D%B8%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8B%A4%EC%9D%B8%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '다인리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '다인리조트_2_공공3유형.jpg', 'images/stays/pension/%EB%8B%A4%EC%9D%B8%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8B%A4%EC%9D%B8%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '다인리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '다인리조트_3_공공3유형.jpg', 'images/stays/pension/%EB%8B%A4%EC%9D%B8%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8B%A4%EC%9D%B8%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '다인리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '다인리조트_4_공공3유형.jpg', 'images/stays/pension/%EB%8B%A4%EC%9D%B8%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8B%A4%EC%9D%B8%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '다인리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '다인리조트_5_공공3유형.jpg', 'images/stays/pension/%EB%8B%A4%EC%9D%B8%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8B%A4%EC%9D%B8%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '다인리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '다인리조트_6_공공3유형.jpg', 'images/stays/pension/%EB%8B%A4%EC%9D%B8%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8B%A4%EC%9D%B8%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '다인리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '다인리조트_7_공공3유형.jpg', 'images/stays/pension/%EB%8B%A4%EC%9D%B8%EB%A6%AC%EC%A1%B0%ED%8A%B8_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8B%A4%EC%9D%B8%EB%A6%AC%EC%A1%B0%ED%8A%B8_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '다인리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담앤루리조트_1_공공3유형.jpg', 'images/stays/pension/%EB%8B%B4%EC%95%A4%EB%A3%A8%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8B%B4%EC%95%A4%EB%A3%A8%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '담앤루리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담앤루리조트_2_공공3유형.jpg', 'images/stays/pension/%EB%8B%B4%EC%95%A4%EB%A3%A8%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8B%B4%EC%95%A4%EB%A3%A8%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '담앤루리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담앤루리조트_3_공공3유형.jpg', 'images/stays/pension/%EB%8B%B4%EC%95%A4%EB%A3%A8%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8B%B4%EC%95%A4%EB%A3%A8%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '담앤루리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담앤루리조트_4_공공3유형.jpg', 'images/stays/pension/%EB%8B%B4%EC%95%A4%EB%A3%A8%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8B%B4%EC%95%A4%EB%A3%A8%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '담앤루리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담앤루리조트_5_공공3유형.jpg', 'images/stays/pension/%EB%8B%B4%EC%95%A4%EB%A3%A8%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8B%B4%EC%95%A4%EB%A3%A8%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '담앤루리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '담앤루리조트_6_공공3유형.jpg', 'images/stays/pension/%EB%8B%B4%EC%95%A4%EB%A3%A8%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8B%B4%EC%95%A4%EB%A3%A8%EB%A6%AC%EC%A1%B0%ED%8A%B8_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '담앤루리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더쉼팡스파앤풀빌라_1_공공3유형.jpg', 'images/stays/pension/%EB%8D%94%EC%89%BC%ED%8C%A1%EC%8A%A4%ED%8C%8C%EC%95%A4%ED%92%80%EB%B9%8C%EB%9D%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8D%94%EC%89%BC%ED%8C%A1%EC%8A%A4%ED%8C%8C%EC%95%A4%ED%92%80%EB%B9%8C%EB%9D%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '더쉼팡스파앤풀빌라' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더쉼팡스파앤풀빌라_2_공공3유형.jpg', 'images/stays/pension/%EB%8D%94%EC%89%BC%ED%8C%A1%EC%8A%A4%ED%8C%8C%EC%95%A4%ED%92%80%EB%B9%8C%EB%9D%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8D%94%EC%89%BC%ED%8C%A1%EC%8A%A4%ED%8C%8C%EC%95%A4%ED%92%80%EB%B9%8C%EB%9D%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '더쉼팡스파앤풀빌라' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더쉼팡스파앤풀빌라_3_공공3유형.jpg', 'images/stays/pension/%EB%8D%94%EC%89%BC%ED%8C%A1%EC%8A%A4%ED%8C%8C%EC%95%A4%ED%92%80%EB%B9%8C%EB%9D%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8D%94%EC%89%BC%ED%8C%A1%EC%8A%A4%ED%8C%8C%EC%95%A4%ED%92%80%EB%B9%8C%EB%9D%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '더쉼팡스파앤풀빌라' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더쉼팡스파앤풀빌라_4_공공3유형.jpg', 'images/stays/pension/%EB%8D%94%EC%89%BC%ED%8C%A1%EC%8A%A4%ED%8C%8C%EC%95%A4%ED%92%80%EB%B9%8C%EB%9D%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8D%94%EC%89%BC%ED%8C%A1%EC%8A%A4%ED%8C%8C%EC%95%A4%ED%92%80%EB%B9%8C%EB%9D%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '더쉼팡스파앤풀빌라' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더쉼팡스파앤풀빌라_5_공공3유형.jpg', 'images/stays/pension/%EB%8D%94%EC%89%BC%ED%8C%A1%EC%8A%A4%ED%8C%8C%EC%95%A4%ED%92%80%EB%B9%8C%EB%9D%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8D%94%EC%89%BC%ED%8C%A1%EC%8A%A4%ED%8C%8C%EC%95%A4%ED%92%80%EB%B9%8C%EB%9D%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '더쉼팡스파앤풀빌라' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '동박생이_1_공공3유형.JPG', 'images/stays/pension/%EB%8F%99%EB%B0%95%EC%83%9D%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8F%99%EB%B0%95%EC%83%9D%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '동박생이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '동박생이_2_공공3유형.jpg', 'images/stays/pension/%EB%8F%99%EB%B0%95%EC%83%9D%EC%9D%B4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8F%99%EB%B0%95%EC%83%9D%EC%9D%B4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '동박생이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '동박생이_3_공공3유형.jpg', 'images/stays/pension/%EB%8F%99%EB%B0%95%EC%83%9D%EC%9D%B4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8F%99%EB%B0%95%EC%83%9D%EC%9D%B4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '동박생이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '라운지하우스 제주다_1_공공3유형.jpg', 'images/stays/pension/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%20%EC%A0%9C%EC%A3%BC%EB%8B%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%20%EC%A0%9C%EC%A3%BC%EB%8B%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '라운지하우스 제주다' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '라운지하우스 제주다_2_공공3유형.jpg', 'images/stays/pension/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%20%EC%A0%9C%EC%A3%BC%EB%8B%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%20%EC%A0%9C%EC%A3%BC%EB%8B%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '라운지하우스 제주다' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '라운지하우스 제주다_3_공공3유형.jpg', 'images/stays/pension/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%20%EC%A0%9C%EC%A3%BC%EB%8B%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%20%EC%A0%9C%EC%A3%BC%EB%8B%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '라운지하우스 제주다' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '라운지하우스 제주다_4_공공3유형.jpg', 'images/stays/pension/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%20%EC%A0%9C%EC%A3%BC%EB%8B%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%20%EC%A0%9C%EC%A3%BC%EB%8B%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '라운지하우스 제주다' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '라운지하우스 제주다_5_공공3유형.jpg', 'images/stays/pension/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%20%EC%A0%9C%EC%A3%BC%EB%8B%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%9D%BC%EC%9A%B4%EC%A7%80%ED%95%98%EC%9A%B0%EC%8A%A4%20%EC%A0%9C%EC%A3%BC%EB%8B%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '라운지하우스 제주다' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '롱비치펜션_1_공공3유형.jpg', 'images/stays/pension/%EB%A1%B1%EB%B9%84%EC%B9%98%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%A1%B1%EB%B9%84%EC%B9%98%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '롱비치펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '물결그림_1_공공3유형.jpg', 'images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '물결그림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '물결그림_10_공공3유형.jpg', 'images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '물결그림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '물결그림_11_공공3유형.jpg', 'images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '물결그림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '물결그림_12_공공3유형.jpg', 'images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '물결그림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '물결그림_13_공공3유형.jpg', 'images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 13, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '물결그림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '물결그림_14_공공3유형.jpg', 'images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 14, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '물결그림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '물결그림_2_공공3유형.jpg', 'images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '물결그림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '물결그림_3_공공3유형.jpg', 'images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '물결그림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '물결그림_4_공공3유형.jpg', 'images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '물결그림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '물결그림_5_공공3유형.jpg', 'images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '물결그림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '물결그림_6_공공3유형.jpg', 'images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '물결그림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '물결그림_7_공공3유형.jpg', 'images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '물결그림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '물결그림_8_공공3유형.jpg', 'images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '물결그림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '물결그림_9_공공3유형.jpg', 'images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%AC%BC%EA%B2%B0%EA%B7%B8%EB%A6%BC_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '물결그림' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '밀레니엄빌_1_공공3유형.jpg', 'images/stays/pension/%EB%B0%80%EB%A0%88%EB%8B%88%EC%97%84%EB%B9%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%80%EB%A0%88%EB%8B%88%EC%97%84%EB%B9%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '밀레니엄빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '밀레니엄빌_2_공공3유형.jpg', 'images/stays/pension/%EB%B0%80%EB%A0%88%EB%8B%88%EC%97%84%EB%B9%8C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%80%EB%A0%88%EB%8B%88%EC%97%84%EB%B9%8C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '밀레니엄빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '밀레니엄빌_3_공공3유형.jpg', 'images/stays/pension/%EB%B0%80%EB%A0%88%EB%8B%88%EC%97%84%EB%B9%8C_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%80%EB%A0%88%EB%8B%88%EC%97%84%EB%B9%8C_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '밀레니엄빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '밀레니엄빌_4_공공3유형.jpg', 'images/stays/pension/%EB%B0%80%EB%A0%88%EB%8B%88%EC%97%84%EB%B9%8C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%80%EB%A0%88%EB%8B%88%EC%97%84%EB%B9%8C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '밀레니엄빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '밀레니엄빌_5_공공3유형.jpg', 'images/stays/pension/%EB%B0%80%EB%A0%88%EB%8B%88%EC%97%84%EB%B9%8C_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%80%EB%A0%88%EB%8B%88%EC%97%84%EB%B9%8C_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '밀레니엄빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다에누워 펜션_1_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다에누워 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다에누워 펜션_10_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다에누워 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다에누워 펜션_11_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다에누워 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다에누워 펜션_12_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다에누워 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다에누워 펜션_2_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다에누워 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다에누워 펜션_3_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다에누워 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다에누워 펜션_4_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다에누워 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다에누워 펜션_5_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다에누워 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다에누워 펜션_6_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다에누워 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다에누워 펜션_7_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다에누워 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다에누워 펜션_8_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다에누워 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다에누워 펜션_9_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%EC%97%90%EB%88%84%EC%9B%8C%20%ED%8E%9C%EC%85%98_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다에누워 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다하우스_1_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다하우스_10_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다하우스_11_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다하우스_12_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다하우스_2_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다하우스_3_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다하우스_4_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다하우스_5_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다하우스_6_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다하우스_7_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다하우스_8_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '바다하우스_9_공공3유형.jpg', 'images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%94%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '바다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_1_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_10_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_11_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_12_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_13_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 13, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_14_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 14, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_15_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_15_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 15, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_16_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_16_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_16_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 16, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_17_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_17_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_17_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 17, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_18_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_18_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_18_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 18, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_19_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_19_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_19_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 19, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_2_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_20_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_20_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_20_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 20, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_3_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_4_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_5_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_6_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_7_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_8_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '발트하우스_9_공공3유형.jpg', 'images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B0%9C%ED%8A%B8%ED%95%98%EC%9A%B0%EC%8A%A4_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '발트하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '보물섬펜션_1_공공3유형.jpg', 'images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '보물섬펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '보물섬펜션_2_공공3유형.jpg', 'images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '보물섬펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '보물섬펜션_3_공공3유형.jpg', 'images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '보물섬펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '보물섬펜션_4_공공3유형.jpg', 'images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '보물섬펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '보물섬펜션_5_공공3유형.jpg', 'images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '보물섬펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '보물섬펜션_6_공공3유형.jpg', 'images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '보물섬펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '보물섬펜션_7_공공3유형.jpg', 'images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '보물섬펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '보물섬펜션_8_공공3유형.jpg', 'images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '보물섬펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '보물섬펜션_9_공공3유형.jpg', 'images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B3%B4%EB%AC%BC%EC%84%AC%ED%8E%9C%EC%85%98_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '보물섬펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '뷰티풀하우스_1_공공3유형.jpg', 'images/stays/pension/%EB%B7%B0%ED%8B%B0%ED%92%80%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B7%B0%ED%8B%B0%ED%92%80%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '뷰티풀하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '뷰티풀하우스_2_공공3유형.jpg', 'images/stays/pension/%EB%B7%B0%ED%8B%B0%ED%92%80%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B7%B0%ED%8B%B0%ED%92%80%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '뷰티풀하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '뷰티풀하우스_3_공공3유형.jpg', 'images/stays/pension/%EB%B7%B0%ED%8B%B0%ED%92%80%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%B7%B0%ED%8B%B0%ED%92%80%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '뷰티풀하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '산들애풀하우스_1_공공3유형.jpg', 'images/stays/pension/%EC%82%B0%EB%93%A4%EC%95%A0%ED%92%80%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%82%B0%EB%93%A4%EC%95%A0%ED%92%80%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '산들애풀하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '산들애풀하우스_2_공공3유형.jpg', 'images/stays/pension/%EC%82%B0%EB%93%A4%EC%95%A0%ED%92%80%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%82%B0%EB%93%A4%EC%95%A0%ED%92%80%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '산들애풀하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '산들애풀하우스_3_공공3유형.jpg', 'images/stays/pension/%EC%82%B0%EB%93%A4%EC%95%A0%ED%92%80%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%82%B0%EB%93%A4%EC%95%A0%ED%92%80%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '산들애풀하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '샘모루펜션_1_공공3유형.JPG', 'images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '샘모루펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '샘모루펜션_2_공공3유형.JPG', 'images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '샘모루펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '샘모루펜션_3_공공3유형.jpg', 'images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '샘모루펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '샘모루펜션_4_공공3유형.JPG', 'images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '샘모루펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '샘모루펜션_5_공공3유형.JPG', 'images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '샘모루펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '샘모루펜션_6_공공3유형.JPG', 'images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '샘모루펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '샘모루펜션_7_공공3유형.jpg', 'images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '샘모루펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '샘모루펜션_8_공공3유형.JPG', 'images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%83%98%EB%AA%A8%EB%A3%A8%ED%8E%9C%EC%85%98_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '샘모루펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '샤뜰레 펜션_1_공공3유형.jpg', 'images/stays/pension/%EC%83%A4%EB%9C%B0%EB%A0%88%20%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%83%A4%EB%9C%B0%EB%A0%88%20%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '샤뜰레 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '샤뜰레 펜션_2_공공3유형.jpg', 'images/stays/pension/%EC%83%A4%EB%9C%B0%EB%A0%88%20%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%83%A4%EB%9C%B0%EB%A0%88%20%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '샤뜰레 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '샤뜰레 펜션_3_공공3유형.jpg', 'images/stays/pension/%EC%83%A4%EB%9C%B0%EB%A0%88%20%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%83%A4%EB%9C%B0%EB%A0%88%20%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '샤뜰레 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '샤뜰레 펜션_4_공공3유형.jpg', 'images/stays/pension/%EC%83%A4%EB%9C%B0%EB%A0%88%20%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%83%A4%EB%9C%B0%EB%A0%88%20%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '샤뜰레 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '샤뜰레 펜션_5_공공3유형.jpg', 'images/stays/pension/%EC%83%A4%EB%9C%B0%EB%A0%88%20%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%83%A4%EB%9C%B0%EB%A0%88%20%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '샤뜰레 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포 귤림성_1_공공3유형.jpg', 'images/stays/pension/%EC%84%9C%EA%B7%80%ED%8F%AC%20%EA%B7%A4%EB%A6%BC%EC%84%B1_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%84%9C%EA%B7%80%ED%8F%AC%20%EA%B7%A4%EB%A6%BC%EC%84%B1_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '서귀포 귤림성' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포 귤림성_2_공공3유형.jpg', 'images/stays/pension/%EC%84%9C%EA%B7%80%ED%8F%AC%20%EA%B7%A4%EB%A6%BC%EC%84%B1_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%84%9C%EA%B7%80%ED%8F%AC%20%EA%B7%A4%EB%A6%BC%EC%84%B1_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '서귀포 귤림성' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포 귤림성_3_공공3유형.jpg', 'images/stays/pension/%EC%84%9C%EA%B7%80%ED%8F%AC%20%EA%B7%A4%EB%A6%BC%EC%84%B1_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%84%9C%EA%B7%80%ED%8F%AC%20%EA%B7%A4%EB%A6%BC%EC%84%B1_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '서귀포 귤림성' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포 귤림성_4_공공3유형.jpg', 'images/stays/pension/%EC%84%9C%EA%B7%80%ED%8F%AC%20%EA%B7%A4%EB%A6%BC%EC%84%B1_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%84%9C%EA%B7%80%ED%8F%AC%20%EA%B7%A4%EB%A6%BC%EC%84%B1_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '서귀포 귤림성' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '서귀포 귤림성_5_공공3유형.jpg', 'images/stays/pension/%EC%84%9C%EA%B7%80%ED%8F%AC%20%EA%B7%A4%EB%A6%BC%EC%84%B1_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%84%9C%EA%B7%80%ED%8F%AC%20%EA%B7%A4%EB%A6%BC%EC%84%B1_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '서귀포 귤림성' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '선셋티아_1_공공3유형.jpg', 'images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '선셋티아' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '선셋티아_10_공공3유형.jpg', 'images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '선셋티아' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '선셋티아_2_공공3유형.jpg', 'images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '선셋티아' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '선셋티아_3_공공3유형.jpg', 'images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '선셋티아' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '선셋티아_4_공공3유형.jpg', 'images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '선셋티아' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '선셋티아_5_공공3유형.jpg', 'images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '선셋티아' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '선셋티아_6_공공3유형.jpg', 'images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '선셋티아' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '선셋티아_7_공공3유형.jpg', 'images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '선셋티아' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '선셋티아_8_공공3유형.jpg', 'images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '선셋티아' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '선셋티아_9_공공3유형.jpg', 'images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%84%A0%EC%85%8B%ED%8B%B0%EC%95%84_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '선셋티아' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '스테리나잇 제주_1_공공3유형.jpg', 'images/stays/pension/%EC%8A%A4%ED%85%8C%EB%A6%AC%EB%82%98%EC%9E%87%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%8A%A4%ED%85%8C%EB%A6%AC%EB%82%98%EC%9E%87%20%EC%A0%9C%EC%A3%BC_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '스테리나잇 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '스테리나잇 제주_2_공공3유형.jpg', 'images/stays/pension/%EC%8A%A4%ED%85%8C%EB%A6%AC%EB%82%98%EC%9E%87%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%8A%A4%ED%85%8C%EB%A6%AC%EB%82%98%EC%9E%87%20%EC%A0%9C%EC%A3%BC_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '스테리나잇 제주' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '스프링힐 리조트_1_공공3유형.jpg', 'images/stays/pension/%EC%8A%A4%ED%94%84%EB%A7%81%ED%9E%90%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%8A%A4%ED%94%84%EB%A7%81%ED%9E%90%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '스프링힐 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '스프링힐 리조트_2_공공3유형.jpg', 'images/stays/pension/%EC%8A%A4%ED%94%84%EB%A7%81%ED%9E%90%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%8A%A4%ED%94%84%EB%A7%81%ED%9E%90%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '스프링힐 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '스프링힐 리조트_3_공공3유형.jpg', 'images/stays/pension/%EC%8A%A4%ED%94%84%EB%A7%81%ED%9E%90%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%8A%A4%ED%94%84%EB%A7%81%ED%9E%90%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '스프링힐 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '스프링힐 리조트_4_공공3유형.jpg', 'images/stays/pension/%EC%8A%A4%ED%94%84%EB%A7%81%ED%9E%90%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%8A%A4%ED%94%84%EB%A7%81%ED%9E%90%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '스프링힐 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '스프링힐 리조트_5_공공3유형.jpg', 'images/stays/pension/%EC%8A%A4%ED%94%84%EB%A7%81%ED%9E%90%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%8A%A4%ED%94%84%EB%A7%81%ED%9E%90%20%EB%A6%AC%EC%A1%B0%ED%8A%B8_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '스프링힐 리조트' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '씨에나펜션_1_공공3유형.jpg', 'images/stays/pension/%EC%94%A8%EC%97%90%EB%82%98%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%94%A8%EC%97%90%EB%82%98%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '씨에나펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '씨에나펜션_2_공공3유형.jpg', 'images/stays/pension/%EC%94%A8%EC%97%90%EB%82%98%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%94%A8%EC%97%90%EB%82%98%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '씨에나펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '씨에나펜션_3_공공3유형.jpg', 'images/stays/pension/%EC%94%A8%EC%97%90%EB%82%98%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%94%A8%EC%97%90%EB%82%98%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '씨에나펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '씨에나펜션_4_공공3유형.jpg', 'images/stays/pension/%EC%94%A8%EC%97%90%EB%82%98%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%94%A8%EC%97%90%EB%82%98%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '씨에나펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '씨에나펜션_5_공공3유형.jpg', 'images/stays/pension/%EC%94%A8%EC%97%90%EB%82%98%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%94%A8%EC%97%90%EB%82%98%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '씨에나펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '아망뜨펜션(제주)_1_공공3유형.jpg', 'images/stays/pension/%EC%95%84%EB%A7%9D%EB%9C%A8%ED%8E%9C%EC%85%98%28%EC%A0%9C%EC%A3%BC%29_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%84%EB%A7%9D%EB%9C%A8%ED%8E%9C%EC%85%98%28%EC%A0%9C%EC%A3%BC%29_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '아망뜨펜션(제주)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '아망뜨펜션(제주)_2_공공3유형.jpg', 'images/stays/pension/%EC%95%84%EB%A7%9D%EB%9C%A8%ED%8E%9C%EC%85%98%28%EC%A0%9C%EC%A3%BC%29_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%84%EB%A7%9D%EB%9C%A8%ED%8E%9C%EC%85%98%28%EC%A0%9C%EC%A3%BC%29_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '아망뜨펜션(제주)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '아망뜨펜션(제주)_3_공공3유형.jpg', 'images/stays/pension/%EC%95%84%EB%A7%9D%EB%9C%A8%ED%8E%9C%EC%85%98%28%EC%A0%9C%EC%A3%BC%29_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%84%EB%A7%9D%EB%9C%A8%ED%8E%9C%EC%85%98%28%EC%A0%9C%EC%A3%BC%29_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '아망뜨펜션(제주)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '아망뜨펜션(제주)_4_공공3유형.jpg', 'images/stays/pension/%EC%95%84%EB%A7%9D%EB%9C%A8%ED%8E%9C%EC%85%98%28%EC%A0%9C%EC%A3%BC%29_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%84%EB%A7%9D%EB%9C%A8%ED%8E%9C%EC%85%98%28%EC%A0%9C%EC%A3%BC%29_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '아망뜨펜션(제주)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '아침의향기_1_공공3유형.jpg', 'images/stays/pension/%EC%95%84%EC%B9%A8%EC%9D%98%ED%96%A5%EA%B8%B0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%84%EC%B9%A8%EC%9D%98%ED%96%A5%EA%B8%B0_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '아침의향기' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '아침의향기_2_공공3유형.jpg', 'images/stays/pension/%EC%95%84%EC%B9%A8%EC%9D%98%ED%96%A5%EA%B8%B0_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%84%EC%B9%A8%EC%9D%98%ED%96%A5%EA%B8%B0_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '아침의향기' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '아침의향기_3_공공3유형.jpg', 'images/stays/pension/%EC%95%84%EC%B9%A8%EC%9D%98%ED%96%A5%EA%B8%B0_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%84%EC%B9%A8%EC%9D%98%ED%96%A5%EA%B8%B0_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '아침의향기' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '아침의향기_4_공공3유형.jpg', 'images/stays/pension/%EC%95%84%EC%B9%A8%EC%9D%98%ED%96%A5%EA%B8%B0_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%84%EC%B9%A8%EC%9D%98%ED%96%A5%EA%B8%B0_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '아침의향기' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '아침의향기_5_공공3유형.jpg', 'images/stays/pension/%EC%95%84%EC%B9%A8%EC%9D%98%ED%96%A5%EA%B8%B0_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%84%EC%B9%A8%EC%9D%98%ED%96%A5%EA%B8%B0_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '아침의향기' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '아침의향기_6_공공3유형.jpg', 'images/stays/pension/%EC%95%84%EC%B9%A8%EC%9D%98%ED%96%A5%EA%B8%B0_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%84%EC%B9%A8%EC%9D%98%ED%96%A5%EA%B8%B0_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '아침의향기' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '앙끄리에펜션_1_공공3유형.jpg', 'images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '앙끄리에펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '앙끄리에펜션_10_공공3유형.jpg', 'images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '앙끄리에펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '앙끄리에펜션_2_공공3유형.jpg', 'images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '앙끄리에펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '앙끄리에펜션_3_공공3유형.jpg', 'images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '앙끄리에펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '앙끄리에펜션_4_공공3유형.jpg', 'images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '앙끄리에펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '앙끄리에펜션_5_공공3유형.jpg', 'images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '앙끄리에펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '앙끄리에펜션_6_공공3유형.jpg', 'images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '앙끄리에펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '앙끄리에펜션_7_공공3유형.jpg', 'images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '앙끄리에펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '앙끄리에펜션_8_공공3유형.jpg', 'images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '앙끄리에펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '앙끄리에펜션_9_공공3유형.jpg', 'images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%99%EB%81%84%EB%A6%AC%EC%97%90%ED%8E%9C%EC%85%98_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '앙끄리에펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '애월해안누리(구 하얀둥지)_1_공공3유형.JPG', 'images/stays/pension/%EC%95%A0%EC%9B%94%ED%95%B4%EC%95%88%EB%88%84%EB%A6%AC%28%EA%B5%AC%20%ED%95%98%EC%96%80%EB%91%A5%EC%A7%80%29_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%A0%EC%9B%94%ED%95%B4%EC%95%88%EB%88%84%EB%A6%AC%28%EA%B5%AC%20%ED%95%98%EC%96%80%EB%91%A5%EC%A7%80%29_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '애월해안누리(구 하얀둥지)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '애월해안누리(구 하얀둥지)_2_공공3유형.jpg', 'images/stays/pension/%EC%95%A0%EC%9B%94%ED%95%B4%EC%95%88%EB%88%84%EB%A6%AC%28%EA%B5%AC%20%ED%95%98%EC%96%80%EB%91%A5%EC%A7%80%29_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%A0%EC%9B%94%ED%95%B4%EC%95%88%EB%88%84%EB%A6%AC%28%EA%B5%AC%20%ED%95%98%EC%96%80%EB%91%A5%EC%A7%80%29_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '애월해안누리(구 하얀둥지)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '애월해안누리(구 하얀둥지)_3_공공3유형.jpg', 'images/stays/pension/%EC%95%A0%EC%9B%94%ED%95%B4%EC%95%88%EB%88%84%EB%A6%AC%28%EA%B5%AC%20%ED%95%98%EC%96%80%EB%91%A5%EC%A7%80%29_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%A0%EC%9B%94%ED%95%B4%EC%95%88%EB%88%84%EB%A6%AC%28%EA%B5%AC%20%ED%95%98%EC%96%80%EB%91%A5%EC%A7%80%29_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '애월해안누리(구 하얀둥지)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '애월해안누리(구 하얀둥지)_4_공공3유형.jpg', 'images/stays/pension/%EC%95%A0%EC%9B%94%ED%95%B4%EC%95%88%EB%88%84%EB%A6%AC%28%EA%B5%AC%20%ED%95%98%EC%96%80%EB%91%A5%EC%A7%80%29_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%A0%EC%9B%94%ED%95%B4%EC%95%88%EB%88%84%EB%A6%AC%28%EA%B5%AC%20%ED%95%98%EC%96%80%EB%91%A5%EC%A7%80%29_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '애월해안누리(구 하얀둥지)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '애월해안누리(구 하얀둥지)_5_공공3유형.jpg', 'images/stays/pension/%EC%95%A0%EC%9B%94%ED%95%B4%EC%95%88%EB%88%84%EB%A6%AC%28%EA%B5%AC%20%ED%95%98%EC%96%80%EB%91%A5%EC%A7%80%29_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%95%A0%EC%9B%94%ED%95%B4%EC%95%88%EB%88%84%EB%A6%AC%28%EA%B5%AC%20%ED%95%98%EC%96%80%EB%91%A5%EC%A7%80%29_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '애월해안누리(구 하얀둥지)' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '예래펜션_1_공공3유형.jpg', 'images/stays/pension/%EC%98%88%EB%9E%98%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%98%88%EB%9E%98%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '예래펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '예래펜션_2_공공3유형.jpg', 'images/stays/pension/%EC%98%88%EB%9E%98%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%98%88%EB%9E%98%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '예래펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '예래펜션_3_공공3유형.jpg', 'images/stays/pension/%EC%98%88%EB%9E%98%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%98%88%EB%9E%98%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '예래펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '예래펜션_4_공공3유형.jpg', 'images/stays/pension/%EC%98%88%EB%9E%98%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%98%88%EB%9E%98%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '예래펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '예래펜션_5_공공3유형.jpg', 'images/stays/pension/%EC%98%88%EB%9E%98%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%98%88%EB%9E%98%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '예래펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '오션하우스_1_공공3유형.jpg', 'images/stays/pension/%EC%98%A4%EC%85%98%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%98%A4%EC%85%98%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '오션하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '오션하우스_2_공공3유형.jpg', 'images/stays/pension/%EC%98%A4%EC%85%98%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%98%A4%EC%85%98%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '오션하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '오션하우스_3_공공3유형.jpg', 'images/stays/pension/%EC%98%A4%EC%85%98%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%98%A4%EC%85%98%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '오션하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '오션하우스_4_공공3유형.jpg', 'images/stays/pension/%EC%98%A4%EC%85%98%ED%95%98%EC%9A%B0%EC%8A%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%98%A4%EC%85%98%ED%95%98%EC%9A%B0%EC%8A%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '오션하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '이어도성 펜션_1_공공3유형.jpg', 'images/stays/pension/%EC%9D%B4%EC%96%B4%EB%8F%84%EC%84%B1%20%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%9D%B4%EC%96%B4%EB%8F%84%EC%84%B1%20%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '이어도성 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '이어도성 펜션_2_공공3유형.jpg', 'images/stays/pension/%EC%9D%B4%EC%96%B4%EB%8F%84%EC%84%B1%20%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%9D%B4%EC%96%B4%EB%8F%84%EC%84%B1%20%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '이어도성 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '이어도성 펜션_3_공공3유형.jpg', 'images/stays/pension/%EC%9D%B4%EC%96%B4%EB%8F%84%EC%84%B1%20%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%9D%B4%EC%96%B4%EB%8F%84%EC%84%B1%20%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '이어도성 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '이어도성 펜션_4_공공3유형.jpg', 'images/stays/pension/%EC%9D%B4%EC%96%B4%EB%8F%84%EC%84%B1%20%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%9D%B4%EC%96%B4%EB%8F%84%EC%84%B1%20%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '이어도성 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '이어도성 펜션_5_공공3유형.jpg', 'images/stays/pension/%EC%9D%B4%EC%96%B4%EB%8F%84%EC%84%B1%20%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%9D%B4%EC%96%B4%EB%8F%84%EC%84%B1%20%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '이어도성 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 그랑빌펜션_1_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EA%B7%B8%EB%9E%91%EB%B9%8C%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EA%B7%B8%EB%9E%91%EB%B9%8C%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 그랑빌펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 그랑빌펜션_2_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EA%B7%B8%EB%9E%91%EB%B9%8C%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EA%B7%B8%EB%9E%91%EB%B9%8C%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 그랑빌펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 그랑빌펜션_3_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EA%B7%B8%EB%9E%91%EB%B9%8C%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EA%B7%B8%EB%9E%91%EB%B9%8C%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 그랑빌펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 그랑빌펜션_4_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EA%B7%B8%EB%9E%91%EB%B9%8C%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EA%B7%B8%EB%9E%91%EB%B9%8C%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 그랑빌펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 그랑빌펜션_5_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EA%B7%B8%EB%9E%91%EB%B9%8C%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EA%B7%B8%EB%9E%91%EB%B9%8C%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 그랑빌펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 그랑빌펜션_6_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EA%B7%B8%EB%9E%91%EB%B9%8C%ED%8E%9C%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EA%B7%B8%EB%9E%91%EB%B9%8C%ED%8E%9C%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 그랑빌펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 라임오렌지빌_1_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EB%9D%BC%EC%9E%84%EC%98%A4%EB%A0%8C%EC%A7%80%EB%B9%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EB%9D%BC%EC%9E%84%EC%98%A4%EB%A0%8C%EC%A7%80%EB%B9%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 라임오렌지빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 라임오렌지빌_2_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EB%9D%BC%EC%9E%84%EC%98%A4%EB%A0%8C%EC%A7%80%EB%B9%8C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EB%9D%BC%EC%9E%84%EC%98%A4%EB%A0%8C%EC%A7%80%EB%B9%8C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 라임오렌지빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 라임오렌지빌_3_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EB%9D%BC%EC%9E%84%EC%98%A4%EB%A0%8C%EC%A7%80%EB%B9%8C_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EB%9D%BC%EC%9E%84%EC%98%A4%EB%A0%8C%EC%A7%80%EB%B9%8C_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 라임오렌지빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 라임오렌지빌_4_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EB%9D%BC%EC%9E%84%EC%98%A4%EB%A0%8C%EC%A7%80%EB%B9%8C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EB%9D%BC%EC%9E%84%EC%98%A4%EB%A0%8C%EC%A7%80%EB%B9%8C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 라임오렌지빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 라임오렌지빌_5_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EB%9D%BC%EC%9E%84%EC%98%A4%EB%A0%8C%EC%A7%80%EB%B9%8C_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EB%9D%BC%EC%9E%84%EC%98%A4%EB%A0%8C%EC%A7%80%EB%B9%8C_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 라임오렌지빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 써니데이_1_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%8D%A8%EB%8B%88%EB%8D%B0%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%8D%A8%EB%8B%88%EB%8D%B0%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 써니데이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 써니데이_2_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%8D%A8%EB%8B%88%EB%8D%B0%EC%9D%B4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%8D%A8%EB%8B%88%EB%8D%B0%EC%9D%B4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 써니데이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 써니데이_3_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%8D%A8%EB%8B%88%EB%8D%B0%EC%9D%B4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%8D%A8%EB%8B%88%EB%8D%B0%EC%9D%B4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 써니데이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 써니데이_4_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%8D%A8%EB%8B%88%EB%8D%B0%EC%9D%B4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%8D%A8%EB%8B%88%EB%8D%B0%EC%9D%B4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 써니데이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 써니데이_5_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%8D%A8%EB%8B%88%EB%8D%B0%EC%9D%B4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%8D%A8%EB%8B%88%EB%8D%B0%EC%9D%B4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 써니데이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 써니데이_6_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%8D%A8%EB%8B%88%EB%8D%B0%EC%9D%B4_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%8D%A8%EB%8B%88%EB%8D%B0%EC%9D%B4_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 써니데이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 지삿개풍경_1_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%A7%80%EC%82%BF%EA%B0%9C%ED%92%8D%EA%B2%BD_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%A7%80%EC%82%BF%EA%B0%9C%ED%92%8D%EA%B2%BD_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 지삿개풍경' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 지삿개풍경_2_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%A7%80%EC%82%BF%EA%B0%9C%ED%92%8D%EA%B2%BD_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%A7%80%EC%82%BF%EA%B0%9C%ED%92%8D%EA%B2%BD_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 지삿개풍경' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 지삿개풍경_3_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%A7%80%EC%82%BF%EA%B0%9C%ED%92%8D%EA%B2%BD_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%A7%80%EC%82%BF%EA%B0%9C%ED%92%8D%EA%B2%BD_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 지삿개풍경' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 지삿개풍경_4_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%A7%80%EC%82%BF%EA%B0%9C%ED%92%8D%EA%B2%BD_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%A7%80%EC%82%BF%EA%B0%9C%ED%92%8D%EA%B2%BD_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 지삿개풍경' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 추억여행_1_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%B6%94%EC%96%B5%EC%97%AC%ED%96%89_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%B6%94%EC%96%B5%EC%97%AC%ED%96%89_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 추억여행' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 추억여행_2_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%B6%94%EC%96%B5%EC%97%AC%ED%96%89_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%B6%94%EC%96%B5%EC%97%AC%ED%96%89_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 추억여행' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 추억여행_3_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%B6%94%EC%96%B5%EC%97%AC%ED%96%89_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%B6%94%EC%96%B5%EC%97%AC%ED%96%89_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 추억여행' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 추억여행_4_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%B6%94%EC%96%B5%EC%97%AC%ED%96%89_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%B6%94%EC%96%B5%EC%97%AC%ED%96%89_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 추억여행' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 추억여행_5_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%B6%94%EC%96%B5%EC%97%AC%ED%96%89_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%EC%B6%94%EC%96%B5%EC%97%AC%ED%96%89_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 추억여행' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 하이랜드 펜션_1_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%ED%95%98%EC%9D%B4%EB%9E%9C%EB%93%9C%20%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%ED%95%98%EC%9D%B4%EB%9E%9C%EB%93%9C%20%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 하이랜드 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주 하이랜드 펜션_2_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%20%ED%95%98%EC%9D%B4%EB%9E%9C%EB%93%9C%20%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%20%ED%95%98%EC%9D%B4%EB%9E%9C%EB%93%9C%20%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주 하이랜드 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주마중_1_공공3유형.JPG', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%A7%88%EC%A4%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%A7%88%EC%A4%91_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주마중' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주마중_2_공공3유형.JPG', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%A7%88%EC%A4%91_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%A7%88%EC%A4%91_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주마중' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주마중_3_공공3유형.JPG', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%A7%88%EC%A4%91_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%A7%88%EC%A4%91_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주마중' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주마중_4_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%A7%88%EC%A4%91_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%A7%88%EC%A4%91_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주마중' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주마중_5_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%A7%88%EC%A4%91_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%A7%88%EC%A4%91_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주마중' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주목화휴양펜션_1_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%AA%A9%ED%99%94%ED%9C%B4%EC%96%91%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%AA%A9%ED%99%94%ED%9C%B4%EC%96%91%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주목화휴양펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주목화휴양펜션_2_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%AA%A9%ED%99%94%ED%9C%B4%EC%96%91%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%AA%A9%ED%99%94%ED%9C%B4%EC%96%91%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주목화휴양펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주목화휴양펜션_3_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%AA%A9%ED%99%94%ED%9C%B4%EC%96%91%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%AA%A9%ED%99%94%ED%9C%B4%EC%96%91%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주목화휴양펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주목화휴양펜션_4_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%AA%A9%ED%99%94%ED%9C%B4%EC%96%91%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%AA%A9%ED%99%94%ED%9C%B4%EC%96%91%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주목화휴양펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주목화휴양펜션_5_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%AA%A9%ED%99%94%ED%9C%B4%EC%96%91%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%AA%A9%ED%99%94%ED%9C%B4%EC%96%91%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주목화휴양펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주바다산책_1_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%A4%EC%82%B0%EC%B1%85_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%A4%EC%82%B0%EC%B1%85_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주바다산책' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주바다산책_2_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%A4%EC%82%B0%EC%B1%85_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%A4%EC%82%B0%EC%B1%85_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주바다산책' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주바다산책_3_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%A4%EC%82%B0%EC%B1%85_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%A4%EC%82%B0%EC%B1%85_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주바다산책' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주바다산책_4_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%A4%EC%82%B0%EC%B1%85_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%A4%EC%82%B0%EC%B1%85_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주바다산책' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주바다산책_5_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%A4%EC%82%B0%EC%B1%85_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%A4%EC%82%B0%EC%B1%85_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주바다산책' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주바다산책_6_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%A4%EC%82%B0%EC%B1%85_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%A4%EC%82%B0%EC%B1%85_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주바다산책' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주바다산책_7_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%A4%EC%82%B0%EC%B1%85_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EB%B0%94%EB%8B%A4%EC%82%B0%EC%B1%85_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주바다산책' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주썬레이크빌_1_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%8D%AC%EB%A0%88%EC%9D%B4%ED%81%AC%EB%B9%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%8D%AC%EB%A0%88%EC%9D%B4%ED%81%AC%EB%B9%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주썬레이크빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주썬레이크빌_2_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%8D%AC%EB%A0%88%EC%9D%B4%ED%81%AC%EB%B9%8C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%8D%AC%EB%A0%88%EC%9D%B4%ED%81%AC%EB%B9%8C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주썬레이크빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주썬레이크빌_3_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%8D%AC%EB%A0%88%EC%9D%B4%ED%81%AC%EB%B9%8C_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%8D%AC%EB%A0%88%EC%9D%B4%ED%81%AC%EB%B9%8C_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주썬레이크빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주썬레이크빌_4_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%8D%AC%EB%A0%88%EC%9D%B4%ED%81%AC%EB%B9%8C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%8D%AC%EB%A0%88%EC%9D%B4%ED%81%AC%EB%B9%8C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주썬레이크빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주썬레이크빌_5_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%8D%AC%EB%A0%88%EC%9D%B4%ED%81%AC%EB%B9%8C_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%8D%AC%EB%A0%88%EC%9D%B4%ED%81%AC%EB%B9%8C_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주썬레이크빌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주올레하우스_1_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주올레하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주올레하우스_10_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_10_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 10, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주올레하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주올레하우스_11_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_11_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 11, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주올레하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주올레하우스_12_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_12_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 12, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주올레하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주올레하우스_13_공공3유형.JPG', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_13_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 13, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주올레하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주올레하우스_14_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_14_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 14, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주올레하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주올레하우스_2_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주올레하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주올레하우스_3_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주올레하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주올레하우스_4_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주올레하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주올레하우스_5_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주올레하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주올레하우스_6_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주올레하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주올레하우스_7_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주올레하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주올레하우스_8_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주올레하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주올레하우스_9_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%98%AC%EB%A0%88%ED%95%98%EC%9A%B0%EC%8A%A4_9_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 9, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주올레하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주캐슬펜션_1_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%BA%90%EC%8A%AC%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%BA%90%EC%8A%AC%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주캐슬펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주캐슬펜션_2_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%BA%90%EC%8A%AC%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%BA%90%EC%8A%AC%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주캐슬펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주캐슬펜션_3_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%BA%90%EC%8A%AC%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%BA%90%EC%8A%AC%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주캐슬펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주캐슬펜션_4_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%BA%90%EC%8A%AC%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%BA%90%EC%8A%AC%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주캐슬펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주캐슬펜션_5_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%BA%90%EC%8A%AC%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%BA%90%EC%8A%AC%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주캐슬펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주캐슬펜션_6_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%BA%90%EC%8A%AC%ED%8E%9C%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%BA%90%EC%8A%AC%ED%8E%9C%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주캐슬펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주펜션 향림원_1_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%8E%9C%EC%85%98%20%ED%96%A5%EB%A6%BC%EC%9B%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%8E%9C%EC%85%98%20%ED%96%A5%EB%A6%BC%EC%9B%90_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주펜션 향림원' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주펜션 향림원_2_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%8E%9C%EC%85%98%20%ED%96%A5%EB%A6%BC%EC%9B%90_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%8E%9C%EC%85%98%20%ED%96%A5%EB%A6%BC%EC%9B%90_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주펜션 향림원' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주펜션 향림원_3_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%8E%9C%EC%85%98%20%ED%96%A5%EB%A6%BC%EC%9B%90_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%8E%9C%EC%85%98%20%ED%96%A5%EB%A6%BC%EC%9B%90_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주펜션 향림원' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주펜션 향림원_4_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%8E%9C%EC%85%98%20%ED%96%A5%EB%A6%BC%EC%9B%90_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%8E%9C%EC%85%98%20%ED%96%A5%EB%A6%BC%EC%9B%90_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주펜션 향림원' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주펜션 향림원_5_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%8E%9C%EC%85%98%20%ED%96%A5%EB%A6%BC%EC%9B%90_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%8E%9C%EC%85%98%20%ED%96%A5%EB%A6%BC%EC%9B%90_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주펜션 향림원' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주향_1_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%96%A5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%96%A5_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주향' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주향_2_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%96%A5_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%96%A5_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주향' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주향_3_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%96%A5_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%96%A5_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주향' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주향_4_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%96%A5_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%96%A5_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주향' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주향_5_공공3유형.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%96%A5_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%ED%96%A5_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주향' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '청재설헌_1_공공3유형.jpg', 'images/stays/pension/%EC%B2%AD%EC%9E%AC%EC%84%A4%ED%97%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%B2%AD%EC%9E%AC%EC%84%A4%ED%97%8C_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '청재설헌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '청재설헌_2_공공3유형.jpg', 'images/stays/pension/%EC%B2%AD%EC%9E%AC%EC%84%A4%ED%97%8C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%B2%AD%EC%9E%AC%EC%84%A4%ED%97%8C_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '청재설헌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '청재설헌_3_공공3유형.jpg', 'images/stays/pension/%EC%B2%AD%EC%9E%AC%EC%84%A4%ED%97%8C_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%B2%AD%EC%9E%AC%EC%84%A4%ED%97%8C_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '청재설헌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '청재설헌_4_공공3유형.jpg', 'images/stays/pension/%EC%B2%AD%EC%9E%AC%EC%84%A4%ED%97%8C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%B2%AD%EC%9E%AC%EC%84%A4%ED%97%8C_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '청재설헌' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카이로스_1_공공3유형.jpg', 'images/stays/pension/%EC%B9%B4%EC%9D%B4%EB%A1%9C%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%B9%B4%EC%9D%B4%EB%A1%9C%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '카이로스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카이로스_2_공공3유형.jpg', 'images/stays/pension/%EC%B9%B4%EC%9D%B4%EB%A1%9C%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%B9%B4%EC%9D%B4%EB%A1%9C%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '카이로스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카이로스_3_공공3유형.jpg', 'images/stays/pension/%EC%B9%B4%EC%9D%B4%EB%A1%9C%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%B9%B4%EC%9D%B4%EB%A1%9C%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '카이로스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카이로스_4_공공3유형.jpg', 'images/stays/pension/%EC%B9%B4%EC%9D%B4%EB%A1%9C%EC%8A%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%B9%B4%EC%9D%B4%EB%A1%9C%EC%8A%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '카이로스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카이로스_5_공공3유형.jpg', 'images/stays/pension/%EC%B9%B4%EC%9D%B4%EB%A1%9C%EC%8A%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%B9%B4%EC%9D%B4%EB%A1%9C%EC%8A%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '카이로스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '카이로스_6_공공3유형.jpg', 'images/stays/pension/%EC%B9%B4%EC%9D%B4%EB%A1%9C%EC%8A%A4_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%B9%B4%EC%9D%B4%EB%A1%9C%EC%8A%A4_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '카이로스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '쿠지홀리데이_1_공공3유형.jpg', 'images/stays/pension/%EC%BF%A0%EC%A7%80%ED%99%80%EB%A6%AC%EB%8D%B0%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%BF%A0%EC%A7%80%ED%99%80%EB%A6%AC%EB%8D%B0%EC%9D%B4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '쿠지홀리데이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '쿠지홀리데이_2_공공3유형.jpg', 'images/stays/pension/%EC%BF%A0%EC%A7%80%ED%99%80%EB%A6%AC%EB%8D%B0%EC%9D%B4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%BF%A0%EC%A7%80%ED%99%80%EB%A6%AC%EB%8D%B0%EC%9D%B4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '쿠지홀리데이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '쿠지홀리데이_3_공공3유형.jpg', 'images/stays/pension/%EC%BF%A0%EC%A7%80%ED%99%80%EB%A6%AC%EB%8D%B0%EC%9D%B4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%BF%A0%EC%A7%80%ED%99%80%EB%A6%AC%EB%8D%B0%EC%9D%B4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '쿠지홀리데이' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '티파니에서 아침을_1_공공3유형.jpg', 'images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '티파니에서 아침을' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '티파니에서 아침을_2_공공3유형.jpg', 'images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '티파니에서 아침을' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '티파니에서 아침을_3_공공3유형.jpg', 'images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '티파니에서 아침을' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '티파니에서 아침을_4_공공3유형.jpg', 'images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '티파니에서 아침을' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '티파니에서 아침을_5_공공3유형.jpg', 'images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '티파니에서 아침을' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '티파니에서 아침을_6_공공3유형.jpg', 'images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '티파니에서 아침을' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '티파니에서 아침을_7_공공3유형.jpg', 'images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '티파니에서 아침을' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '티파니에서 아침을_8_공공3유형.jpg', 'images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B0%ED%8C%8C%EB%8B%88%EC%97%90%EC%84%9C%20%EC%95%84%EC%B9%A8%EC%9D%84_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '티파니에서 아침을' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '틸다하우스_1_공공3유형.JPG', 'images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '틸다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '틸다하우스_2_공공3유형.JPG', 'images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '틸다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '틸다하우스_3_공공3유형.jpg', 'images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '틸다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '틸다하우스_4_공공3유형.JPG', 'images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '틸다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '틸다하우스_5_공공3유형.JPG', 'images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '틸다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '틸다하우스_6_공공3유형.JPG', 'images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '틸다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '틸다하우스_7_공공3유형.jpg', 'images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_7_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 7, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '틸다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '틸다하우스_8_공공3유형.JPG', 'images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8B%B8%EB%8B%A4%ED%95%98%EC%9A%B0%EC%8A%A4_8_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.JPG', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 8, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '틸다하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '포시즌펜션_1_공공3유형.jpg', 'images/stays/pension/%ED%8F%AC%EC%8B%9C%EC%A6%8C%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8F%AC%EC%8B%9C%EC%A6%8C%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '포시즌펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '포시즌펜션_2_공공3유형.jpg', 'images/stays/pension/%ED%8F%AC%EC%8B%9C%EC%A6%8C%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8F%AC%EC%8B%9C%EC%A6%8C%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '포시즌펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '포시즌펜션_3_공공3유형.jpg', 'images/stays/pension/%ED%8F%AC%EC%8B%9C%EC%A6%8C%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8F%AC%EC%8B%9C%EC%A6%8C%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '포시즌펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '포시즌펜션_4_공공3유형.jpg', 'images/stays/pension/%ED%8F%AC%EC%8B%9C%EC%A6%8C%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8F%AC%EC%8B%9C%EC%A6%8C%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '포시즌펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '포시즌펜션_5_공공3유형.jpg', 'images/stays/pension/%ED%8F%AC%EC%8B%9C%EC%A6%8C%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8F%AC%EC%8B%9C%EC%A6%8C%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '포시즌펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '프레리아 커플 독채펜션_1_공공3유형.jpg', 'images/stays/pension/%ED%94%84%EB%A0%88%EB%A6%AC%EC%95%84%20%EC%BB%A4%ED%94%8C%20%EB%8F%85%EC%B1%84%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%94%84%EB%A0%88%EB%A6%AC%EC%95%84%20%EC%BB%A4%ED%94%8C%20%EB%8F%85%EC%B1%84%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '프레리아 커플 독채펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '프레리아 커플 독채펜션_2_공공3유형.jpg', 'images/stays/pension/%ED%94%84%EB%A0%88%EB%A6%AC%EC%95%84%20%EC%BB%A4%ED%94%8C%20%EB%8F%85%EC%B1%84%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%94%84%EB%A0%88%EB%A6%AC%EC%95%84%20%EC%BB%A4%ED%94%8C%20%EB%8F%85%EC%B1%84%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '프레리아 커플 독채펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '프레리아 커플 독채펜션_3_공공3유형.jpg', 'images/stays/pension/%ED%94%84%EB%A0%88%EB%A6%AC%EC%95%84%20%EC%BB%A4%ED%94%8C%20%EB%8F%85%EC%B1%84%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%94%84%EB%A0%88%EB%A6%AC%EC%95%84%20%EC%BB%A4%ED%94%8C%20%EB%8F%85%EC%B1%84%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '프레리아 커플 독채펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '프레리아 커플 독채펜션_4_공공3유형.jpg', 'images/stays/pension/%ED%94%84%EB%A0%88%EB%A6%AC%EC%95%84%20%EC%BB%A4%ED%94%8C%20%EB%8F%85%EC%B1%84%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%94%84%EB%A0%88%EB%A6%AC%EC%95%84%20%EC%BB%A4%ED%94%8C%20%EB%8F%85%EC%B1%84%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '프레리아 커플 독채펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '프레리아 커플 독채펜션_5_공공3유형.jpg', 'images/stays/pension/%ED%94%84%EB%A0%88%EB%A6%AC%EC%95%84%20%EC%BB%A4%ED%94%8C%20%EB%8F%85%EC%B1%84%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%94%84%EB%A0%88%EB%A6%AC%EC%95%84%20%EC%BB%A4%ED%94%8C%20%EB%8F%85%EC%B1%84%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '프레리아 커플 독채펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '프레리아 커플 독채펜션_6_공공3유형.jpg', 'images/stays/pension/%ED%94%84%EB%A0%88%EB%A6%AC%EC%95%84%20%EC%BB%A4%ED%94%8C%20%EB%8F%85%EC%B1%84%ED%8E%9C%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%94%84%EB%A0%88%EB%A6%AC%EC%95%84%20%EC%BB%A4%ED%94%8C%20%EB%8F%85%EC%B1%84%ED%8E%9C%EC%85%98_6_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 6, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '프레리아 커플 독채펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '하얀언덕_1_공공3유형.jpg', 'images/stays/pension/%ED%95%98%EC%96%80%EC%96%B8%EB%8D%95_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%95%98%EC%96%80%EC%96%B8%EB%8D%95_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '하얀언덕' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '하얀언덕_2_공공3유형.jpg', 'images/stays/pension/%ED%95%98%EC%96%80%EC%96%B8%EB%8D%95_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%95%98%EC%96%80%EC%96%B8%EB%8D%95_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '하얀언덕' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '하얀언덕_3_공공3유형.jpg', 'images/stays/pension/%ED%95%98%EC%96%80%EC%96%B8%EB%8D%95_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%95%98%EC%96%80%EC%96%B8%EB%8D%95_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '하얀언덕' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '하얀언덕_4_공공3유형.jpg', 'images/stays/pension/%ED%95%98%EC%96%80%EC%96%B8%EB%8D%95_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%95%98%EC%96%80%EC%96%B8%EB%8D%95_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '하얀언덕' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '하얀언덕_5_공공3유형.jpg', 'images/stays/pension/%ED%95%98%EC%96%80%EC%96%B8%EB%8D%95_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%95%98%EC%96%80%EC%96%B8%EB%8D%95_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '하얀언덕' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '해뜨는집 펜션_1_공공3유형.jpg', 'images/stays/pension/%ED%95%B4%EB%9C%A8%EB%8A%94%EC%A7%91%20%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%95%B4%EB%9C%A8%EB%8A%94%EC%A7%91%20%ED%8E%9C%EC%85%98_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '해뜨는집 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '해뜨는집 펜션_2_공공3유형.jpg', 'images/stays/pension/%ED%95%B4%EB%9C%A8%EB%8A%94%EC%A7%91%20%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%95%B4%EB%9C%A8%EB%8A%94%EC%A7%91%20%ED%8E%9C%EC%85%98_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '해뜨는집 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '해뜨는집 펜션_3_공공3유형.jpg', 'images/stays/pension/%ED%95%B4%EB%9C%A8%EB%8A%94%EC%A7%91%20%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%95%B4%EB%9C%A8%EB%8A%94%EC%A7%91%20%ED%8E%9C%EC%85%98_3_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 3, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '해뜨는집 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '해뜨는집 펜션_4_공공3유형.jpg', 'images/stays/pension/%ED%95%B4%EB%9C%A8%EB%8A%94%EC%A7%91%20%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%95%B4%EB%9C%A8%EB%8A%94%EC%A7%91%20%ED%8E%9C%EC%85%98_4_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 4, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '해뜨는집 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '해뜨는집 펜션_5_공공3유형.jpg', 'images/stays/pension/%ED%95%B4%EB%9C%A8%EB%8A%94%EC%A7%91%20%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%95%B4%EB%9C%A8%EB%8A%94%EC%A7%91%20%ED%8E%9C%EC%85%98_5_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 5, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = '해뜨는집 펜션' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'JJ하우스_1_공공3유형.jpg', 'images/stays/pension/JJ%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/JJ%ED%95%98%EC%9A%B0%EC%8A%A4_1_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = 'JJ하우스' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT 'JJ하우스_2_공공3유형.jpg', 'images/stays/pension/JJ%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/JJ%ED%95%98%EC%9A%B0%EC%8A%A4_2_%EA%B3%B5%EA%B3%B53%EC%9C%A0%ED%98%95.jpg', @bucket_name, 1, 'image/jpeg', 'STAYS', stay_id, 2, FALSE, @creator_id, TRUE
FROM stays WHERE stay_name = 'JJ하우스' LIMIT 1;


-- 부족한 펜션
SET @bucket_name = 'travelshoot-s3';
SET @creator_id = 1;

-- 귤익는마을
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '귤익는마을_1.jpg', 'images/stays/pension/%EA%B7%A4%EC%9D%B5%EB%8A%94%EB%A7%88%EC%9D%84_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EA%B7%A4%EC%9D%B5%EB%8A%94%EB%A7%88%EC%9D%84_1.jpg', @bucket_name, 6246, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '귤익는마을' LIMIT 1;

-- 노인과바다
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '노인과바다_1.jpg', 'images/stays/pension/%EB%85%B8%EC%9D%B8%EA%B3%BC%EB%B0%94%EB%8B%A4_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%85%B8%EC%9D%B8%EA%B3%BC%EB%B0%94%EB%8B%A4_1.jpg', @bucket_name, 12390, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '노인과바다' LIMIT 1;

-- 더럭펜션
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '더럭펜션_1.jpg', 'images/stays/pension/%EB%8D%94%EB%9F%AD%ED%8E%9C%EC%85%98_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EB%8D%94%EB%9F%AD%ED%8E%9C%EC%85%98_1.jpg', @bucket_name, 10649, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '더럭펜션' LIMIT 1;

-- 샤론의집
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '샤론의집_1.jpg', 'images/stays/pension/%EC%83%A4%EB%A1%A0%EC%9D%98%EC%A7%91_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%83%A4%EB%A1%A0%EC%9D%98%EC%A7%91_1.jpg', @bucket_name, 13107, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '샤론의집' LIMIT 1;

-- 소랑호젠
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '소랑호젠_1.jpg', 'images/stays/pension/%EC%86%8C%EB%9E%91%ED%98%B8%EC%A0%A0_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%86%8C%EB%9E%91%ED%98%B8%EC%A0%A0_1.jpg', @bucket_name, 7168, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '소랑호젠' LIMIT 1;

-- 솔바람풍경소리
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '솔바람풍경소리_1.jpg', 'images/stays/pension/%EC%86%94%EB%B0%94%EB%9E%8C%ED%92%8D%EA%B2%BD%EC%86%8C%EB%A6%AC_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%86%94%EB%B0%94%EB%9E%8C%ED%92%8D%EA%B2%BD%EC%86%8C%EB%A6%AC_1.jpg', @bucket_name, 13722, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE

FROM stays WHERE stay_name = '솔바람풍경소리' LIMIT 1;

-- 제주스카이휴양펜션
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)

SELECT '제주스카이휴양펜션_1.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%8A%A4%EC%B9%B4%EC%9D%B4%ED%9C%B4%EC%96%91%ED%8E%9C%EC%85%98_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%8A%A4%EC%B9%B4%EC%9D%B4%ED%9C%B4%EC%96%91%ED%8E%9C%EC%85%98_1.jpg', @bucket_name, 11366, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주스카이휴양펜션' LIMIT 1;

-- 제주애 펜션
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주애 펜션_1.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%95%A0%20%ED%8E%9C%EC%85%98_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%95%A0%20%ED%8E%9C%EC%85%98_1.jpg', @bucket_name, 11161, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주애 펜션' LIMIT 1;

-- 제주카사블랑카
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주카사블랑카_1.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%B9%B4%EC%82%AC%EB%B8%94%EB%9E%91%EC%B9%B4_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%B9%B4%EC%82%AC%EB%B8%94%EB%9E%91%EC%B9%B4_1.jpg', @bucket_name, 13004, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주카사블랑카' LIMIT 1;

-- 킴스캐빈
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '킴스캐빈_1.jpg', 'images/stays/pension/%ED%82%B4%EC%8A%A4%EC%BA%90%EB%B9%88_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%82%B4%EC%8A%A4%EC%BA%90%EB%B9%88_1.jpg', @bucket_name, 13516, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '킴스캐빈' LIMIT 1;

-- 펜션리본
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '펜션리본_1.jpg', 'images/stays/pension/%ED%8E%9C%EC%85%98%EB%A6%AC%EB%B3%B8_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%8E%9C%EC%85%98%EB%A6%AC%EB%B3%B8_1.jpg', @bucket_name, 10240, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '펜션리본' LIMIT 1;

-- 푸른바다이야기
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '푸른바다이야기_1.jpg', 'images/stays/pension/%ED%91%B8%EB%A5%B8%EB%B0%94%EB%8B%A4%EC%9D%B4%EC%95%BC%EA%B8%B0_1.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%ED%91%B8%EB%A5%B8%EB%B0%94%EB%8B%A4%EC%9D%B4%EC%95%BC%EA%B8%B0_1.jpg', @bucket_name, 11571, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '푸른바다이야기' LIMIT 1;

INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '제주시 애월 펜션.jpg', 'images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%8B%9C%20%EC%95%A0%EC%9B%94%20%ED%8E%9C%EC%85%98.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%A0%9C%EC%A3%BC%EC%8B%9C%20%EC%95%A0%EC%9B%94%20%ED%8E%9C%EC%85%98.jpg', @bucket_name, 11366, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '제주시 애월 펜션' LIMIT 1;

-- 춘천 남이섬 펜션
INSERT INTO files (original_filename, s3_key, s3_url, bucket_name, file_size, content_type, reference_type, reference_id, sort_order, is_representative, creator_id, is_public)
SELECT '춘천 남이섬 펜션.jpg', 'images/stays/pension/%EC%B6%98%EC%B2%9C%20%EB%82%A8%EC%9D%B4%EC%84%AC%20%ED%8E%9C%EC%85%98.jpg', 'https://travelshoot-s3.s3.ap-southeast-2.amazonaws.com/images/stays/pension/%EC%B6%98%EC%B2%9C%20%EB%82%A8%EC%9D%B4%EC%84%AC%20%ED%8E%9C%EC%85%98.jpg', @bucket_name, 11366, 'image/jpeg', 'STAYS', stay_id, 1, TRUE, @creator_id, TRUE
FROM stays WHERE stay_name = '춘천 남이섬 펜션' LIMIT 1;