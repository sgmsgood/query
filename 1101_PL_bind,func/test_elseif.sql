-- 다중 if (else ~ if)
-- 점수를 입력받아 점수가 0보다 작은 경우 '0보다 작아서 실패'
-- 100보다 큰 경우 '100보다 커서 실패' / 그렇지 않은 경우 '성공'

set serveroutput on
set verify off

accept score prompt '점수: '

declare
  score number := &score;

begin
   
   	dbms_output.put(score); --> 출력에 score을 써주기 위해서. 아래 식에서는 출력에 점수값이 안 나옴.
    
  	if score < 0 then
  		dbms_output.put_line('점은 0보다 작아서 실패');
  	elsif score > 100 then
  		dbms_output.put_line('점은 100보다 커서 실패');
  	else 
  		dbms_output.put_line('점은 입력성공 o(^^o)(o^^)o');
	end if;

end;
/