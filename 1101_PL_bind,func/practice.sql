/* �̸�, ���̸� �Է¹޾� ref_tab ���̺��� �����Ͽ� ������ ����(record ����: ���̺��� �����ؼ� ������ ������)�� ���� �Է��� ��
	�Ʒ��� ���� ����ϴ� PL/SQL�� �����ϼ���.
	���) �̸�: xxxx��, ����: xx��
		(�۳� ����: xx��, ���⳪��: xx��) */

set serveroutput on 
set verify off   


accept name prompt '�̸�:';  
accept age prompt '����:';

declare 
	input_data ref_tab%rowtype;  --> ref_tab�� ���� �����Ͱ� �����ϱ� �װŶ� ���� ������ �ٳ�(rowtype)
	--> ������       ���̺��%���̺� ��� �÷� ����	
								 --> ������ ������� ���� ������ (name ref_tab.name%type)
 	
begin  
 	input_data.name := '&name';
 	input_data.age := &age;

    dbms_output.put_line('�̸�:'||input_data.name||'��, ����: '||input_data.age||'��');  
    dbms_output.put_line('�۳⳪��: '||(input_data.age-1)||'��, ���⳪��:'||(input_data.age+1)||'�� �Դϴ�.');

end;
/