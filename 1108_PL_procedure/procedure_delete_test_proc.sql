-- 사원번호를 입력받아 test_proc 테이블에서 삭제하는 procedure

create or replace procedure delete_test_proc(
	i_empno number,
	result_msg out varchar2,
	cnt out number)

is 

begin
	
	delete from test_proc
		where empno=i_empno;
	cnt := sql%rowcount;   
	
	commit;
	
	if cnt = 1 then
		result_msg := i_empno||'번 사원 퇴사. 행복하세요~!!';
		
	else
		result_msg := i_empno||'번 사원없음!';
	
	end if;

end;
/
