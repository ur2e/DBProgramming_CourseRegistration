CREATE OR REPLACE TRIGGER BeforeUpdateStudent BEFORE UPDATE ON students
FOR EACH ROW

DECLARE
   underflow_length EXCEPTION;
   invalid_value EXCEPTION;
   nBlank NUMBER;    --공백 개수

BEGIN
/* 4자리 이하 */
IF (LENGTH(:new.s_pwd) < 4) THEN
   RAISE underflow_length;
END IF;

/* 공란 포함 */
IF (:new.s_pwd LIKE '% %') THEN 
   RAISE invalid_value;
END IF;



/* 정상 동작 */
UPDATE students s 
SET s.s_pwd = :new.s_pwd
WHERE s.s_id = :new.s_id;


EXCEPTION
WHEN underflow_length THEN
   RAISE_APPLICATION_ERROR(-20002, '암호는 4자리 이상이어야 합니다');
   -- 에러창 띄우기, 에러 내용 출력
WHEN invalid_value THEN 
   RAISE_APPLICATION_ERROR(-20003, '암호는 공란은 입력되지 않습니다');
-- 에러창 띄우기, 에러 내용 출력
WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE('오류 발생');
END;
/