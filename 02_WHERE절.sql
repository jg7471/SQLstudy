SELECT * FROM employees;

-- WHERE절 비교 (데이터 값은 대/소문자를 구분)
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG'; --it_prog 안됨

SELECT *
FROM employees
WHERE last_name = 'King';