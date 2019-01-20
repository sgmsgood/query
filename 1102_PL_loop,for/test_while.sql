-- 최소 0번 수행 ~ 최대 조건까지 반복수행 while
set serveroutput on


declare
	i number;


begin
	-- 1에서부터 10까지 1씩 증가하는 값을 출력하는 while
	
	i := 1 ;
	-- 조건식
	while i <= 10 loop
	    dbms_output.put_line(i);
	    
	i := i +1;
	
	end loop; 
	
-- 0에서 100사이의 홀수만 출력하는 while

	i := 1;
	
	while i < 101 loop
	
-- 1) if 함수를 쓰는 경우		if mod(i,2)=1 then
			dbms_output.put_line(i);
--	    					end if;
-- 							i := i + 1	    
	 i := i+2;
	 
	end loop; 



end;
/