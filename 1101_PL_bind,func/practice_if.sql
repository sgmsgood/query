/* 상품명, 고객등급, 가격을 입력받아
	고객등급이 '특별'이라면 상품가격의 30%가 할인된 가격으로 출력하세요.
	출력) (일반등급) xx등급 고객님 xxx상품의 정가는 xx원입니다.
	     (특별 등급) 상품가격 xx언 할인가 xx원
*/
	      
set serveroutput on
set verify off 

accept class prompt '고객등급:'
accept product prompt '상품명:'
accept price prompt '가격:'

declare
	class varchar2(9);
	product varchar2(60);
	price number;

begin 
   	class := '&class';
 	product := '&product';
 	price := &price;           
         
	if class = '일반' then 
	dbms_output.put('상품가격 '||(price*0.7)||'원 할인가: '||(price * 0.3)||'원');
	end if;   
    dbms_output.put_line(class||'등급 고객님 '||product||'상품의 정가는 '||price||'원 입니다.');
end;
/
