/*���ö� �ڵ带 "OR_000000001"�� ��ȯ�ϴ� �Լ�*/

create or replace function order_code
return char
is 

begin  
	return concat('L_',lpad(seq_lunch.nextval,9,0));  
end;
/
