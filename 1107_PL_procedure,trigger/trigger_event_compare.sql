-- trigger event ��

create or replace trigger event_compare
after insert or update or delete on trigger1
for each row
-- trigger�ȿ��� ������ �ۼ��Ϸ��� declare�� ����ؾ��Ѵ�.    
-- declare
--	num number;     
     
begin
	if inserting then
		-- trigger2 ���̺� �̸�, ���̸�  �߰�
		-- dbms_output.put_line('�߰� �۾� ����');
		
		insert into trigger2(name, age)
		values (:new.name, :new.age+1); 
		-- commit; trigger������ transaction�� ����� ����� �� ����.
		
		
		dbms_output.put_line('�߰� �۾� ����'	);
	end if;
	
	if updating then
	--dbms_output.put_line('���� �۾� ����'	);
	-- trigger1 ���̺��� �����۾��� �߻��ϸ� 
	-- trigger2 ���̺� ���� �̸��� ���̸� �߰��Ƥ�������
		
		insert into trigger2(name, age)
		values (:old.name, :old.age); 
	
	end if;

	if deleting then
--		dbms_output.put_line('���� �۾� ����'	);
	-- trigger1���̺��� ���� �۾� �߻��ϸ� trigger2���̺��� 
	-- ���� �̸��� ��� ���ڵ带 ����
	delete from trigger2
	where name =:old.name;   
	
	select*from user_troggers,
	
	drop trigger
	
	end if;


end;
/
