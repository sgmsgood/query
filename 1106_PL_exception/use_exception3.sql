-- �� ���� �Է¹޾� ���� ���� ����ϴ� pl/sql

set serveroutput on
set verify off

accept num1 prompt '��1: '
accept num2 prompt '��2: '

declare
	result number;
	
begin
	result := &num1/ &num2;
	dbms_output.put_line(&num1 ||'/'|| &num2 ||'='||result);
	
	exception
--	when zero_divide then
--		dbms_output.put_line('0���δ� ���� �� �����ϴ�.');
	when others then
--		dbms_output.put_line('�����ڰ� �ν����� ���� ����'||sqlcode);
	
	
	-- ���ܰ� �߻����� �� Oracle���� �����ϴ� ������ ���� �޽����� ����ϰ� ���� �� ����� ���� ����ó���� ��.
	-- raise_application_error(�����ڵ�, '�޽���')
	raise_application_error(-20000,'����� ���� ����');	
end;
/