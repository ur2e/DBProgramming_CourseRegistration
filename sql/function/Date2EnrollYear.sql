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
	
	RETURN v_year;

END;
