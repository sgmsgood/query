-- �μ���ȣ�� �Է¹޾� �ش� �μ��� ���� 
-- �����ȣ, �����, �Ի���, ������ ��ȸ
-- �Ի����� '��-��-�� �б�'�� �������� ��ȸ

set serveroutput on
set verify off

accept deptno prompt '�μ���ȣ�� �Է��϶���: '

declare --(declare..begin ���̿����� ������ ���� ����, ����� �� �� ����!)

	--1. ����
	cursor cur_emp is 
		select empno, ename, sal, to_char(hiredate,'yyyy-mm-dd q') hiredate
		from emp
		where deptno = &deptno; 
begin
	
--	open cur_emp; (Ŀ���� 2�� ���� �� ���� ������ �����߻�)
	
	-- 2. for�� ����� ���� (fetch��� X)
	for emp_data in cur_emp loop
		dbms_output.put_line(emp_data.empno||' '||emp_data.ename||' '||emp_data.sal||' '||emp_data.hiredate);
	end loop;
	
-- close cur_emp; (���� for���� ������ ���� ������ ������ 2�� ���� �� ����)	

end;
/