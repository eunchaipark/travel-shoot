SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS user_stay_recommendations (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '추천 캐시 ID',
    user_id BIGINT NOT NULL COMMENT '사용자 ID',
    stay_id BIGINT NOT NULL COMMENT '숙소 ID',
    filter_level INT NOT NULL COMMENT '성공한 완화 레벨 (1~5)',
    base_price DECIMAL(10, 2) NOT NULL COMMENT '계산 시점의 basePrice',
    recommendation_rank INT NOT NULL COMMENT '추천 순위 (1~15)',
    reservation_count INT NOT NULL COMMENT '예약 건수',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    UNIQUE KEY uk_user_stay (user_id, stay_id) COMMENT '사용자별 숙소 중복 방지',
    INDEX idx_user_updated (user_id, updated_at) COMMENT '사용자별 최신 캐시 조회',
    INDEX idx_user_rank (user_id, recommendation_rank) COMMENT '사용자별 순위 조회',
    CONSTRAINT fk_recommendation_user FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE,
    CONSTRAINT fk_recommendation_stay FOREIGN KEY (stay_id) REFERENCES stays (stay_id) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '숙소 추천 캐시 테이블';