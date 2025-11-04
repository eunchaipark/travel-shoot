-- users 테이블 변경사항
-- 실제 users 이름처럼 변경
UPDATE users SET user_name = '김서연' WHERE email = 'light1@test.com';
UPDATE users SET user_name = '이준호' WHERE email = 'light2@test.com';
UPDATE users SET user_name = '박지민' WHERE email = 'light3@test.com';
UPDATE users SET user_name = '최예은' WHERE email = 'light4@test.com';
UPDATE users SET user_name = '정하준' WHERE email = 'light5@test.com';
UPDATE users SET user_name = '강민지' WHERE email = 'heavy1@test.com';
UPDATE users SET user_name = '송우진' WHERE email = 'heavy2@test.com';
UPDATE users SET user_name = '윤서아' WHERE email = 'heavy3@test.com';
UPDATE users SET user_name = '임도현' WHERE email = 'heavy4@test.com';
UPDATE users SET user_name = '한지우' WHERE email = 'heavy5@test.com';

COMMIT;