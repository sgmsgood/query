/* ��ǰ��, �����, ������ �Է¹޾�
	������� 'Ư��'�̶�� ��ǰ������ 30%�� ���ε� �������� ����ϼ���.
	���) (�Ϲݵ��) xx��� ���� xxx��ǰ�� ������ xx���Դϴ�.
	     (Ư�� ���) ��ǰ���� xx�� ���ΰ� xx��
*/
	      
set serveroutput on
set verify off 

accept class prompt '�����:'
accept product prompt '��ǰ��:'
accept price prompt '����:'

declare
	class varchar2(9);
	product varchar2(60);
	price number;

begin 
   	class := '&class';
 	product := '&product';
 	price := &price;           
         
	if class = '�Ϲ�' then 
	dbms_output.put('��ǰ���� '||(price*0.7)||'�� ���ΰ�: '||(price * 0.3)||'��');
	end if;   
    dbms_output.put_line(class||'��� ���� '||product||'��ǰ�� ������ '||price||'�� �Դϴ�.');
end;
/
