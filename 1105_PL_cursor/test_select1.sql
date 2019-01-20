-- �����ȣ�� �Է¹޾� �����, ����, ����, �Ի���, �μ���ȣ�� ��ȸ
-- ��, ������ 2000 �̸��̶�� ���� * 2 �����Ͽ� ����ϰ�
-- �μ���ȣ�� 10, 20���̶�� �Ի����� ��-��-���� ��������
-- �׷��� �ʴٸ�, ��-��-���� �������� ����ϼ���.

set verify  off
set serveroutput on

accept empno prompt '�����ȣ�� �Է��ϼ���:'

declare
	i_empno emp.empno%type := &empno;
	ename emp.ename%type;
	sal emp.sal%type;
	job emp.job%type;
	hiredate emp.hiredate%type;
	deptno emp.deptno%type;

	date_format varchar2(30) := 'yyyy-mm-dd';

begin

	select ename, sal, hiredate, deptno, job
	into   ename, sal, hiredate, deptno, job
	from   emp
	where  empno = i_empno;

	-- ������ 2000�̾��� ����� ���� ó��
	if sal < 2000 then
	 	sal := sal *2;
	end if;

	-- �μ� ��ȣ�� ���� ��¥ ��� ���� ���� (mm-dd-yyyy)
	if deptno in(10,20) then
		date_format := 'mm-dd-yyyy';	
	end if;
        dbms_output.put_line(i_empno||'�� ��� ����');
        dbms_output.put_line('�����: '||ename||', ����: '||job||', ����: '||sal||', �μ���ȣ: '||deptno||', �Ի���: '
        						||to_char(hiredate,date_format));
        

	exception
	when no_data_found then
		dbms_output.put_line('�Է��Ͻ� ['||i_empno||']�� ����� �������� �ʽ��ϴ�.');

end;
/
