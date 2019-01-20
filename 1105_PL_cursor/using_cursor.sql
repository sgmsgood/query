-- 여러 행을 조회할 때 사용하는 커서
-- dept 테이블의 모든 레코드르 조회하는 cursor


set serveroutput on

declare
	-- 1. 선언: cursor 커서명 is select
	cursor cur_dept is 
	 			select deptno, dname, loc
				from dept;
	--2. 조회결과를 저장할 수 있는 변수 선언
		deptno dept.deptno%type;
		dname dept.dname%type;
		loc dept.loc% type;
		
	dept_data dept%rowtype;
	
begin
	  open cur_dept;
   		 if cur_dept%isopen then
     close cur_dept;
     	end if;
    --2.열기
    open cur_dept;
    
    --3. 인출 
    loop
    	fetch cur_dept into deptno, dname, loc;
----   		dbms_output.put_line (deptno||''||dname||''||loc);
         if cur_dept%found then
         	dbms_output.put_line('레코드 있음');
        
         else 
         	dbms_output.put_line('레코드 없음');
        	 exit;
         end if;
         	dbms_output.put_line(deptno||' '|| dname||'  '||loc); 
     end loop;
      dbms_output.put_line('조회된 레코드 수 : '||cur_dept%rowcount);
        
     --4. 커서 닫기
     close cur_dept;
end;
/