-- 외부값 입력 받기
set serveroutput on
set verify off

accept name prompt '이름:'
accept age prompt '나이:'

declare
		name varchar2(90);
		age number;

begin
--입력된 값을 변수에 할당
-- 입력 값이 문자열인 경우에는 '로 묶어서 사용된다.
--  작동함! 그니까 절때로 주석에도 넣지말기!
		name :='&name';
		age := &age; 
        --birth := to_char(sysdate,'yyyy')-age+1
        -->dbms_output.put_line(age||'살 태어난 해:'||birth||'년 생');
	
		                                                                                              
		-- 태어난 해 출력: xx살 태어난해 xxxx년 생
		-- 1) 문자열은 연산이 안됨. 이재찬 + 1  -> 그래도 오라클은 문자가 숫자로만 이루어지면 알아서 잘 계산하는데...  
		-- 2) ||는 +, - 보다 더 빨리 계산이 되니까  to_char(sysdate)를 먼저 가져가서 붙힘. 그래서 오류발생
		-- 3) 구니까 (  )를 쳐서 먼저 계산해야 할 부분이라고 확인시켜줘야 함.
	 	dbms_output.put_line(age||'살 태어난 해:'||((to_char(sysdate,'yyyy')) - age + 1)||'년 생');
		
		-- 산술 연산자가 아닌 연산자의 결과를 출력할 수 있다.	 	
		-- dbms_otput.put_line(age>10); 

end;
/
