-- 입력되는 주민번호의 유효성 검증
-- 글자수가 14자리, 7번째 자리에 '-'이 존재하는지

create or replace function check_ssn (ssn char)
return varchar2
is 
	result_msg varchar2(7) := 'fail';
		
begin
	if length (trim(ssn))=14 and instr(ssn,'-')=7 then 
	  result_msg := 'success';
	end if;         
	
	return result_msg;
	
end;
/
