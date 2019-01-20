-- 고객등급, 상품명, 가격을 입력 받아 처리하는 PL/SQL작성
-- 출력은 고객등급이 '특별 또는 일반'인 경우에만 연산을 출력
-- 특별고객은 상품할인을 상품가에 50%, 
-- 일반고객은 ............. 30%	


set serveroutput on
set verify off

accept grade prompt '고객등급: '
accept item_name prompt '상품명: '
accept price prompt '가격: '

declare
 grade varchar2(9) := '&grade';
 item_name varchar2(90) := '&item_name';
 price number := &price;
 sale number :=0.3;
 
begin

-- if grade='특별' or grade='일반' then
	if grade in('특별', '일반') then --> '특별, 일반' 중에서만 다음 조건을 실행할거야.
	
		if grade = '특별' then
	 		  sale:= 0.5;
	 		
	 		 	
	 		
	    end if;
	    dbms_output.put_line(grade||'고객님 구매하신 상품'||item_name||'이고 정상가'||price||'원이며 할인가액은 '||(price-price*sale)||'입니다');	 
 	end if;

end;
/