/*���ö� �ڵ带 "L_000001"�� ��ȯ�ϴ� �Լ�*/

create or replace function lunch_code
return char
is 

begin  
	return concat('L_',lpad(seq_lunch.nextval,6,0));  
end;
/
