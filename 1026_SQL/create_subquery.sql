--테이블 복사
-- 사원테이블(원천 데이터)에서 사원번호, 사원명, 입사일, 연봉을 조회하여
-- 조회한 결과로 CP_EMP라는 테이블을 생성할 것

create table CP_EMP
as (select empno, ename, hiredate, sal from emp);

select * from CP_EMP;

alter table cp_emp modify sal number(7,2) not null; --> not null 조건이 단독으로 설정되어 있다면 복사가 된다잉
select*from user_constraints; --> 구조 확인

-- cp_emp테이블에서 사원번호가 7500~7599 사이에 속한
-- 사원의 사원번호, 사원명, 입사일, 연봉을 조회하여
-- cp_emp2 테이블을 생성하고 입력하세요.

create table cp_emp2 as (
select *
from cp_emp
where empno between 7500 and 7599);

select * from CP_EMP2;

-- 구조만 복사하고 싶을 때 (레코드를 조회하지 않고 서브쿼리를 수행)
-- 사원테이블에서 사원번호,부서번호, 직무, 부서명, 연봉을
-- 레코드가 조회되지 않도록 조회해 보세요.

create table ep_emp3 as(
select empno, ename, deptno, job, sal
from emp
where 1=0);
--where 1=0;  => 이 테이블의 레코드 값 모두 거부
-- where 1=1; => 이 테이블의 레코드 값 모두 ㄱㄱ

select * from EP_EMP3;


