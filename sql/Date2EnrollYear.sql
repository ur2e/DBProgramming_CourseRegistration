/*
[Date2EnrollYear]
    IN 파라미터
        p1: 오늘 날짜
    리턴 결과
        숫자형
        수강신청 하는 년도
    9~12 : 다음 년도
    1~8: 해당 년도
*/

/*
    VAR month NUMBER;
    month := Date2EnrollYear(SYSDATE)
    print month;
*/ 

CREATE OR REPLACE FUNCTION Date2EnrollYear(dDate IN DATE)
RETURN NUMBER
IS
	v_month VARCHAR2(2);
	v_year NUMBER;
BEGIN
	v_month := TO_CHAR(dDate, 'MM');

	IF(v_month >= '01' AND v_month <= '08') THEN
	v_year := TO_NUMBER(TO_CHAR(dDate, 'YYYY'));

	ELSIF(v_month >= '09' and v_month <= '12') THEN 
	v_year := TO_NUMBER(TO_CHAR(dDate, 'YYYY') + 1);
	
	END IF;
	
--	DBMS_OUTPUT.PUT_LINE(v_month || 'and' || v_year);
	RETURN v_year;

END;

