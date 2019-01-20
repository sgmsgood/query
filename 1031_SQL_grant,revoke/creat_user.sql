-- 계정생성 : 관리자 계정만 생성가능
-- create user 계정명 identified by 비번;

-- 도스창에서 관리자 로그인 방법 sqlplus "/as sysdba"
create user test_user identified by 1111;

-- (도스창 들어가서 grant connect to test; 이렇게 입력)

-- 접속권한 ,자원사용 권한(resource) , 관리자 권한(dba)
grant connect,resource,dba to test;


--테이블 생성 (X) (Resource 권한이 부여되면 가능)
create table my_table(num number);
insert into my_table values(1);
commit;

-- 관리자 권한 부여 후 일반계정이 관리자의 업무 수행 할수 있다.
-- 계정생성, 계정 권한 부여한다.    -- 일반계정 scott계정은 못만듬-- ,
create view test_view as (select num from my_table);

select * from user_views;

drop view test_view;

-- 권한 회수 :
revoke 권한,,,  from  계정명;

create user tset1 identified by 2222;     --권한 뺏겨서 이제 테이블 못 만듬--

--계정 삭제 : 계정이 접속되어 있다면 삭제되지 않는다.

select tname from tab;

-- 계정 조회 (all_users: 계정명, 생성일자, dba_users: 계정에 여러 정보들을 볼 수 있음)
select * from dba_users;




