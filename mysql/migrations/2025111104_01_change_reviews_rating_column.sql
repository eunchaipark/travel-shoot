-- reviews 테이블 변경사항
-- 1. 기존 제약조건 및 인덱스 삭제
ALTER TABLE reviews DROP INDEX idx_overall_rating;
ALTER TABLE reviews DROP CONSTRAINT chk_overall_rating;
ALTER TABLE reviews DROP CONSTRAINT chk_cleanliness_rating;
-- 2. 컬럼명 변경
ALTER TABLE reviews CHANGE COLUMN overall_rating total_rating DECIMAL(3, 2) NOT NULL COMMENT '종합 평점';
ALTER TABLE reviews CHANGE COLUMN cleanliness_rating clean_rating DECIMAL(3, 2) NOT NULL COMMENT '청결도 점수';
-- 3. 새로운 인덱스 추가
ALTER TABLE reviews ADD INDEX idx_total_rating (total_rating);
-- 4. 새로운 제약조건 추가
ALTER TABLE reviews ADD CONSTRAINT chk_total_rating CHECK (total_rating >= 0 AND total_rating <= 5);
ALTER TABLE reviews ADD CONSTRAINT chk_clean_rating CHECK (clean_rating >= 0 AND clean_rating <= 5);
COMMIT;
select * from reviews;