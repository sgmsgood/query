set serveroutput on

loop 
	cnt :=cnt+1;  
	-- if mod(cnt,2)=0 then
	dbms_output.put(cnt||'');
	-- end if
	
	cnt:=cnt+1;
	exit when cnt > 101;
end loop; 
 	dbms_output.put_line ('');

end;
/ 	