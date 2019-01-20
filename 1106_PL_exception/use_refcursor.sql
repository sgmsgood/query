-- sys_refcursor�� ���
-- Ŀ���� ������� �ܺη� ������ �� �ַ� ����մϴ�.
-- ������̺��� �Ŵ�����ȣ�� �Է¹޾� �Ŵ����� �����ϴ� �����
-- �����ȣ, �����, �Ի���, �μ���ȣ, ������ ��ȸ�ϼ���.
-- ��, �Էµ� �Ŵ��� ��ȣ�� emp ���̺� �����ϴ� �Ŵ��� ��ȣ�� ���� �˻��� �����մϴ�.
-- 7839,7782,7698,7902,7566,7788 (��ȣ�� �ٲ� ���� �ִ�.)

set verify off
set serveroutput on
	
	accept mgr prompt'�Ŵ�����ȣ: '

declare
	i_mgr number; 
	
	-- sys_refcursor ����: Ŀ���� sys_refcursor
	cur_mgr sys_refcursor;
	
	-- ��ȸ����� ������ record type ����
	type rec_emp is record( empno emp.empno%type,
							ename emp.ename%type,
							hiredate emp.hiredate%type,
							deptno emp.deptno%type,
							sal emp.sal%type
							);
	emp_data rec_emp;
	
	

begin
	-- �Էµ� �Ŵ��� ��ȣ�� �����ϴ��� �˻�
	for temp_mgr in (select distinct mgr from emp where mgr = &mgr) 
	loop
		
	i_mgr := temp_mgr.mgr;

	end loop;
	
	if i_mgr is not null then 
				
		--2. Ŀ�� ����: ��ȸ ������ �ۼ�
		open cur_mgr for
			select empno, ename, hiredate, deptno, sal
			from emp
			where mgr = i_mgr;
		-- ��ȸ�� ����� ������ �� �ִ� ������ �ʿ��ϴϱ� declare�� ���� record ���� ����� 
			                  
		--3. ����
		loop 
		 	fetch cur_mgr into emp_data;
		 	exit when cur_mgr%notfound;
		 	
		 	dbms_output.put_line(emp_data.empno||' '||
		 						 emp_data.ename||' '||
		 						 to_char(emp_data.hiredate,'yyyy-mm-dd')||' '||
		 						 emp_data.deptno||' '||
		 						 emp_data.sal);		   
		end loop; 
		dbms_output.put_line('�Ŵ��� ����'); 
		
		--4. Ŀ�� �ݱ�
		close cur_mgr;
	
	else   
	    
		dbms_output.put_line(&mgr||'�Ŵ����� �������� �ʽ��ϴ�.');

	end if;

end;
/
