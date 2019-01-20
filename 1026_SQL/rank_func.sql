-- 순위 구하기
-- 전체 순위 구하기
-- rank( ) over(order by 컬럼명 정렬방식) -> 중복순위 발생 가능

-- 사원테이블에서 사원번호와 사원명, 연봉, 연봉순위 조회
select * from EMP;

select  empno, ename, sal, rank() over(order by sal)
from emp;

-- 사원테이블에서 사원번호와 사원명, 연봉, 연봉순위 조회
-- 단, 중복 순위가 발생하지 않도록 처리하여 조회할 것.
select empno, ename, sal, row_number() over(order by sal), ename
from emp;

---------------------------------------------------------------

-- 조회된 레코드를 그룹별 순위: partition by
-- 사원테이블에서 사원번호, 사원명, 연봉, 부서별 연봉순위 조회

select empno, ename, sal, rank() over(partition by deptno order by sal)
from  emp;

-- cf) 순위 안 겹치게
-- 조회된 레코드를 그룹별 순위: partition by
-- 사원테이블에서 사원번호, 사원명, 연봉, 부서별 연봉순위 조회

select empno, ename, sal, row_number() over(partition by deptno order by sal)
from  emp;

----------------------------------------------------------------------------------
-- rollup, cube
----------------------------------------------------------------------------------
-- rollup: 그룹별 소계를 얻을 때 사용
-- 그룹으로 묶이는 컬럼이 하나인 경우에는 총계가 출력된다.

-- 사원테이블에서 부서별 연봉의 합 조회하고 총계를 출력해봐라.
select deptno, sum(sal)
from   emp
group by rollup(deptno); --> 총 합을 마지막에 출력, 총 합의 옆은 null값

--> cf) 총 합이 가장 앞에 출력: cube
select deptno, sum(sal)
from   emp
group by cube(deptno);

-- 여러컬럼이 그룹으로 묶여지면 rollup은 그룹별 소계를 마지막에 출력한다.
-- 날짜는 초까지 같아야 같은 그룹으로 묶여질 수 있음

-- 사원테이블에서 부서별 직무의 연봉 합과 소계 조회

select deptno, job, sum(sal)
from emp
group by rollup(deptno, job)
order by deptno;

-- 사원테이블에서 부서별, 직무의 연봉합, 직무별소계, 총계, 조회되는 레코드의 소계가 조회
select deptno, job, sum(sal)
from emp
group by cube(deptno, job);

select * from user_constraints;

desc dept;
