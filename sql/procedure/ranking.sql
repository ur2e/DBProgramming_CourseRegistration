col s_name for a20;  
col c_name for a10;  
col c_id for 999;
col c_no for 999;
col s_id for 999999;
col rank for 999;
col e_state for a6;

SELECT * 
FROM (
    SELECT e.c_id, e.c_no, e.c_name, e.s_id, s_name, e.c_prof, c.c_credit, c.c_day, c.c_time, c_max, DENSE_RANK() OVER (PARTITION BY e.c_id, e.c_no ORDER BY s.s_grade desc, s.last_credit desc, s.last_score desc) RANK 
    FROM ENROLL e , STUDENTS s, COURSE c 
    WHERE e.s_id = s.s_id and (e.c_id = c.c_id and e.c_no = c.c_no) 
    ORDER BY c_name, rank) 
WHERE RANK <= 1;