-- cp_emp2���� �����ȣ�� 7521�� ����� �����, �Ի���, ������ ��ȸ�Ͽ� ����ϴ�
-- PL/SQL �ۼ�



declare
	ename cp_emp2.ename%type;
	input_date varchar2(10);
	sal cp_emp2.sal%type;
	
begin
	select ename, to_char(hiredate,'yyyy-mm-dd') hiredate, sal
	into ename, input_date, sal 
	from cp_emp2
	where empno =7521;
	
	dbms_output.put_line('��ȸ���: '|| ename||'/'||input_date||'/'||sal||'/'||sql%rowcount);
	
	exception
	when others then
	dbms_output.put_line('�����߻�');

end;
/