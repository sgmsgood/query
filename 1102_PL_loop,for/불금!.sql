set serveroutput on 

declare

begin
	
	msg := '������ �ݿ��� �Դϴ�.'; 

	for i in 1..length(msg) loop
		dbms_output.put_line(substr(msg,'i',1));
	end loop;
	
end;
/