-- �ܷ�Ű: �ٸ� ���̺�(�θ�)�� �����θ� ���� �߰��ؾ��� �� ���
-- null, �ߺ����� �����.

-- �÷����� �������: foreign key�� ������� �ʴ´�.
-- table_primary ���̺��� id ���� �����Ͽ� �����͸� �߰��ϴ� foreign key ����
-- �ڽ����̺��� �÷����� ���� �ʿ�� ���� (��κ��� ����), ���������� ũ�⸸ �����ָ� ��

create table column_foreign(

				f_id varchar2(20) constraint fk_f_id
			  --f_id varchar2(20) constraint fk_f_id foreign key --> ������
                     references table_primary(id),
				tel varchar2(13), address varchar2(400)
);

-- �߰� ����
-- �θ����̺� �����ϴ� ������ �߰�

insert into table_primary(f_id,tel, address)
values ('kim','010-4567-6541','SM');

insert into column_foreign(f_id,tel, address)
values ('test','010-7897-1523','����� ������ �ѵ�����');

-- ���� ���̵�� ���� �߰��� �� �ִ�.
insert into column_foreign(f_id,tel, address)
values ('kim','010-4567-6541','JYP');

-- null �� ���
insert into column_foreign(tel, address)
values ('010-4567-6541','�̽�ƽ');

-- �θ� ���̺� ���� ���� �Է��ϸ� error
insert into column_foreign(f_id, tel, address)
values ('kim1','010-4567-6541','�̽�ƽ');

select * from column_foreign;

-- �θ����̺��� ���ϴ� �ڽ� ���ڵ尡 �����Ѵٸ� �������� ����.
insert into table_primary(name, id, password)
values ('��ȣ��','kang','1234');

commit;
-- kang �����ϴ� ���ڵ尡 �������� �����Ƿ� ����
delete from table_primary where id = 'kang';
-- kim�̳� test�� �����ϴ� �ڽ����̺��� ���ڵ尡 �����ϹǷ� ���� �Ұ�
delete from table_primary where id = 'test';

-- on delete cascade�� �������� �ʾ��� ������
-- �����ϴ� �ڽķ��ڵ带 ��� �����ϰ�
delete from column_foreign where f_id = 'kim';
-- �θ� ���ڵ带 �����ϸ� ����!
delete from table_primary where id='kim';

commit;

select * from column_foreign;
-- ���������� �̸��� ������ �ȴ�
create table table_foreign(
			id varchar2(20),
			java_score number(3),
			oracle_score number(3),
			constraint fk_table_foreign_id foreign key(id) references
				table_primary(id)
);
-- �θ����̺� �����ϴ� ������ �߰�
insert into table_foreign(id, java_score, oracle_score)
values ('kim', 97, 78);

commit;

-- �����ϴ� �ڽ� ���ڵ尡 �����Ѵٸ� �θ����̺��� �ٷ� ���� �Ұ�
delete from table_primary
where id='kim';

insert into table_primary(name, id, password)
values('���߱�', 'song','1234');

insert into table_primary(name, id, password)
values('����', 'gong','1234');

select*from table_primary;


-- �θ� ���ڵ带 �����ϸ� �����ϴ� ��� �ڽ� ���ڵ带 �����ϰ�
-- �θ� ���ڵ带 �����ϴ� on delete cascade ���
create table test_cascade(
	id varchar2(20),
	addr varchar2(100),
	constraint fk_test_id foreign key(id)
	references table_primary(id)
	on delete cascade
);

insert into test_cascade(id, addr) values('song','������ ���ﵿ');
insert into test_cascade(id, addr) values('gong','������ ���ﵿ');

select*from test_cascade;

-- on delete cascade�� �����Ǹ� �θ��ڵ尡 �����Ǹ�
-- �ڽķ��ڵ嵵 �Բ� �����ȴ�.

delete from table_primary where id='song';
delete from table_primary where id='song';

-- on delete cascade�� ������ ���� ���̺��� �����ϴ� ���ڵ�� �������� �ʴ´�.
delete from table_primary where id='kim';

select*from test_cascade;
select*from table_primary;

select*from user_indexes;
