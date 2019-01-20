-- 이름을 입력받아 '이재찬'이면 '반장'을 출력하고
-- 

set serveroutput on
set verify off

accept name prompt '이름을 입력하세요: '

declare
	name varchar2(30) := '&name';


begin                      
	if name = '이재찬' then
		dbms_output.put('반장');
	else
		dbms_output.put('평민');
	end if;

	dbms_output.put_line('('||name||') 님 안녕하세요.');
end;
/ 