-- �Էµ� �ֹι�ȣ���� ���̸� ���ϴ� �Լ�
-- 880101-1234567
-- ����⵵ - �¾ �� +1

create or replace function get_age(ssn char)
return number
is
 	age number := 0; --�⺻��
 	b_year char(4);
 	flag char(1); --�ڵ��� �Ǵܱ����� �Ǵ� ����
begin
    if check_ssn(ssn) = 'success' then 
    	-- 19�� ���� ��, 20�� ���� ��, 18�� ���� �� �Ǵ��ϴ� ��
   		flag := substr(ssn, 8,1);
   		
   	
   		if flag in (1,2,5,6) then
   		   b_year:= '19'||substr(ssn,1,2);
   		elsif flag in (3,4,7,8) then
   		   b_year := '20'||substr(ssn,1,2);
   		else 
   			b_year := '18'||substr(ssn,1,2);
   		end if;
   				
          age:= to_char(sysdate,'yyyy') - b_year+1;
         end if;
                            
	return age;
end;
/
