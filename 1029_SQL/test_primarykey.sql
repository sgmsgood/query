-- 제약사항 확인 : user_constraints (: dictionary)
-- 제약사항 이름도 유일해야 함

select * from user_constraints;

-- 번호, 이름, 전화번호, 주민번호, 이메일을 저장하는 테이블을 생성하고 시퍼요.
-- 주민번호는 null을 허용하지 않으면서 유일해야함.

create table column_primary(
			num number, --번호 22개까지 가능
			name varchar2(30),
			tel varchar2(13),
--			ssn char(14) primary key, --> 이름이 오라클에서 자동으로 들어감 (이름이 나중에 에러발생 원인 찾기 어려움)
			ssn char(14) constraint pk_column_primary primary key,
			email varchar2(50)
);

insert into column_primary (num, name,ssn) values(1,'test','880101-1234567');

insert into dept(deptno, dname, loc) values(10,'t','t');

/*
drop table column_primary;
purge recyclebin;
*/

---------------------- 컬럼 하나로 pk가 구성되는 경우
/* 1) 추가 성공 */
-- 최초 레코드 삽입 성공
	INSERT into column_primary(num, name, tel, ssn, email)
			values (1,'이재찬','010-1234-5678','880101-1234567','lee@test.com');
    commit;

    select*from column_primary;

-- 주민번호 다른 경우
    INSERT into column_primary(num, name, tel, ssn, email)
			values (2,'이재현','010-1754-5646','890101-1234567','lee@test.com');

-- 2. 추가 실패하는 경우
-- 주민번호에 같은 주민번호가 입력되는 경우
	INSERT into column_primary(num, name, tel, ssn, email)
			values (3,'정택성','010-1654-4566','890101-1234567','lee@test.com');
commit;
-- null이 입력되는 경우
-- 숫자, 날짜는 컬럼이 생략되면 null이 입력되고
-- 문자열(고정길이, 가변길이)는 컬럼이 생략되는 경우와 ' (empty)'로 데이터가 추가되는 경우에 null 입력

-- 1)컬럼이 생략되어 insert 되는 경우
	INSERT into column_primary(num, name, tel, email)
			values (2,'정택성','010-1754-5564','jung@test.com');--> ssn 컬럼 생략

-- 2)컬럼은 정의되어 있으나 "가 입력되는 경우
	INSERT into column_primary(num, name, tel, ssn, email)
			values (2,'이재현','010-1754-5646','','lee@test.com'); --> ssn 데이터가 비어있음

--------------------------table level constraint
-- 이름, 아이디, 비밀번호 저장하는 테이블 생성
-- 아이디는 null을 허용하지 않으면서 값은 유일해야 한다.

create table table_primary(
		name varchar2(30),
		id varchar2(20),
		password varchar2(30),
		constraint pk_table_primary primary key(id)
);

-- 추가성공
insert into table_primary (name, id, password)
values ('김희철','kim','1234');
commit;
insert into table_primary (name, id, password)
values ('김희철','test','1234');
commit;
-- 추가실패
insert into table_primary(name, password)
values('김희철','123455');

insert into table_primary(name, id, password)
values('김희철','','1234');

-- 여러개의 컬럼이 PK로 구성되는 경우
-- table 단위 제약사항으로만 설정가능

-- 아이템명, 아이템 번호, 설명
-- 아이템 번호는 레코드가 추가될 때 순차적으로 증가하며 'ITEM_0001'의 형식을 가짐. (1. SEQUENCE O 2. SUBQUERY)
-- 아이템 번호와 아이템명은 같을 수 없다.
CREATE TABLE table_multi_primary(
           item_num char(9),
           item varchar2(60),
           item_info varchar2(4000),
           constraint pk_table_multi_primary primary key(item_num, item) --> 두 개의 요건이 충족되었을 때 에러
);

-- 레코드 없을 때 'ITEM_0001'조회방법
SELECT CONCAT('item_',LPAD(nvl(max(item_num),0)+1,4,0))
from table_multi_primary;

-- 여러개의 컬럼이 하나의 pk로 구성되는 경우
-- 추가성공: 최초데이터 입력
insert into table_multi_primary(item_num, item, item_info)
values ((SELECT CONCAT('item_',LPAD(nvl(max(item_num),0)+1,4,0))
from table_multi_primary),'물파리','바로 앞 라이더에게 날려 라이더를 잠시 띄울 수 있음.');

commit;

insert into table_multi_primary(item_num, item, item_info)
values ((SELECT CONCAT('item_',LPAD(max(substr(item_num,instr(item_num,'_')+1))+1,4,0))
from table_multi_primary),'물폭탄','일정거리의 앞 라이더들에게 날려 공격받은 라이더들을 물폭탄에 가둠.');

commit;

-- 조회된 레코드가 null일 때만 값을 변경 (조회된 레코드가 없다면 동작 X)
select concat('item_',lpad(max(substr(item_num,instr(item_num,'_')+1))+1,4,0))
--> nvl은 찾는 레코드의 결과가 없어야! 작동 // nvl(item_num,111) 작동 안함
from   table_multi_primary;

delete from table_multi_primary;

-- 가장 마지막 사원번호보다 1증가한 값으로 EMP_00007899의 형식을 가진 값을 조회
SELECT CONCAT('EMP_',LPAD(max(empno)+1,8,0))  --※ LPAD 확인
FROM EMP;

-- 두 컬럼의 값이 다른 경우: 성공
insert into table_multi_primary(item_num,item,item_info)
values ('ITEM_0002','물 폭탄', '바로 앞 라이더에게 날려 라이더를 잠시 띄울 수 있음.');

-- 두 컬럼 중 하나의 컬럼만 다른 경우: 성공
insert into table_multi_primary(item_num,item,item_info)
values ('ITEM_0002','물파리', '바로 앞 라이더에게 날려 라이더를 잠시 띄울 수 있음.');

COMMIT;

-- 두 컬럼이 모두 같은 값을 가질 경우: 에러
insert into table_multi_primary(item_num,item,item_info)
values ('ITEM_0002','물파리', '당하면 짜증남'); --> 구조상 ITEM_NUM과 ITEM이 같으면 에러

-- 둘 중 하나라도 NULL 이 추가될 때: 에러
insert into table_multi_primary(item_num,item,item_info)
values ('','물파리', '당하면 짜증남');

insert into table_multi_primary(item_num,item_info)
values ('ITEM_0003', '앞선 특정 라이더를 조준하여 미사일 발사');

delete from dept
where deptno= 30;

rollback;


