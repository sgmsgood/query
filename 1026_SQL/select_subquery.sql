--단수행:
-- scalar subquery: select 조회하는 컬럼에 서브쿼리를 사용하는 것.
-- emp 테이블에서 사원번호, 사원명, 부서번호 (emp에 존재)/ 부서명 (dept)을
-- 부서명은 dept테이블에 존재
-- 구분하여 사용해야한다.(테이블명. 컬럼명)

select * from dept;
select * from emp;

select empno, ename, deptno, (select dname from dept where dept.deptno = emp.deptno)
--> dept.deptno: dept 테이블의 deptno임을 구분
from emp;

-- cp_emp3테이블 사원 테이블에서 사원번호
insert into cp_emp3
(select empno, ename, deptno, job, sal from emp
 where deptno in (10, 30));

commit;

-- 사원테이블에서 사원번호가 '7698'인 사원의 부서번호와
-- 같은 부서를 cp_emp3 테이블에서 조회
-- 조회 컬럼은 사원번호, 사원명, 부서번호, 직무를 조회합니다.

select empno, ename, deptno, job
from   cp_emp3
where deptno = (select deptno from emp where empno = 7698);
--where deptno = (select deptno from emp where empno  7698);
select *from cp_emp3;

-- cf) 컬럼값의 다중행 서브쿼리 in, any, all, exists
-- 사원테이블에서 사원번호가 '7698'인 사원의 부서번호와
-- 같은 부서를 cp_emp3 테이블에서 조회
-- 조회 컬럼은 사원번호, 사원명, 부서번호, 직무를 조회합니다.

select empno, ename, deptno, job
from   cp_emp3
where deptno in (select deptno
					from emp
					where empno in (7698,7782));

-- 외부값 입력받기
-- 쿼리문제에 &변수명 - 입력창 동작 입력창에 입력한 것이 쿼리 대입
-- exist: 서브쿼리에 값이 존재한다면 바깥 쿼리를 수행
-- '&변수명'이 쿼리문에 그대로 대입 되는대로 문자열을 입력한 경우 ' '로 묶어져야 에러가 발생하지 않는다.

select*from emp where deptno = &deptno;
select*from emp where ename  = '&ename';

-- exist: 서브쿼리에 값이 있으면 무조건 바깥 쿼리의 실행 switch on
-- 사원테이블에서 입력되는 부서번호가 존재한다면 사원번호, 사원명, 입사일, 부서번호를 조회

select empno, ename, hiredate, deptno
from emp
where exists(select deptno from emp where deptno = &deptdno);

/* all (=and) - < all: 서브쿼리에 조회된 값 중 가장 작은 값으로 비교 수행
				> all: 가장 큰 값으로 비교 */
-- 입력된 부서에서 가장 연봉이 작은 사람보다,
-- 연봉이 작은 사원을 조회


select empno, ename, sal, deptno
from emp
where sal > all(select sal from EMP where deptno = &d_no);

/* any (=or) - 	< any: 서브쿼리에 조회된 값 중 가장 큰 값으로 비교 수행
				> any: 가장 작은 값으로 비교 */
-- 입력된 부서에서 가장 연봉이 작은 사람보다,
-- 연봉이 작은 사원을 조회

select empno, ename, sal, deptno
from emp
where sal > any (select sal from EMP where deptno = 10);

----------------------------------------------------------------------------
-- rownum: 조회된 결과에 순차적인 번호를 붙이는 가상 컬럼
----------------------------------------------------------------------------

-- 번호, 사원번호, 사원명, 입사일 조회
-- 단, 번호는 조회결과에 1 부터 순차적으로 부여되어야 한다.

select  rownum, empno, ename, hiredate
from emp
where deptno in (10, 20);


-- order by와 같이 사용되면 번호가 섞이게 된다.
select  rownum, empno, ename
from emp
order by ename;

-- rownum은 where 절에서 사용하면 1번부터는 조회가 되나
-- 1번이 아닌 번호는 조회되지 않는다.
-- 사원테이블에서 사원번호, 사원명, 입사일, 연봉을 조회하세요.
-- 단, 출력은 조회순서에 1번부터 5번까지만 출력
select empno, ename, hiredate, sal
from   emp
where rownum between 1 and 5;


-- 사원테이블에서 사원번호, 사원명, 입사일, 연봉을 조회하세요.
-- 단, 출력은 조회순서에 3번부터 5번까지만 출력 --> 에러발생

-- 복수행 서브쿼리
-- 조회결과(inline view)를 가지고 재조회
-- 문법
/*
	select 컬럼명,,,
	from (select,,,))
*/

select rownum, empno, ename, sal, hi
from (select rownum, empno, ename, sal, hiredate hi
		from emp
        order by sal);

-- 사원테이블에서 가장 마지막에 입사한 사원부터 5명을 조회해보때여
-- 조회컬럼은 사원번호, 사원명, 입사일을 조회하때여

select  rownum,empno, ename, hiredate  --> 2) 정렬된 자료에 번호를 매겨서 출력해줘.
from  (select empno, ename, hiredate
		from emp
		order by hiredate desc) --> 1) hiredate가 늦은 순서대로 정렬을 해주고
where rownum between 1 and 5; --> 3) 단, rownum의 숫자가 1~5번까지인 것만 보여줬음 좋겠어.

-- 사원테이블에서 가장 마지막에 입사한 이전 사원부터 5명을 조회해보때여 (2~6)
-- 조회컬럼은 사원번호, 사원명, 입사일을 조회하때여
select rownum, rr, empno, ename, hi  --> 3)
from (select rownum RR, empno, ename, hi --> 2) 정렬된 자료에 번호를 매겨
		from (select empno, ename, hiredate hi --> 1) hiredate가 늦은 순서대로 정렬하고
				from emp
				order by hiredate desc))
where rr between 2 and 6;



select * from user_constraints
