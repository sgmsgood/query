create or replace function check_hiredate (hiredate date)
return varchar2
is            
	result_msg  varchar(12):= '���ټ�';
	
begin
	
	if (to_char(sysdate,'yyyy') - to_char(hiredate,'yyyy')) < 10 then
		result_msg  := '�ܱ�ټ�';
	end if;	
	
	return result_msg;
	
end;
/
