--���ڿ� ������ like���� ����� ���̺�

create table test_like(
	num number,
	name varchar2(30),
	loc varchar2(300),
	highschool varchar2(60)
);

insert into test_like (num, name, loc, highschool) values (1, '������','����� ������ ���ﵿ','������');
insert into test_like (num, name, loc, highschool) values (2, '������','����� ���α� ������','������');
insert into test_like (num, name, loc, highschool) values (3, '�ڿ���','��⵵ ������','���հ�');
insert into test_like (num, name, loc, highschool) values (4, '����ö','����� ���ʱ� ���ʵ�','�԰�');
insert into test_like (num, name, loc, highschool) values (5, '��������','���� ��絿','�ð�');
insert into test_like (num, name, loc, highschool) values (6, '������','��⵵ ������ �ΰ赿','���');

select * from test_like;

commit; --commit�� �ؾ� �ٸ� ��� �����ڵ� �� �� �ֽ���.

--like ������ %, _��ȣ�� ���� ���.
--  % :��� ���ڿ�
--  _ :�� ����

-- test_like ���̺��� '�����'�� ��� ����� ��ȣ, �̸�, ��Ű�� ��ȸ

select  num, name, highschool
from	test_like
where   loc like '�����%';

-- �̸��� '��'���� ������ �л��� ��ȣ, �̸�, �ּ� ��ȸ

select num, name, loc
from test_like
where name like '%��';

-- �̸��� '��'�� ���ԵǾ� �ִ� �л��� ��ȣ, �̸�, �ּ�, ����б��� ��ȸ�ϼ�

select num, name, loc, highschool
from   test_like
where  name like '%��%';

-- cf)�̸��� 3�����̸� ��� ���ڰ� '��'�� ����� ��ȣ�� �̸��� ��ȸ�غ���
select num, name
from   test_like
where  name like '_��_';

-- �̸��� 4������ �л��� ��ȣ, �̸�, ����б����� ��ȸ
select num, name, highschool
from   test_like
where  name like '____';

-- �����ּҸ� �����ϴ� ���̺�
create table zipcode(
	zipcode char(7),
	sido char(6),
	gugun varchar2(25),
	dong varchar2(60),
	bunji varchar2(25),
	seq number(5)
);

alter table zipcode modify dong varchar2(100);

truncate table zipcode;

select *
from zipcode;

truncate table zipcode;

-- �츮���� �����ּҸ� ��ȸ
-- �� �̸��� �Է��ϼ���
select zipcode, sido, gugun, dong, bunji, seq
from  zipcode
where dong like '�󵵵�%';

-- ������̺��� ����� 'L'�� �ΰ� ����ִ� �����
-- �����ȣ, �����, �Ի����� �����غ���

select * from emp;

select  empno, ename, hiredate
from    emp
where   ename like '%A%A%';

select deptno
from emp; -- ���� ���� ������ ����

-- �ߺ�����
-- ������̺��� �Ŵ�����ȣ�� ��ȸ (��, �ߺ��Ǵ� �Ŵ�����ȣ�� �����������)
-- distinct: ���� �Լ��� ����Ͽ� �׷캰 ���踦 ������ �� ����.

select distinct mgr, /*ename --> ������ �÷��� �����ؼ� �̿� */
from emp;

--group by: �׷����� �������� ���� �÷��� ���� ���Ǹ� error�߻�
select   mgr /*, ename*/
from emp
group by mgr;

