-- �����ȣ�� �Է¹޾� cp_emp2���̺��� �����ȣ�� ��ġ�ϴ�
-- ����� �����ϴ� PL/SQL�� �ۼ��ϼ���.

set verify off
set serveroutput on

accept empno prompt '�����ȣ: '

declare
	i_empno cp_emp2.empno%type := &empno;
	cnt number;
begin    
	-- delete�� where�������� �÷���� �������� ���ٸ� ��� ������ �Ǵ��Ͽ� ��� ���ڵ带 �����Ѵ�.
	-- �Ǵ��Ͽ� ��� ���ڵ带 �����Ѵ�.
	-- ������� �÷����� ���е� �� �ֵ��� �̸��� �����ؾ��Ѵ�.
	
	delete from cp_emp2
	where empno = i_empno;
	
    cnt := sql%rowcount;
    
    if cnt = 1 then
    	dbms_output.put_line(cnt||'�� ���ڵ� ����');
    	commit;
    else
		dbms_output.put_line(cnt||'�������� ���ڵ�� ������ �� �����ϴ�.');
		rollback;      
    end if; 
    
    
end;
/