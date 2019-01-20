-- 정렬
-- 사원테이블에서 사원번호, 사원명, 연봉, 입사일 조회
-- 단, 연봉은 오름차순으로 정렬하여 출력하세욥
-- 연봉이 같다면 입사일의 내림차순으로 정렬하여 출력하세요.

select empno, ename, sal, hiredate
from emp
order by sal, hiredate desc;

-- 사원테이블에서 사원명의 매니저번호, 사원번호, 사원명, 연봉을 조회
-- 단, 매니저번호의 내림차순으로 정렬하되,
-- 매니저번호가 같다면 사원명의 오름차순으로 정렬하세요.

select mgr, empno, ename,sal
from emp
order by mgr desc, ename;

select*from emp


