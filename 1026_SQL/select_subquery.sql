--�ܼ���:
-- scalar subquery: select ��ȸ�ϴ� �÷��� ���������� ����ϴ� ��.
-- emp ���̺��� �����ȣ, �����, �μ���ȣ (emp�� ����)/ �μ��� (dept)��
-- �μ����� dept���̺� ����
-- �����Ͽ� ����ؾ��Ѵ�.(���̺��. �÷���)

select * from dept;
select * from emp;

select empno, ename, deptno, (select dname from dept where dept.deptno = emp.deptno)
--> dept.deptno: dept ���̺��� deptno���� ����
from emp;

-- cp_emp3���̺� ��� ���̺��� �����ȣ
insert into cp_emp3
(select empno, ename, deptno, job, sal from emp
 where deptno in (10, 30));

commit;

-- ������̺��� �����ȣ�� '7698'�� ����� �μ���ȣ��
-- ���� �μ��� cp_emp3 ���̺��� ��ȸ
-- ��ȸ �÷��� �����ȣ, �����, �μ���ȣ, ������ ��ȸ�մϴ�.

select empno, ename, deptno, job
from   cp_emp3
where deptno = (select deptno from emp where empno = 7698);
--where deptno = (select deptno from emp where empno  7698);
select *from cp_emp3;

-- cf) �÷����� ������ �������� in, any, all, exists
-- ������̺��� �����ȣ�� '7698'�� ����� �μ���ȣ��
-- ���� �μ��� cp_emp3 ���̺��� ��ȸ
-- ��ȸ �÷��� �����ȣ, �����, �μ���ȣ, ������ ��ȸ�մϴ�.

select empno, ename, deptno, job
from   cp_emp3
where deptno in (select deptno
					from emp
					where empno in (7698,7782));

-- �ܺΰ� �Է¹ޱ�
-- ���������� &������ - �Է�â ���� �Է�â�� �Է��� ���� ���� ����
-- exist: ���������� ���� �����Ѵٸ� �ٱ� ������ ����
-- '&������'�� �������� �״�� ���� �Ǵ´�� ���ڿ��� �Է��� ��� ' '�� �������� ������ �߻����� �ʴ´�.

select*from emp where deptno = &deptno;
select*from emp where ename  = '&ename';

-- exist: ���������� ���� ������ ������ �ٱ� ������ ���� switch on
-- ������̺��� �ԷµǴ� �μ���ȣ�� �����Ѵٸ� �����ȣ, �����, �Ի���, �μ���ȣ�� ��ȸ

select empno, ename, hiredate, deptno
from emp
where exists(select deptno from emp where deptno = &deptdno);

/* all (=and) - < all: ���������� ��ȸ�� �� �� ���� ���� ������ �� ����
				> all: ���� ū ������ �� */
-- �Էµ� �μ����� ���� ������ ���� �������,
-- ������ ���� ����� ��ȸ


select empno, ename, sal, deptno
from emp
where sal > all(select sal from EMP where deptno = &d_no);

/* any (=or) - 	< any: ���������� ��ȸ�� �� �� ���� ū ������ �� ����
				> any: ���� ���� ������ �� */
-- �Էµ� �μ����� ���� ������ ���� �������,
-- ������ ���� ����� ��ȸ

select empno, ename, sal, deptno
from emp
where sal > any (select sal from EMP where deptno = 10);

----------------------------------------------------------------------------
-- rownum: ��ȸ�� ����� �������� ��ȣ�� ���̴� ���� �÷�
----------------------------------------------------------------------------

-- ��ȣ, �����ȣ, �����, �Ի��� ��ȸ
-- ��, ��ȣ�� ��ȸ����� 1 ���� ���������� �ο��Ǿ�� �Ѵ�.

select  rownum, empno, ename, hiredate
from emp
where deptno in (10, 20);


-- order by�� ���� ���Ǹ� ��ȣ�� ���̰� �ȴ�.
select  rownum, empno, ename
from emp
order by ename;

-- rownum�� where ������ ����ϸ� 1�����ʹ� ��ȸ�� �ǳ�
-- 1���� �ƴ� ��ȣ�� ��ȸ���� �ʴ´�.
-- ������̺��� �����ȣ, �����, �Ի���, ������ ��ȸ�ϼ���.
-- ��, ����� ��ȸ������ 1������ 5�������� ���
select empno, ename, hiredate, sal
from   emp
where rownum between 1 and 5;


-- ������̺��� �����ȣ, �����, �Ի���, ������ ��ȸ�ϼ���.
-- ��, ����� ��ȸ������ 3������ 5�������� ��� --> �����߻�

-- ������ ��������
-- ��ȸ���(inline view)�� ������ ����ȸ
-- ����
/*
	select �÷���,,,
	from (select,,,))
*/

select rownum, empno, ename, sal, hi
from (select rownum, empno, ename, sal, hiredate hi
		from emp
        order by sal);

-- ������̺��� ���� �������� �Ի��� ������� 5���� ��ȸ�غ�����
-- ��ȸ�÷��� �����ȣ, �����, �Ի����� ��ȸ�϶���

select  rownum,empno, ename, hiredate  --> 2) ���ĵ� �ڷῡ ��ȣ�� �Űܼ� �������.
from  (select empno, ename, hiredate
		from emp
		order by hiredate desc) --> 1) hiredate�� ���� ������� ������ ���ְ�
where rownum between 1 and 5; --> 3) ��, rownum�� ���ڰ� 1~5�������� �͸� �������� ���ھ�.

-- ������̺��� ���� �������� �Ի��� ���� ������� 5���� ��ȸ�غ����� (2~6)
-- ��ȸ�÷��� �����ȣ, �����, �Ի����� ��ȸ�϶���
select rownum, rr, empno, ename, hi  --> 3)
from (select rownum RR, empno, ename, hi --> 2) ���ĵ� �ڷῡ ��ȣ�� �Ű�
		from (select empno, ename, hiredate hi --> 1) hiredate�� ���� ������� �����ϰ�
				from emp
				order by hiredate desc))
where rr between 2 and 6;



select * from user_constraints
