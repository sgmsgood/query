-- cp_emp 테이블에 레코드가 추가 되면
-- cp_emp3 테이블에 사원번호, 사원명, 부서번호, 사원 , 연봉을 추가하는 trigger을 만드세요.
-- 부서번호는 emp 테이블의 사원번호가 7788인 사원과 동일한 번호로 추가하고
--  연봉이 2000 이하가 추가되면 cp_emp3 테이블에는 연봉에 500을 더하여 추가해주세요.

create or replace trigger tri_emp3
after insert on cp_emp
for each row 
declare
	empno number;

begin      

	select empno
	into empno
	from emp
	where empno = 7788;

 		
	insert into cp_emp3(empno, ename, deptno, job, sal) 
		values ( emp.empno, :new.ename, :new.deptno, :new.job, :new.sal);
		
end;
/
