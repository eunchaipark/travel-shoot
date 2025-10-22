-- user_survey_activities 테이블의 activity_category를 ENUM으로 변경
SET NAMES utf8mb4;
ALTER TABLE user_survey_activities
    MODIFY COLUMN activity_category ENUM('자연관광', '문화체험', '레포츠', '맛집탐방', '쇼핑', '사진', '휴양', '축제') NOT NULL COMMENT '관광지 유형';
commit;