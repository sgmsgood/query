-- unique: ���� ���� ���� �ְ� �ִٸ� �����ؾ��� ��
-- �̸�, �̸���, �ּҸ� �����ϴ� ���̺��� �����ϼ���.

create table column_unique(
			name varchar2(30),
			email varchar2(50) constraint uk_email unique,
			addr varchar2(100)
);

select * from user_constraints;

-- �߰�����
-- �����Է�

insert into column_unique(name, email, addr)
values ('������','lee@test.com','��⵵ ������ ���뱸');

commit;

select * from column_unique;

-- null ��� �� �̸���(null)�� ���� ���
insert into column_unique(name, addr)
values ('������','��⵵ ������ ���뱸');

insert into column_unique(name, email,addr)
values ('������1','','��⵵ ������ ���뱸');

-- �����ϴ� ���
-- ���� �̸����� ������ ���

 into column_unique(name, email, addr)
values ('�ڿ���','lee@test.com','�λ��');

-- ���̺� ����
-- ��ȣ, �̸�, ��ȭ��ȣ, ī���ȣ�� �����ϴ� ���̺��� ����
-- ��ȭ��ȣ�� ī���ȣ�� ���� ���� �ְ�, �ִٸ� �����ؾ��Ѵ�.

create table table_unique(
		num number(5),
		name varchar2(30),
		tel varchar2(13),
		card_num char(4),
		constraint uk_tel unique (tel),
		constraint uk_card_num unique(card_num)
);

-- �߰�����
-- �����Է�
insert into table_unique(num, name, tel, card_num)
values (1,'������','010-8769-6112','1234');
-- ��ȭ��ȣ�� ī���ȣ�� �ٸ� ���

insert into table_unique(num, name, tel, card_num)
values (2,'��������','010-8769-6142','1534');
-- null�Է�

insert into table_unique(num, name, tel, card_num)
values (2, '��������','','');

insert into table_unique(num, name)
values (3, '������');

-- ����
-- ��ȭ��ȣ�� ī���ȣ�� ������ ����

insert into table_unique(num, name, tel, card_num)
values (4,'���ü�','010-8769-6112','1544');




select * from TABLE_UNIQUE;

select * from table_unique;
select * from user_indexes;
commit;

