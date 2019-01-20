-- ������� Ȯ�� : user_constraints (: dictionary)
-- ������� �̸��� �����ؾ� ��

select * from user_constraints;

-- ��ȣ, �̸�, ��ȭ��ȣ, �ֹι�ȣ, �̸����� �����ϴ� ���̺��� �����ϰ� ���ۿ�.
-- �ֹι�ȣ�� null�� ������� �����鼭 �����ؾ���.

create table column_primary(
			num number, --��ȣ 22������ ����
			name varchar2(30),
			tel varchar2(13),
--			ssn char(14) primary key, --> �̸��� ����Ŭ���� �ڵ����� �� (�̸��� ���߿� �����߻� ���� ã�� �����)
			ssn char(14) constraint pk_column_primary primary key,
			email varchar2(50)
);

insert into column_primary (num, name,ssn) values(1,'test','880101-1234567');

insert into dept(deptno, dname, loc) values(10,'t','t');

/*
drop table column_primary;
purge recyclebin;
*/

---------------------- �÷� �ϳ��� pk�� �����Ǵ� ���
/* 1) �߰� ���� */
-- ���� ���ڵ� ���� ����
	INSERT into column_primary(num, name, tel, ssn, email)
			values (1,'������','010-1234-5678','880101-1234567','lee@test.com');
    commit;

    select*from column_primary;

-- �ֹι�ȣ �ٸ� ���
    INSERT into column_primary(num, name, tel, ssn, email)
			values (2,'������','010-1754-5646','890101-1234567','lee@test.com');

-- 2. �߰� �����ϴ� ���
-- �ֹι�ȣ�� ���� �ֹι�ȣ�� �ԷµǴ� ���
	INSERT into column_primary(num, name, tel, ssn, email)
			values (3,'���ü�','010-1654-4566','890101-1234567','lee@test.com');
commit;
-- null�� �ԷµǴ� ���
-- ����, ��¥�� �÷��� �����Ǹ� null�� �Էµǰ�
-- ���ڿ�(��������, ��������)�� �÷��� �����Ǵ� ���� ' (empty)'�� �����Ͱ� �߰��Ǵ� ��쿡 null �Է�

-- 1)�÷��� �����Ǿ� insert �Ǵ� ���
	INSERT into column_primary(num, name, tel, email)
			values (2,'���ü�','010-1754-5564','jung@test.com');--> ssn �÷� ����

-- 2)�÷��� ���ǵǾ� ������ "�� �ԷµǴ� ���
	INSERT into column_primary(num, name, tel, ssn, email)
			values (2,'������','010-1754-5646','','lee@test.com'); --> ssn �����Ͱ� �������

--------------------------table level constraint
-- �̸�, ���̵�, ��й�ȣ �����ϴ� ���̺� ����
-- ���̵�� null�� ������� �����鼭 ���� �����ؾ� �Ѵ�.

create table table_primary(
		name varchar2(30),
		id varchar2(20),
		password varchar2(30),
		constraint pk_table_primary primary key(id)
);

-- �߰�����
insert into table_primary (name, id, password)
values ('����ö','kim','1234');
commit;
insert into table_primary (name, id, password)
values ('����ö','test','1234');
commit;
-- �߰�����
insert into table_primary(name, password)
values('����ö','123455');

insert into table_primary(name, id, password)
values('����ö','','1234');

-- �������� �÷��� PK�� �����Ǵ� ���
-- table ���� ����������θ� ��������

-- �����۸�, ������ ��ȣ, ����
-- ������ ��ȣ�� ���ڵ尡 �߰��� �� ���������� �����ϸ� 'ITEM_0001'�� ������ ����. (1. SEQUENCE O 2. SUBQUERY)
-- ������ ��ȣ�� �����۸��� ���� �� ����.
CREATE TABLE table_multi_primary(
           item_num char(9),
           item varchar2(60),
           item_info varchar2(4000),
           constraint pk_table_multi_primary primary key(item_num, item) --> �� ���� ����� �����Ǿ��� �� ����
);

-- ���ڵ� ���� �� 'ITEM_0001'��ȸ���
SELECT CONCAT('item_',LPAD(nvl(max(item_num),0)+1,4,0))
from table_multi_primary;

-- �������� �÷��� �ϳ��� pk�� �����Ǵ� ���
-- �߰�����: ���ʵ����� �Է�
insert into table_multi_primary(item_num, item, item_info)
values ((SELECT CONCAT('item_',LPAD(nvl(max(item_num),0)+1,4,0))
from table_multi_primary),'���ĸ�','�ٷ� �� ���̴����� ���� ���̴��� ��� ��� �� ����.');

commit;

insert into table_multi_primary(item_num, item, item_info)
values ((SELECT CONCAT('item_',LPAD(max(substr(item_num,instr(item_num,'_')+1))+1,4,0))
from table_multi_primary),'����ź','�����Ÿ��� �� ���̴��鿡�� ���� ���ݹ��� ���̴����� ����ź�� ����.');

commit;

-- ��ȸ�� ���ڵ尡 null�� ���� ���� ���� (��ȸ�� ���ڵ尡 ���ٸ� ���� X)
select concat('item_',lpad(max(substr(item_num,instr(item_num,'_')+1))+1,4,0))
--> nvl�� ã�� ���ڵ��� ����� �����! �۵� // nvl(item_num,111) �۵� ����
from   table_multi_primary;

delete from table_multi_primary;

-- ���� ������ �����ȣ���� 1������ ������ EMP_00007899�� ������ ���� ���� ��ȸ
SELECT CONCAT('EMP_',LPAD(max(empno)+1,8,0))  --�� LPAD Ȯ��
FROM EMP;

-- �� �÷��� ���� �ٸ� ���: ����
insert into table_multi_primary(item_num,item,item_info)
values ('ITEM_0002','�� ��ź', '�ٷ� �� ���̴����� ���� ���̴��� ��� ��� �� ����.');

-- �� �÷� �� �ϳ��� �÷��� �ٸ� ���: ����
insert into table_multi_primary(item_num,item,item_info)
values ('ITEM_0002','���ĸ�', '�ٷ� �� ���̴����� ���� ���̴��� ��� ��� �� ����.');

COMMIT;

-- �� �÷��� ��� ���� ���� ���� ���: ����
insert into table_multi_primary(item_num,item,item_info)
values ('ITEM_0002','���ĸ�', '���ϸ� ¥����'); --> ������ ITEM_NUM�� ITEM�� ������ ����

-- �� �� �ϳ��� NULL �� �߰��� ��: ����
insert into table_multi_primary(item_num,item,item_info)
values ('','���ĸ�', '���ϸ� ¥����');

insert into table_multi_primary(item_num,item_info)
values ('ITEM_0003', '�ռ� Ư�� ���̴��� �����Ͽ� �̻��� �߻�');

delete from dept
where deptno= 30;

rollback;


