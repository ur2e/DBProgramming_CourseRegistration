CREATE OR REPLACE PROCEDURE DELETE_ENROLL
(
    USER_S_ID IN ENROLL.S_ID%TYPE,
    USER_C_ID IN ENROLL.C_ID%TYPE,
    USER_C_NAME OUT ENROLL.C_NAME%TYPE
)
IS
   v_c_no ENROLL.C_NO%TYPE;    
   v_c_name ENROLL.C_NAME%TYPE;
    v_c_crnt COURSE.C_CRNT%TYPE;
    v_c_spare COURSE.C_SPARE%TYPE;
BEGIN
    SELECT c_no, c_name
    INTO v_c_no, v_c_name
    FROM ENROLL
    WHERE s_id = USER_S_ID and c_id = USER_C_ID;

   /* ENROLL 제거 */
    DELETE FROM ENROLL WHERE s_id = USER_S_ID and c_id = USER_C_ID;
    
    /* COURSE UPDATE */
    SELECT c_crnt, c_spare
    INTO v_c_crnt, v_c_spare
    FROM COURSE
    WHERE c_id = USER_C_ID and c_no = v_c_no;
    
    UPDATE COURSE 
    SET c_crnt = v_c_crnt - 1, c_spare = v_c_spare + 1
      WHERE c_id = USER_C_ID and c_no = v_c_no; 
      

    USER_C_NAME := v_c_name;
--    DBMS_OUTPUT.PUT_LINE('이름은 : ' || USER_C_NAME);
END;
/