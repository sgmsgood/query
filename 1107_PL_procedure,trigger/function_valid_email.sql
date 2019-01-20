-- 이메일의 유효성 검증은 [6자 이상이면서  @'과 '.' 포함]을 검증하는 함수를 만들꼬야
-- 검증에 통과하면 '유효, '무효'

create or replace function valid_mail(mail varchar2)
return char
is
	result_msg char(6) := '무효';
	

begin
	if length(mail) > 6 and instr(mail,'@') != 0
		and instr(mail,'.')  <>0 then
		result_msg := '유효';
	
	end if;

    return result_msg;
end;

