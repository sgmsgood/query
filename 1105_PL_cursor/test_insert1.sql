-- ���̺� �����ȣ, �����, ������ ����ڿ��� �Է¹޾�
--	CP_EMP2���̺� �߰��ϴ� PL/SQL �ۼ�
-- ��, ������ 9000�̻� �ԷµǸ� 9000���� �����Ͽ� �߰�
-- �Ի����� �߰��Ǵ� ������ ��¥�� �߰��մϴ�.

set verify off
set serverout on

accept empno prompt '�����ȣ: '
accept ename prompt '�����: '
accept sal prompt '����: '

declare
	empno cp_emp2.empno%type;
	ename cp_emp2.ename%type;
	sal number := &sal;


begin
	empno := &empno;
	ename := '&ename';

	if sal > 9000 then  -- sal�� 9000�̻��̶��,
		sal := 9000;   -- sal�� 9000���� �ٲ��.

	end if;

    -- ���� ������ �Ŀ� SQL���� ����
	insert into cp_emp2(empno, ename, hiredate, sal)
	values(empno, ename, sysdate, sal);

	commit;
	dbms_output.put_line(empno||'�� ����� ������ '||sal||'�� �Է��Ͽ����ϴ�.');

end;
/
;