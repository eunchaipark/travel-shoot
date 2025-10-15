-- travel_courses 테이블의 course_data 컬럼 삭제
ALTER TABLE travel_courses
DROP COLUMN course_data;
commit;