select * from user_procedures;

--��Ű���� ���Ե� �Լ� ȣ��
select test_pack.get_name('������')
from dual;

--��Ű���� ���Ե� �Լ� ȣ��
var age number;
exec test_pack.get_age(1990,:age);
print age;

-- ����(Random number): ��ǻ�Ͱ� ������ ���� �����Ͽ� ��ȯ�ϴ� ��
-- dbms_random.value(����, �߻����� ��) (1,10)  - 1~9������ ���ڸ� ��� �Լ�
select trunc(dbms_random.value(1,21))
from dual;

-- dbms_random.value('����', ������ ����) - ���� ���ڿ��� ��� �Լ�
-- ����: u_������ �빮��/ l - ������ �ҹ���/ a- ��, �ҹ��� ȥ��/  x- �빮�ڿ� ����ȥ��/ p-�빮��, �ҹ��� Ư������

select dbms_random.string('u',10)
from dual;

select dbms_random.string('l',10)
from dual;

select dbms_random.string('a',10)
from dual;

select dbms_random.string('x',10)
from dual;

select dbms_random.string('p',10)
from dual;

--����� ��
select lucky_pack.lucky_num
from dual;

-- ����

var name varchar2(30);
exec lucky_pack.lucky_name(:name);
print name;

var cur refcursor;
exec test_pack.constraints_search('car_maker', :cur);
print cur;

var ssn char(14)
exec lucky_pack.create_ssn('880219','����','������', :ssn);
print ssn;

select name, ssn, valid_ssn(ssn) from CLASS4_INFO;

select * from user_triggers;

create table trigger1
	(name varchar2(30),
	age number(3),
	addr varchar2(100)
	);

alter table tigger1 rename to trigger1;

create table trigger2
	(name varchar2(30),
	age number (3)
	);


drop trigger test_trigger;
select * from user_triggers;

select * from trigger1;
select * from trigger2;

insert into trigger1(name, age, addr)
values ('������',26,'��õ�� ������');

update trigger1
set    name = '���ü�',age = 30
where  name = '������';

delete from trigger2
set tname = '���ü�';

update from trigger1
where name = '����ȯ';

select*from user_triggers;

drop trigger event_compare;
