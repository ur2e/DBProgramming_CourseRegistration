CREATE OR REPLACE VIEW ordered_data
AS
SELECT e.c_id, e.c_no, e.c_name, e.s_id, s_name, e.c_prof, c.c_credit, c.c_day, c.c_time, c_max, DENSE_RANK() OVER (PARTITION BY e.c_id, e.c_no ORDER BY s.s_grade desc, s.last_credit desc, s.last_score desc) RANK 
FROM ENROLL e , STUDENTS s, COURSE c 
WHERE e.s_id = s.s_id and (e.c_id = c.c_id and e.c_no = c.c_no) 
ORDER BY c_name, rank;