/*
AFTER Ʈ���� - INSERT, UPDATE, DELETE �۾� ���Ŀ� �����ϴ� Ʈ���Ÿ� �ǹ��մϴ�.
BEFORE Ʈ���� - INSERT, UPDATE, DELETE �۾� ������ �����ϴ� Ʈ���Ÿ� �ǹ��մϴ�.

:OLD = ���� �� ���� �� (INSERT: �Է� �� �ڷ�, UPDATE: ���� �� �ڷ�, DELETE: ������ ��) --before
:NEW = ���� �� ���� �� (INSERT: �Է� �� �ڷ�, UPDATE: ���� �� �ڷ�) --after

���̺� UPDATE�� DELETE�� �õ��ϸ� ����, �Ǵ� ������ �����͸� --������̺� �ۼ��� ���� ��
������ ���̺� ������ ���� �������� Ʈ���Ÿ� ���� ����մϴ�.

Ʈ���� ��ü�� Ʈ������� �Ϻη� ó���ϱ� ������ COMMIT�̳� ROLLBACK�� ���� �� �� �����ϴ�.
*/


CREATE TABLE tbl_user(
    id VARCHAR2(20) PRIMARY KEY,
    name VARCHAR2(20),
    address VARCHAR2(30)
);



CREATE TABLE tbl_user_backup(
    id VARCHAR2(20) PRIMARY KEY,
    name VARCHAR2(20),
    address VARCHAR2(30),
    update_date DATE DEFAULT sysdate, -- ���� ���� �ð�(�⺻��: INSERT �Ǵ� �ð�) --�μ�Ʈ�� �� sysdate �ڵ� �Էµ�
    m_type VARCHAR2(10), -- ���� Ÿ�� --���� or ����
    m_user VARCHAR2(20) -- ������ ����� --����
);



--AFTER Ʈ���� ���� � ����
CREATE OR REPLACE TRIGGER trg_user_backup
    AFTER UPDATE OR DELETE
    ON tbl_user
    FOR EACH ROW --��� �࿡ ����
DECLARE
    --Ʈ���� ���� : �������� = --m_type
    v_type VARCHAR2(10);

BEGIN
    --���� Ʈ���Ű� �ߵ��� ��Ȳ�� UPDATE���� DELETE���� �ľ��ϴ� ���ǹ�
    IF UPDATING THEN -- UPDATING�� �ý��� ��ü���� ���¿� ���� ������ �����ϴ� ��Ʈ�� �⺻ ����. //INSERTING
        v_type := '����'; --m_type
    ELSIF DELETING THEN
        v_type := '����';
    END IF;

    
    --�������� ���� ���� �ۼ� (backup ���̺� ���� INSERT
    -- -> ���� ���̺��� UPDATE or DELETE �� ������� ���� �� ��Ÿ ����)
    INSERT INTO tbl_user_backup
    VALUES(:OLD.id, :OLD.name, :OLD.address, sysdate, v_type, USER()); --���� id, name , address : ����/���� �Ǳ� ���� �������Էµ�(Ʈ����)
    --��¥ update_date �ȳ־�� �ڵ��Է�(�÷� ���� �����Ƽ� ����)
    --USER() �Լ� : ���� ������
    
END;



-- Ȯ��!
INSERT INTO tbl_user VALUES('test01', 'kim', '����');
INSERT INTO tbl_user VALUES('test02', 'lee', '���');
INSERT INTO tbl_user VALUES('test03', 'hong', '�λ�');

SELECT * FROM tbl_user;
SELECT * FROM tbl_user_backup; --������̺� ����(����,����) --���� insert X, Ʈ���ſ� ���� �ڵ� �Էµ� : ������ ���� ���� �Էµ�!!
--@ ���� �Ȱ� Ȯ��

UPDATE tbl_user SET address = '��õ' WHERE id = 'test01'; --���� �����ε� -> ��õ���� ����
DELETE FROM tbl_user WHERE id = 'test02';



