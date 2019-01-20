-- insert subquery
-- �ܼ���
-- cp_emp3�� �Ʒ��� ���� ���ڵ带 �߰��϶���
-- �����ȣ: 1111, �����: ����ö, �μ���ȣ: 10, ����: ���
-- ����: emp ���̺��� �����ȣ�� 7566�� ����� ������ ������ �������� �߰�

insert into cp_emp3 (empno, ename, deptno, job, sal)
values (1111, '����ö', 10, '���',
		(select sal from EMP where empno = 7566));


-- ������ ���������� ���� �ϴ� ������ �������� ���Ǹ� error
-- �������� ������ ���
insert into cp_emp3(empno, ename, deptno, job, sal)
values (1111, '����ö', 10, '���',
		(select sal from EMP where empno = 7566));

-- �÷� �ϳ��� ���� �־�� �ϴ� ���� �÷� �������� ��ȸ�Ǹ�
-- �ʰ��ϴ� ���� ������ ���� �����Ƿ� error
insert into cp_emp3(empno, ename, deptno, job, sal)
values (1111, '����ö', 10, '���',
		(select sal, deptno from emp where empno = 7566));
commit;
-- ������(������) ��������
-- emp ���̺��� �μ���ȣ�� 30���� �μ��� �����ȣ, �����, �μ���ȣ
-- ����, ������ ��ȸ�Ͽ� ep_emp3 ���̺� �߰�

savepoint a;
insert into cp_emp3
(select empno, ename, deptno, job, sal from emp
where deptno=30);

select *from cp_emp3;

create table test(job varchar2(9), sal number(7,2), hiredate date);

alter table test add input_date date;
alter table test modify hiredate varchar2(7);


--������̺��� 1981-02�� �Ի��� ����� ����, ������,
	--�Ի��-��, �Է����� test ���̺� �߰�  (�ùٸ� ������ �ƴ�. ������ ��������)

insert into test
(select job, sum(sal), to_char(hiredate,'yyyy-mm') hiredate, sysdate
from emp
where to_char(hiredate,'yyyy-mm') = '1981-02'
group by job, hiredate);

select * from test;



