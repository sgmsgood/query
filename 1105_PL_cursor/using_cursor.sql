-- ���� ���� ��ȸ�� �� ����ϴ� Ŀ��
-- dept ���̺��� ��� ���ڵ帣 ��ȸ�ϴ� cursor


set serveroutput on

declare
	-- 1. ����: cursor Ŀ���� is select
	cursor cur_dept is 
	 			select deptno, dname, loc
				from dept;
	--2. ��ȸ����� ������ �� �ִ� ���� ����
		deptno dept.deptno%type;
		dname dept.dname%type;
		loc dept.loc% type;
		
	dept_data dept%rowtype;
	
begin
	  open cur_dept;
   		 if cur_dept%isopen then
     close cur_dept;
     	end if;
    --2.����
    open cur_dept;
    
    --3. ���� 
    loop
    	fetch cur_dept into deptno, dname, loc;
----   		dbms_output.put_line (deptno||''||dname||''||loc);
         if cur_dept%found then
         	dbms_output.put_line('���ڵ� ����');
        
         else 
         	dbms_output.put_line('���ڵ� ����');
        	 exit;
         end if;
         	dbms_output.put_line(deptno||' '|| dname||'  '||loc); 
     end loop;
      dbms_output.put_line('��ȸ�� ���ڵ� �� : '||cur_dept%rowcount);
        
     --4. Ŀ�� �ݱ�
     close cur_dept;
end;
/