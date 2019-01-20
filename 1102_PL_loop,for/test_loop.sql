-- 코드를 여러번 반복 실행시켜주는 loop 사용
set serveroutput on 

declare
           i number;

begin
                

		i:=0;							--무한루프에 들어가면 출력안한다. 단지 눈에 안보이는것 뿐--	
		loop   
	--	 exit when (i=10);  조건이 위에 있어도 비슷하다--
		dbms_output.put_line('오늘은 금요일인 부분'||i); 
		
		i := i+1;
		 
		 exit when (i=10);   --if문 보다 더 간단한 조작--
--		 if i=10 then
--		exit; 
--		end if;
	end loop;
	dbms_output.put_line('내일은 퇼');
end;
/


