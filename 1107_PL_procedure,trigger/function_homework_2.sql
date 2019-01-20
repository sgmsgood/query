create or replace function check_ssn (ssn char)
return char
is
 	result_msg char(6) := 'M';
 	
 	
begin
	if length (trim(ssn))=14 and instr(ssn,'-')=7 then 
		if mod(substr(ssn, instr(ssn, '-')+1, 1),2) =0 then
			result_msg := 'F';
	 	end if;	
	else 
	 	 result_msg := ' ';
 	end if;
	return result_msg;

end;
/
