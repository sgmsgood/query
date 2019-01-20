-- ���� ���ϱ�
-- ��ü ���� ���ϱ�
-- rank( ) over(order by �÷��� ���Ĺ��) -> �ߺ����� �߻� ����

-- ������̺��� �����ȣ�� �����, ����, �������� ��ȸ
select * from EMP;

select  empno, ename, sal, rank() over(order by sal)
from emp;

-- ������̺��� �����ȣ�� �����, ����, �������� ��ȸ
-- ��, �ߺ� ������ �߻����� �ʵ��� ó���Ͽ� ��ȸ�� ��.
select empno, ename, sal, row_number() over(order by sal), ename
from emp;

---------------------------------------------------------------

-- ��ȸ�� ���ڵ带 �׷캰 ����: partition by
-- ������̺��� �����ȣ, �����, ����, �μ��� �������� ��ȸ

select empno, ename, sal, rank() over(partition by deptno order by sal)
from  emp;

-- cf) ���� �� ��ġ��
-- ��ȸ�� ���ڵ带 �׷캰 ����: partition by
-- ������̺��� �����ȣ, �����, ����, �μ��� �������� ��ȸ

select empno, ename, sal, row_number() over(partition by deptno order by sal)
from  emp;

----------------------------------------------------------------------------------
-- rollup, cube
----------------------------------------------------------------------------------
-- rollup: �׷캰 �Ұ踦 ���� �� ���
-- �׷����� ���̴� �÷��� �ϳ��� ��쿡�� �Ѱ谡 ��µȴ�.

-- ������̺��� �μ��� ������ �� ��ȸ�ϰ� �Ѱ踦 ����غ���.
select deptno, sum(sal)
from   emp
group by rollup(deptno); --> �� ���� �������� ���, �� ���� ���� null��

--> cf) �� ���� ���� �տ� ���: cube
select deptno, sum(sal)
from   emp
group by cube(deptno);

-- �����÷��� �׷����� �������� rollup�� �׷캰 �Ұ踦 �������� ����Ѵ�.
-- ��¥�� �ʱ��� ���ƾ� ���� �׷����� ������ �� ����

-- ������̺��� �μ��� ������ ���� �հ� �Ұ� ��ȸ

select deptno, job, sum(sal)
from emp
group by rollup(deptno, job)
order by deptno;

-- ������̺��� �μ���, ������ ������, �������Ұ�, �Ѱ�, ��ȸ�Ǵ� ���ڵ��� �Ұ谡 ��ȸ
select deptno, job, sum(sal)
from emp
group by cube(deptno, job);

select * from user_constraints;

desc dept;
