CREATE OR REPLACE TRIGGER BeforeUpdateStudent BEFORE UPDATE ON students
FOR EACH ROW

DECLARE
   underflow_length EXCEPTION;
   invalid_value EXCEPTION;
   nBlank NUMBER;    --���� ����

BEGIN
/* 4�ڸ� ���� */
IF (LENGTH(:new.s_pwd) < 4) THEN
   RAISE underflow_length;
END IF;

/* ���� ���� */
IF (:new.s_pwd LIKE '% %') THEN 
   RAISE invalid_value;
END IF;



/* ���� ���� */
UPDATE students s 
SET s.s_pwd = :new.s_pwd
WHERE s.s_id = :new.s_id;


EXCEPTION
WHEN underflow_length THEN
   RAISE_APPLICATION_ERROR(-20002, '��ȣ�� 4�ڸ� �̻��̾�� �մϴ�');
   -- ����â ����, ���� ���� ���
WHEN invalid_value THEN 
   RAISE_APPLICATION_ERROR(-20003, '��ȣ�� ������ �Էµ��� �ʽ��ϴ�');
-- ����â ����, ���� ���� ���
WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE('���� �߻�');
END;
/