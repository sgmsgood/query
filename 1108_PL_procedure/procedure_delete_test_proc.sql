-- �����ȣ�� �Է¹޾� test_proc ���̺��� �����ϴ� procedure

create or replace procedure delete_test_proc(
	i_empno number,
	result_msg out varchar2,
	cnt out number)

is 

begin
	
	delete from test_proc
		where empno=i_empno;
	cnt := sql%rowcount;   
	
	commit;
	
	if cnt = 1 then
		result_msg := i_empno||'�� ��� ���. �ູ�ϼ���~!!';
		
	else
		result_msg := i_empno||'�� �������!';
	
	end if;

end;
/
