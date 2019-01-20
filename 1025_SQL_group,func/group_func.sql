-- ���� �Լ� - �÷��� ���� �ϳ��� ����� ��ȯ�ϴ� �Լ���
-- count: null�� �ƴ� �÷��� ������ �� ��
-- ������̺� ���ڵ� �� (��� ��), ���ʽ��� �����ϴ� ��� ��, ���ʽ��� �������� �ʴ� ����� ��,
-- �Ŵ����� �ִ� ��� ��

select count(empno), count(comm), count(empno)- count(comm)
		,count(mgr)
from emp;

-- ���� ��, ���ʽ� ��, �ΰǺ� ����
select sum(sal), sum(comm), sum(sal)+sum(comm) labor
from emp;

-- ���� ���, ���ʽ� ���
select   trunc(avg(sal),0), avg(comm)
from emp;

-- �ְ� ����, ���� ������, �ְ�� ������ ����
select max(sal), min(sal), max(sal)-min(sal) diff
--> �̸��� �˰� ������ �������μ� �Ұ���...
from emp;

--**where�������� �����Լ��� ����� �� ����.
--�� ��� ���̺��� ��� �������� ���� �����ϴ� ����� �����ȣ, �����, ����, �Ի��� �Ұ���

select empno, ename, sal, hiredate
from  emp
where sal> avg(sal);

--�����Լ��� group by�� ���� ����ϸ� �׷캰 ���踦 ��ȸ�Ѵ�.
--�μ���ȣ, �μ��� �ο���, �μ��� ���� ��, �������
select deptno,  count(empno), sum(sal), sum(sal), trunc(avg(sal),2), max(sal), min(sal)
from  emp
group by deptno
order by deptno;

-- ������̺��� �Ŵ����� �����ο���, �ְ����� ��������, �ְ����� ���������� ����
select mgr, count(empno), max(sal), min(sal), max(sal)-min(sal)
from emp
where mgr is not null
group by mgr;

-- ��¥�Լ�
-- ��¥�� +�� ����ϸ����� ���Ѵ�.

select sysdate+100
from   dual;

select add_months(sysdate,6)
from dual;

select months_between('2019-11-11',sysdate)
from dual;



select*from emp;


