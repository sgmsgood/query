-- insert subquery
-- 단수행
-- cp_emp3에 아래와 같은 레코드를 추가하때여
-- 사원번호: 1111, 사원명: 김희철, 부서번호: 10, 직무: 사원
-- 연봉: emp 테이블의 사원번호가 7566인 사원의 연봉과 동일한 연봉으로 추가

insert into cp_emp3 (empno, ename, deptno, job, sal)
values (1111, '김희철', 10, '사원',
		(select sal from EMP where empno = 7566));


-- 단일형 서브쿼리가 들어가야 하는 곳에서 복수행이 사용되면 error
-- 여러행이 나오는 경우
insert into cp_emp3(empno, ename, deptno, job, sal)
values (1111, '김희철', 10, '사원',
		(select sal from EMP where empno = 7566));

-- 컬럼 하나에 값을 넣어야 하는 곳에 컬럼 여러개가 조회되면
-- 초과하는 값의 개수가 맞지 않으므로 error
insert into cp_emp3(empno, ename, deptno, job, sal)
values (1111, '김희철', 10, '사원',
		(select sal, deptno from emp where empno = 7566));
commit;
-- 복수행(다중행) 서브쿼리
-- emp 테이블에서 부서번호가 30번인 부서의 사원번호, 사원명, 부서번호
-- 직무, 연봉을 조회하여 ep_emp3 테이블에 추가

savepoint a;
insert into cp_emp3
(select empno, ename, deptno, job, sal from emp
where deptno=30);

select *from cp_emp3;

create table test(job varchar2(9), sal number(7,2), hiredate date);

alter table test add input_date date;
alter table test modify hiredate varchar2(7);


--사원테이블에서 1981-02에 입사한 사원의 직무, 연봉합,
	--입사년-월, 입력일을 test 테이블에 추가  (올바른 쿼리는 아님. 문제에 끼워맞춤)

insert into test
(select job, sum(sal), to_char(hiredate,'yyyy-mm') hiredate, sysdate
from emp
where to_char(hiredate,'yyyy-mm') = '1981-02'
group by job, hiredate);

select * from test;



