set serveroutput on

declare 
	     temp_deptno number:=55;
begin
	-- 입력되는 부서번호를 10 또는 20으로 생성
	temp_deptno := trunc(temp_deptno/10,0)*10;
	
	if temp_deptno not in (10, 20) then
		temp_deptno := 30;
	end if;	  
	
	dbms_output.put_line( '===='||temp_deptno);

end;
/                           
							
