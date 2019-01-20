-- 부서번호를 입력받아 emp테이블에서 부서별 사원번호를 
-- 조회하여 out parameter에 저장하는 procedure
-- 조회: 사원번호, 사원명, 연봉, 부서번호, 부서명, 위치 
-- 10~19번 입력되면 10번 ㄱㄱ
-- 20~29번 입력되면 20번 
-- 그 외는 모두 30번 

create or replace procedure select_emp
		(deptno number,
		 cur_join out sys_refcursor)
is     
	temp_deptno number := deptno;
	
begin
	-- 입력되는 부서번호를 10 또는 20으로 생성
	temp_deptno := trunc(temp_deptno/10,0)*10;
	
	if temp_deptno not in (10, 20) then
		temp_deptno := 30;
	end if;	  
	
	-- refcursor 열기
	open cur_join for
		select  e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
		from  dept d, emp e
		where (e.deptno = d.deptno) 
		and d.deptno = temp_deptno;
	

end;
                           
							
