-- ��ȸ: ������ �Է¹޾� �ش� ������ ������� �������� 
-- out prameter�� �����ϴ� procedure

create or replace procedure select_test_proc_cnt
		(i_job varchar2, result_msg out varchar2, emp_cnt out number, emp_sal out number)
is
	
		temp_sal number := 0;    

begin 
    
    	emp_cnt := 0;
		emp_sal := 0;
		
	if i_job in ('���', '����', '�븮', '����', '����', '����','�̻�','��','����','��ǥ�̻�') then
	
		select count(empno), sum(sal)
		into    emp_cnt, emp_sal
		from   test_proc
		where  job = i_job;
	
--		for rec_emp in
--			(select sal from test_proc where job = i_job)
--		
--		loop
--			--��ȸ�� ����� ������ ����� ����
--			emp_cnt := emp_cnt+1;
--			emp_sal := emp_sal + rec_emp.sal;
--	    end loop;

		if emp_cnt != 0 then
			result_msg := i_job||'���� ��ȸ�� ��� ����.';
		
		else
			result_msg := i_job||'������ ����� �������� �ʽ��ϴ�.';
			emp_sal := 0;
	    end if;
		
		
		
	
	end if;
	

end;
