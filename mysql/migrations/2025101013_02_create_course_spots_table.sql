-- 코스 상세 스팟 테이블 생성
CREATE TABLE course_spots
(
    spot_id      BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '스팟 ID',
    course_id    BIGINT   NOT NULL COMMENT '코스 ID',
    day          INT      NOT NULL COMMENT '여행 N일차',
    spot_order   INT      NOT NULL COMMENT '당일 방문 순서',
    spot_type    ENUM('관광지', '맛집') NOT NULL COMMENT '스팟 유형',
    reference_id BIGINT   NOT NULL COMMENT '관광지/맛집 테이블 PK',
    start_time   TIME     NOT NULL COMMENT '시작 시간',
    end_time     TIME     NOT NULL COMMENT '종료 시간',
    ai_comment   VARCHAR(500) NULL COMMENT 'GPT 추천 코멘트',
    created_at   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
    FOREIGN KEY (course_id) REFERENCES travel_courses (course_id) ON DELETE CASCADE,
    INDEX        idx_course_day (course_id, day, spot_order),
    INDEX        idx_spot_type (spot_type),
    CONSTRAINT chk_day_positive CHECK (day > 0
) ,
    CONSTRAINT chk_order_positive CHECK (spot_order > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='코스 상세 스팟';
commit;