-- ���̺� �����ȣ, �����, ������ ����ڿ��� �Է¹޾�
-- ������ 5000�̻��̸� CP_EMP2���̺� 
-- �߰��ϰ� 5000���϶�� CP_EMP2�� �߰��ϴ� pl/sql �ۼ�
-- cp_emp3���̺� �߰��Ǵ� ����� �μ���ȣ�� ������ 10������ �߰��ϼ���.

set verify off
set serveroutput on

	accept empno prompt '�����ȣ: '
	accept ename prompt '�����: '
	accept sal prompt '����: '
	

declare
	empno cp_emp2.empno%type := &empno;
	ename cp_emp2.ename%type := '&ename';
	sal cp_emp2.sal%type:= &sal;
	
begin

	if sal >5000 then
	   insert into cp_emp3(empno, ename, deptno,sal)
	   values (empno, ename, 10, sal);
	   
	   dbms_output.put_line ('������ 5000�̻��̹Ƿ� cp_emp3 ���̺� �߰��Ͽ����ϴ�.');
	   
	   
	else
		insert into cp_emp2(empno, ename, hiredate, sal)
	   values (empno, ename, sysdate, sal);
	   
	   dbms_output.put_line ('������ 5000�̻��̹Ƿ� cp_emp2 ���̺� �߰��Ͽ����ϴ�.');
	   
	
	end if;
	
	commit;
           
end;
/


