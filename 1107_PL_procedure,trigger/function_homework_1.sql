create or replace function check_hiredate (hiredate date)
return varchar2
is            
	result_msg  varchar(12):= '장기근속';
	
begin
	
	if (to_char(sysdate,'yyyy') - to_char(hiredate,'yyyy')) < 10 then
		result_msg  := '단기근속';
	end if;	
	
	return result_msg;
	
end;
/
