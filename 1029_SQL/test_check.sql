-- check , not null, default
-- check: �÷��� ���� ��ȿ�� ������ ������ �߰��� ��
-- not null: ���� �ݵ�� �Է¹޾ƾ� �� ��
-- default: �÷��� �����Ǿ� null �Էµ� �� ��� �� �⺻ ��

-- �̸�, ����, �ּ�, �Է����� �����ϴ� ���̺� ����
-- ��, �̸��� �ʼ��Է��̰� ���̴� 20~30�븸 �Է� �����ϰ�,
-- �Է����� �����Ǹ� ���� ��¥�� �Էµǵ��� �����غ�����

create table other_constraints(
		name varchar2(30)
			constraint c_name not null,
		age number(2)
			constraint c_age check (age between 20 and 39),
		addr varchar2 (20) null,
		input_date date default sysdate );
-- user_constraints������ ������� (PK, FK, UK, check, not null)�� Ȯ�ΰ���

select *from user_tab_cols
where table_name = 'other_constraints';

--�߰� ����
-- ���� ������
insert into other_constraints (name, age, addr, input_date)
values ('������', 27,'�����','2018-10-26');

-- �ּҿ� �Է����� ����
insert into other_constraints(name, age)
values('�ڿ���','27');


-- error
-- �̸��� �����Ǵ� ��� (not null���ǿ� ���谡 ��)
insert into other_constraints (age, addr, input_date)
values (27,'�����','2018-10-26')

-- ���̰� 20~30�밡 �ƴ� ���
insert into other_constraints (name, age, addr, input_date)
values ('������', 19, '�����','2018-10-26');

insert into other_constraints (name, age, addr, input_date)
values ('������', 40, '�����','2018-10-26');

create table temp(
			name varchar2 (10),
			constraint c_name1 not null(name)
			);
