-- ���̵�, �̸�, ��й�ȣ�� �Է¹޾� TABLE_PRIMARY ���̺� 
-- �����ϴ� PL/SQL 

set verify off
set serveroutput on

accept name prompt '�̸�? '
accept id prompt '���̵�? '
accept passwd prompt '��й�ȣ? '


declare

	name varchar2(30) := '';
		id varchar2(30) := '&id';
	passwd varchar2(30) := '&passwd';
	
begin

	-- ���ڿ��� �Է¹޾� �Է¹��� ���ڿ��� ���̰� ������ �� �ִ�
	-- ũ�Ⱑ �ƴ϶�� ���ܷδ� ó���� �� ���� �ڵ�� ó���ؾ���.
	
	if length('&name') > 10 then
		dbms_output.put_line('�Է°����� ���ڼ��� �ʰ��Ͽ����ϴ�.');
	
	else
		name:='&name';
		
		
		insert into table_primary (name, id, password)
		values (name, id, passwd);
		
		dbms_output.put_line(id||' ���� ������ �߰��Ͽ����ϴ�.');
		
		commit;   
	end if;
	
	exception
	when dup_val_on_index then
		dbms_output.put_line('�Է��Ͻ� ['||id||'] �� �̹� ������Դϴ�.');
		-- ����ó�� ��ü�� �����ϴ� �޽���: sqlerrm
		dbms_output.put_line(sqlerrm);
		-- ����ó�� ��ü�� �����ϴ� �����ڵ�: sqlerrm
		dbms_output.put_line(sqlcode);
	when others then
		dbms_output.put_line('--------'||sqlcode);
	
	


end;
/