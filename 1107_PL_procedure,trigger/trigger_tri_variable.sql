-- trigger1 ���̺��� ���ڵ尡 �߰��Ǹ�
-- trigger2 ���̺� �߰��� �̸��� class4_info ���̺���
--��ȣ�� 99���� �л��� ���̷� �߰�.

create or replace trigger tri_variable
after insert on trigger1
for each row
declare
	age number;
begin

	select age
	into age
	from class4_info
	where num = 99;
	
	insert into trigger2(name, age) 
		values ( :new.name, age);

end;
/

