--���̺� ����
-- ������̺�(��õ ������)���� �����ȣ, �����, �Ի���, ������ ��ȸ�Ͽ�
-- ��ȸ�� ����� CP_EMP��� ���̺��� ������ ��

create table CP_EMP
as (select empno, ename, hiredate, sal from emp);

select * from CP_EMP;

alter table cp_emp modify sal number(7,2) not null; --> not null ������ �ܵ����� �����Ǿ� �ִٸ� ���簡 �ȴ���
select*from user_constraints; --> ���� Ȯ��

-- cp_emp���̺��� �����ȣ�� 7500~7599 ���̿� ����
-- ����� �����ȣ, �����, �Ի���, ������ ��ȸ�Ͽ�
-- cp_emp2 ���̺��� �����ϰ� �Է��ϼ���.

create table cp_emp2 as (
select *
from cp_emp
where empno between 7500 and 7599);

select * from CP_EMP2;

-- ������ �����ϰ� ���� �� (���ڵ带 ��ȸ���� �ʰ� ���������� ����)
-- ������̺��� �����ȣ,�μ���ȣ, ����, �μ���, ������
-- ���ڵ尡 ��ȸ���� �ʵ��� ��ȸ�� ������.

create table ep_emp3 as(
select empno, ename, deptno, job, sal
from emp
where 1=0);
--where 1=0;  => �� ���̺��� ���ڵ� �� ��� �ź�
-- where 1=1; => �� ���̺��� ���ڵ� �� ��� ����

select * from EP_EMP3;


