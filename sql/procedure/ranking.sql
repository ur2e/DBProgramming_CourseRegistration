CREATE OR REPLACE PROCEDURE RANKING
(
    TYPE s_id_table IS TABLE OF enroll.s_id%TYPE INDEX BY BINARY_INTEGER;
    TYPE c_id_table IS TABLE OF enroll.c_id%TYPE INDEX BY BINARY_INTEGER;

    CURSOR final_student IS ( SELECT e.c_name, e.c_id, e.c_no, e.s_id, s_name, RANK() OVER (PARTITION BY e.c_id, e.c_no ORDER BY s.s_grade desc, s.last_credit desc, s.last_score desc) RANK, c_max
                              FROM ENROLL e , STUDENTS s, COURSE c
                              WHERE e.s_id = s.s_id and (e.c_id = c.c_id and e.c_no = c.c_no)
                              ORDER BY c_name, rank;
    )
IS
    -- 각 과목별 max 정원
    v_c_max  NUMBER(3);
BEGIN
    OPEN final_student;
        
    LOOP 

        FETCH final_student INTO ;


        EXIT WHEN final_student%NOTFOUND;
    END LOOP;

    CLOSE final_student;
END;
/