SELECT * FROM employees;

-- WHERE�� �� (������ ���� ��/�ҹ��ڸ� ����)
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG'; --it_prog �ȵ�

SELECT *
FROM employees
WHERE last_name = 'King';