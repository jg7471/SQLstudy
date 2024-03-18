SET SERVEROUTPUT ON;


--�͸� ��� ����
DECLARE --������ �����ϴ� ����(�����)
    emp_num NUMBER; --���� ����
BEGIN --�ڵ带 �����ϴ� ����(�����)
    emp_num := 10; --���� ������
    DBMS_OUTPUT.put_line('Hello pl/sql!');
END;




DECLARE
    v_emp_name VARCHAR2(50);
    v_dep_name departments.department_name%TYPE;

BEGIN

    SELECT
        e.first_name,
        d.department_name
    
    INTO
        v_emp_name, v_dep_name --��ȸ ����� ������ ����
        
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    WHERE e.employee_id = 103;

    dbms_output.put_line(v_emp_name || '-' || v_dep_name);    

END; 

