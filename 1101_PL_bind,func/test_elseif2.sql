-- ������ �Է¹޾� 0~100 ������ �� ������ ���
-- 0~100 ���̰� �ƴ϶�� �Է� ���� ���
-- 0~100 ������ �� 0~40 ���̶�� '����' 41~60 - �ٸ� ���� ����
-- 61~100 '�հݾ� ���֤����־־�'

set serveroutput on
set verify off

accept score prompt '����: '

declare
	score number := &score;

begin
    
	if score between 0 and 100 then 
	  
	  if score<=40 then 
	  	dbms_output.put_line('����');  
	  	
	  elsif score between 41 and 60 then 
	  	dbms_output.put_line('�ٸ� ���� ����');
	  	
	  else
	   dbms_output.put_line('�ڰ���� �հݾ� o(^^o)(o^^)o');
      end if;
	else 
	 dbms_output.put_line('������ 0~100���̸� �Է��� �ּ���.');
     
	end if; 
end;
/	
	
