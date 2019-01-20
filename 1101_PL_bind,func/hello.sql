set serveroutput on --(처리는 되지만, 출력 안함)
declare
     -- 변수선언
begin 
	 -- 코드 작성
	 -- put_line은 출력 후 줄을 변경
	dbms_output.put_line('하이룽 PL/SQL');
	dbms_output.put_line('오늘은 목요일');
	 -- put은 출력 후 줄을 변경하지 않음
	dbms_output.put('내일은 그묘일 PL/SQL');
	 -- put으로만 출력이 종료되면 출력내용이 출력되지 않음 
	dbms_output.put_line('모레는 퇼 PL/SQL');
end;
/



