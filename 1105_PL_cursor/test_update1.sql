-- �����ȣ, �����, ������ �Է¹޾�
-- �����ȣ�� ��ġ�ϴ� ����� ������ ������� Cp_emp2���̺��� �����ϼ���.
-- ��, ������ 3000������ ��, 1000�� ���� �������� �����Ѵ�.
set verify off
set serveroutput on

-- accept �ڿ��� �÷��� �ֱ�

	accept empno prompt '�����ȣ: '
	accept ename prompt '�����: '
	accept sal prompt '����: '

declare
	i_empno cp_emp2.empno%type := &empno;
	i_ename cp_emp2.ename%type := '&ename';
	i_sal cp_emp2.sal%type:= &sal;

	cnt number;
begin

	if i_sal < 3001 then
		i_sal := i_sal + 1000;
	end if;
	-- update�� set�� where���� ������� �÷����� ���е� �� �ֵ���
	-- �̸��� �ٸ����Ͽ� �ۼ��ؾ��Ѵ�.

	update cp_emp2
	set sal = i_sal, ename = i_ename
	where empno = i_empno;

	cnt := sql%rowcount;
	
    if cnt = 1 then
    	dbms_output.put_line(cnt||'���� ����Ǿ����ϴ�.');		
		commit;
	else 
		dbms_output.put_line(cnt||': 1���� �ƴ϶� ������ ��ҵ�.');
		rollback;
	end if;
		
end;
/


