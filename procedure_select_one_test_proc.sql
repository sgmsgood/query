/*
��������� �Է¹޾� �����, ����, ����, �Ի����� ��ȸ�ϴ� procedure
*/                                                                                

create or replace procedure select_one_test_proc(
	i_empno in number, emp_cur out sys_refcursor, err_msg out varchar2)

is 

begin 
	err_msg := '����';	
      open emp_cur for 
      select ename,sal,job,to_char(hiredate,'yy-mm-dd day') hiredate
      from test_proc
      where empno =i_empno;
    
    exception   
    	when others then
    	err_msg := '�����߻�:' || sqlerrm;
end;
/
