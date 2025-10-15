-- reservations 테이블에 transportation_method 컬럼 추가
ALTER TABLE reservations
    ADD COLUMN transportation_method ENUM('차량', '대중교통') DEFAULT '차량' COMMENT '방문 수단';
commit;