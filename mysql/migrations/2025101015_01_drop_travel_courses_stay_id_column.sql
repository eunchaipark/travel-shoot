-- travel_courses 테이블의 course_data 컬럼 삭제
ALTER TABLE travel_courses
DROP FOREIGN KEY travel_courses_ibfk_3;
ALTER TABLE travel_courses
DROP COLUMN stay_id;
commit;