-- 부서번호를 입력받아 해당 부서에 따른 
-- 사원번호, 사원명, 입사일, 연봉을 조회
-- 입사일은 '년-월-일 분기'의 형식으로 조회

set serveroutput on
set verify off

accept deptno prompt '부서번호를 입력하때여: '

declare --(declare..begin 사이에서는 변수만 선언 가능, 제어문을 쓸 수 없음!)

	--1. 선언
	cursor cur_emp is 
		select empno, ename, sal, to_char(hiredate,'yyyy-mm-dd q') hiredate
		from emp
		where deptno = &deptno; 
begin
	
--	open cur_emp; (커서가 2번 열릴 수 없기 때문에 에러발생)
	
	-- 2. for을 사용한 인출 (fetch사용 X)
	for emp_data in cur_emp loop
		dbms_output.put_line(emp_data.empno||' '||emp_data.ename||' '||emp_data.sal||' '||emp_data.hiredate);
	end loop;
	
-- close cur_emp; (위의 for문을 나가는 순간 닫히기 때문에 2번 닫힐 수 없음)	

end;
/