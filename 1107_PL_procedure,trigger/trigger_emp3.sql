-- cp_emp ���̺� ���ڵ尡 �߰� �Ǹ�
-- cp_emp3 ���̺� �����ȣ, �����, �μ���ȣ, ��� , ������ �߰��ϴ� trigger�� ���弼��.
-- �μ���ȣ�� emp ���̺��� �����ȣ�� 7788�� ����� ������ ��ȣ�� �߰��ϰ�
--  ������ 2000 ���ϰ� �߰��Ǹ� cp_emp3 ���̺��� ������ 500�� ���Ͽ� �߰����ּ���.

create or replace trigger tri_emp3
after insert on cp_emp
for each row 
declare
	empno number;

begin      

	select empno
	into empno
	from emp
	where empno = 7788;

 		
	insert into cp_emp3(empno, ename, deptno, job, sal) 
		values ( emp.empno, :new.ename, :new.deptno, :new.job, :new.sal);
		
end;
/
