-- 외래키: 다른 테이블(부모)의 값으로만 값을 추가해야할 때 사용
-- null, 중복값을 허용함.

-- 컬럼단위 제약사항: foreign key를 기술하지 않는다.
-- table_primary 테이블의 id 값을 참조하여 데이터를 추가하는 foreign key 설정
-- 자식테이블의 컬럼명이 같을 필요는 없고 (대부분은 같음), 데이터형과 크기만 맞춰주면 댐

create table column_foreign(

				f_id varchar2(20) constraint fk_f_id
			  --f_id varchar2(20) constraint fk_f_id foreign key --> 에러남
                     references table_primary(id),
				tel varchar2(13), address varchar2(400)
);

-- 추가 성공
-- 부모테이블에 존재하는 값으로 추가

insert into table_primary(f_id,tel, address)
values ('kim','010-4567-6541','SM');

insert into column_foreign(f_id,tel, address)
values ('test','010-7897-1523','서울시 강남구 한독빌딩');

-- 같은 아이디로 값을 추가할 수 있다.
insert into column_foreign(f_id,tel, address)
values ('kim','010-4567-6541','JYP');

-- null 값 허용
insert into column_foreign(tel, address)
values ('010-4567-6541','미스틱');

-- 부모 테이블에 없는 값을 입력하면 error
insert into column_foreign(f_id, tel, address)
values ('kim1','010-4567-6541','미스틱');

select * from column_foreign;

-- 부모테이블은 조하는 자식 레코드가 존재한다면 삭제되지 않음.
insert into table_primary(name, id, password)
values ('강호동','kang','1234');

commit;
-- kang 참조하는 레코드가 존재하지 않으므로 삭제
delete from table_primary where id = 'kang';
-- kim이나 test는 참조하는 자식테이블의 레코드가 존재하므로 삭제 불가
delete from table_primary where id = 'test';

-- on delete cascade를 설정하지 않았을 때에는
-- 참조하는 자식레코드를 모두 삭제하고
delete from column_foreign where f_id = 'kim';
-- 부모 레코드를 삭제하면 ㅇㅋ!
delete from table_primary where id='kim';

commit;

select * from column_foreign;
-- 제약조건의 이름도 같으면 안댐
create table table_foreign(
			id varchar2(20),
			java_score number(3),
			oracle_score number(3),
			constraint fk_table_foreign_id foreign key(id) references
				table_primary(id)
);
-- 부모테이블에 존재하는 값으로 추가
insert into table_foreign(id, java_score, oracle_score)
values ('kim', 97, 78);

commit;

-- 참조하는 자식 레코드가 존재한다면 부모테이블에서 바로 삭제 불가
delete from table_primary
where id='kim';

insert into table_primary(name, id, password)
values('송중기', 'song','1234');

insert into table_primary(name, id, password)
values('공유', 'gong','1234');

select*from table_primary;


-- 부모 레코드를 삭제하면 참조하는 모든 자식 레코드를 삭제하고
-- 부모 레코드를 삭제하는 on delete cascade 사용
create table test_cascade(
	id varchar2(20),
	addr varchar2(100),
	constraint fk_test_id foreign key(id)
	references table_primary(id)
	on delete cascade
);

insert into test_cascade(id, addr) values('song','강남구 역삼동');
insert into test_cascade(id, addr) values('gong','강남구 역삼동');

select*from test_cascade;

-- on delete cascade가 설정되면 부모레코드가 삭제되면
-- 자식레코드도 함께 삭제된다.

delete from table_primary where id='song';
delete from table_primary where id='song';

-- on delete cascade가 사용되지 않은 테이블에서 참조하는 레코드는 삭제되지 않는다.
delete from table_primary where id='kim';

select*from test_cascade;
select*from table_primary;

select*from user_indexes;
