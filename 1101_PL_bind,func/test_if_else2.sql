-- �����, ��ǰ��, ������ �Է� �޾� ó���ϴ� PL/SQL�ۼ�
-- ����� ������� 'Ư�� �Ǵ� �Ϲ�'�� ��쿡�� ������ ���
-- Ư������ ��ǰ������ ��ǰ���� 50%, 
-- �Ϲݰ��� ............. 30%	


set serveroutput on
set verify off

accept grade prompt '�����: '
accept item_name prompt '��ǰ��: '
accept price prompt '����: '

declare
 grade varchar2(9) := '&grade';
 item_name varchar2(90) := '&item_name';
 price number := &price;
 sale number :=0.3;
 
begin

-- if grade='Ư��' or grade='�Ϲ�' then
	if grade in('Ư��', '�Ϲ�') then --> 'Ư��, �Ϲ�' �߿����� ���� ������ �����Ұž�.
	
		if grade = 'Ư��' then
	 		  sale:= 0.5;
	 		
	 		 	
	 		
	    end if;
	    dbms_output.put_line(grade||'���� �����Ͻ� ��ǰ'||item_name||'�̰� ����'||price||'���̸� ���ΰ����� '||(price-price*sale)||'�Դϴ�');	 
 	end if;

end;
/