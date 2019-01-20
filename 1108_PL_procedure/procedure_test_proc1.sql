-- �����ȣ, ����, ������ �Է¹޾� test_proc ���̺���
-- �����ϴ� procedure

--1.������ ���, ����, �븮, ����, ����, ����, �̻�, ��, ����, ��ǥ�̻簡 �ԷµǾ��� ���� �����Ѵ�.

-- 2. ������ ���� �������� �۴ٸ� ���� �������� 5% �λ������ ����
-- (2500 ���϶�� 2500����, 8000 �̻��̶�� 8000���� �����Ͽ� �߰��Ѵ�.)

create or replace procedure update_test_proc
		(i_empno number,
   		 i_job varchar2,
       	 sal number,
       	 row_cnt out number,
       	 result_msg out varchar2)
       	
is 
   temp_sal number;
    

begin 

	row_cnt:= 0;
	--1.
	if i_job in ('���', '����', '�븮', '����', '����', '����','�̻�','��','����','��ǥ�̻�') then
	--2.
		select sal
		into  temp_sal
		from test_proc
		where	empno=i_empno;
		
		
  	 	if sal < temp_sal then
   		temp_sal := trunc(temp_sal+temp_sal*0.05,0);
   	
   		else
   		temp_sal := sal; 
   		
   		end if; 
   	
   	update test_proc
   	set		 job = i_job, sal = temp_sal 
   	where  empno = i_empno;
   	
   	row_cnt := sql%rowcount;
   	
   	commit;
   	
   	result_msg := i_empno||'�� ����� ������ ����Ǿ����ϴ�. ���ÿ���: '||sal||', Ȯ������: '||temp_sal;
   		
		
	else
	  result_msg :=i_job||'�� �系 ������ �ƴմϴ�.';
	end if;   
	
	exception
	when no_data_found then
			result_msg := i_empno||'�� ����� �������� �ʽ��ϴ�.';
	when others then 
			result_msg := sqlerrm;
	
	
end;
/
