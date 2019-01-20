--수학함수
select sin(25), cos(25), tan(25)
from dual;

-- 절댓값: abs값
select abs(25), abs(-25)
from   dual;

-- 반올림: round(값, 자릿수)
select round(777.774,2), round(777.774,-1)
from   dual;


-- 절삭: trunc(값, 자릿수)
select trunc(777.777, 2), trunc(777.777, -1)
from dual;

-- 올림: ceil(값)
select ceil(10.1), ceil(10.9)
from dual;

-- 내림: floor(값)
select floor(10.8), floor(45.1)
from dual;

-- 사원테이블에서 사원번호, 사원명, 입사일, 연봉, 세금을 조회하세요
-- 단, 세금은 연봉의 3.3%로 계산하고, '원 단위 절삭하여 출력'
select  empno, ename, hiredate, sal, trunc(sal*0.033, -1) tax
from emp;    
      




