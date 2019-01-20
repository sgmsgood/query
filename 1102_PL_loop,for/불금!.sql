set serveroutput on 

declare

begin
	
	msg := '오늘은 금요일 입니다.'; 

	for i in 1..length(msg) loop
		dbms_output.put_line(substr(msg,'i',1));
	end loop;
	
end;
/