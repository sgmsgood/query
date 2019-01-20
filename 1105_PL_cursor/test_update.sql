-- PL/SQL에서 update 사용 

set serveroutput on


declare
	cnt number;
begin
	
	update cp_emp2
	set    sal = 3500
	where  empno = 2221;
	
	-- 암시적(묵시적) 커서 sql을 사용하여 변경한 행의 수를 얻음  (안써도 되긴 함ㅎㅎ)
	cnt := sql%rowcount; 
	
	-- 변경된 사원이 1명일 때만 transaction을 완료하고  
	-- 그렇지 않다면 작업을 취소 
	if cnt = 1 then 
		dbms_output.put_line(cnt||'건이 변경되었습니다.');
		commit;
		
	else
		dbms_output.put_line('조회된 사원이 여러명이거나 없으므로 변경작업을 취소하였습니다.');
		rollback;
					
	end if;
	
--	dbms_output.put_line(sql%rowcount||'건이 변경되었습니다.');
	
	
	
	
end;
/
