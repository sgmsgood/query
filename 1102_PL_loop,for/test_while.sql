-- �ּ� 0�� ���� ~ �ִ� ���Ǳ��� �ݺ����� while
set serveroutput on


declare
	i number;


begin
	-- 1�������� 10���� 1�� �����ϴ� ���� ����ϴ� while
	
	i := 1 ;
	-- ���ǽ�
	while i <= 10 loop
	    dbms_output.put_line(i);
	    
	i := i +1;
	
	end loop; 
	
-- 0���� 100������ Ȧ���� ����ϴ� while

	i := 1;
	
	while i < 101 loop
	
-- 1) if �Լ��� ���� ���		if mod(i,2)=1 then
			dbms_output.put_line(i);
--	    					end if;
-- 							i := i + 1	    
	 i := i+2;
	 
	end loop; 



end;
/