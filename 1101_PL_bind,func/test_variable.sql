set serveroutput on

declare
-- 1. ������ ����: ������ ��������(ũ��)
	name varchar2(60);
-- ���̺��� �÷� ���������� �����Ͽ� ���� ����
	e_name emp.ename%type;
-- ���̺��� ��� �÷��� �����Ͽ� ���� ���� (record type)
	row_type cp_emp%rowtype; -- cp_emp��� ��� �÷� ��� ����
begin
-- 2. �� �Ҵ� : ������ := ��;
	name := '����ȣ�˱浿';
	dbms_output.put_line('�̸�:'||name);
	name := '������';
-- 3. ���: ���, ��������, ���Ҵ�
	dbms_output.put_line('�̸�:'||name);

	e_name:='������';
	dbms_output.put_line('�������� ���:'||e_name);

-- record type �������: ������.�÷���
	row_type.empno :=1111;
	row_type.ename := '���ü�';
	row_type.hiredate := sysdate;
	row_type.sal :=2800;

	dbms_output.put_line('�����ȣ:'||row_type.empno||', �����:'||row_type.ename||
						', �Ի���:'||to_char(row_type.hiredate,'yyyy-mm-dd dy')||
						', ����:'||row_type.sal);

end;
/





