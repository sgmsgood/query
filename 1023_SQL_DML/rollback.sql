--Transaction ���
-- savepoint�� �����Ͽ� Ư�� �������� �۾����
-- Transaction�� �������� Ŀ���� �̷���� ��� savepoint�� ���


savepoint insert_a;
insert into class4_info(num, name, mail)
values(21, '�׽�Ʈ', 'test@test.com');

savepoint insert_b;
insert into class4_info(num, name, mail)
values(22, '�׽�Ʈ1', 'test1@test.com');

savepoint update_c;
update  	class4_info
set	name = '����3'
where	num = 22;

savepoint delete_d;
delete from class4_info
where num=22;

--rollback to delete_d;

--rollback to update_c;


