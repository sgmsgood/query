-- procedure �ȿ��� ������ ��ȸ�� ��
-- dept ���̺��� ��� �μ������� ��ȸ�Ͽ� procedure�� ����
-- �����ϴ� procedure 

create or replace procedure select_all_dept(cur_dept out sys_refcursor)
is
-- 	dept_data dept%rowtype;  
 	
begin
	open cur_dept for 
		select deptno, dname, loc
		from dept;                                                 
		
--	sys_refcursor�� ����� ������ �ܺο��� ó������ �޾�
-- ����� �� �ֵ��� Ŀ���� ������ procedure ������ �������� �ʴ´�.

--	loop
--		fetch cur_dept into dept_data;
--		exit when cur_dept%notfound;
--	end loop;
         
	close cur_dept;
	
end;
/
                     

-- 1. bind���� ����: var ������ refcursor
-- 2. ����: 		      exec ���ν�����(: ������)
-- 3. ���: 			 print ������
