-- 집계 함수 - 컬럼의 값을 하나로 만들어 반환하는 함수들
-- count: null이 아닌 컬럼의 개수를 셀 때
-- 사원테이블에 레코드 수 (사원 수), 보너스를 수령하는 사원 수, 보너스를 수령하지 않는 사원의 수,
-- 매니저가 있는 사원 수

select count(empno), count(comm), count(empno)- count(comm)
		,count(mgr)
from emp;

-- 연봉 합, 보너스 합, 인건비 총합
select sum(sal), sum(comm), sum(sal)+sum(comm) labor
from emp;

-- 연봉 평균, 보너스 평균
select   trunc(avg(sal),0), avg(comm)
from emp;

-- 최고 연봉, 최저 연봉액, 최고와 최저의 차이
select max(sal), min(sal), max(sal)-min(sal) diff
--> 이름도 알고 싶지만 지금으로선 불가능...
from emp;

--**where절에서는 집계함수를 사용할 수 없다.
--∴ 사원 테이블에서 평균 연봉보다 많이 수령하는 사원의 사원번호, 사원명, 연봉, 입사일 불가능

select empno, ename, sal, hiredate
from  emp
where sal> avg(sal);

--집계함수는 group by와 같이 사용하면 그룹별 집계를 조회한다.
--부서번호, 부서별 인원수, 부서별 연봉 합, 연봉평균
select deptno,  count(empno), sum(sal), sum(sal), trunc(avg(sal),2), max(sal), min(sal)
from  emp
group by deptno
order by deptno;

-- 사원테이블에서 매니저별 관리인원수, 최고연봉과 최저연봉, 최고연봉과 최저연봉의 차이
select mgr, count(empno), max(sal), min(sal), max(sal)-min(sal)
from emp
where mgr is not null
group by mgr;

-- 날짜함수
-- 날짜에 +를 사용하면일을 더한다.

select sysdate+100
from   dual;

select add_months(sysdate,6)
from dual;

select months_between('2019-11-11',sysdate)
from dual;



select*from emp;


