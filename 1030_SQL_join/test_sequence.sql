--sequece: ���������� �����ϴ� ���� ����ϴ� ��ü
-- 1~9999999���� 1�� �����ϴ� ������ ����

create sequence seq_test
increment by 1
start with 1
maxvalue 9999999;

select*from user_sequences;
--currval�� �޸𸮿� �ö���ִ� �������� ���� ��ȣ�� ��� ���� ��
select seq_test.currval
from dual;

select seq_test.nextval
from dual;

--�������� ���� ���п��� �������� �����
insert into cp_emp(empno, ename, hiredate, sal)
values (seq_test.nextval,'�ȱ��',sysdate,300);

-- ������ ����: drop sequence ��������
drop sequence seq_test;

create sequence seq_test
increment by 2
start with 1
maxvalue 9999999
cache 40
cycle;

select * from user_sequences;

select seq_test.nextval
from dual;

-- �����ϴ� ���� ������ pk�� ����ؾ��� �� sequence ����ϸ� ����
-- concat lpad sequnce ����ؼ� w�����ϴ� �� �� ����ϰ� ��.
