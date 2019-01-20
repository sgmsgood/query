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

--번호 오름차순 정렬: 문자열의 정렬은 자릿수의 정렬이다.

select num
from test_orderby
order by num;

