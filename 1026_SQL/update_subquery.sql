-- update subquery: 다른 테이블의 값을 참조하여 현재 테이블의 값을 변경할 때

-- 단수행
-- cp_emp3테이블에서 사원번호가 '1111'인 사원의 연봉을
-- emp 테이블의 사원번호가 '7788'인 사원의 연봉으로 변경

update cp_emp3
set sal = (select sal from emp where empno=7788)
where empno = 1111;

-- 단수행 서브쿼리에 복수행이 발생하면 error 발생


update cp_emp3
set sal = (select sal from emp)
where empno = 1111;

-- 컬럼을 여러개 조회하면 errors
update cp_emp3
set sal = (select sal, deptno from emp where empno=7788)
where empno = 1111;


-- 복수행 서브쿼리는 in을 사용하여 where절에 사용
insert into cp_emp3(empno, ename, deptno, job, sal) values (2222,'테스트',30,'SALESMAN',2000);
commit;
-- cp_emp3 테이블에서 emp테이블의 부서번호가 30번인
-- 모든 사원들의 사원번호가 같은 사원의 연봉을 '1000'으로 변경하세요.

update cp_emp3
set sal = 1000
where empno in (select empno from emp where deptno=30); --> subquery 결과값이 여러개라서 에러남 => in으로 바꿔주기

select * from CP_EMP3;

--------------------------------------------------------------
-- delete subquery
--------------------------------------------------------------
-- 다른 테이블의 값을 참조하여 현재 테이블 레코드 삭제
-- 단수행
update cp_emp3
set    ename='블랑카'
where  empno = 7698;
commit;

select*from emp;
-- cp_emp3 테이블에서 사원정보를 삭제
-- 삭제 조건: emp테이블의 사원명이 'BLAKE'인 사원의 사원번호
-- 같은 사원을 cp_emp3테이블에서 삭제

delete from cp_emp3
where empno=(select empno from emp where ename = 'BALKE');

select*from cp_emp3;

-- 복수행;
-- cp_emp3 테이블에서 emp테이블의 부서번호가 30번인
-- 모든 사원들의 사원번호와 같은 사원을 삭제하세요.

delete from cp_emp3
where empno in (select empno
					from   emp
					where deptno = 30);

select * from cp_emp3;

