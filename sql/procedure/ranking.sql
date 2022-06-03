CREATE OR REPLACE PROCEDURE RANKING
IS
    CURSOR final_student IS 
        SELECT *
        FROM (
            SELECT e.c_name, e.c_id, e.c_no, e.s_id, s_name, DENSE_RANK() OVER (PARTITION BY e.c_id, e.c_no ORDER BY s.s_grade desc, s.last_credit desc, s.last_score desc) RANK, c_max
            FROM ENROLL e , STUDENTS s, COURSE c
            WHERE e.s_id = s.s_id and (e.c_id = c.c_id and e.c_no = c.c_no)
            ORDER BY c_name, rank
        )
        WHERE RANK <= 1;

BEGIN
    OPEN final_student;    
    LOOP 
        UPDATE ENROLL
        SET e_state = 'È®Á¤';
        EXIT WHEN final_student%NOTFOUND;
    END LOOP;

    CLOSE final_student;
END;
/