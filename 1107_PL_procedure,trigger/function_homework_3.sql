create or replace function check_loc (ssn char) 
return varchar2
is
	result_msg varchar(30) := '�ٽ� �Է����ּ���.';
	
begin
	if length (trim(ssn))=14 and instr(ssn,'-')=7 then        
	
	if to_number(substr(ssn,9,2)) between 0 and 8 then
		result_msg := '����Ư����'; 
	
	elsif to_number(substr(ssn,9,2)) between 9 and 12 then
		result_msg := '�λ걤����'; 
		
	elsif  to_number(substr(ssn,9,2)) between 13 and 15 then
		result_msg := '��õ������';
		
	elsif substr(ssn,9,2) between 16 and 25 then
		result_msg := '��⵵';  
		
	elsif  substr(ssn,9,2) between 26 and 34 then
		result_msg := '������'; 			
	
	elsif substr(ssn,9,2) between 35 and 47 then
		result_msg := '��û��';
		
	elsif substr(ssn,9,2) between 48 and 66 then
		result_msg := '����';            
		
	elsif  substr(ssn,9,2) between 67 and 92 then	
			result_msg := '���';
	
  	else  result_msg := '����Ư����ġ��';
		 
     end if; 
     end if;
     return result_msg;
end;
/



