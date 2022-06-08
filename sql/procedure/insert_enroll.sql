CREATE OR REPLACE PROCEDURE INSERT_ENROLL
(
    USER_S_ID IN ENROLL.S_ID%TYPE,
    USER_C_ID IN ENROLL.C_ID%TYPE,
    USER_C_NO IN ENROLL.C_NO%TYPE,
    result OUT VARCHAR2
)
IS
    MAX_CREDIT_EXCEPT EXCEPTION;
    DUP_COURSE_EXCEPT EXCEPTION;
    DUP_TIME_EXCEPT EXCEPTION;
    
    v_year NUMBER;
    v_sem NUMBER;
    v_course COURSE%ROWTYPE;
    v_state VARCHAR2(10) := '미정';
    
    MAX_CREDIT NUMBER := 12; -- 최대 수강 가능 학점
    nTotalCredit NUMBER := 0;
    nDup NUMBER := 0;
    nTime NUMBER := 0;
        v_num COURSE.C_CRNT%TYPE;
    
    CURSOR Time_list(u_sid ENROLL.S_ID%TYPE, year ENROLL.e_year%TYPE, sem ENROLL.e_sem%TYPE, v_day ENROLL.c_day%TYPE, v_time ENROLL.c_time%TYPE) IS
       SELECT c_id
       FROM ENROLL
       WHERE s_id = u_sid and e_year = year and e_sem = sem and c_day=v_day and c_time=v_time;
   
BEGIN
    result := '';
   
    /*년도, 학기 */
    v_year := Date2EnrollYear(SYSDATE);
    v_sem := Date2EnrollSemester(SYSDATE);
   
    SELECT *
    INTO v_course.c_id, v_course.c_no, v_course.c_name, v_course.c_day, v_course.c_time, 
    v_course.c_grade, v_course.c_credit, v_course.c_max, v_course.c_crnt, v_course.c_spare, v_course.c_prof 
    FROM COURSE
    WHERE c_id = USER_C_ID and c_no = USER_C_NO;
 
    /* 에러1: 최대학점 초과여부 */
    SELECT SUM(c_credit)
    INTO nTotalCredit
    FROM ENROLL
    WHERE s_id = USER_S_ID and e_year = v_year and e_sem = v_sem ;

    IF (nTotalCredit + v_course.c_credit > MAX_CREDIT) THEN
       RAISE MAX_CREDIT_EXCEPT;
    END IF;
    
    /* 에러2: 동일한 과목 신청 여부 */
    SELECT NVL(COUNT(*), 0)
    INTO nDup
    FROM ENROLL
    WHERE s_id = USER_S_ID and e_year = v_year and e_sem = v_sem and c_id=USER_C_ID and c_no=USER_C_NO;
    
    IF (nDup > 0) THEN
       RAISE DUP_COURSE_EXCEPT;
    END IF;

    /* 에러3: 시간 중복 여부 */
    FOR cid IN Time_list(USER_S_ID, v_year, v_sem, v_course.c_day, v_course.c_time) LOOP
      nTime := nTime + 1;
    END LOOP;
    
    IF (nTime > 0) THEN
       RAISE DUP_TIME_EXCEPT;
    END IF;

    /* 정상 동작 */
    /* enroll 삽입 */
    INSERT INTO ENROLL VALUES (USER_S_ID, v_course.c_id, v_course.c_no, v_course.c_name, v_course.c_credit, v_course.c_prof,
                      v_course.c_day, v_course.c_time, v_course.c_grade, v_year, v_sem, v_state);
    

    SELECT count(*)
    INTO v_num
    FROM ENROLL
    WHERE c_id = USER_C_ID and c_no = USER_C_NO;

    v_course.c_spare := v_course.c_max - v_num;

    IF  (v_course.c_spare < 0) THEN
   	    v_course.c_spare := 0;
    END IF;      

    UPDATE COURSE
    SET c_crnt = v_num, c_spare = v_course.c_spare
    WHERE c_id = USER_C_ID and c_no = USER_C_NO;
    
    COMMIT;
    /* course 업데이트 */
   --  v_course.c_crnt := NVL(v_course.c_crnt, 0) + 1;
   --  UPDATE COURSE 
   --  SET c_crnt = v_course.c_crnt, c_spare = v_course.c_spare
   --  WHERE c_id = v_course.c_id and c_no = v_course.c_no; 
      
    result := '수강신청 등록이 완료되었습니다.';

EXCEPTION
   WHEN MAX_CREDIT_EXCEPT THEN
      result := '최대 학점을 초과하였습니다.';
    WHEN DUP_COURSE_EXCEPT THEN
       result := '이미 등록된 과목을 신청하였습니다';
    WHEN DUP_TIME_EXCEPT THEN 
       result := '이미 등록된 과목 중 중복되는 시간이 존재합니다';
    WHEN OTHERS THEN
       result := '실행 에러';
END;
/