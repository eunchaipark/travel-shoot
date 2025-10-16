-- user_survey_foods 테이블의 food_category를 ENUM으로 변경
SET NAMES utf8mb4;
ALTER TABLE user_survey_foods
    MODIFY COLUMN food_category ENUM('한식', '중식', '일식', '양식', '카페', '해산물', '고기', '디저트') NOT NULL COMMENT '음식 유형';
commit;