-- 사원번호, 사원명, 연봉을 입력받아
-- 사원번호와 일치하는 사원의 연봉과 사원명을 Cp_emp2테이블에서 변경하세요.
-- 단, 연봉은 3000이하일 때, 1000을 더한 연봉으로 변경한다.
set verify off
set serveroutput on

-- accept 뒤에는 컬럼명 넣기

	accept empno prompt '사원번호: '
	accept ename prompt '사원명: '
	accept sal prompt '연봉: '

declare
	i_empno cp_emp2.empno%type := &empno;
	i_ename cp_emp2.ename%type := '&ename';
	i_sal cp_emp2.sal%type:= &sal;

	cnt number;
begin

	if i_sal < 3001 then
		i_sal := i_sal + 1000;
	end if;
	-- update의 set과 where절은 변수명과 컬럼명을 구분될 수 있도록
	-- 이름을 다르게하여 작성해야한다.

	update cp_emp2
	set sal = i_sal, ename = i_ename
	where empno = i_empno;

	cnt := sql%rowcount;
	
    if cnt = 1 then
    	dbms_output.put_line(cnt||'건이 변경되었습니다.');		
		commit;
	else 
		dbms_output.put_line(cnt||': 1건이 아니라서 변경이 취소됨.');
		rollback;
	end if;
		
end;
/


