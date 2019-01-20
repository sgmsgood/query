-- alter

create table test_atler(
			num number,
			neam varchar2(30),
			addr number
);


-- ���� ��ױ�: �����ڸ� ����
alter user scott account lock;
-- ����: system, ���: managerum

-- ���� ����
alter user scott account unlock;

-- ��й�ȣ �ٲٱ�
alter user scott identified by tiger;

-- ���̺�� ���� (test_atler -> test_alter)
alter table test_atler rename to test_alter;

-- �÷��� ���� (neam -> name)
alter table test_alter rename column neam to name;

-- �÷��� �������� ����: ���ڵ尡 �����Ƿ� ������������ ����
-- addr�� number ���������� varchar2(100)
alter table test_alter modify addr varchar2(100) not null;

insert into test_alter(num, name, addr) values(1,'�׽�Ʈ','����� ������');
commit;

-- ���������� ������ ������ ���ڵ尡 ����־�� �Ѵ�.
alter table test_alter modify addr number;

-- ���ڵ尡 ������ ������ ���� ������������ ũ�⸸ ���氡��
alter table test_alter modify addr varchar2(200);

-- �÷� �߰�: �߰��Ǵ� �÷��� ���� �������� �߰��ȴ�.
-- ���ڵ尡 �������� ������ ��� ��������� �ο��� �� �ִ�.

alter table test_alter add id varchar2(16);

-- �÷�����
alter table test_alter drop column addr;

select * from test_alter;

-- ������� �߰�
-- ���ڵ��� ������ ��������� �����ϰ� �ִ��� �Ǵ�.
update test_alter
set    id = 'test'
where  num = 1;

alter table test_alter add constraint pk_test_alter
	primary key (id) ;

select * from user_constraints
where table_name = 'test_alter';

--������� ��Ȱ��ȭ: ��������� �������� �ʴ´�.
alter table test_alter disable constraint pk_test_alter;

select * from test_alter;

insert into test_alter (num, name, id) values (2, '������', 'test');

-- ������� Ȱ��ȭ: ���ڵ��� ������ ���� �ٸ���.
delete from test_alter where num = 2;
alter table test_alter enable constraint pk_test_alter;

-- ������� ����
alter table test_alter drop constraint pk_test_alter;
