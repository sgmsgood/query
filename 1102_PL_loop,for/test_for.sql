-- for: 시작과 끝을 한 눈에 알 수 있고 1씩 증가하는 반복문

set serveroutput on

declare
--변수 안만들어도 ㅇㅋ
    i number;
    num number;
    total number; 
    msg varchar2(30);
begin

	for i in 1 .. 10 loop
		dbms_output.put_line('i='||i);
	end loop;
	-- for의 index를 저장하는 변수는 declare에서 선언된 변수를 사용하지 않음
		dbms_output.put_line('for 종료 i='||i);  --> 출력값: for 종료 i =  없음.

	-- 1~9까지 1씩 증가하는 for를 만들어보세요.
	num := 2;
	for i in 1 .. 9 loop
		dbms_output.put_line(num||'*'||i||'= '||num*i);
	end loop;

	-- 1~100까지의 합을 구해보세요.
	total := 0;

	for idx in 1 .. 100 loop
		total := total + idx;
	end loop;
	 	dbms_output.put_line('1에서 100까지의 합은: '|| total);


	-- 2단~9단
	total := 0;

	for i in 2 .. 9 loop

		for j in 1 .. 9 loop
		 	dbms_output.put_line(i||'X'||j||'= '||i*j);
	
		end loop;	
    end loop;
	
dbms_output.put_line('-------------------------------------');

		for i in reverse 1..10 loop	
 		     dbms_output.put_line(i);
		end loop; 
		
dbms_output.put_line('-------------------------------------');
--오늘은 금요일입니다. 해보기

	msg := '오늘은 금요일입니다.';

	for i in 1 .. length(msg) loop
		dbms_output.put_line(substr(msg,i,1));
	end loop;
	
	
		
	
	
end;
/
