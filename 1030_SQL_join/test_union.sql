select * from cp_emp3;
insert into cp_emp3(empno, ename, deptno, job, sal)
values (1112, '이재찬', 10, '대리', 3500);

insert into cp_emp3(empno, ename, deptno, job, sal)
values (1113, '이재현', 20, '차장', 7000);

insert into cp_emp3(empno, ename, deptno, job, sal)
values (1114, '이호찡', 20, '알바', 1500);

commit;

-- emp: 미국본사, cp_emp3: 한국지사
-- 미국본사와 한국지사의 사원급여가 2000이하인 사원의 급여를 올려주고 싶어요.
-- 2000 이하인 사원의 사원번호, 사원명, 연봉, 직무를 조회
-- union: 중복데이터가 조회되지 않는다.
-- union all: 중복데이터가 조회된다.

select empno, ename, sal, job
from emp
where sal <= 2000

union

select empno, ename, sal, job
from cp_emp3
where sal <= 2000;

-- cp_emp3에 emp테이블의 30번 부서 사원정보를 모두 추가

insert into cp_emp3(empno, ename, deptno, job, sal)
		(select empno, ename, deptno, job, sal
	   	from emp
		where deptno = 30
		);

-- 컬럼의 개수가 일치하지 않거나 데이터형이 일치하지 않으면 error 발생

select empno, ename, sal, job
from emp
where sal <= 2000

union

select empno, ename, sal
from cp_emp3
where sal <= 2000;

-- 컬럼의 데이터형이 일치하지 않는 경우
select empno, ename, sal, job
from emp
where sal <= 2000

union

select sal, job, ename, empno
from cp_emp3
where sal <= 2000;

-------------------------intersect
--미국 본사의 사원정보와 한국지사의 사원정보 중 일치하는 정보만 조회

select empno, ename, sal, job
from emp
where sal <= 2000

intersect

select empno, ename, sal, job
from cp_emp3
where sal <= 2000;


-- minus: 상위 select에서 조회된 결과를 하위 select에서 조회된 결과에서 뺀 나머지를 조회
select empno, ename, sal, job
from emp

minus

select empno, ename, sal, job
from cp_emp3
where sal <= 2000;
