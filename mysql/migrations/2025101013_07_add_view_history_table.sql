-- 조회 이력 테이블 추가 및 트리거 추가
-- 조회 이력 테이블에 데이터 추가하면 숙소, 맛집, 액티비티 타입에따라서 해당 테이블의 view_count데이터 +1

-- 조회 이력 테이블
CREATE TABLE IF NOT EXISTS view_history (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    view_type ENUM('STAY', 'RESTAURANT', 'ACTIVITY') NOT NULL,
    target_id BIGINT NOT NULL COMMENT '각 도메인의 PK',
    viewed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id BIGINT NULL,
    INDEX idx_view_type_target (view_type, target_id),
    INDEX idx_viewed_at (viewed_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TRIGGER IF EXISTS after_view_history_insert;

CREATE TRIGGER after_view_history_insert
AFTER INSERT ON view_history
FOR EACH ROW
BEGIN
    IF NEW.view_type = 'STAY' THEN
        UPDATE stays SET view_count = view_count + 1 WHERE stay_id = NEW.target_id;
    END IF;
    IF NEW.view_type = 'RESTAURANT' THEN
        UPDATE restaurants SET view_count = view_count + 1 WHERE restaurant_id = NEW.target_id;
    END IF;
    IF NEW.view_type = 'ACTIVITY' THEN
        UPDATE activities SET view_count = view_count + 1 WHERE activity_id = NEW.target_id;
    END IF;
END;


commit;