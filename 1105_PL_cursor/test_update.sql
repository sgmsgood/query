-- PL/SQL���� update ��� 

set serveroutput on


declare
	cnt number;
begin
	
	update cp_emp2
	set    sal = 3500
	where  empno = 2221;
	
	-- �Ͻ���(������) Ŀ�� sql�� ����Ͽ� ������ ���� ���� ����  (�Ƚᵵ �Ǳ� �Ԥ���)
	cnt := sql%rowcount; 
	
	-- ����� ����� 1���� ���� transaction�� �Ϸ��ϰ�  
	-- �׷��� �ʴٸ� �۾��� ��� 
	if cnt = 1 then 
		dbms_output.put_line(cnt||'���� ����Ǿ����ϴ�.');
		commit;
		
	else
		dbms_output.put_line('��ȸ�� ����� �������̰ų� �����Ƿ� �����۾��� ����Ͽ����ϴ�.');
		rollback;
					
	end if;
	
--	dbms_output.put_line(sql%rowcount||'���� ����Ǿ����ϴ�.');
	
	
	
	
end;
/
