-- Ư�� ���̺��� ���ϴ� �÷��� ��� ���ڵ带 ��ȸ

-- class4_info ���̺��� �̸�, ��ȣ, ���̸� ��ȸ

/*
select name, num, age
from class4_info;
*/

-- ��ȸ�ϴ� �÷��� "*"�� ����ϸ� ��� �÷��� ��ȸ

/*
select * 
from class4_info;
*/

-- �÷�ũ�� ����
-- 0: �����Ͱ� ���ٸ� 0�� ä�� ���
column num format 0000


-- ���ڿ��� "a���ڼ��� ����"
column name format a6
col ssn format a6
col mail format a20

-- 9: �����Ͱ� �����ϴ� �͸� ���
col age format 999
col eye format 0.000

select * 
from class4_info;