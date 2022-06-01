CREATE OR REPLACE PROCEDURE RANKING
(
    TYPE s_id_table IS TABLE OF enroll.s_id%TYPE INDEX BY BINARY_INTEGER;
    TYPE c_id_table IS TABLE OF enroll.c_id%TYPE INDEX BY BINARY_INTEGER;

    CURSOR final_student IS ( SELECT c_name, c_id, c_no, e.s_id, s_name, RANK() OVER (PARTITION BY c_id, c_no ORDER BY s.s_grade desc, s.last_credit desc, s.last_score desc) RANK
                              FROM ENROLL e , STUDENTS s 
                              WHERE e.s_id = s.s_id
                              RDER BY c_name, rank;;
    )
IS

BEGIN
    OPEN final_student;
        
    LOOP 

        FETCH final_student INTO ;


        EXIT WHEN final_student%NOTFOUND;
    END LOOP;

    CLOSE final_student;
END;
/