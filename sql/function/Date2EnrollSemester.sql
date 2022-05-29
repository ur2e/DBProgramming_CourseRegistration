/*
[Date2EnrollSemester]
    IN 파라미터
        p1: 오늘 날짜
    리턴 결과
        숫자형
        수강신청하는 학기 리턴

    9~12, 1~2 : 1학기
    3~8: 2학기
*/

/*
    Set ServerOutput on;

    VAR sem NUMBER;
    EXECUTE :sem := Date2EnrollSemester(SYSDATE)
    PRINT sem;
*/

/*SYSDATE -> 학기 추출*/
CREATE OR REPLACE FUNCTION Date2EnrollSemester(dDate IN DATE)
RETURN NUMBER
IS
	v_month VARCHAR2;
	v_sem NUMBER;
BEGIN
	v_month := TO_CHAR(dDate, ‘MM’);

	IF (v_month >= ‘03’ and v_month <= ‘08’) THEN
	v_sem := 2;

ELSIF (v_month >= ‘09’ and v_month <= ‘12’) OR (v_month >= ‘01’ and v_month <= ‘02’) THEN
v_sem := 1;

ENDIF;

DBMS_OUTPUT.PUT_LINE(v_month);
RETURN v_sem;
END;
/