--sequece: 순차적으로 증가하는 수를 사용하는 객체
-- 1~9999999까지 1씩 증가하는 시퀀스 생성

create sequence seq_test
increment by 1
start with 1
maxvalue 9999999;

select*from user_sequences;
--currval은 메모리에 올라와있는 시퀀스의 현재 번호를 얻는 일을 함
select seq_test.currval
from dual;

select seq_test.nextval
from dual;

--쿼리문의 실행 실패에도 시퀀스는 사라짐
insert into cp_emp(empno, ename, hiredate, sal)
values (seq_test.nextval,'안기모씨',sysdate,300);

-- 시퀀스 삭제: drop sequence 시퀀스명
drop sequence seq_test;

create sequence seq_test
increment by 2
start with 1
maxvalue 9999999
cache 40
cycle;

select * from user_sequences;

select seq_test.nextval
from dual;

-- 증가하는 수를 가지고 pk를 사용해야할 때 sequence 사용하면 좋음
-- concat lpad sequnce 사용해서 w증가하는 수 잘 사용하게 됨.
