create table test_orderby(
num varchar2(10)
);

insert into test_orderby(num) values('1000');
insert into test_orderby(num) values('1');
insert into test_orderby(num) values('204');
insert into test_orderby(num) values('21');
insert into test_orderby(num) values('191');
insert into test_orderby(num) values('300');
insert into test_orderby(num) values('20001');

commit;

select*from test_orderby;

--��ȣ �������� ����: ���ڿ��� ������ �ڸ����� �����̴�.

select num
from test_orderby
order by num;

