SET SERVEROUTPUT ON;


--익명 블록 설정
DECLARE --변수를 선언하는 구간(선언부)
    emp_num NUMBER; --변수 선언
BEGIN --코드를 실행하는 구간(실행부)
    emp_num := 10; --대입 연산자
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
        v_emp_name, v_dep_name --조회 결과를 변수에 대입
        
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    WHERE e.employee_id = 103;

    dbms_output.put_line(v_emp_name || '-' || v_dep_name);    

END; 

