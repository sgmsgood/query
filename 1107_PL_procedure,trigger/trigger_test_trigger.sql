-- trigger1 ���̺��� �����ϴ� trigger

create or replace trigger test_trigger
after insert or delete or update on trigger1
for each row

begin

	dbms_output.put_line('������');
	dbms_output.put_line('������: '||:old.name||''||:old.age);   
	dbms_output.put_line('���ο: '||:new.name||''||:new.age);
end;
/
