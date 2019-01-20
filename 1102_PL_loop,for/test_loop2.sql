-- 1 ~ 100까지 출력하는 loop

set serveroutput on

declare
       cnt number(3); 

begin
     
     -- 초기값
         cnt :=1;                                  		--시작이 1이라 초기값2로 할수 없음--
          --1에서 부터 100까지 (짝수만 출력)
         
                                                       --종으로 나는게 싫으면 put으로 출력하고
     loop   
          if mod(cnt,2)=0 then   
         dbms_output.put_line( cnt||'' );  
         end if;                --이런식으로 달아주면 된다.
         cnt := cnt+1;
         exit when cnt=101;                              	
	end loop;
	 -- endloop; 밑에 dbms_output.put_line('끝');     
end;
/
