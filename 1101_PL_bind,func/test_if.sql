-- ���� if: ���ǿ� �´� ��쿡�� �ڵ带 ���� �ؾ��� ��
-- �̸��� �Է¹޾� �̸��� '����ȣ'��� �̸���� ���� 
-- '���� ��ģ'�� ����Ͻÿ�. �ٸ� �̸��� �̸��� ����Ͻÿ�.
 
set serveroutput on
set verify off

accept name prompt '��~ �Ͷ�ť���~??? ' 

declare  -- declare�� ����� ������ �׻� ';'����
--	name varchar2(15);
	name table_primary.name%type := '&name';
	
begin       
	if name ='����δ��' then
	    dbms_output.put_line('�˰����!');
	end if;      
	
	dbms_output.put_line(name||'����������');
end;
/

