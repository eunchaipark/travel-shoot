UPDATE stays
SET check_in_time = '15:00:00',
    check_out_time = '11:00:00';

ALTER TABLE stays
MODIFY check_in_time TIME DEFAULT '15:00:00',
MODIFY check_out_time TIME DEFAULT '11:00:00';

-- 값을 넣어줘야 NOT NULL 설정 가능
ALTER TABLE stays
MODIFY check_in_time TIME NOT NULL DEFAULT '15:00:00',
MODIFY check_out_time TIME NOT NULL DEFAULT '11:00:00';

commit;


