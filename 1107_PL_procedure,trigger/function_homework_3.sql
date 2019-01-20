create or replace function check_loc (ssn char) 
return varchar2
is
	result_msg varchar(30) := '다시 입력해주세요.';
	
begin
	if length (trim(ssn))=14 and instr(ssn,'-')=7 then        
	
	if to_number(substr(ssn,9,2)) between 0 and 8 then
		result_msg := '서울특별시'; 
	
	elsif to_number(substr(ssn,9,2)) between 9 and 12 then
		result_msg := '부산광역시'; 
		
	elsif  to_number(substr(ssn,9,2)) between 13 and 15 then
		result_msg := '인천광역시';
		
	elsif substr(ssn,9,2) between 16 and 25 then
		result_msg := '경기도';  
		
	elsif  substr(ssn,9,2) between 26 and 34 then
		result_msg := '강원도'; 			
	
	elsif substr(ssn,9,2) between 35 and 47 then
		result_msg := '충청도';
		
	elsif substr(ssn,9,2) between 48 and 66 then
		result_msg := '전라도';            
		
	elsif  substr(ssn,9,2) between 67 and 92 then	
			result_msg := '경상도';
	
  	else  result_msg := '제주특별자치도';
		 
     end if; 
     end if;
     return result_msg;
end;
/



