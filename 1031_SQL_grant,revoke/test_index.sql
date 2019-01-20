-- 인덱스의 조회
select *from user_indexes;

create  table cp_zipcode as(select * from zipcode);

select count(*) from zipcode

-- cp_zipcode테이블에 seq 컬럼에 'unique index 설정;
create index idx_zipcode on cp_zipcode (seq);

create index idx_zipcode on cp_zipcode (seq);

drop index idx_zipcode;

select* from idx_zipcode;

-- 인덱스를 사용하지 않는 조회  (full scan)
select zipcode, sido, gugun, bunji, seq
from zipcode
where zipcode='402-866';

-- 인덱스를 사용한 조회
select /*+ ordered index (bit_zipcode)*/zipcode, sido, gugun, bunji, seq
from cp_zipcode
where zipcode = '402-866';

-- 우편번호는 중복되지만 독특한 형태를 갖는다.
create index bit_zipcode on cp_zipcode(zipcode);
select * from user_indexes;

-- 인덱스는 실제테이블이 변경되면 변경사항을 적용하지 않음
-- 테이블과 인덱스를 동일하게 맞추는 쿼리
alter index bit_zipcode rebuild;







--=======================group by having절
-- having: 그룹으로 묶일 조건
-- 부서별 사원 수가 4명 이상인 부서의 부서번호, 사원수, 연봉합, 최고연봉을 조회해
--
select deptno, count(deptno), sum(sal), max(sal)
from emp
group by deptno
having count(deptno)>4;

-- replace: 값을 변경하는 일 (치환)
select replace('나는 류이호입니다.','나는','그는')
from dual;

select*from user_objects;

drop table zipcode;
drop table cp_zipcode;
drop table emp;
purge recyclebin;


