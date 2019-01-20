select * from user_procedures;

--패키지에 포함된 함수 호출
select test_pack.get_name('이재찬')
from dual;

--패키지에 포함된 함수 호출
var age number;
exec test_pack.get_age(1990,:age);
print age;

-- 난수(Random number): 컴퓨터가 임의의 수를 생성하여 반환하는 것
-- dbms_random.value(시작, 발생범위 수) (1,10)  - 1~9까지의 숫자를 얻는 함수
select trunc(dbms_random.value(1,21))
from dual;

-- dbms_random.value('형식', 난수의 개수) - 랜덤 문자열을 얻는 함수
-- 형식: u_영문자 대문자/ l - 영문자 소문자/ a- 대, 소문자 혼합/  x- 대문자와 숫자혼합/ p-대문자, 소문자 특수문자

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

--행운의 수
select lucky_pack.lucky_num
from dual;

-- 귀인

var name varchar2(30);
exec lucky_pack.lucky_name(:name);
print name;

var cur refcursor;
exec test_pack.constraints_search('car_maker', :cur);
print cur;

var ssn char(14)
exec lucky_pack.create_ssn('880219','남자','노진경', :ssn);
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
values ('이재현',26,'인천시 남동구');

update trigger1
set    name = '정택성',age = 30
where  name = '이재현';

delete from trigger2
set tname = '정택성';

update from trigger1
where name = '이재환';

select*from user_triggers;

drop trigger event_compare;
