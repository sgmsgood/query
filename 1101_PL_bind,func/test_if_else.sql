-- �̸��� �Է¹޾� '������'�̸� '����'�� ����ϰ�
-- 

set serveroutput on
set verify off

accept name prompt '�̸��� �Է��ϼ���: '

declare
	name varchar2(30) := '&name';


begin                      
	if name = '������' then
		dbms_output.put('����');
	else
		dbms_output.put('���');
	end if;

	dbms_output.put_line('('||name||') �� �ȳ��ϼ���.');
end;
/ 