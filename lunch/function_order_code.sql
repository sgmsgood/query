/*도시락 코드를 "OR_000000001"를 반환하는 함수*/

create or replace function order_code
return char
is 

begin  
	return concat('L_',lpad(seq_lunch.nextval,9,0));  
end;
/
