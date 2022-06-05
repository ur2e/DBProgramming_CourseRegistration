CREATE OR REPLACE PROCEDURE DELETE_ENROLL
(
    USER_S_ID IN ENROLL.S_ID%TYPE,
    USER_C_ID IN ENROLL.C_ID%TYPE,
    USER_C_NAME OUT ENROLL.C_NAME%TYPE
)
IS
    v_c_name ENROLL.C_NAME%TYPE;
BEGIN
    SELECT c_name
    INTO v_c_name
    FROM ENROLL
    WHERE s_id = USER_S_ID and c_id = USER_C_ID;

    DELETE FROM ENROLL WHERE s_id = USER_S_ID and c_id = USER_C_ID;

    USER_C_NAME := v_c_name;
    DBMS_OUTPUT.PUT_LINE('이름은 : ' || USER_C_NAME);
END;
/