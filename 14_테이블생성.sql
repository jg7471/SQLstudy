/*
- NUMBER(2) -> 정수를 2자리까지 저장할 수 있는 숫자형 타입.
- NUMBER(5, 2) -> 정수부, 실수부를 합친 총 자리수 5자리, 소수점 2자리 --356.74
- NUMBER -> 괄호를 생략할 시 (38, 0)으로 자동 지정됩니다.
- VARCHAR2(byte) -> 괄호 안에 들어올 문자열의 최대 길이를 지정. (4000byte까지)
- CLOB -> 대용량 텍스트 데이터 타입 (최대 4Gbyte)
- BLOB -> 이진형 대용량 객체 (이미지, 파일 저장 시 사용)
- DATE -> BC 4712년 1월 1일 ~ AD 9999년 12월 31일까지 지정 가능
- 시, 분, 초 지원 가능.
*/

CREATE TABLE dept2 (
    dept_no NUMBER(2), --데이터 크기 지정(미만)
    dept_name VARCHAR2(14), --14byte
    loca VARCHAR2(15),
    dept_date DATE,
    dept_bonus NUMBER(10)
);

DESC dept2;
SELECT * FROM dept2;

INSERT INTO dept2
VALUES(10, '영업부', '서울', sysdate, 1000000);

INSERT INTO dept2
VALUES(20, '개발부', '서울', sysdate, 2000000);

--NUMBER와 VARCHAR2 타입의 길이를 확인
INSERT INTO dept2
VALUES(20, '개발부워ㅜㄹ넝런어룬어ㅜㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇ', '서ㄴㄹㄴㅇㄹㄴㅇㄹ울', sysdate, 200000000000000); --세팅한 글자수 초과

