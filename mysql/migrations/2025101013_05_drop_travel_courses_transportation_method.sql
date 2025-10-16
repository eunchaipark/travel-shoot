-- travel_courses 테이블의 transportation_method 컬럼 삭제
ALTER TABLE travel_courses
DROP COLUMN transportation_method;
commit;