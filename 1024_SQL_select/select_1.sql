-- 컬럼을 붙여 문자열 조회: (컬럼)|(컬럼)
-- EMP 테이블에서 사원번호, 사원명, 직무를 조회
-- 출력형식은 : xxx(사원번호)님 xxx직무입니다.
-- alias를 "로 묶어서 부여하면 대소문자가 가려진 컬럼이 나온다.

select ename||' ('|| empno||')님 '|| job|| ' 직무입니다.'
from EMP;

-- alias는 바로 아래 where절에서 사용할 수 없음.

select	empno, ename, sal s --(= sal alias s)
from	emp
where	sal < 3000; --(사용 불가능)

-- 산술 연산자: +, -, /, *
-- 사원테이블에서 사원번호, 사원명, 연봉, 세금 조회
-- 세금은 연봉의 3.3% 계산하여 출력
-- 사원번호는 현재 번호에 10을 더한 값으로 출력

select empno, empno + 10 new_empno, ename, sal * 0.033 tax
from   emp;


-- 컬럼 값끼리 더하기
select empno - mgr
from   emp;

-- null은 연산되면 결과가 null이 나옴.
-- 사원테이블에서 사원번호, 연봉, 보너스, 총수령액을 조회
-- 단, 총 수령액은 연봉과 보너스를 합산한 금액으로 조회
-- null인 컬럼에 연산을 하기 위해서 nvl 함수를 사용
select ename, sal, comm, sal + nvl(comm,0) total
from   emp;

-- 나눈 나머지: mod(컬럼명, 나눌 값) 함수 사용
/* dual테이블: 모든 계정에서 사용할 수 있는 가상테이블
			입력되는 값으로 컬럼을 생성하여 조회처리 */

select '이지수' name, mod(11,2), mod(1990,12)
from dual;
--0~11
-- 11: 양, 10: 말, 9: 뱀, 8:용, 7: 토끼, 6: 호랑이, 5: 소, 4:쥐, 3: 돼지, 2:개띠, 1: 닭, 0: 원숭이
-- 조회하는 컬럼에 관계 연산자를 사용하면 Error

select  sal>300
from emp;

-- 관계연산자: where절, having절 사용
-- >, <, >=, <=, =, !=, (<>)
-- 사원테이블에서 연봉이 3000보다 작거나 같은 사원의 사원번호, 사원명, 매니저번호, 연봉, 입사일, 부서번호 조회

select empno, ename, mgr, sal, hiredate, deptno
from EMP
where sal <= 3000;

-- 사원테이블에서 연봉이 3000초과 사원의 사원번호, 사우너명, 매니저번호, 연봉, 입사일, 부서번호 조회

select empno, ename, mgr, hiredate, deptno, sal
from   emp
where  sal >= 3000;
