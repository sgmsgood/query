set serveroutput on --(ó���� ������, ��� ����)
declare
     -- ��������
begin 
	 -- �ڵ� �ۼ�
	 -- put_line�� ��� �� ���� ����
	dbms_output.put_line('���̷� PL/SQL');
	dbms_output.put_line('������ �����');
	 -- put�� ��� �� ���� �������� ����
	dbms_output.put('������ �׹��� PL/SQL');
	 -- put���θ� ����� ����Ǹ� ��³����� ��µ��� ���� 
	dbms_output.put_line('�𷹴� �p PL/SQL');
end;
/



