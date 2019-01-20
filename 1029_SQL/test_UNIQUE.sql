-- unique: 값이 없을 수도 있고 있다면 유일해야할 때
-- 이름, 이메일, 주소를 저장하는 테이블을 생성하세요.

create table column_unique(
			name varchar2(30),
			email varchar2(50) constraint uk_email unique,
			addr varchar2(100)
);

select * from user_constraints;

-- 추가성공
-- 최초입력

insert into column_unique(name, email, addr)
values ('이재찬','lee@test.com','경기도 수원시 영통구');

commit;

select * from column_unique;

-- null 허용 시 이메일(null)이 없는 경우
insert into column_unique(name, addr)
values ('이재찬','경기도 수원시 영통구');

insert into column_unique(name, email,addr)
values ('이재찬1','','경기도 수원시 영통구');

-- 실패하는 경우
-- 같은 이메일이 들어왔을 경우

 into column_unique(name, email, addr)
values ('박영민','lee@test.com','부산시');

-- 테이블 단위
-- 번호, 이름, 전화번호, 카드번호를 저장하는 테이블을 생성
-- 전화번호와 카드번호는 없을 수도 있고, 있다면 유일해야한다.

create table table_unique(
		num number(5),
		name varchar2(30),
		tel varchar2(13),
		card_num char(4),
		constraint uk_tel unique (tel),
		constraint uk_card_num unique(card_num)
);

-- 추가성공
-- 최초입력
insert into table_unique(num, name, tel, card_num)
values (1,'김정운','010-8769-6112','1234');
-- 전화번호와 카드번호가 다른 경우

insert into table_unique(num, name, tel, card_num)
values (2,'김정현운','010-8769-6142','1534');
-- null입력

insert into table_unique(num, name, tel, card_num)
values (2, '이재현운','','');

insert into table_unique(num, name)
values (3, '이재현');

-- 에러
-- 전화번호든 카드번호든 같으면 에러

insert into table_unique(num, name, tel, card_num)
values (4,'정택성','010-8769-6112','1544');




select * from TABLE_UNIQUE;

select * from table_unique;
select * from user_indexes;
commit;

